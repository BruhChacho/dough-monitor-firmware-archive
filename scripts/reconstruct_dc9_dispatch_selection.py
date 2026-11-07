"""Recover channel selector helpers and indirect metadata dispatch sources."""
import json
from pathlib import Path

from aeon_helper_emulator import context
from aeon_subset_assembler import assemble
from build_dc9_source_baseline import LAYOUT, ROOT, load_original, sha


SPANS = [
    ("channel_dispatch_selection_read", 0x21be27, 0x21be98,
     "Read the engine selector byte and return bits 2..6; unsupported engine indices return 0x1f.",
     set(), set()),
    ("channel_dispatch_metadata_indirect", 0x21dcee, 0x21dd76,
     "Dispatch a selected metadata key through nine absolute targets; valid cases tail through 0x23ddb9.",
     {0x23ddb9},
     {0x21dd25, 0x21dd36, 0x21dd6e, 0x21dd66, 0x21dd5e,
      0x21dd56, 0x21dd4e, 0x21dd46, 0x21dd3e}),
    ("channel_dispatch_mask_02", 0x21be98, 0x21bece,
     "Apply selector masked update with mask 0x02.", {0x23dfe1}, set()),
    ("channel_dispatch_mask_01", 0x21bece, 0x21bf19,
     "Apply selector masked update with mask 0x01.", {0x23dfe1}, set()),
    ("channel_dispatch_mask_30", 0x21bf19, 0x21bf85,
     "Apply selector masked update with mask 0x30.", {0x23dfe1}, set()),
    ("channel_dispatch_mask_18", 0x21bf85, 0x21bfca,
     "Apply selector masked update with mask 0x18.", {0x23dfe1}, set()),
]
TABLE = ("channel_dispatch_metadata_targets", 0x2af5b8, 36,
         "Nine little-endian absolute code pointers used by metadata dispatch.")
UNCOND = {"bt.j", "bn.j", "bg.j"}
RET = {"bt.jr"}


def branch_target(row):
    return int(row.body.rstrip(",").split(",")[-1].strip(), 0)


def is_branch(op):
    return op in UNCOND or op.startswith(("bg.b", "bn.b"))


def check_cfg(name, start, end, rows, external_tails, indirect_targets):
    bounds = {row.addr.offset for row in rows}
    succ, returns, tails = {}, [], []
    indirect_jumps = []
    for row in rows:
        pc, nxt, op = row.addr.offset, row.addr.offset + row.length, row.mnem
        edges = []
        if op in RET:
            if name == "channel_dispatch_metadata_indirect" and pc == 0x21dd23:
                if row.body.strip() != "r7":
                    raise ValueError(f"{name}: indirect dispatch register differs at {pc:#x}")
                if indirect_targets != {0x21dd25, 0x21dd36, 0x21dd6e,
                        0x21dd66, 0x21dd5e, 0x21dd56, 0x21dd4e, 0x21dd46, 0x21dd3e}:
                    raise ValueError(f"{name}: unexpected indirect target set")
                edges.extend(sorted(indirect_targets))
                indirect_jumps.append(pc)
            elif row.body.strip() == "r9":
                returns.append(pc)
            else:
                raise ValueError(f"{name}: unmodeled indirect jump register at {pc:#x}: {row.body}")
        elif op in UNCOND:
            dest = branch_target(row)
            if dest in external_tails:
                tails.append((pc, dest))
            elif start <= dest < end and dest in bounds:
                edges.append(dest)
            else:
                raise ValueError(f"{name}: invalid unconditional target {dest:#x}")
        elif op.startswith(("bg.b", "bn.b")):
            dest = branch_target(row)
            if not start <= dest < end or dest not in bounds:
                raise ValueError(f"{name}: invalid conditional target {dest:#x}")
            edges.append(dest)
            if nxt < end:
                edges.append(nxt)
        elif nxt < end:
            edges.append(nxt)
        succ[pc] = edges
    if set(dest for _, dest in tails) != external_tails:
        raise ValueError(f"{name}: external tail target set differs: {tails}")
    if not returns and not tails:
        raise ValueError(f"{name}: no terminal return or listed external tail")
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
    if any(row.addr.offset + row.length == end and row.mnem not in UNCOND | RET for row in rows):
        raise ValueError(f"{name}: final instruction falls through span")
    return returns, tails, indirect_jumps


def recover():
    _, expanded, _ = load_original()
    layout = json.loads(LAYOUT.read_text())
    layout_bytes = LAYOUT.read_bytes()
    prior_routines, prior_tables = list(layout["routines"]), list(layout["tables"])
    routine_names = [row["name"] for row in prior_routines]
    table_names = [row["name"] for row in prior_tables]
    if len(routine_names) != len(set(routine_names)) or len(table_names) != len(set(table_names)):
        raise ValueError("duplicate existing routine or table name")
    by_name = {row["name"]: row for row in prior_routines}
    table_by_name = {row["name"]: row for row in prior_tables}
    ctx = context()

    name, address, size, purpose = TABLE
    raw_table = expanded[address - 0x200000:address - 0x200000 + size]
    targets = [int.from_bytes(raw_table[i:i + 4], "little") for i in range(0, size, 4)]
    if len(raw_table) != size or targets != [0x21dd25, 0x21dd36, 0x21dd6e,
            0x21dd66, 0x21dd5e, 0x21dd56, 0x21dd4e, 0x21dd46, 0x21dd3e]:
        raise ValueError("metadata dispatch table bytes/target order differ")
    table_record = {"name": name, "address": hex(address), "size": size,
                    "original_data_sha256": sha(raw_table),
                    "values": [hex(byte) for byte in raw_table],
                    "decoded_values": [hex(target) for target in targets],
                    "purpose": purpose}
    if table_record["original_data_sha256"] != "2d298797c026ce4e84ebefd43de1e37f6bcb2438d627275f1aac8be22dfb2dfa":
        raise ValueError("metadata dispatch table SHA-256 differs")

    for i, (rname, start, end, _, _, _) in enumerate(SPANS):
        for other, a, b, *_ in SPANS[i + 1:]:
            if start < b and a < end:
                raise ValueError(f"requested spans overlap: {rname} and {other}")
        for collection in (prior_routines, prior_tables):
            for record in collection:
                a = int(record["address"], 16)
                b = a + record["size"]
                if record.get("name") == rname and collection is prior_routines and a == start and b == end:
                    continue
                if start < b and a < end:
                    raise ValueError(f"{rname} overlaps existing component {record['name']}")
    for record in prior_routines + prior_tables:
        a = int(record["address"], 16)
        b = a + record["size"]
        if record.get("name") == name and record in prior_tables and a == address and b == address + size:
            continue
        if address < b and a < address + size:
            raise ValueError(f"table overlaps existing component {record['name']}")

    if name in table_by_name and table_by_name[name] != table_record:
        raise ValueError(f"existing table record differs: {name}")
    outputs, records, checks = [], [], {}
    own_names = {item[0] for item in SPANS}
    for rname, start, end, purpose, external_tails, indirect in SPANS:
        code = expanded[start - 0x200000:end - 0x200000]
        rows = ctx.disassemble(code, base_address=start).instructions
        if (not code or sum(row.length for row in rows) != len(code)
                or rows[0].addr.offset != start or rows[-1].addr.offset + rows[-1].length != end):
            raise ValueError(f"incomplete decode/boundary: {rname}")
        if indirect and not set(targets).issubset({row.addr.offset for row in rows}):
            raise ValueError(f"{rname}: indirect target misses instruction boundary")
        returns, tails, jumps = check_cfg(rname, start, end, rows, external_tails, set(targets) if indirect else set())
        local = {branch_target(row) for row in rows if is_branch(row.mnem)
                 and start <= branch_target(row) < end}
        local.update(indirect)
        source_lines = [
            "# Firmware-derived reconstruction; excluded from the repository MIT grant.",
            f"# DC9 v101 candidate [{start:#x},{end:#x}); {purpose}",
            "# Fixed original addresses; not hardware-validated.",
        ]
        for row in rows:
            if row.addr.offset in local:
                source_lines.append(f"loc_{row.addr.offset:x}:")
            args = [value.strip() for value in row.body.rstrip(",").split(",")]
            if is_branch(row.mnem) and branch_target(row) in local:
                args[-1] = f"loc_{branch_target(row):x}"
            source_lines.append("    " + row.mnem + " " + ", ".join(args))
        source = "\n".join(source_lines) + "\n"
        assembled, listing = assemble(source, start)
        if assembled != code:
            raise ValueError(f"reassembly differs: {rname}")
        path = Path("analysis/reconstructed") / f"spectrum_one_{rname}.aeon.s"
        record = {"name": rname, "address": hex(start), "size": len(code),
                  "source": path.as_posix(), "original_code_sha256": sha(code),
                  "purpose": purpose, "component_kind": "routine",
                  "external_call_targets": [hex(value) for value in sorted(
                      {int(row.body, 0) for row in rows if row.mnem == "bg.jal"})],
                  "external_tail_targets": [hex(value) for value in sorted({dest for _, dest in tails})]}
        if rname in by_name and by_name[rname] != record:
            raise ValueError(f"existing routine record differs: {rname}")
        out = ROOT / path
        if out.exists() and out.read_text() != source:
            raise ValueError(f"existing source differs: {path}")
        outputs.append((out, source, len(listing)))
        records.append(record)
        checks[rname] = (returns, tails, jumps)

    missing = [record for record in records if record["name"] not in by_name]
    layout["routines"].extend(missing)
    if name not in table_by_name:
        layout["tables"].append(table_record)
    if layout["tables"] != prior_tables and layout["tables"] != prior_tables + [table_record]:
        raise ValueError("unrelated table records changed")
    if ([row for row in layout["routines"] if row["name"] not in own_names]
            != [row for row in prior_routines if row["name"] not in own_names]):
        raise ValueError("unrelated routine records changed")
    layout["limitations"][0] = f"{len(layout['routines'])} reconstructed routines/fragments only; remaining firmware is a pinned vendor input"
    new_layout = (json.dumps(layout, indent=2) + "\n").encode()
    if LAYOUT.read_bytes() != layout_bytes:
        raise ValueError("layout changed during validation")
    # All validation finishes before any output is created.
    for out, source, _ in outputs:
        if not out.exists():
            with out.open("x") as handle:
                handle.write(source)
    if new_layout != layout_bytes:
        LAYOUT.write_bytes(new_layout)
    print(f"Validated {len(records)} routines, {sum(item[2] for item in outputs)} instructions, {sum(row['size'] for row in records)} code bytes; table {name}: {targets}")
    for rname, *_ in SPANS:
        returns, tails, jumps = checks[rname]
        print(f"{rname}: returns={len(returns)}, tails={[hex(dest) for _, dest in tails]}, indirect_jumps={[hex(pc) for pc in jumps]}")


if __name__ == "__main__":
    recover()
