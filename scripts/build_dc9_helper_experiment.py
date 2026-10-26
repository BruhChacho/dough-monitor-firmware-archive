"""Assemble, emulate and integrate one helper rewrite into an offline image.

Most of this image remains precompiled vendor code. No hardware or USB access;
the output is an experiment, not a supported monitor update.
"""
import argparse
import hashlib
import json
from pathlib import Path

from recompress_dc9 import SOURCE_SHA, repack_program
from unpack_mstar import unpack
from validate_aeon_rewrite import validate

ROOT = Path(__file__).resolve().parents[1]


def build(original):
    helper, emulation = validate(original)
    expanded, _ = unpack(original)
    program = bytearray(expanded[0x3800:])
    offset = 0x4059 - 0x3800
    program[offset:offset + len(helper)] = helper
    output, report = repack_program(original, program)
    recovered, _ = unpack(output)
    if recovered[0x3800:] != program:
        raise ValueError("Built program differs from requested replacement")
    changes = [i for i, (a, b) in enumerate(zip(expanded[0x3800:], program)) if a != b]
    if not changes or any(not offset <= i < offset + 39 for i in changes):
        raise ValueError("Unexpected program change outside helper")
    report.update({"experiment": "source-built helper rewrite with stock remainder",
                   "helper_emulation": emulation,
                   "changed_program_byte_count": len(changes),
                   "changed_expanded_offsets": [hex(i + 0x3800) for i in changes],
                   "unchanged_program_outside_helper": True,
                   "user_visible_feature_change": False})
    return output, report


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    if not args.output.name.endswith(".experimental.bin"):
        parser.error("Output must end with .experimental.bin")
    item = next(x for x in json.loads((ROOT / "analysis/mstar-layouts.json").read_text())
                if x["source_sha256"] == SOURCE_SHA)
    original = (ROOT / item["source_path"]).read_bytes()
    if hashlib.sha256(original).hexdigest() != SOURCE_SHA:
        raise ValueError("Unexpected source firmware")
    output, report = build(original)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    with args.output.open("xb") as handle:
        handle.write(output)
    (ROOT / "analysis/dc9-helper-experiment.json").write_text(json.dumps(report, indent=2) + "\n")
    print(f"Built {len(output)} bytes; SHA256 {report['experimental_sha256']}")
    print(f"Changed {report['changed_program_byte_count']} decoded bytes inside one 39-byte helper")
    print("Main CRC16, both CRC32s, unchanged resources and bounded helper emulation pass")


if __name__ == "__main__":
    main()
