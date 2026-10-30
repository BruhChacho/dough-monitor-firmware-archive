"""Independently audit two generated DC9 experiments without packer imports.

Uses bit-at-a-time CRCs and direct byte comparisons. No device access. Passing
these offline checks does not establish loader acceptance or hardware behavior.
"""
import argparse
import hashlib
import json
from pathlib import Path
import struct
import zlib

ROOT = Path(__file__).resolve().parents[1]
SOURCE_SHA = "0b5d8350af9997e35b8591b4d5585ae859988129b72b4e7b8d55a3ab68ea56a9"
HELPER_SHA = "d6d071ac2a33df38d030e70f34e2e1e9df5c6453fc062e25d8d6986b29c1bd64"
START, STREAM, TABLE = 0x30080, 0x33880, 0x32080


def sha(data):
    return hashlib.sha256(data).hexdigest()


def require(condition, message):
    if not condition:
        raise ValueError(message)


def crc(data, width, polynomial):
    value, top, mask = 0, 1 << (width - 1), (1 << width) - 1
    for byte in data:
        value ^= byte << (width - 8)
        for _ in range(8):
            value = ((value << 1) ^ (polynomial if value & top else 0)) & mask
    return value


def decode(data):
    start, base, limit, end = struct.unpack_from("<4I", data, 0x10000)
    require(start == START and base == 0x200000, "Unexpected AP mapping")
    require(STREAM + 6 < end <= len(data) - 4, "Unexpected AP bounds")
    require(limit == base + end - start, "Incorrect AP extent")
    require(struct.unpack_from("<I", data, 0x10020)[0] == len(data) - 4,
            "Incorrect file size field")
    require(data[start + 0x1147:start + 0x114a] == bytes.fromhex("beadde"),
            "Incorrect compression marker")
    require(struct.unpack_from("<I", data, start + 0x114a)[0] == end - start,
            "Incorrect prefix length")
    inflater = zlib.decompressobj(-15)
    program = inflater.decompress(data[STREAM:end - 6], 2426561)
    require(inflater.eof and not inflater.unused_data and not inflater.unconsumed_tail,
            "Incorrect DEFLATE extent")
    require(len(program) == 2426560 == struct.unpack_from("<I", data, end - 6)[0],
            "Incorrect program size")
    return end, program


def audit(original, candidate, kind):
    require(len(candidate) == len(original), "File size changed")
    old_end, old_program = decode(original)
    end, program = decode(candidate)
    require(end <= old_end, "AP allocation grew")
    require(candidate[end:old_end] == bytes(old_end - end), "Nonzero freed AP space")

    normalized = bytearray(candidate[0x10000:end - 2])
    for offset in (0x14, 0x60, 0x64):
        normalized[offset:offset + 4] = bytes(4)
    main = crc(normalized, 16, 0x8005)
    segment = crc(candidate[START:end], 32, 0x04c11db7)
    whole = crc(candidate[:-4], 32, 0x04c11db7)
    require(main == int.from_bytes(candidate[end - 2:end], "big"), "Main CRC16 mismatch")
    require(segment == struct.unpack_from("<I", candidate, 0x10014)[0], "AP CRC32 mismatch")
    require(whole == int.from_bytes(candidate[-4:], "big"), "File CRC32 mismatch")

    allowed = [(0x10008, 0x10010), (0x10014, 0x10018),
               (START + 0x114a, START + 0x114e), (STREAM, old_end),
               (len(original) - 4, len(original))]
    restored = bytearray(candidate)
    for begin, finish in allowed:
        restored[begin:finish] = original[begin:finish]
    require(restored == original, "Raw change outside allowed metadata/AP/checksum spans")
    prefix_changes = [hex(i) for i, (a, b) in enumerate(
        zip(original[START:STREAM], candidate[START:STREAM])) if a != b]

    count = struct.unpack_from(">H", original, TABLE + 12)[0]
    directory_end = TABLE + 14 + count * 11 + 2
    require(candidate[TABLE:directory_end] == original[TABLE:directory_end],
            "Resource directory changed")
    payloads = []
    for i in range(count):
        identifier, offset, size, flags = struct.unpack_from(">HIIB", original, TABLE + 14 + i * 11)
        require(old_end <= offset < offset + size <= len(original) - 4,
                "Unexpected resource bounds")
        require(candidate[offset:offset + size] == original[offset:offset + size],
                "Resource payload changed")
        payloads.append({"id": hex(identifier), "offset": hex(offset), "size": size,
                         "flags": flags, "sha256": sha(candidate[offset:offset + size])})

    changes = [i for i, (a, b) in enumerate(zip(old_program, program)) if a != b]
    helper_begin, helper_end = 0x4059 - 0x3800, 0x4080 - 0x3800
    if kind == "baseline":
        require(program == old_program, "Baseline program changed")
    else:
        require(changes and all(helper_begin <= i < helper_end for i in changes),
                "Program change outside helper")
        require(sha(program[helper_begin:helper_end]) == HELPER_SHA, "Unexpected helper bytes")
    return {
        "kind": kind, "sha256": sha(candidate), "file_size": len(candidate),
        "program_sha256": sha(program), "segment_end": hex(end),
        "deflate_bytes": end - 6 - STREAM, "allocation_growth": False,
        "zero_filled_freed_bytes": old_end - end,
        "main_crc16": f"{main:04x}", "segment_crc32": f"{segment:08x}",
        "whole_file_crc32": f"{whole:08x}", "independent_bitwise_checksums_valid": True,
        "raw_changes_confined_to_allowed_spans": True,
        "allowed_raw_spans_end_exclusive": [[hex(a), hex(b)] for a, b in allowed],
        "changed_prefix_offsets": prefix_changes,
        "changed_expanded_program_offsets": [hex(i + 0x3800) for i in changes],
        "changed_program_bytes": len(changes),
        "resources_identical": True, "resources": payloads,
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--baseline", type=Path, required=True)
    parser.add_argument("--helper", type=Path, required=True)
    parser.add_argument("--historical", type=Path)
    args = parser.parse_args()
    layouts = json.loads((ROOT / "analysis/mstar-layouts.json").read_text())
    source = next(x for x in layouts if x["source_sha256"] == SOURCE_SHA)
    original = (ROOT / source["source_path"]).read_bytes()
    require(sha(original) == SOURCE_SHA, "Unexpected source firmware")
    require(crc(b"123456789", 16, 0x8005) == 0xfee8, "CRC16 reference failure")
    require(crc(b"123456789", 32, 0x04c11db7) == 0x89a1897f, "CRC32 reference failure")
    results = []
    for kind, path in (("baseline", args.baseline), ("helper", args.helper)):
        result = audit(original, path.read_bytes(), kind)
        result["path"] = path.resolve().relative_to(ROOT).as_posix()
        results.append(result)
        print(f"{kind}: independent CRCs and byte invariants pass", flush=True)
    report = {"source_sha256": SOURCE_SHA, "source_path": source["source_path"],
              "method": "Direct parsing, bit-at-a-time CRCs, exhaustive byte comparisons; no packer/parser imports",
              "hardware_validated": False, "results": results}
    if args.historical:
        historical = args.historical.read_bytes()
        require(sha(historical) == "1460a4608062167bcda589aad57567cd9528d00d6f3349f507b80dc2907d7873",
                "Unexpected historical artifact")
        end, _ = decode(historical)
        normalized = bytearray(historical[0x10000:end - 2])
        for offset in (0x14, 0x60, 0x64):
            normalized[offset:offset + 4] = bytes(4)
        required = crc(normalized, 16, 0x8005)
        stored = int.from_bytes(historical[end - 2:end], "big")
        require(stored != required, "Historical main CRC16 unexpectedly valid")
        report["historical_experiment"] = {
            "sha256": sha(historical), "stored_main_crc16": f"{stored:04x}",
            "required_main_crc16": f"{required:04x}", "main_crc16_valid": False,
            "status": "Preserved historical experiment; superseded by corrected baseline",
        }
    (ROOT / "analysis/dc9-experiment-audit.json").write_text(json.dumps(report, indent=2) + "\n")


if __name__ == "__main__":
    main()
