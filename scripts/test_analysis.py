"""Bounds checks for the two recovered archive parsers; no device access."""
import struct
import unittest
import zlib
import copy
from pathlib import Path
import tempfile
from unpack_mstar import unpack
from mstar_checksums import crc32_msb, crc16_msb, update_crc32
from mstar_resources import resources, TABLE, TABLE_PREFIX
from roundtrip_mstar import split, assemble, export, rebuild
from aeon_subset_assembler import assemble as assemble_aeon
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
    image[0x311c7:0x311ca] = b"\xbe\xad\xde"
    struct.pack_into("<I", image, 0x311ca, end - 0x30080)
    return bytearray(update_crc32(image, 0x30080, end)), program


def sample_with_resource(compressed=False):
    image, program = sample()
    end = len(image) - 4
    del image[-4:]
    image += bytes((-len(image)) % 8)
    start = len(image)
    if compressed:
        compressor = zlib.compressobj(wbits=-15)
        payload = compressor.compress(b"resource") + compressor.flush()
        payload += struct.pack("<I", 8) + b"\xbe\xef"
        flags = 4
    else:
        payload, flags = b"resource", 0
    payload += bytes(8 - ((len(payload) + 2) % 8))
    image += payload + struct.pack(">H", crc16_msb(payload)) + bytes(4)
    image[TABLE:TABLE + 12] = TABLE_PREFIX
    struct.pack_into(">H", image, TABLE + 12, 1)
    struct.pack_into(">HIIBH", image, TABLE + 14, 0x109, start, len(payload) + 2, flags, 0xf000)
    struct.pack_into("<I", image, 0x10020, len(image) - 4)
    return bytearray(update_crc32(image, 0x30080, end)), end, start


class ParserTests(unittest.TestCase):
    def test_assembler_rejects_out_of_range_branch(self):
        with self.assertRaisesRegex(ValueError, "10-bit range"):
            assemble_aeon("bt.j 0x1000", 0)

    def test_assembler_rejects_invalid_register_and_immediate(self):
        for source in ("bt.movi r32, 1", "bt.movi r3, 16", "bg.addi r7, r7, 32768"):
            with self.assertRaises(ValueError):
                assemble_aeon(source, 0)

    def test_assembler_rejects_duplicate_label_and_unknown_opcode(self):
        for source in ("entry:\nentry:\nbt.j entry", "unknown r3, r4"):
            with self.assertRaises(ValueError):
                assemble_aeon(source, 0)

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
        data = update_crc32(data, 0x30080, len(data) - 4)
        with self.assertRaises(ValueError):
            unpack(data)

    def test_crc32_against_bitwise_reference(self):
        for data in (b"", b"123456789", bytes(range(256)), b"\xff" * 1031):
            crc = 0
            for byte in data:
                crc ^= byte << 24
                for _ in range(8):
                    crc = ((crc << 1) ^ (0x04c11db7 if crc & 0x80000000 else 0)) & 0xffffffff
            self.assertEqual(crc32_msb(data), crc)
        self.assertEqual(crc32_msb(b"123456789"), 0x89a1897f)

    def test_crc16_against_bitwise_reference(self):
        for data in (b"", b"123456789", bytes(range(256)), b"\xff" * 1031):
            crc = 0
            for byte in data:
                crc ^= byte << 8
                for _ in range(8):
                    crc = ((crc << 1) ^ (0x8005 if crc & 0x8000 else 0)) & 0xffff
            self.assertEqual(crc16_msb(data), crc)
        self.assertEqual(crc16_msb(b"123456789"), 0xfee8)

    def test_resource_checksums_and_inflate(self):
        for compressed in (False, True):
            image, end, start = sample_with_resource(compressed)
            parsed = resources(image, end)
            self.assertTrue(parsed[0]["crc16_valid"])
            if compressed:
                self.assertEqual(parsed[0]["expanded_size"], 8)
            image[start] ^= 1
            with self.assertRaisesRegex(ValueError, "CRC16 mismatch"):
                resources(image, end)

    def test_resource_overlap_rejected(self):
        image, end, _ = sample_with_resource()
        struct.pack_into(">I", image, TABLE + 16, 0x30080)
        with self.assertRaisesRegex(ValueError, "overlapping"):
            resources(image, end)

    def test_resource_truncated_directory_rejected(self):
        with self.assertRaisesRegex(ValueError, "Truncated"):
            resources(b"", 0)

    def test_resource_wrong_trailer_with_valid_crc_rejected(self):
        image, end, start = sample_with_resource(True)
        image[start + image[start:-6].find(b"\xbe\xef")] ^= 1
        struct.pack_into(">H", image, len(image) - 6, crc16_msb(image[start:-6]))
        with self.assertRaisesRegex(ValueError, "trailer"):
            resources(image, end)

    def test_roundtrip_and_component_mutation(self):
        image, _, _ = sample_with_resource(True)
        manifest, parts = split(image)
        self.assertEqual(assemble(manifest, parts), image)
        name = next(iter(parts))
        parts[name] = bytes([parts[name][0] ^ 1]) + parts[name][1:]
        with self.assertRaisesRegex(ValueError, "Changed component"):
            assemble(manifest, parts)

    def test_manifest_gap_rejected(self):
        image, _, _ = sample_with_resource()
        manifest, parts = split(image)
        changed = copy.deepcopy(manifest)
        changed["parts"][1]["offset"] += 1
        with self.assertRaisesRegex(ValueError, "non-contiguous"):
            assemble(changed, parts)

    def test_disk_export_rebuild_and_no_overwrite(self):
        image, _, _ = sample_with_resource()
        scratch = Path(__file__).resolve().parents[1] / "analysis/scratch"
        scratch.mkdir(parents=True, exist_ok=True)
        with tempfile.TemporaryDirectory(dir=scratch) as tmp:
            root = Path(tmp)
            self.assertTrue(root.resolve().is_relative_to(scratch.resolve()))
            source, bundle, output = root / "source.bin", root / "bundle", root / "rebuilt.bin"
            source.write_bytes(image)
            export(source, bundle)
            rebuild(bundle, output)
            self.assertEqual(output.read_bytes(), image)
            with self.assertRaises(FileExistsError):
                rebuild(bundle, output)

    def test_segment_corruption_rejected(self):
        data, _ = sample()
        data[0x30080] ^= 1
        with self.assertRaisesRegex(ValueError, "segment CRC32"):
            unpack(data)

    def test_bootloader_corruption_rejected(self):
        data, _ = sample()
        data[0x100] ^= 1
        with self.assertRaisesRegex(ValueError, "Whole-file CRC32"):
            unpack(data)

    def test_inconsistent_prefix_size_with_valid_crc_rejected(self):
        data, _ = sample()
        data[0x311ca] ^= 1
        data = update_crc32(data, 0x30080, len(data) - 4)
        with self.assertRaisesRegex(ValueError, "compression metadata"):
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
