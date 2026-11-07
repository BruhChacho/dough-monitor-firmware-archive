"""Recover the bounded DC9 channel storage and register setup routines.

Each source span is disassembled from the pinned firmware, checked for a
complete CFG and boundary-aligned local branches, then reassembled byte-exactly
at its original address. No peripheral behavior is modeled.
"""
import json
from pathlib import Path

from aeon_helper_emulator import context
from aeon_subset_assembler import assemble
from build_dc9_source_baseline import LAYOUT, ROOT, load_original, sha


SPANS = [
    ("channel_storage_lowest_set_bit", 0x2402c4, 0x2402de,
     "Return zero for zero input, otherwise return the index of the lowest set bit; the storage configuration caller's zero case remains ambiguous."),
    ("channel_storage_lookup", 0x2250c5, 0x2250e8,
     "Read one channel record's halfword field and pass it to a helper; the helper's physical meaning is unresolved."),
    ("channel_storage_configuration", 0x2250e8, 0x225416,
     "Configure channel storage records through indexed branches, helper calls, and memory writes; external services remain unresolved."),
    ("channel_storage_register_setup", 0x226100, 0x226278,
     "Initialize register fields and configure them from ENGINE-pair records at 0x47faa0 and 0x47fb98; bus and device behavior remain unresolved."),
]

UNCONDITIONAL_BRANCHES = {"bt.j", "bn.j", "bg.j"}
TERMINATORS = {"bt.jr"}


def is_branch(op):
    return (op in UNCONDITIONAL_BRANCHES or op.startswith(("bg.b", "bn.b")))


def branch_target(row):
    return int(row.body.rstrip(",").split(",")[-1].strip(), 0)


def check_cfg(name, start, end, rows):
    boundaries = {row.addr.offset for row in rows}
    successors = {}
    returns = []
    for index, row in enumerate(rows):
        pc = row.addr.offset
        next_pc = pc + row.length
        op = row.mnem
        edges = []
        if op in TERMINATORS:
            returns.append(pc)
        elif op in UNCONDITIONAL_BRANCHES:
            target = branch_target(row)
            if not start <= target < end or target not in boundaries:
                raise ValueError(f"{name}: branch target is outside an instruction boundary: {target:#x}")
            edges.append(target)
        elif is_branch(op):
            target = branch_target(row)
            if not start <= target < end or target not in boundaries:
                raise ValueError(f"{name}: branch target is outside an instruction boundary: {target:#x}")
            edges.append(target)
            if next_pc < end:
                edges.append(next_pc)
        elif next_pc < end:
            edges.append(next_pc)
        successors[pc] = edges

    if not returns:
        raise ValueError(f"{name}: no decoded return instruction")
    reached, pending = set(), [start]
    while pending:
        pc = pending.pop()
        if pc in reached:
            continue
        if pc not in boundaries:
            raise ValueError(f"{name}: CFG reaches non-instruction boundary {pc:#x}")
        reached.add(pc)
        pending.extend(successors[pc])
    if reached != boundaries:
        absent = sorted(boundaries - reached)
        raise ValueError(f"{name}: unreachable decoded instructions: {absent[:8]}")
    # A function boundary must not be reached by ordinary fall-through.
    if any((row.addr.offset + row.length == end)
           and row.mnem not in UNCONDITIONAL_BRANCHES | TERMINATORS
           for row in rows):
        raise ValueError(f"{name}: final instruction can fall through its span")
    return boundaries, returns


def recover():
    _, expanded, _ = load_original()
    ctx = context()
    layout = json.loads(LAYOUT.read_text())
    prior_routines = list(layout["routines"])
    prior_tables = list(layout["tables"])
    prior_layout_bytes = LAYOUT.read_bytes()
    own_names = {name for name, *_ in SPANS}

    prior_by_name = {}
    for record in prior_routines:
        if record["name"] in prior_by_name:
            raise ValueError(f"Duplicate routine name: {record['name']}")
        prior_by_name[record["name"]] = record

    requested = [(start, end, name) for name, start, end, _ in SPANS]
    for index, (start, end, name) in enumerate(requested):
        if start >= end:
            raise ValueError(f"Invalid span: {name}")
        for other_start, other_end, other_name in requested[index + 1:]:
            if start < other_end and other_start < end:
                raise ValueError(f"Requested routine spans overlap: {name} and {other_name}")
        for record in prior_routines + prior_tables:
            old_start = int(record["address"], 16)
            old_end = old_start + record["size"]
            if (record.get("name") == name and old_start == start
                    and record["size"] == end - start and record in prior_routines):
                continue
            if start < old_end and old_start < end:
                raise ValueError(f"Span overlaps existing component {record['name']}: {name}")

    decoded = {}
    for name, start, end, _ in SPANS:
        code = expanded[start - 0x200000:end - 0x200000]
        rows = ctx.disassemble(code, base_address=start).instructions
        if not code or sum(row.length for row in rows) != len(code):
            raise ValueError(f"Incomplete pinned decode: {name}")
        if rows[0].addr.offset != start or rows[-1].addr.offset + rows[-1].length != end:
            raise ValueError(f"Decoded boundaries disagree with requested span: {name}")
        boundaries, returns = check_cfg(name, start, end, rows)
        decoded[name] = (code, rows, boundaries, returns)

    outputs, records = [], []
    for name, start, end, purpose in SPANS:
        code, rows, boundaries, returns = decoded[name]
        targets = {branch_target(row) for row in rows if is_branch(row.mnem)}
        lines = [
            "# Firmware-derived reconstruction; excluded from the repository MIT grant.",
            f"# DC9 v101 candidate [{start:#x},{end:#x}); {purpose}",
            "# Fixed original addresses; not hardware-validated.",
        ]
        for row in rows:
            if row.addr.offset in targets:
                lines.append(f"loc_{row.addr.offset:x}:")
            args = [value.strip() for value in row.body.rstrip(",").split(",")]
            if is_branch(row.mnem):
                target = int(args[-1], 0)
                args[-1] = f"loc_{target:x}"
            lines.append("    " + row.mnem + " " + ", ".join(args))
        source = "\n".join(lines) + "\n"
        encoded, listing = assemble(source, start)
        if encoded != code:
            raise ValueError(f"Reassembly differs from original: {name}")

        path = Path("analysis/reconstructed") / f"spectrum_one_{name}.aeon.s"
        call_targets = sorted({int(row.body, 0) for row in rows if row.mnem == "bg.jal"})
        record = {
            "name": name,
            "address": hex(start),
            "size": len(code),
            "source": path.as_posix(),
            "original_code_sha256": sha(code),
            "purpose": purpose,
            "component_kind": "routine",
            "external_call_targets": [hex(target) for target in call_targets],
        }
        output = ROOT / path
        outputs.append((output, source, len(listing)))
        records.append(record)

    missing_records = []
    for record in records:
        existing = prior_by_name.get(record["name"])
        if existing is not None and existing != record:
            raise ValueError(f"Existing routine record differs: {record['name']}")
        if existing is None:
            missing_records.append(record)
    for (output, source, _), record in zip(outputs, records):
        if output.exists() and output.read_text() != source:
            raise ValueError(f"Existing source differs: {record['source']}")

    updated_routines = list(layout["routines"])
    updated_routines.extend(missing_records)
    if len(updated_routines) != len(prior_routines) + len(missing_records):
        raise ValueError("Routine count does not match the validated additions")
    if [r for r in updated_routines if r["name"] not in own_names] != [
            r for r in prior_routines if r["name"] not in own_names]:
        raise ValueError("Existing unrelated routine records would change")
    layout["routines"] = updated_routines
    if layout["tables"] != prior_tables:
        raise ValueError("Existing table records would change")
    if sum(record["name"] in own_names for record in updated_routines) != len(records):
        raise ValueError("Own routine records do not match the requested spans")
    layout["limitations"][0] = (
        f"{len(layout['routines'])} reconstructed routines/fragments only; "
        "remaining firmware is a pinned vendor input"
    )
    serialized_layout = (json.dumps(layout, indent=2) + "\n").encode()

    # All decoder, CFG, collision, and byte-equality checks complete before writing.
    for output, source, _ in outputs:
        if not output.exists():
            with output.open("x") as handle:
                handle.write(source)
    if serialized_layout != prior_layout_bytes:
        LAYOUT.write_bytes(serialized_layout)
    print(f"Validated {len(outputs)} routines, "
          f"{sum(item[2] for item in outputs)} instructions, "
          f"{sum(record['size'] for record in records)} code bytes; "
          f"added {len(missing_records)} records; returns "
          + ", ".join(f"{name}={len(decoded[name][3])}" for name, *_ in SPANS))


if __name__ == "__main__":
    recover()
