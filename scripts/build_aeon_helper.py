"""Assemble a recovered helper and require byte equality with DC9 v101."""
import hashlib
import json
from pathlib import Path

from aeon_subset_assembler import assemble
from recompress_dc9 import SOURCE_SHA
from unpack_mstar import unpack

ROOT = Path(__file__).resolve().parents[1]


def main():
    source_path = ROOT / "analysis/reconstructed/spectrum_one_table_helper.aeon.s"
    source = source_path.read_text()
    output, listing = assemble(source, 0x204059)
    item = next(x for x in json.loads((ROOT / "analysis/mstar-layouts.json").read_text())
                if x["source_sha256"] == SOURCE_SHA)
    original = (ROOT / item["source_path"]).read_bytes()
    if hashlib.sha256(original).hexdigest() != SOURCE_SHA:
        raise ValueError("Unexpected source firmware")
    expanded, _ = unpack(original)
    expected = expanded[0x4059:0x4080]
    if output != expected:
        raise ValueError("Assembled helper differs from original machine code")
    folder = ROOT / "analysis/extracted/rebuild"
    folder.mkdir(parents=True, exist_ok=True)
    (folder / "dc9-table-helper.bin").write_bytes(output)
    report = {"source_firmware_sha256": SOURCE_SHA,
              "assembly_path": source_path.relative_to(ROOT).as_posix(),
              "assembly_normalized_utf8_sha256": hashlib.sha256(source.encode()).hexdigest(),
              "candidate_address": "0x204059", "expanded_offset": "0x4059",
              "size_bytes": len(output), "instruction_count": len(listing),
              "machine_code_sha256": hashlib.sha256(output).hexdigest(),
              "matches_original_bytes": True, "listing": listing,
              "limitations": "One routine, nine supported mnemonics; no C compiler, linker or hardware validation"}
    (ROOT / "analysis/aeon-helper-build.json").write_text(json.dumps(report, indent=2) + "\n")
    print(f"Assembled {len(listing)} instructions, {len(output)} bytes; exact match with original helper")


if __name__ == "__main__":
    main()
