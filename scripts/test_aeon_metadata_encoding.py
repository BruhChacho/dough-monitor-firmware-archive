"""Focused encoding and execution regressions for metadata-path instructions."""
import unittest

from aeon_helper_emulator import context
from aeon_module_model import Memory, ModuleModel, RETURN
from aeon_subset_assembler import assemble, encode
from build_dc9_source_baseline import load_original


BASE = 0x200000


def initial_registers():
    registers = [0] * 32
    registers[9] = RETURN
    return registers


def model_for(source, base=BASE):
    code, _ = assemble(source, base)
    return code, ModuleModel([(base, code)], call_policy="fallthrough-hypothesis")


class MetadataEncodingTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        _, cls.expanded, _ = load_original()
        cls.decoder = context()

    def test_new_encodings_match_archived_sites(self):
        expected = {
            0x20523B: ("bt.movhi", "9573"),
            0x23D60D: ("bn.extbs", "5cc702"),
            0x23D613: ("bn.sflesi", "5cdff1"),
            0x23D6CB: ("bn.sll", "4c845c"),
        }
        for address, (mnemonic, raw_hex) in expected.items():
            with self.subTest(address=hex(address)):
                offset = address - BASE
                rows = self.decoder.disassemble(
                    self.expanded[offset:offset + 4], base_address=address
                ).instructions
                instruction = rows[0]
                self.assertEqual(instruction.mnem, mnemonic)
                args = [part.strip() for part in instruction.body.rstrip(",").split(",")]
                archived = self.expanded[offset:offset + instruction.length]
                self.assertEqual(archived.hex(), raw_hex)
                self.assertEqual(encode(mnemonic, args, address, {}), archived)

    def test_bt_movhi_signed_five_bit_boundaries(self):
        for immediate, expected in ((-16, 0xFFF00000), (15, 0x000F0000)):
            with self.subTest(immediate=immediate):
                _, model = model_for(f"bt.movhi r3, {immediate}\nbt.jr r9")
                result = model.run(BASE, Memory([]), initial_registers())
                self.assertEqual(result["registers"][3], expected)

        for immediate in (-17, 16):
            with self.subTest(rejected=immediate), self.assertRaises(ValueError):
                assemble(f"bt.movhi r3, {immediate}", BASE)

    def test_extbs_uses_signed_low_byte_and_preserves_alias_semantics(self):
        _, separate = model_for("bn.extbs r3, r4\nbt.jr r9")
        _, aliased = model_for("bn.extbs r4, r4\nbt.jr r9", BASE + 0x100)

        for byte in range(256):
            value = ((byte ^ 0xFF) << 24) | 0x00005A00 | byte
            expected = (byte - 256 if byte & 0x80 else byte) & 0xFFFFFFFF
            with self.subTest(byte=byte):
                registers = initial_registers(); registers[4] = value
                result = separate.run(BASE, Memory([]), registers)
                self.assertEqual(result["registers"][3], expected)

                registers = initial_registers(); registers[4] = value
                result = aliased.run(BASE + 0x100, Memory([]), registers)
                self.assertEqual(result["registers"][4], expected)

    def test_sflesi_signed_immediate_and_uint32_operand_edges(self):
        cases = (
            (-128, 0x80000000, True), (-128, 0xFFFFFF80, True),
            (-128, 0xFFFFFF81, False),
            (-1, 0xFFFFFFFF, True), (-1, 0x80000000, True), (-1, 0, False),
            (0, 0xFFFFFFFF, True), (0, 0, True), (0, 1, False),
            (127, 0x7FFFFFFF, False), (127, 0x0000007F, True),
            (127, 0xFFFFFF80, True),
        )
        for index, (immediate, value, expected) in enumerate(cases):
            with self.subTest(immediate=immediate, value=hex(value)):
                base = BASE + index * 0x20
                source = (f"bn.sflesi r3, {immediate}\n"
                          "bn.bf taken\n"
                          "bt.movi r4, 0\n"
                          "bt.j done\n"
                          "taken:\n"
                          "bt.movi r4, 1\n"
                          "done:\n"
                          "bt.jr r9")
                _, model = model_for(source, base)
                registers = initial_registers(); registers[3] = value
                result = model.run(base, Memory([]), registers)
                self.assertEqual(result["registers"][4], int(expected))

    def test_sll_register_count_edges_aliasing_and_large_count_rejection(self):
        _, model = model_for("bn.sll r3, r4, r5\nbt.jr r9")
        for value, count, expected in (
            (0x12345678, 0, 0x12345678),
            (0x80000001, 1, 0x00000002),
            (0x00000003, 31, 0x80000000),
        ):
            with self.subTest(count=count):
                registers = initial_registers(); registers[4], registers[5] = value, count
                result = model.run(BASE, Memory([]), registers)
                self.assertEqual(result["registers"][3], expected)

        _, aliased = model_for("bn.sll r4, r4, r5\nbt.jr r9", BASE + 0x100)
        registers = initial_registers(); registers[4], registers[5] = 0x40000001, 1
        result = aliased.run(BASE + 0x100, Memory([]), registers)
        self.assertEqual(result["registers"][4], 0x80000002)

        for count in (32, 0xFFFFFFFF):
            with self.subTest(rejected_count=count), self.assertRaisesRegex(
                ValueError, "Unresolved variable shift count >=32"
            ):
                registers = initial_registers(); registers[4], registers[5] = 1, count
                model.run(BASE, Memory([]), registers)


if __name__ == "__main__":
    unittest.main()
