"""Assemble recovered routines and produce a byte-exact stock DC9 baseline.

This is a partial source build with a pinned vendor remainder, not a complete
firmware source tree. Changed assembly is rejected in baseline mode; explicit
experimental mode supports same-size replacements. No USB,
flashing, or vendor application execution is implemented.
"""
import argparse
import hashlib
import json
from pathlib import Path

from aeon_subset_assembler import assemble as assemble_code
from recompress_dc9 import SOURCE_SHA, repack_program
from roundtrip_mstar import split, assemble as assemble_image
from unpack_mstar import unpack

ROOT = Path(__file__).resolve().parents[1]
LAYOUT = ROOT / "analysis/reconstructed/dc9-source-layout.json"


def sha(data):
    return hashlib.sha256(data).hexdigest()


def load_original():
    layouts = json.loads((ROOT / "analysis/mstar-layouts.json").read_text())
    item = next(x for x in layouts if x["source_sha256"] == SOURCE_SHA)
    original = (ROOT / item["source_path"]).read_bytes()
    if sha(original) != SOURCE_SHA:
        raise ValueError("Unexpected source firmware")
    expanded, info = unpack(original)
    return original, expanded, info


def assemble_routines(expanded, layout, allow_changes=False, *, source_root=ROOT, source_directory=None):
    if (layout["format"] != "dc9-source-baseline-v1"
            or layout["source_firmware_sha256"] != SOURCE_SHA
            or int(layout["candidate_load_base"], 16) != 0x200000):
        raise ValueError("Unsupported source layout")
    result, records, spans = bytearray(expanded), [], []
    for routine in layout["routines"]:
        address, size = int(routine["address"], 16), routine["size"]
        offset = address - 0x200000
        if size <= 0 or offset < 0x3800 or offset + size > len(expanded):
            raise ValueError("Source routine outside expanded program")
        if any(offset < end and begin < offset + size for begin, end in spans):
            raise ValueError("Overlapping source routines")
        spans.append((offset, offset + size))
        original = expanded[offset:offset + size]
        if sha(original) != routine["original_code_sha256"]:
            raise ValueError("Original routine identity mismatch")
        path = (source_root / routine["source"]).resolve()
        allowed = source_directory if source_directory is not None else ROOT / "analysis/reconstructed"
        if not path.is_relative_to(allowed.resolve()):
            raise ValueError("Assembly source outside reconstructed directory")
        source = path.read_text()
        encoded, listing = assemble_code(source, address)
        if len(encoded) != size or (encoded != original and not allow_changes):
            raise ValueError(f"Baseline requires byte-exact original assembly: {routine['name']}")
        result[offset:offset + size] = encoded
        records.append({**routine, "source_normalized_utf8_sha256": sha(source.encode()),
                        "assembled_sha256": sha(encoded), "matches_original": encoded == original,
                        "instruction_count": len(listing), "listing": listing})
    if not records:
        raise ValueError("Empty source layout")
    if result != expanded and not allow_changes:
        raise ValueError("Baseline program changed")
    return bytes(result), records


def assemble_tables(expanded, layout, allow_changes=False):
    result, records = bytearray(expanded), []
    spans = [(int(r["address"], 16) - 0x200000,
              int(r["address"], 16) - 0x200000 + r["size"]) for r in layout["routines"]]
    for table in layout["tables"]:
        offset, size = int(table["address"], 16) - 0x200000, table["size"]
        if size <= 0 or offset < 0x3800 or offset + size > len(expanded):
            raise ValueError("Source table outside expanded program")
        if any(offset < end and begin < offset + size for begin, end in spans):
            raise ValueError("Overlapping source table")
        spans.append((offset, offset + size))
        original = expanded[offset:offset + size]
        if sha(original) != table["original_data_sha256"]:
            raise ValueError("Original table identity mismatch")
        encoded = bytes(int(value, 0) for value in table["values"])
        if len(encoded) != size or (encoded != original and not allow_changes):
            raise ValueError("Baseline requires byte-exact original table")
        result[offset:offset + size] = encoded
        records.append({**table, "assembled_sha256": sha(encoded), "matches_original": encoded == original})
    return bytes(result), records


def build(original, layout, experimental=False, *, source_root=ROOT, source_directory=None):
    if sha(original) != SOURCE_SHA:
        raise ValueError("Unexpected source firmware")
    expanded, info = unpack(original)
    assembled, routines = assemble_routines(expanded, layout, experimental,
                                           source_root=source_root, source_directory=source_directory)
    assembled, tables = assemble_tables(assembled, layout, experimental)
    # Baseline equality permits reusing the original stream. Experimental mode
    # recompresses the requested program and regenerates all three checksums.
    manifest, parts = split(original)
    if experimental:
        output, _ = repack_program(original, assembled[0x3800:])
    else:
        output = assemble_image(manifest, parts)
    decoded, output_info = unpack(output)
    # Recompression changes the prefix's length metadata, not the program.
    if decoded[0x3800:] != assembled[0x3800:] or (not experimental and output != original):
        raise ValueError("Baseline image differs from assembled program or pinned input")
    changed = [hex(i) for i, (a, b) in enumerate(zip(expanded, assembled)) if a != b]
    return output, {
        "status": ("partial-source experiment; semantic equivalence not established by this builder; hardware untested"
                   if experimental else "byte-exact stock baseline; partial source reconstruction; hardware untested"),
        "source_sha256": SOURCE_SHA, "output_sha256": sha(output), "output_size": len(output),
        "source_layout_sha256": sha(json.dumps(layout, sort_keys=True).encode()),
        "assembled_code_bytes": sum(x["size"] for x in routines),
        "assembled_instructions": sum(x["instruction_count"] for x in routines),
        "assembled_table_bytes": sum(x["size"] for x in tables), "tables": tables,
        "program_size": info["program_size"], "routines": routines,
        "byte_exact_original": output == original,
        "original_deflate_reused_after_program_equality": not experimental,
        "changed_expanded_offsets": changed, "changed_program_bytes": len(changed),
        "regenerated_checksums": ["main_crc16", "segment_crc32", "whole_file_crc32"],
        "checksums": output_info["checksums"], "resource_count": len(manifest["resources"]),
        "limitations": layout["limitations"],
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--experimental", action="store_true")
    parser.add_argument("--replace-source", action="append", default=[], metavar="NAME=PATH")
    args = parser.parse_args()
    suffix = ".experimental.bin" if args.experimental else ".baseline.bin"
    if not args.output.name.endswith(suffix):
        parser.error(f"Output must end with {suffix}")
    if args.replace_source and not args.experimental:
        parser.error("Source overrides require --experimental")
    if not args.output.resolve().is_relative_to((ROOT / "analysis/extracted/rebuild").resolve()):
        parser.error("Output must be under analysis/extracted/rebuild")
    original, _, _ = load_original()
    layout = json.loads(LAYOUT.read_text())
    routines = {x["name"]: x for x in layout["routines"]}
    overridden = set()
    for override in args.replace_source:
        name, separator, source = override.partition("=")
        if not separator or name not in routines or name in overridden:
            parser.error("Expected a unique known routine NAME=PATH")
        routines[name]["source"] = source
        overridden.add(name)
    output, report = build(original, layout, args.experimental)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    with args.output.open("xb") as handle:
        handle.write(output)
    report["output_path"] = args.output.resolve().relative_to(ROOT).as_posix()
    report["source_overrides"] = args.replace_source
    report_name = "dc9-source-experiment.json" if args.experimental else "dc9-source-baseline.json"
    (ROOT / "analysis" / report_name).write_text(json.dumps(report, indent=2) + "\n")
    print(f"Assembled {len(report['routines'])} routines, {report['assembled_code_bytes']} bytes")
    print(f"{report['status']}: {report['output_sha256']}")


if __name__ == "__main__":
    main()
