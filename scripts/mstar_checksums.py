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
