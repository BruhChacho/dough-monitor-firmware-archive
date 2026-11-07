"""Recover exact channel update routines from the pinned DC9 image.

Only boundaries and instructions supported by the current restricted encoder
are emitted. This is source recovery, not hardware semantic validation.
"""
import json
from pathlib import Path

from aeon_helper_emulator import context
from aeon_subset_assembler import assemble
from build_dc9_source_baseline import LAYOUT, ROOT, load_original, sha

SPANS = [
    ("channel_metadata_update", 0x2271a9, 0x2272cf,
     "Update channel metadata flags using the metadata index and channel record."),
    ("channel_metadata_bit_update", 0x227145, 0x2271a9,
     "Allocate and mark channel metadata ownership, then call the channel helper."),
    ("channel_overlap_flags_update", 0x222843, 0x222898,
     "Update channel overlap flags 0x35 and 0x36."),
    ("engine_pair01_available", 0x222ace, 0x222af1,
     "Return whether engine register pair 0x01 is available."),
    ("engine_pair23_available", 0x222af1, 0x222b15,
     "Return whether engine register pair 0x23 is available."),
    ("channel_record_rectangle_assign", 0x2229f8, 0x222aa2,
     "Assign the selected channel rectangle using the requested engine and record."),
    ("engine_free_index_scan", 0x222b65, 0x222b8a,
     "Scan engine records and return a free engine index, if found."),
    ("channel_update_range_check", 0x22aa4e, 0x22ab1c,
     "Check channel records in the selected range and apply range-update helpers."),
    ("channel_update_range_apply", 0x22ab1c, 0x22ac17,
     "Apply the requested update across channel records in the selected range."),
]


def local_branch(op):
    return op.startswith(("bg.b", "bn.b")) or op in ("bt.j", "bn.j", "bg.j")


def recover():
    _, expanded, _ = load_original()
    ctx = context()
    layout = json.loads(LAYOUT.read_text())
    prior = list(layout["routines"])
    names = {record["name"] for record in prior}
    outputs = []
    for name, start, end, purpose in SPANS:
        code = expanded[start - 0x200000:end - 0x200000]
        rows = ctx.disassemble(code, base_address=start).instructions
        if sum(row.length for row in rows) != len(code):
            raise ValueError(f"Incomplete decode: {name}")
        targets = {int(row.body.rstrip(",").split(",")[-1], 0)
                   for row in rows if local_branch(row.mnem)}
        targets = {target for target in targets if start <= target < end}
        boundaries = {row.addr.offset for row in rows}
        if not targets.issubset(boundaries):
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
            "name": name, "address": hex(start), "size": len(code),
            "source": path.as_posix(), "original_code_sha256": sha(code),
            "purpose": purpose, "component_kind": "routine",
        }
        existing = [item for item in prior if item["name"] == name]
        if existing and existing != [record]:
            raise ValueError(f"Layout entry differs: {name}")
        output = ROOT / path
        if output.exists() and output.read_text() != source:
            raise ValueError(f"Existing source differs: {path}")
        outputs.append((output, source, len(listing), record))

    for output, source, _, _ in outputs:
        if not output.exists():
            with output.open("x") as handle:
                handle.write(source)
    for _, _, _, record in outputs:
        if record["name"] not in names:
            layout["routines"].append(record)
    if len(layout["routines"]) != len(prior) + sum(r["name"] not in names for *_, r in outputs):
        raise ValueError("Unexpected routine-layout mutation")
    layout["limitations"][0] = (f"{len(layout['routines'])} reconstructed routines/fragments only; "
                                "remaining firmware is a pinned vendor input")
    LAYOUT.write_text(json.dumps(layout, indent=2) + "\n")
    print(f"Recovered {len(outputs)} routines, {sum(item[2] for item in outputs)} instructions")


if __name__ == "__main__":
    recover()
