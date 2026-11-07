"""Recover byte-exact DC9 wide arithmetic helpers and their byte lookup table."""
import json
from pathlib import Path

from aeon_helper_emulator import context
from aeon_subset_assembler import assemble
from build_dc9_source_baseline import LAYOUT, ROOT, load_original, sha

SPANS = [
    ("wide_multiply", 0x2aacb9, 0x2aad0b,
     "Modulo-64-bit product of two 64-bit operands, reconstructed from partial-product operations."),
    ("wide_compare_signed", 0x2aad0b, 0x2aad27,
     "Compare signed high words, then unsigned low words, returning 0, 1, or 2 for less, equal, or greater."),
    ("wide_unsigned_divide", 0x2ab331, 0x2ab6d2,
     "Unsigned wide divide helper; calls no external routines."),
]
TABLE = ("byte_bit_length_lookup", 0x33b628, 256,
         "Byte-indexed bit-length lookup used by the wide divide helper.")
UNCOND = {"bt.j", "bn.j", "bg.j"}
RET = {"bt.jr"}


def target(row):
    return int(row.body.rstrip(",").split(",")[-1].strip(), 0)


def is_branch(op):
    return op in UNCOND or op.startswith(("bg.b", "bn.b"))


def check_cfg(name, start, end, rows):
    bounds = {r.addr.offset for r in rows}
    succ, returns = {}, []
    for r in rows:
        pc, nxt, op = r.addr.offset, r.addr.offset + r.length, r.mnem
        edges = []
        if op in RET:
            args = [x.strip() for x in r.body.rstrip(",").split(",")]
            if args != ["r9"]:
                raise ValueError(f"{name}: return must use r9, got {args}")
            returns.append(pc)
        elif op in UNCOND:
            dest = target(r)
            if not start <= dest < end or dest not in bounds:
                raise ValueError(f"{name}: invalid jump target {dest:#x}")
            edges.append(dest)
        elif is_branch(op):
            dest = target(r)
            if not start <= dest < end or dest not in bounds:
                raise ValueError(f"{name}: invalid conditional target {dest:#x}")
            edges.append(dest)
            if nxt < end:
                edges.append(nxt)
        elif nxt < end:
            edges.append(nxt)
        succ[pc] = edges
    if not returns:
        raise ValueError(f"{name}: no return instruction")
    reached, todo = set(), [start]
    while todo:
        pc = todo.pop()
        if pc in reached:
            continue
        if pc not in bounds:
            raise ValueError(f"{name}: non-boundary CFG node {pc:#x}")
        reached.add(pc)
        todo.extend(succ[pc])
    if reached != bounds:
        raise ValueError(f"{name}: unreachable instructions {sorted(bounds-reached)[:8]}")
    if any(r.addr.offset + r.length == end and r.mnem not in UNCOND | RET for r in rows):
        raise ValueError(f"{name}: final instruction falls through span")
    return returns


def recover():
    _, expanded, _ = load_original()
    ctx = context()
    layout = json.loads(LAYOUT.read_text())
    prior_layout = LAYOUT.read_bytes()
    prior_routines, prior_tables = list(layout["routines"]), list(layout["tables"])
    by_name = {r["name"]: r for r in prior_routines}
    table_by_name = {t["name"]: t for t in prior_tables}
    if len(by_name) != len(prior_routines) or len(table_by_name) != len(prior_tables):
        raise ValueError("duplicate existing layout name")

    table_name, table_start, table_size, table_purpose = TABLE
    table_bytes = expanded[table_start - 0x200000:table_start - 0x200000 + table_size]
    derived = bytes((i.bit_length() for i in range(256)))
    if len(table_bytes) != table_size or table_bytes != derived:
        raise ValueError("candidate byte lookup does not match bit_length(0..255)")
    table_record = {
        "name": table_name, "address": hex(table_start), "size": table_size,
        "values": [hex(x) for x in table_bytes],
        "original_data_sha256": sha(table_bytes), "purpose": table_purpose,
    }
    if table_name in table_by_name and table_by_name[table_name] != table_record:
        raise ValueError("existing byte bit-length table record differs")

    records, outputs = [], []
    own_names = {spec[0] for spec in SPANS}
    for name, start, end, purpose in SPANS:
        for old in prior_routines + prior_tables:
            a = int(old["address"], 16)
            b = a + old["size"]
            if (old.get("name") == name and old.get("address") == hex(start)
                    and old.get("size") == end - start and old in prior_routines):
                continue
            if start < b and a < end:
                raise ValueError(f"{name} overlaps existing {old['name']}")
        if start < table_start + table_size and table_start < end:
            raise ValueError(f"{name} overlaps {table_name}")
        code = expanded[start - 0x200000:end - 0x200000]
        rows = ctx.disassemble(code, base_address=start).instructions
        if (not code or sum(r.length for r in rows) != len(code)
                or rows[0].addr.offset != start
                or rows[-1].addr.offset + rows[-1].length != end):
            raise ValueError(f"incomplete decode/boundary: {name}")
        if any(r.mnem in ("bg.jal", "bn.jal", "bt.jalr") for r in rows):
            raise ValueError(f"{name}: unexpected external call")
        check_cfg(name, start, end, rows)
        internal = {target(r) for r in rows if is_branch(r.mnem)
                    and target(r) in {x.addr.offset for x in rows}}
        lines = ["# Firmware-derived reconstruction; excluded from the repository MIT grant.",
                 f"# DC9 v101 candidate [{start:#x},{end:#x}); {purpose}",
                 "# Fixed original addresses; not hardware-validated."]
        for r in rows:
            if r.addr.offset in internal:
                lines.append(f"loc_{r.addr.offset:x}:")
            args = [v.strip() for v in r.body.rstrip(",").split(",")]
            if is_branch(r.mnem) and target(r) in internal:
                args[-1] = f"loc_{target(r):x}"
            lines.append("    " + r.mnem + " " + ", ".join(args))
        source = "\n".join(lines) + "\n"
        encoded, listing = assemble(source, start)
        if encoded != code:
            raise ValueError(f"reassembly differs: {name}")
        source_path = Path("analysis/reconstructed") / f"spectrum_one_{name}.aeon.s"
        record = {
            "name": name, "address": hex(start), "size": len(code),
            "source": source_path.as_posix(), "original_code_sha256": sha(code),
            "purpose": purpose, "component_kind": "routine",
            "external_call_targets": [], "external_tail_targets": [],
        }
        if name in by_name and by_name[name] != record:
            raise ValueError(f"existing routine record differs: {name}")
        output_path = ROOT / source_path
        if output_path.exists() and output_path.read_text() != source:
            raise ValueError(f"existing source differs: {source_path}")
        outputs.append((output_path, source, len(listing)))
        records.append(record)

    for i, record in enumerate(records):
        a, b = int(record["address"], 16), int(record["address"], 16) + record["size"]
        for other in records[i + 1:]:
            c, d = int(other["address"], 16), int(other["address"], 16) + other["size"]
            if a < d and c < b:
                raise ValueError(f"requested spans overlap: {record['name']} and {other['name']}")

    layout["routines"].extend(r for r in records if r["name"] not in by_name)
    if table_name not in table_by_name:
        layout["tables"].append(table_record)
    if [r for r in layout["routines"] if r["name"] not in own_names] != [
            r for r in prior_routines if r["name"] not in own_names]:
        raise ValueError("unrelated routine records changed")
    if [t for t in layout["tables"] if t["name"] != table_name] != [
            t for t in prior_tables if t["name"] != table_name]:
        raise ValueError("unrelated table records changed")
    layout["limitations"][0] = (
        f"{len(layout['routines'])} reconstructed routines/fragments only; remaining firmware is a pinned vendor input")
    new_layout = (json.dumps(layout, indent=2) + "\n").encode()
    if LAYOUT.read_bytes() != prior_layout:
        raise ValueError("source layout changed while recovery was in progress")
    for output_path, source, _ in outputs:
        if not output_path.exists():
            with output_path.open("x") as f:
                f.write(source)
    if new_layout != prior_layout:
        LAYOUT.write_bytes(new_layout)
    print(f"Validated {len(records)} routines, {sum(x[2] for x in outputs)} instructions, "
          f"{sum(r['size'] for r in records)} code bytes; table {table_name}: {table_size} exact bytes")


if __name__ == "__main__":
    recover()
