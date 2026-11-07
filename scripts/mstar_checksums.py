"""Checksum primitives independently recovered from Spectrum One images."""
import struct
import zlib

REVERSE_BYTE = bytes(int(f"{n:08b}"[::-1], 2) for n in range(256))


def _crc16_table():
    table = []
    for value in range(256):
        crc = value << 8
        for _ in range(8):
            crc = ((crc << 1) ^ (0x8005 if crc & 0x8000 else 0)) & 0xffff
        table.append(crc)
    return tuple(table)


CRC16_TABLE = _crc16_table()


def crc16_msb(data):
    """Width 16, polynomial 8005, init 0, refin/refout false, xorout 0."""
    crc = 0
    for byte in data:
        crc = ((crc << 8) & 0xffff) ^ CRC16_TABLE[(crc >> 8) ^ byte]
    return crc


def crc32_msb(data):
    """Width 32, polynomial 04c11db7, init 0, refin/refout false, xorout 0."""
    reflected = zlib.crc32(bytes(data).translate(REVERSE_BYTE), 0xffffffff)
    reversed_bits = int.from_bytes(
        reflected.to_bytes(4, "little").translate(REVERSE_BYTE), "big")
    return reversed_bits ^ 0xffffffff


def verify_crc32(data, start, end):
    """Check both known CRC32 fields; caller must validate container bounds."""
    segment = crc32_msb(data[start:end])
    whole = crc32_msb(data[:-4])
    if struct.unpack_from("<I", data, 0x10014)[0] != segment:
        raise ValueError("AP segment CRC32 mismatch")
    if struct.unpack_from(">I", data, len(data) - 4)[0] != whole:
        raise ValueError("Whole-file CRC32 mismatch")
    return {
        "algorithm": "CRC32 MSB polynomial=04c11db7 init=0 xorout=0",
        "segment_crc32": f"{segment:08x}",
        "segment_crc32_field": "0x10014, little-endian",
        "whole_file_crc32": f"{whole:08x}",
        "whole_file_crc32_field": "last four bytes, big-endian",
        "both_crc32_valid": True,
    }


def update_crc32(data, start, end):
    """Return a copy with known CRC32 fields set; not a flash-safety check."""
    result = bytearray(data)
    struct.pack_into("<I", result, 0x10014, crc32_msb(result[start:end]))
    struct.pack_into(">I", result, len(result) - 4, crc32_msb(result[:-4]))
    return bytes(result)


def main_crc16(data, end):
    """CRC16 of [0x10000,end-2), normalizing three header words.

    Matches all 13 archived Spectrum One images. Header words at 0x10060
    and 0x10064 are treated as zero; their complete semantics are unconfirmed.
    """
    if not 0x10082 <= end <= len(data):
        raise ValueError("Invalid main CRC16 bounds")
    region = bytearray(data[0x10000:end - 2])
    for offset in (0x14, 0x60, 0x64):
        region[offset:offset + 4] = bytes(4)
    return crc16_msb(region)


def verify_main_crc16(data, end):
    calculated = main_crc16(data, end)
    if int.from_bytes(data[end - 2:end], "big") != calculated:
        raise ValueError("Main trailer CRC16 mismatch")
    return {"main_crc16": f"{calculated:04x}", "main_crc16_valid": True,
            "main_crc16_range": f"0x10000:{end - 2:#x} (end exclusive)",
            "main_crc16_zeroed_words": ["0x10014", "0x10060", "0x10064"]}


def update_checksums(data, start, end):
    """Regenerate main CRC16, AP CRC32, then file CRC32 in dependency order.

    Caller must validate AP bounds and non-overlap with the file CRC32 field.
    """
    result = bytearray(data)
    struct.pack_into(">H", result, end - 2, main_crc16(result, end))
    return update_crc32(result, start, end)
