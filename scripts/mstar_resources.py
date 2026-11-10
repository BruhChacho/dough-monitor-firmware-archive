"""Parse and validate the Spectrum One appended-resource directory offline."""
import hashlib
import struct
import zlib

from mstar_checksums import crc16_msb

TABLE = 0x32080
TABLE_PREFIX = bytes.fromhex("54454c0958336900007b0000")
LIMIT = 16 * 1024 * 1024


def resources(data, segment_end):
    if len(data) < TABLE + 14:
        raise ValueError("Truncated resource directory")
    if data[TABLE:TABLE + 12] != TABLE_PREFIX:
        raise ValueError("Unsupported resource-directory signature")
    count = struct.unpack_from(">H", data, TABLE + 12)[0]
    if not 1 <= count <= 64:
        raise ValueError("Invalid resource count")
    if TABLE + 14 + count * 11 + 2 > min(len(data) - 4, segment_end):
        raise ValueError("Truncated resource records")
    position = TABLE + 14
    previous_end = segment_end
    result = []
    seen = set()
    for index in range(count):
        ident, start, size, flags = struct.unpack_from(">HIIB", data, position)
        position += 11
        end = start + size
        if ident in seen or ident == 0xf000:
            raise ValueError("Duplicate or reserved resource ID")
        if start < previous_end or end > len(data) - 4 or size < 8 or start % 8 or size % 8:
            raise ValueError("Invalid or overlapping resource bounds")
        if flags not in (0, 4):
            raise ValueError("Unsupported resource encoding")
        content = data[start:end - 2]
        crc = crc16_msb(content)
        if crc != struct.unpack_from(">H", data, end - 2)[0]:
            raise ValueError(f"Resource {ident:04x} CRC16 mismatch")
        item = {"id": f"{ident:04x}", "table_record_offset": hex(position - 11),
                "start": hex(start), "end_exclusive": hex(end), "size": size,
                "flags": flags, "crc16": f"{crc:04x}", "crc16_valid": True,
                "sha256": hashlib.sha256(data[start:end]).hexdigest()}
        if flags == 4:
            decoder = zlib.decompressobj(-15)
            expanded = decoder.decompress(content, LIMIT + 1)
            trailer = decoder.unused_data
            if not decoder.eof or len(expanded) > LIMIT:
                raise ValueError("Incomplete or oversized compressed resource")
            if (len(trailer) < 6 or struct.unpack_from("<I", trailer)[0] != len(expanded)
                    or trailer[4:6] != b"\xbe\xef" or any(trailer[6:])):
                raise ValueError("Unexpected compressed resource trailer")
            item.update({"expanded_size": len(expanded),
                         "expanded_sha256": hashlib.sha256(expanded).hexdigest(),
                         "deflate_size": len(content) - len(trailer),
                         "trailer_hex": trailer.hex()})
        result.append(item)
        previous_end = end
        seen.add(ident)
    if struct.unpack_from(">H", data, position)[0] != 0xf000:
        raise ValueError("Missing resource-directory terminator")
    if previous_end != len(data) - 4:
        raise ValueError("Unexpected data after final resource")
    return result
