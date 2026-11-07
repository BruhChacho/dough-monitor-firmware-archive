"""Recover the engine-preparation path and its immediate request helpers.

Every emitted routine is decoded from the pinned DC9 image and reassembled
byte-exactly. The routines retain fixed original addresses and do not claim
hardware behavior for the external services they call.
"""
import json
from pathlib import Path

from aeon_helper_emulator import context
from aeon_subset_assembler import assemble
from build_dc9_source_baseline import LAYOUT, ROOT, load_original, sha

SPANS = [
    ("engine_prepare_selected", 0x21ffb3, 0x22089f,
     "Prepare selected engine state and issue register requests; external services remain unresolved."),
    ("engine_pair_configuration", 0x22089f, 0x220995,
     "Prepare the selected engine-pair state and preserve its original service calls."),
    ("constant_one_return", 0x21bd8d, 0x21bd91,
     "Return the constant value 1."),
    ("deferred_request_dispatch_27aa7f", 0x23e49c, 0x23e4a0,
     "Tail-transfer to the existing request service at 0x27aa7f."),
    ("deferred_request_dispatch_27b4e2", 0x23e4a0, 0x23e4a6,
     "Set r3 to 1, then tail-transfer to the existing request service at 0x27b4e2."),
    ("deferred_masked_halfword_request", 0x23e4a6, 0x23e4f4,
     "Prepare a masked halfword request, then tail-transfer to the request service."),
    ("deferred_shifted_byte_request", 0x23e4f4, 0x23e50c,
     "Prepare a shifted masked byte request, then tail-transfer to the request service."),
    ("deferred_halfword_request", 0x23e58a, 0x23e5d1,
     "Prepare a deferred halfword request, then tail-transfer to the request service."),
]


def local_branch(op):
    return op.startswith(("bg.b", "bn.b")) or op in ("bt.j", "bn.j", "bg.j")


def recover():
    _, expanded, _ = load_original()
    ctx = context()
    layout = json.loads(LAYOUT.read_text())
    prior_routines = list(layout["routines"])
    prior_tables = list(layout["tables"])
    prior_names = {record["name"] for record in prior_routines}
    outputs = []
    requested_spans = [(start, end, name) for name, start, end, _ in SPANS]
    for index, (start, end, name) in enumerate(requested_spans):
        if start >= end:
            raise ValueError(f"Invalid span: {name}")
        for other_start, other_end, other_name in requested_spans[index + 1:]:
            if start < other_end and other_start < end:
                raise ValueError(f"Requested spans overlap: {name} and {other_name}")
        for record in prior_routines:
            if record["name"] == name:
                if (int(record["address"], 16) != start
                        or record["size"] != end - start):
                    raise ValueError(f"Existing routine boundary differs: {name}")
                continue
            existing_start = int(record["address"], 16)
            existing_end = existing_start + record["size"]
            if start < existing_end and existing_start < end:
                raise ValueError(f"Span overlaps existing routine {record['name']}: {name}")
        for record in prior_tables:
            existing_start = int(record["address"], 16)
            existing_end = existing_start + record["size"]
            if start < existing_end and existing_start < end:
                raise ValueError(f"Span overlaps existing table {record['name']}: {name}")

    for name, start, end, purpose in SPANS:
        code = expanded[start - 0x200000:end - 0x200000]
        rows = ctx.disassemble(code, base_address=start).instructions
        if not code or sum(row.length for row in rows) != len(code):
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
            "name": name,
            "address": hex(start),
            "size": len(code),
            "source": path.as_posix(),
            "original_code_sha256": sha(code),
            "purpose": purpose,
            "component_kind": "routine",
        }
        existing = [item for item in prior_routines if item["name"] == name]
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
        if record["name"] not in prior_names:
            layout["routines"].append(record)

    expected_additions = sum(record["name"] not in prior_names
                             for _, _, _, record in outputs)
    if len(layout["routines"]) != len(prior_routines) + expected_additions:
        raise ValueError("Unexpected routine-layout mutation")
    if [record for record in layout["routines"] if record["name"] in prior_names] != prior_routines:
        raise ValueError("Existing routine records were changed or reordered")
    if layout["tables"] != prior_tables:
        raise ValueError("Unexpected table mutation")

    layout["limitations"][0] = (
        f"{len(layout['routines'])} reconstructed routines/fragments only; "
        "remaining firmware is a pinned vendor input"
    )
    LAYOUT.write_text(json.dumps(layout, indent=2) + "\n")
    print(f"Recovered {len(outputs)} routines, {sum(item[2] for item in outputs)} instructions")


if __name__ == "__main__":
    recover()
