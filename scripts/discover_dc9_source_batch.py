"""Find byte-exact, bounded DC9 routine candidates without changing the layout.

The output is an inventory for review, not a claim of complete application
source or hardware behavior. Only a selected, contiguous, reachable CFG with
source that the current assembler reproduces exactly is accepted.
"""
import argparse
from collections import defaultdict, deque
import hashlib
import json
from pathlib import Path

from aeon_helper_emulator import context, decoder_identity
from aeon_subset_assembler import SIZES, assemble
from build_dc9_source_baseline import LAYOUT, ROOT, load_original, sha
from recompress_dc9 import SOURCE_SHA


BASE = 0x200000
LIMIT = 4096
UNCONDITIONAL = {"bt.j", "bn.j", "bg.j"}
INDIRECT = {"bt.jalr", "bn.jal", "bg.jalr"}


def operand_target(row):
    return int(row.body.rstrip(",").split(",")[-1].strip(), 0)


def branch(row):
    return row.mnem in UNCONDITIONAL or row.mnem.startswith(("bg.b", "bn.b"))


def overlaps(start, end, spans):
    return next(((a, b, name) for a, b, name in spans if start < b and a < end), None)


def render_source(start, end, rows):
    """Produce normal editable AEON assembly; no raw data directives."""
    local = {row.addr.offset for row in rows}
    labels = {operand_target(row) for row in rows if branch(row)
              and operand_target(row) in local}
    lines = [
        "# Firmware-derived reconstruction; excluded from the repository MIT grant.",
        f"# DC9 v101 candidate [{start:#x},{end:#x}); byte-exact only; hardware untested.",
    ]
    for row in rows:
        if row.addr.offset in labels:
            lines.append(f"loc_{row.addr.offset:x}:")
        args = [part.strip() for part in row.body.rstrip(",").split(",")]
        if branch(row) and operand_target(row) in labels:
            args[-1] = f"loc_{operand_target(row):x}"
        lines.append("    " + row.mnem + " " + ", ".join(args))
    return "\n".join(lines) + "\n"


def existing_calls(ctx, expanded, layout):
    """Direct calls decoded from recorded source bytes, with exact call sites."""
    sites = defaultdict(set)
    for record in layout["routines"]:
        start = int(record["address"], 16)
        end = start + record["size"]
        data = expanded[start - BASE:end - BASE]
        rows = ctx.disassemble(data, base_address=start).instructions
        if not rows or sum(row.length for row in rows) != len(data):
            raise ValueError(f"existing layout decode incomplete: {record['name']}")
        for row in rows:
            if row.mnem == "bg.jal":
                sites[operand_target(row)].add(row.addr.offset)
    return sites


def inspect(start, *, ctx, expanded, protected, entries, call_entries):
    image_end = BASE + len(expanded)
    if not BASE + 0x3800 <= start < image_end:
        raise ValueError("entry_outside_application")
    old = overlaps(start, start + 1, protected)
    if old:
        raise ValueError(f"entry_overlaps_{old[2]}")
    pending, rows = [start], {}
    calls, call_sites, tails, returns = set(), defaultdict(set), set(), set()
    while pending:
        pc = pending.pop()
        if pc in rows:
            continue
        if pc < start or pc >= min(start + LIMIT, image_end):
            raise ValueError(f"edge_outside_bound_{pc:#x}")
        if pc != start and pc in entries:
            raise ValueError(f"fallthrough_or_branch_into_entry_{pc:#x}")
        old = overlaps(pc, pc + 1, protected)
        if old:
            raise ValueError(f"edge_overlaps_{old[2]}_{pc:#x}")
        try:
            decoded = ctx.disassemble(expanded[pc - BASE:pc - BASE + 4],
                                      base_address=pc, max_instructions=1).instructions
        except Exception as exc:
            raise ValueError(f"invalid_decode_{pc:#x}_{type(exc).__name__}") from exc
        if not decoded or decoded[0].addr.offset != pc:
            raise ValueError(f"invalid_decode_{pc:#x}")
        row = decoded[0]
        nxt = pc + row.length
        if row.length != SIZES.get(row.mnem) or nxt > image_end or nxt > start + LIMIT:
            raise ValueError(f"unsupported_form_or_bound_{pc:#x}_{row.mnem}")
        old = overlaps(pc, nxt, protected)
        if old:
            raise ValueError(f"instruction_overlaps_{old[2]}_{pc:#x}")
        for other_pc, other in rows.items():
            if pc < other_pc + other.length and other_pc < nxt:
                raise ValueError(f"conflicting_instruction_boundaries_{pc:#x}_{other_pc:#x}")
        rows[pc] = row
        op = row.mnem
        if op == "bt.jr":
            if row.body.strip() != "r9":
                raise ValueError(f"unresolved_indirect_jump_{pc:#x}_{row.body.strip()}")
            returns.add(pc)
        elif op in INDIRECT:
            raise ValueError(f"unsupported_indirect_call_{pc:#x}_{op}")
        elif op == "bg.jal":
            dest = operand_target(row)
            calls.add(dest)
            call_sites[dest].add(pc)
            pending.append(nxt)
        elif op in UNCONDITIONAL:
            dest = operand_target(row)
            if dest != start and dest in entries:
                tails.add(dest)
            elif dest < start or dest >= start + LIMIT:
                if dest in call_entries:
                    tails.add(dest)
                else:
                    raise ValueError(f"unproven_external_tail_{pc:#x}_{dest:#x}")
            else:
                pending.append(dest)
        elif branch(row):
            dest = operand_target(row)
            if dest < start or dest >= start + LIMIT or (dest != start and dest in entries):
                raise ValueError(f"conditional_edge_outside_routine_{pc:#x}_{dest:#x}")
            pending.extend((dest, nxt))
        else:
            pending.append(nxt)
        if len(rows) > LIMIT // 2:
            raise ValueError("instruction_limit")
    if not returns and not tails:
        raise ValueError("no_proven_terminal")
    ordered = [rows[pc] for pc in sorted(rows)]
    end = max(pc + row.length for pc, row in rows.items())
    cursor = start
    for row in ordered:
        if row.addr.offset != cursor:
            raise ValueError(f"unreachable_or_unexplained_bytes_{cursor:#x}_{row.addr.offset:#x}")
        cursor += row.length
    if cursor != end:
        raise ValueError("noncontiguous_code")
    code = expanded[start - BASE:end - BASE]
    source = render_source(start, end, ordered)
    try:
        encoded, listing = assemble(source, start)
    except Exception as exc:
        raise ValueError(f"assembler_rejects_{type(exc).__name__}_{str(exc)[:100]}") from exc
    if encoded != code or len(listing) != len(ordered):
        raise ValueError("reassembly_mismatch")
    return {
        "address": hex(start), "end_exclusive": hex(end), "size": len(code),
        "instructions": len(ordered), "original_code_sha256": sha(code),
        "assembly_sha256": sha(source.encode()),
        "external_call_targets": [hex(x) for x in sorted(calls)],
        "external_tail_targets": [hex(x) for x in sorted(tails)],
        "return_sites": [hex(x) for x in sorted(returns)],
    }, source, call_sites


def discover(max_candidates=2000):
    _, expanded, _ = load_original()
    layout_bytes = LAYOUT.read_bytes()
    layout = json.loads(layout_bytes)
    ctx = context()
    existing_spans = sorted((int(record["address"], 16),
                             int(record["address"], 16) + record["size"], record["name"])
                            for record in layout["routines"] + layout["tables"])
    existing_entries = {int(record["address"], 16) for record in layout["routines"]}
    sites = existing_calls(ctx, expanded, layout)
    seed_entries = set(sites)
    passes = 0
    while True:
        passes += 1
        protected = list(existing_spans)
        known_entries = set(existing_entries)
        call_entries = set(seed_entries)
        queue = deque(sorted(call_entries))
        seen, accepted, rejected, sources = set(), [], [], {}
        while queue and len(seen) < max_candidates:
            start = queue.popleft()
            if start in seen:
                continue
            seen.add(start)
            try:
                record, source, discovered_sites = inspect(
                    start, ctx=ctx, expanded=expanded, protected=protected,
                    entries=known_entries | call_entries, call_entries=call_entries)
                collision = overlaps(start, int(record["end_exclusive"], 16), protected)
                if collision:
                    raise ValueError(f"span_overlaps_{collision[2]}")
                accepted.append(record)
                sources[start] = source
                protected.append((start, int(record["end_exclusive"], 16),
                                  f"candidate_{start:x}"))
                known_entries.add(start)
                for target in sorted(discovered_sites):
                    sites[target].update(discovered_sites[target])
                    if target not in call_entries:
                        call_entries.add(target)
                        queue.append(target)
            except ValueError as exc:
                rejected.append({"address": hex(start), "reason": str(exc)})
        if queue:
            rejected.append({"address": None,
                             "reason": f"candidate_limit_{max_candidates}; {len(queue)} queued"})
            break
        if call_entries == seed_entries:
            break
        seed_entries = call_entries
    for record in accepted:
        start, end = int(record["address"], 16), int(record["end_exclusive"], 16)
        if any(start < entry < end for entry in call_entries):
            raise ValueError(f"independent call entry hidden inside accepted span {start:#x}")
    accepted.sort(key=lambda item: int(item["address"], 16))
    rejected.sort(key=lambda item: (-1 if item["address"] is None else int(item["address"], 16), item["reason"]))
    for record in accepted:
        address = int(record["address"], 16)
        record["provenance_call_sites"] = [hex(x) for x in sorted(sites[address])]
        reserved = ((0x2ac756, 0x2ac837), (0x2ad165, 0x2ad1b7),
                    (0x2ac268, 0x2ac288), (0x2aba8f, 0x2abba0))
        if any(address < b and a < int(record["end_exclusive"], 16) for a, b in reserved):
            record["reserved_by_parallel_leaf_reconstruction"] = True
    return {
        "format": "dc9-bulk-source-candidate-inventory-v1",
        "source_firmware_sha256": SOURCE_SHA,
        "expanded_sha256": sha(expanded),
        "layout_sha256": hashlib.sha256(layout_bytes).hexdigest(),
        "candidate_load_base": hex(BASE), "max_candidate_bytes": LIMIT,
        "fixed_point_passes": passes,
        "decoder": decoder_identity(),
        "summary": {"accepted": len(accepted), "code_bytes": sum(x["size"] for x in accepted),
                    "instructions": sum(x["instructions"] for x in accepted),
                    "rejected": len(rejected)},
        "candidates": accepted, "rejected": rejected,
        "limitations": ["Static CFG and exact source encoding only; no runtime or hardware validation.",
                        "Indirect entries and calls are not discovered.",
                        "Conditional exits to other routines are conservatively rejected."],
    }, sources


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path,
                        default=ROOT / "analysis/scratch/dc9-source-batch-inventory-v2.json")
    parser.add_argument("--emit-dir", type=Path,
                        help="Optional scratch directory for verified candidate assembly")
    parser.add_argument("--max-candidates", type=int, default=2000)
    args = parser.parse_args()
    if args.max_candidates <= 0:
        parser.error("--max-candidates must be positive")
    inventory, sources = discover(args.max_candidates)
    output = args.output.resolve()
    scratch = (ROOT / "analysis/scratch").resolve()
    if not output.is_relative_to(scratch):
        parser.error("inventory output must be under analysis/scratch")
    output.parent.mkdir(parents=True, exist_ok=True)
    write_new_or_identical(output, json.dumps(inventory, indent=2, sort_keys=True) + "\n")
    if args.emit_dir:
        emit_dir = args.emit_dir.resolve()
        if not emit_dir.is_relative_to(scratch):
            parser.error("emitted source must be under analysis/scratch")
        emit_dir.mkdir(parents=True, exist_ok=True)
        for address, source in sorted(sources.items()):
            write_new_or_identical(emit_dir / f"candidate_{address:x}.aeon.s", source)
    print(json.dumps(inventory["summary"], sort_keys=True))


def write_new_or_identical(path, content):
    if path.exists():
        if path.read_text() != content:
            raise ValueError(f"refusing to overwrite different evidence: {path}")
    else:
        with path.open("x") as stream:
            stream.write(content)


if __name__ == "__main__":
    main()
