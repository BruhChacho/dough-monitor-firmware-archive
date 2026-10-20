"""Recover the raw DEFLATE program from the archived Spectrum One images.

This is an offline parser, not a firmware packer or flashing tool. The layout
checks below were established across 13 distinct D02/D03/DC9 images.
"""
import hashlib
import json
from pathlib import Path
import re
import struct
import zlib

ROOT = Path(__file__).resolve().parents[1]
PREFIX = bytes.fromhex("c2afe4f5")
MAX_EXPANDED = 16 * 1024 * 1024


def unpack(data):
    if len(data) < 0x33880 or data[:4] != PREFIX:
        raise ValueError("Not a supported Spectrum One image")
    words = struct.unpack_from("<10I", data, 0x10000)
    start, base, end_address, end = words[:4]
    if start != 0x30080 or base != 0x200000 or not start < end <= len(data):
        raise ValueError("Unrecognized segment bounds")
    if end - start != end_address - base or words[8] != len(data) - 4:
        raise ValueError("Inconsistent header spans")
    compressed_start = start + 0x3800
    decoder = zlib.decompressobj(-15)
    program = decoder.decompress(data[compressed_start:end], MAX_EXPANDED + 1)
    if not decoder.eof or len(program) > MAX_EXPANDED:
        raise ValueError("Incomplete or oversized DEFLATE stream")
    trailer = decoder.unused_data
    if len(trailer) != 6 or struct.unpack_from("<I", trailer)[0] != len(program):
        raise ValueError("Unrecognized stream trailer or expanded length")
    expanded = data[start:compressed_start] + program
    return expanded, {
        "header_offset": "0x10000", "header_words_le": [hex(w) for w in words],
        "segment_start": hex(start), "segment_end_exclusive": hex(end),
        "candidate_load_base": hex(base), "deflate_start": hex(compressed_start),
        "deflate_end_exclusive": hex(end - 6), "deflate_bytes": end - 6 - compressed_start,
        "program_size": len(program), "trailer_hex": trailer.hex(),
        "trailer_length_matches": True, "trailer_last_two_bytes_meaning": "unknown",
        "expanded_size": len(expanded), "expanded_sha256": hashlib.sha256(expanded).hexdigest(),
        "candidate_expanded_end_address": hex(base + len(expanded)),
        "header_checksum_meaning": "unknown; not validated",
    }


def main():
    inventory = json.loads((ROOT / "analysis/inventory.json").read_text())["members"]
    results = []
    for member in inventory:
        if not member["local_path"].lower().endswith(".bin"):
            continue
        path = ROOT / member["local_path"]
        raw = path.read_bytes()
        if raw[:4] != PREFIX:
            continue
        if hashlib.sha256(raw).hexdigest() != member["sha256"]:
            raise ValueError("Input hash mismatch")
        expanded, info = unpack(raw)
        target = path.parent / "expanded.aeon.bin"
        target.write_bytes(expanded)
        strings = [{"expanded_offset": hex(m.start()), "text": m.group().decode("ascii")}
                   for m in re.finditer(rb"[ -~]{8,}", expanded)]
        # Generated vendor-derived content stays beside the ignored binary.
        (path.parent / "expanded.strings.json").write_text(json.dumps(strings, indent=2) + "\n")
        info.update({"source_sha256": member["sha256"], "source_path": member["local_path"],
                     "expanded_path": target.relative_to(ROOT).as_posix(),
                     "sources": member["sources"], "ascii_string_count": len(strings)})
        results.append(info)
    (ROOT / "analysis/mstar-layouts.json").write_text(json.dumps(results, indent=2) + "\n")
    print(f"Recovered {len(results)} AEON images; all DEFLATE ends and trailer lengths verified")


if __name__ == "__main__":
    main()
