"""Recover engine-mode routine, dispatch wrapper, and global helpers.

Routines are decoded from the pinned DC9 image, then reassembled byte-exactly
at their original addresses. The dispatch table is recorded as original data;
none of these candidates imply modeled device behavior.
"""
import json
from pathlib import Path

from aeon_helper_emulator import context
from aeon_subset_assembler import assemble
from build_dc9_source_baseline import LAYOUT, ROOT, load_original, sha


SPANS = [
    ("engine_mode_configuration", 0x2213d0, 0x222634,
     "Configure engine mode through indexed branches and register requests; external services remain unresolved."),
    ("engine_mode_reset", 0x222634, 0x222679,
     "Set global mode parameters, invoke the mode routine, and update engine state."),
    ("engine_mode_apply_wrapper", 0x23d349, 0x23d36a,
     "Invoke the engine-mode routine for indices 0 through 12."),
    ("global_halfword_set", 0x21bd00, 0x21bd0a,
     "Execute ambiguous bg.sh store relative to global 0x343c14; width/lane policies remain unresolved."),
    ("global_word_set", 0x21bd0a, 0x21bd14,
     "Execute ambiguous bg.sw_1 store relative to global 0x343c14; width/lane policies remain unresolved."),
    ("global_adjacent_halfword_read", 0x21bd14, 0x21bd1e,
     "Read a halfword from global address 0x343c16."),
]

MODE_TABLE = ("engine_mode_dispatch", 0x2af5dc, 44,
              "Eleven little-endian branch pointers used by engine-mode configuration.")


def local_branch(op):
    return op.startswith(("bg.b", "bn.b")) or op in ("bt.j", "bn.j", "bg.j")


def table_record(data, boundaries):
    name, address, size, purpose = MODE_TABLE
    raw = data[address - 0x200000:address - 0x200000 + size]
    if len(raw) != size or size % 4:
        raise ValueError("Invalid engine mode dispatch table")
    values = [int.from_bytes(raw[i:i + 4], "little")
              for i in range(0, size, 4)]
    if len(values) != 11 or any(value not in boundaries for value in values):
        raise ValueError("Engine mode table target misses a routine instruction boundary")
    return {
        "name": name,
        "address": hex(address),
        "size": size,
        "values": [hex(value) for value in raw],
        "original_data_sha256": sha(raw),
    }


def recover():
    _, expanded, _ = load_original()
    ctx = context()
    layout = json.loads(LAYOUT.read_text())
    prior_routines = list(layout["routines"])
    prior_tables = list(layout["tables"])
    prior_layout_bytes = LAYOUT.read_bytes()
    prior_by_name = {}
    for record in prior_routines:
        if record["name"] in prior_by_name:
            raise ValueError(f"Duplicate routine name: {record['name']}")
        prior_by_name[record["name"]] = record
    prior_table_by_name = {}
    for record in prior_tables:
        if record["name"] in prior_table_by_name:
            raise ValueError(f"Duplicate table name: {record['name']}")
        prior_table_by_name[record["name"]] = record

    requested = [(start, end, name) for name, start, end, _ in SPANS]
    for index, (start, end, name) in enumerate(requested):
        if start >= end:
            raise ValueError(f"Invalid span: {name}")
        for other_start, other_end, other_name in requested[index + 1:]:
            if start < other_end and other_start < end:
                raise ValueError(f"Requested routine spans overlap: {name} and {other_name}")
        for record in prior_routines:
            old_start = int(record["address"], 16)
            old_end = old_start + record["size"]
            if (record["name"] == name and old_start == start
                    and record["size"] == end - start):
                continue
            if start < old_end and old_start < end:
                raise ValueError(f"Span overlaps existing routine {record['name']}: {name}")
        for record in prior_tables:
            old_start = int(record["address"], 16)
            old_end = old_start + record["size"]
            if start < old_end and old_start < end:
                raise ValueError(f"Span overlaps existing table {record['name']}: {name}")

    decoded = {}
    for name, start, end, _ in SPANS:
        code = expanded[start - 0x200000:end - 0x200000]
        rows = ctx.disassemble(code, base_address=start).instructions
        if not code or sum(row.length for row in rows) != len(code):
            raise ValueError(f"Incomplete decode: {name}")
        decoded[name] = (code, rows)

    # The 44-byte table is data at a separate image address, and all entries
    # must resolve to instruction starts inside the mode-configuration span.
    mode_targets = table_record(expanded, {
        row.addr.offset for row in decoded["engine_mode_configuration"][1]
    })

    outputs = []
    records = []
    for name, start, end, purpose in SPANS:
        code, rows = decoded[name]
        targets = {int(row.body.rstrip(",").split(",")[-1], 0)
                   for row in rows if local_branch(row.mnem)}
        targets = {target for target in targets if start <= target < end}
        row_boundaries = {row.addr.offset for row in rows}
        if not targets.issubset(row_boundaries):
            raise ValueError(f"Branch misses instruction boundary: {name}")

        lines = [
            "# Firmware-derived reconstruction; excluded from the repository MIT grant.",
            f"# DC9 v101 candidate [{start:#x},{end:#x}); {purpose}",
            "# Fixed original addresses; not hardware-validated.",
        ]
        for row in rows:
            if row.addr.offset in targets:
                lines.append(f"loc_{row.addr.offset:x}:")
            args = [value.strip() for value in row.body.rstrip(",").split(",")]
            if local_branch(row.mnem):
                target = int(args[-1], 0)
                if target in targets:
                    args[-1] = f"loc_{target:x}"
            lines.append("    " + row.mnem + " " + ", ".join(args))
        source = "\n".join(lines) + "\n"
        encoded, listing = assemble(source, start)
        if encoded != code:
            raise ValueError(f"Encoding differs from original: {name}")

        path = Path("analysis/reconstructed") / f"spectrum_one_{name}.aeon.s"
        record = {
            "name": name,
            "address": hex(start),
            "size": len(code),
            "source": path.as_posix(),
            "original_code_sha256": sha(code),
            "purpose": purpose,
            "component_kind": "routine",
        }
        output = ROOT / path
        outputs.append((output, source, len(listing)))
        records.append(record)

    table_name, table_start, table_size, _ = MODE_TABLE
    table_end = table_start + table_size
    old_table = prior_table_by_name.get(table_name)
    if old_table is not None and old_table != mode_targets:
        raise ValueError(f"Existing table record differs: {table_name}")
    for record in prior_routines + prior_tables:
        old_start = int(record["address"], 16)
        old_end = old_start + record["size"]
        if (record["name"] == table_name and old_start == table_start
                and record["size"] == table_size and record in prior_tables):
            continue
        if table_start < old_end and old_start < table_end:
            raise ValueError(f"Mode table overlaps existing component {record['name']}")
    for start, end, name in requested:
        if table_start < end and start < table_end:
            raise ValueError(f"Mode table overlaps routine {name}")

    missing_records = []
    for record in records:
        existing = prior_by_name.get(record["name"])
        if existing is not None and existing != record:
            raise ValueError(f"Existing routine record differs: {record['name']}")
        if existing is None:
            missing_records.append(record)

    # Every existing file and layout record must match before any filesystem
    # write. Missing files/records may be restored from the pinned image.
    for (output, source, _), record in zip(outputs, records):
        if output.exists() and output.read_text() != source:
            raise ValueError(f"Existing source differs: {record['source']}")

    if len(layout["routines"]) != len(prior_routines) or layout["tables"] != prior_tables:
        raise ValueError("Unexpected layout mutation before emission")

    layout["routines"].extend(missing_records)
    if old_table is None:
        layout["tables"].append(mode_targets)
    layout["limitations"][0] = (
        f"{len(layout['routines'])} reconstructed routines/fragments only; "
        "remaining firmware is a pinned vendor input"
    )
    serialized_layout = (json.dumps(layout, indent=2) + "\n").encode()

    # No validation remains after this point: emit only missing sources and
    # records, preserving identical existing outputs on repeat runs.
    for output, source, _ in outputs:
        if not output.exists():
            with output.open("x") as handle:
                handle.write(source)
    if serialized_layout != prior_layout_bytes:
        LAYOUT.write_bytes(serialized_layout)
    print(f"Validated {len(outputs)} routines, "
          f"{sum(item[2] for item in outputs)} instructions, "
          f"{sum(record['size'] for record in records)} code bytes; "
          f"added {len(missing_records)} routine records; "
          f"table {table_name} ({table_size} bytes, "
          f"{'added' if old_table is None else 'matched'})")


if __name__ == "__main__":
    recover()
