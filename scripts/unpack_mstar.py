"""Recover the raw DEFLATE program from the archived Spectrum One images.

This is an offline parser, not a firmware packer or flashing tool. The parser checks segment bounds, decompression limits, lengths and checksums.
"""
import hashlib
import struct
import zlib
from mstar_checksums import verify_crc32, verify_main_crc16

PREFIX = bytes.fromhex("c2afe4f5")
MAX_EXPANDED = 16 * 1024 * 1024


def unpack(data):
    if len(data) < 0x33880 or data[:4] != PREFIX:
        raise ValueError("Not a supported Spectrum One image")
    words = struct.unpack_from("<10I", data, 0x10000)
    start, base, end_address, end = words[:4]
    if start != 0x30080 or base != 0x200000 or not start + 0x3800 < end <= len(data) - 4:
        raise ValueError("Unrecognized segment bounds")
    if end - start != end_address - base or words[8] != len(data) - 4:
        raise ValueError("Inconsistent header spans")
    checksums = verify_crc32(data, start, end)
    checksums.update(verify_main_crc16(data, end))
    if (data[start + 0x1147:start + 0x114a] != b"\xbe\xad\xde"
            or struct.unpack_from("<I", data, start + 0x114a)[0] != end - start):
        raise ValueError("Inconsistent application compression metadata")
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
        "trailer_length_matches": True, "trailer_last_two_bytes_meaning": "normalized main CRC16, big-endian",
        "compression_marker": "beadde", "prefix_segment_length_matches": True,
        "expanded_size": len(expanded), "expanded_sha256": hashlib.sha256(expanded).hexdigest(),
        "candidate_expanded_end_address": hex(base + len(expanded)),
        "checksums": checksums,
    }
