"""Build an OFFLINE EXPERIMENT for DC9 v101 using a new DEFLATE stream.

The default decoded program is unchanged. This is not a complete source build
or an approved update. The main CRC16 and both CRC32 fields are regenerated.
The command has no USB, I2C, or flashing functionality.
"""
import argparse
import hashlib
import json
from pathlib import Path
import struct
import zlib

from mstar_checksums import update_checksums
from mstar_resources import resources
from unpack_mstar import unpack

ROOT = Path(__file__).resolve().parents[1]
SOURCE_SHA = "0b5d8350af9997e35b8591b4d5585ae859988129b72b4e7b8d55a3ab68ea56a9"


def sha(data):
    return hashlib.sha256(data).hexdigest()


def recompress(original):
    return repack_program(original)


def repack_program(original, replacement_program=None):
    """Offline packer for a same-size DC9 program; no compatibility guarantee."""
    if sha(original) != SOURCE_SHA:
        raise ValueError("Only the traced ES07DC9 v101 image is supported")
    expanded, before = unpack(original)
    start = int(before["segment_start"], 16)
    stream_start = int(before["deflate_start"], 16)
    old_end = int(before["segment_end_exclusive"], 16)
    directory = resources(original, old_end)
    if (original[start + 0x1147:start + 0x114a] != b"\xbe\xad\xde"
            or struct.unpack_from("<I", original, start + 0x114a)[0] != old_end - start):
        raise ValueError("Unsupported application compression metadata")
    source_program = expanded[0x3800:]
    program = source_program if replacement_program is None else bytes(replacement_program)
    if len(program) != len(source_program):
        raise ValueError("Replacement program must retain the original size")
    compressor = zlib.compressobj(level=9, wbits=-15)
    stream = compressor.compress(program) + compressor.flush()
    trailer = struct.pack("<I", len(program)) + bytes(2)
    end = stream_start + len(stream) + len(trailer)
    if end > old_end:
        raise ValueError("New stream does not fit the original AP allocation")
    result = bytearray(original)
    result[stream_start:old_end] = stream + trailer + bytes(old_end - end)
    base = int(before["candidate_load_base"], 16)
    struct.pack_into("<II", result, 0x10008, base + end - start, end)
    struct.pack_into("<I", result, start + 0x114a, end - start)
    result = update_checksums(result, start, end)
    recovered, after = unpack(result)
    if recovered[0x3800:] != program:
        raise ValueError("Recompression changed decoded program bytes")
    expected_prefix = bytearray(expanded[:0x3800])
    struct.pack_into("<I", expected_prefix, 0x114a, end - start)
    if recovered[:0x3800] != expected_prefix:
        raise ValueError("Unexpected prefix modification")
    if resources(result, end) != directory:
        raise ValueError("Appended resources changed")
    if len(result) != len(original) or result[old_end:-4] != original[old_end:-4]:
        raise ValueError("Unexpected image extent or trailing data modification")
    report = {
        "status": "offline experiment; not hardware-validated; not a complete source build",
        "model": "ES07DC9", "base_version": "v101 rev1148",
        "source_sha256": SOURCE_SHA, "experimental_sha256": sha(result),
        "zlib_runtime": zlib.ZLIB_RUNTIME_VERSION,
        "source_deflate_bytes": before["deflate_bytes"], "new_deflate_bytes": len(stream),
        "old_segment_end": hex(old_end), "new_segment_end": hex(end),
        "program_size": len(program), "program_sha256": sha(program),
        "decoded_program_identical": program == source_program,
        "decoded_program_matches_requested": True, "resource_directory_and_payloads_identical": True,
        "regenerated_main_crc16": after["checksums"]["main_crc16"],
        "checksums": after["checksums"],
        "remaining_gates": ["Validate any other update consumers and hardware constraints",
                            "Validate loader behavior beyond static decoding",
                            "Confirm exact device revision, backup and restore path",
                            "Hardware boot and feature regression tests"],
    }
    return result, report


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    if not args.output.name.endswith(".experimental.bin"):
        parser.error("Output must end with .experimental.bin")
    layouts = json.loads((ROOT / "analysis/mstar-layouts.json").read_text())
    item = next(x for x in layouts if x["source_sha256"] == SOURCE_SHA)
    result, report = recompress((ROOT / item["source_path"]).read_bytes())
    args.output.parent.mkdir(parents=True, exist_ok=True)
    with args.output.open("xb") as handle:
        handle.write(result)
    (ROOT / "analysis/dc9-recompression-corrected.json").write_text(json.dumps(report, indent=2) + "\n")
    print(json.dumps(report, indent=2))


if __name__ == "__main__":
    main()
