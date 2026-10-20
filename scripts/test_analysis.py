"""Bounds checks for the two recovered archive parsers; no device access."""
import struct
import unittest
import zlib
from unpack_mstar import unpack
from inspect_updater import carchive_entries, unpack as unpack_entry


def sample():
    program = b"example firmware program" * 100
    compressor = zlib.compressobj(wbits=-15)
    stream = compressor.compress(program) + compressor.flush()
    image = bytearray(0x33880)
    image[:4] = bytes.fromhex("c2afe4f5")
    image += stream + struct.pack("<I", len(program)) + b"\x12\x34"
    end = len(image)
    image += b"\0" * 4
    struct.pack_into("<4I", image, 0x10000, 0x30080, 0x200000, 0x200000 + end - 0x30080, end)
    struct.pack_into("<I", image, 0x10020, len(image) - 4)
    return image, program


class ParserTests(unittest.TestCase):
    def test_valid_mstar_stream_and_prefix(self):
        data, program = sample()
        expanded, info = unpack(data)
        self.assertEqual(expanded[0x3800:], program)
        self.assertEqual(len(expanded), info["expanded_size"])

    def test_truncated_mstar_rejected(self):
        data, _ = sample()
        with self.assertRaises(ValueError):
            unpack(data[:-10])

    def test_wrong_expanded_length_rejected(self):
        data, _ = sample()
        data[-10] ^= 1
        with self.assertRaises(ValueError):
            unpack(data)

    def test_truncated_carchive_cookie_rejected(self):
        with self.assertRaises(ValueError):
            carchive_entries(b"MEI\x0c\x0b\x0a\x0b\x0e")

    def test_oversized_inflate_rejected(self):
        compressed = zlib.compress(b"x" * 100)
        entry = {"offset": 0, "compressed_size": len(compressed), "uncompressed_size": 10, "compressed": True}
        with self.assertRaises(ValueError):
            unpack_entry(compressed, entry)


if __name__ == "__main__":
    unittest.main()
