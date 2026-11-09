"""Recover four bounded DC9 conversion leaves from pinned firmware bytes.

The script checks instruction boundaries, local control flow, overlaps, direct
calls, and byte-exact reassembly before optionally writing new source files.
It does not update the layout manifest.
"""
import argparse
import json
import os
from pathlib import Path
import tempfile

from aeon_helper_emulator import context
from aeon_subset_assembler import assemble
from build_dc9_source_baseline import LAYOUT, ROOT, load_original, sha


SPANS = [
    ("conversion_from_wide", 0x2ac756, 0x2ac837,
     "Convert a two-word input into a tagged conversion record; called helper semantics remain unresolved."),
    ("conversion_to_wide_wrapper", 0x2ad165, 0x2ad1b7,
     "Prepare a conversion record, call the conversion leaf and finalize the output; helper semantics remain unresolved."),
    ("conversion_wrapper", 0x2ac268, 0x2ac288,
     "Save four arguments, call the float conversion leaf and restore the return path."),
    ("conversion_to_float", 0x2aba8f, 0x2abba0,
     "Convert a tagged value to a 32-bit floating-point representation; numeric edge behavior is not independently validated."),
]

UNCOND = {"bt.j", "bn.j", "bg.j"}
RET = {"bt.jr"}


def branch_target(row):
    return int(row.body.rstrip(",").split(",")[-1].strip(), 0)


def is_branch(op):
    return op in UNCOND or op.startswith(("bg.b", "bn.b"))


def check_cfg(name, start, end, rows):
    bounds = {row.addr.offset for row in rows}
    succ, returns = {}, []
    for row in rows:
        pc, nxt, op = row.addr.offset, row.addr.offset + row.length, row.mnem
        edges = []
        if op in RET:
            args = [x.strip() for x in row.body.rstrip(",").split(",")]
            if args != ["r9"]:
                raise ValueError(f"{name}: unexpected return register operands {args}")
            returns.append(pc)
        elif op in UNCOND:
            target = branch_target(row)
            if not start <= target < end or target not in bounds:
                raise ValueError(f"{name}: invalid local jump target {target:#x}")
            edges.append(target)
        elif is_branch(op):
            target = branch_target(row)
            if not start <= target < end or target not in bounds:
                raise ValueError(f"{name}: invalid conditional target {target:#x}")
            edges.append(target)
            if nxt < end:
                edges.append(nxt)
        elif nxt < end:
            edges.append(nxt)
        succ[pc] = edges

    if not returns:
        raise ValueError(f"{name}: no decoded return")
    reached, todo = set(), [start]
    while todo:
        pc = todo.pop()
        if pc in reached:
            continue
        if pc not in bounds:
            raise ValueError(f"{name}: CFG reaches non-instruction boundary {pc:#x}")
        reached.add(pc)
        todo.extend(succ[pc])
    if reached != bounds:
        raise ValueError(f"{name}: unreachable instructions {sorted(bounds - reached)[:8]}")
    if any(row.addr.offset + row.length == end and
           row.mnem not in UNCOND | RET for row in rows):
        raise ValueError(f"{name}: final instruction falls through its span")
    return bounds, returns


def source_for(name, start, end, purpose, rows, code):
    local_targets = {branch_target(row) for row in rows if is_branch(row.mnem)}
    lines = [
        "# Firmware-derived reconstruction; excluded from the repository MIT grant.",
        f"# DC9 v101 candidate [{start:#x},{end:#x}); {purpose}",
        "# Fixed original addresses; not hardware-validated.",
    ]
    for row in rows:
        if row.addr.offset in local_targets:
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
    return source, listing


def recover(apply=False):
    _, expanded, _ = load_original()
    original_layout_bytes = LAYOUT.read_bytes()
    layout = json.loads(original_layout_bytes)
    routines, tables = layout["routines"], layout["tables"]
    records_by_name = {}
    for record in routines:
        if record["name"] in records_by_name:
            raise ValueError(f"Duplicate existing routine name: {record['name']}")
        records_by_name[record["name"]] = record

    requested = [(start, end, name) for name, start, end, _ in SPANS]
    for i, (start, end, name) in enumerate(requested):
        if start >= end:
            raise ValueError(f"Invalid span: {name}")
        for other_start, other_end, other_name in requested[i + 1:]:
            if start < other_end and other_start < end:
                raise ValueError(f"Requested spans overlap: {name} and {other_name}")
        for record in routines + tables:
            old_start = int(record["address"], 16)
            old_end = old_start + record["size"]
            if record.get("name") == name and old_start == start and old_end == end:
                continue
            if start < old_end and old_start < end:
                raise ValueError(f"Span overlaps existing component {record['name']}: {name}")

    ctx = context()
    built = []
    candidate_names = {name for name, *_ in SPANS}
    for name, start, end, purpose in SPANS:
        code = expanded[start - 0x200000:end - 0x200000]
        rows = ctx.disassemble(code, base_address=start).instructions
        if not code or sum(row.length for row in rows) != len(code):
            raise ValueError(f"Incomplete pinned decode: {name}")
        if rows[0].addr.offset != start or rows[-1].addr.offset + rows[-1].length != end:
            raise ValueError(f"Decoded boundaries disagree with requested span: {name}")
        _, returns = check_cfg(name, start, end, rows)
        calls = sorted({int(row.body, 0) for row in rows if row.mnem == "bg.jal"})
        for target in calls:
            if target in {begin for _, begin, _, _ in SPANS}:
                continue
            # Calls outside this candidate batch are allowed as external services;
            # no behavior is inferred from them.
            pass
        source, listing = source_for(name, start, end, purpose, rows, code)
        path = Path("analysis/reconstructed") / f"spectrum_one_{name}.aeon.s"
        record = {
            "name": name, "address": hex(start), "size": len(code),
            "source": path.as_posix(), "original_code_sha256": sha(code),
            "purpose": purpose, "component_kind": "routine",
            "external_call_targets": [hex(target) for target in calls
                                       if target not in {begin for _, begin, _, _ in SPANS}],
        }
        existing = records_by_name.get(name)
        if existing is not None and existing != record:
            raise ValueError(f"Existing routine record differs: {name}")
        output = ROOT / path
        if output.exists() and output.read_text() != source:
            raise ValueError(f"Existing source differs: {path}")
        built.append((name, source, output, record, len(listing), len(code), len(returns), calls))

    if len({item[0] for item in built}) != len(candidate_names):
        raise ValueError("Candidate source count mismatch")
    additions = [record for name, _, _, record, *_ in built
                 if name not in records_by_name]
    updated_layout = dict(layout)
    updated_layout["routines"] = list(routines) + additions
    if additions:
        updated_layout["limitations"] = list(layout["limitations"])
        updated_layout["limitations"][0] = (
            f"{len(updated_layout['routines'])} reconstructed routines/fragments only; "
            "remaining firmware is a pinned vendor input"
        )
    serialized_layout = (json.dumps(updated_layout, indent=2) + "\n").encode()
    if [record for record in updated_layout["routines"] if record["name"] not in candidate_names] != [
            record for record in routines if record["name"] not in candidate_names]:
        raise ValueError("Unrelated routine records would change")
    if updated_layout["tables"] != tables:
        raise ValueError("Existing table records would change")

    if apply:
        # Check identity before any filesystem change, then again immediately
        # before replacing the manifest to detect concurrent publication.
        if LAYOUT.read_bytes() != original_layout_bytes:
            raise ValueError("Layout changed during validation; rerun against the current layout")
        for _, source, output, *_ in built:
            if not output.exists():
                output.parent.mkdir(parents=True, exist_ok=True)
                with output.open("x") as handle:
                    handle.write(source)
        if LAYOUT.read_bytes() != original_layout_bytes:
            raise ValueError("Layout changed while writing sources; sources are idempotent, rerun before layout publication")
        if serialized_layout != original_layout_bytes:
            with tempfile.NamedTemporaryFile(dir=LAYOUT.parent, prefix=LAYOUT.name + ".",
                                             suffix=".tmp", delete=False) as temporary:
                temporary.write(serialized_layout)
                temporary_path = Path(temporary.name)
            try:
                if LAYOUT.read_bytes() != original_layout_bytes:
                    raise ValueError("Layout changed before atomic replacement; rerun against the current layout")
                os.replace(temporary_path, LAYOUT)
            finally:
                if temporary_path.exists():
                    temporary_path.unlink()
    print(f"Validated {len(built)} conversion leaves, "
          f"{sum(item[4] for item in built)} instructions, "
          f"{sum(item[5] for item in built)} code bytes; "
          f"added {len(additions)} records; "
          f"returns=" + ", ".join(f"{item[0]}:{item[6]}" for item in built))
    for name, _, _, _, _, _, _, calls in built:
        print(f"{name}: calls=" + ", ".join(hex(target) for target in calls))


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--apply", action="store_true",
                        help="after all checks, add matching sources and routine records")
    recover(apply=parser.parse_args().apply)
