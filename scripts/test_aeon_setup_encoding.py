"""Archived encoding and bounded semantics for newly recovered setup ops."""
import unittest

from aeon_helper_emulator import context
from aeon_module_model import Memory, ModuleModel
from aeon_subset_assembler import assemble, encode
from build_dc9_source_baseline import load_original
from validate_dc9_module import initial_registers


ARCHIVED = {
    0x220b7e: (bytes.fromhex("5cfff9"), "bn.sfgtsi", ["r7", "-0x1"]),
    0x220b81: (bytes.fromhex("48e00a"), "bn.cmovsi_2", ["r7", "r0", "0x1"]),
    0x220bf5: (bytes.fromhex("d061f601"), "bg.bleui", ["r3", "0x1", "0x220ab5"]),
}


class SetupEncodingTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        _, cls.expanded, _ = load_original()
        cls.decoder = context()

    def test_archived_bytes_disassemble_and_reencode(self):
        for address, (expected, mnemonic, operands) in ARCHIVED.items():
            with self.subTest(address=hex(address)):
                actual = self.expanded[address - 0x200000:address - 0x200000 + len(expected)]
                self.assertEqual(actual, expected)
                row = self.decoder.disassemble(actual, base_address=address).instructions[0]
                decoded_args = [part.strip() for part in row.body.rstrip(",").split(",")]
                self.assertEqual((row.mnem, decoded_args), (mnemonic, operands))
                self.assertEqual(encode(row.mnem, decoded_args, address, {}), expected)

    def test_signed_immediate_encoding_bounds(self):
        self.assertEqual(encode("bn.sfgtsi", ["r7", "-128"], 0, {}).hex(), "5cf019")
        self.assertEqual(encode("bn.sfgtsi", ["r7", "127"], 0, {}).hex(), "5ceff9")
        self.assertEqual(encode("bn.cmovsi_2", ["r7", "r0", "-4"], 0, {}).hex(), "48e0e2")
        self.assertEqual(encode("bn.cmovsi_2", ["r7", "r0", "3"], 0, {}).hex(), "48e01a")
        self.assertEqual(encode("bn.cmovsi_2", ["r7", "r0", "-16"], 0, {}).hex(), "48e082")
        self.assertEqual(encode("bn.cmovsi_2", ["r7", "r0", "15"], 0, {}).hex(), "48e07a")
        for op, args in (("bn.sfgtsi", ["r7", "-129"]),
                         ("bn.sfgtsi", ["r7", "128"]),
                         ("bn.cmovsi_2", ["r7", "r0", "-17"]),
                         ("bn.cmovsi_2", ["r7", "r0", "16"])):
            with self.subTest(op=op, args=args), self.assertRaises(ValueError):
                encode(op, args, 0, {})

    def test_signed_compare_and_conditional_move_alias(self):
        code, _ = assemble("bn.sfgtsi r3,-1\nbn.cmovsi_2 r4,r4,-1\nbt.jr r9", 0x200000)
        model = ModuleModel([(0x200000, code)], call_policy="fallthrough-hypothesis")
        for value, flag, expected in ((0xffffffff, False, 0xffffffff), (0, True, 0x12345678)):
            regs = initial_registers(); regs[3], regs[4] = value, 0x12345678
            result = model.run(0x200000, Memory([]), regs)
            self.assertEqual(result["flag"], flag)
            self.assertEqual(result["registers"][4], expected)

    def test_cmovsi_rejects_uninitialized_flag(self):
        code, _ = assemble("bn.cmovsi_2 r4,r4,1\nbt.jr r9", 0x200000)
        model = ModuleModel([(0x200000, code)], call_policy="fallthrough-hypothesis")
        regs = initial_registers(); regs[4] = 9
        with self.assertRaisesRegex(ValueError, "uninitialized flag"):
            model.run(0x200000, Memory([]), regs)

    def test_cmovsi_all_signed_five_bit_values_and_predicates(self):
        for immediate in range(-16, 16):
            with self.subTest(immediate=immediate):
                code, _ = assemble(
                    f"bn.sfeqi r3,1\nbn.cmovsi_2 r4,r4,{immediate}\nbt.jr r9", 0x200000)
                model = ModuleModel([(0x200000, code)], call_policy="fallthrough-hypothesis")
                regs = initial_registers(); regs[3], regs[4] = 0, 0x12345678
                result = model.run(0x200000, Memory([]), regs)
                self.assertFalse(result["flag"])
                self.assertEqual(result["registers"][4], immediate & 0xffffffff)
                regs[3], regs[4] = 1, 0x12345678
                result = model.run(0x200000, Memory([]), regs)
                self.assertTrue(result["flag"])
                self.assertEqual(result["registers"][4], 0x12345678)

    def test_archived_unsigned_branch_semantics(self):
        source = """bg.bleui r3,1,yes
bt.movi r4,1
bt.j end
yes:
bt.movi r4,2
end:
bt.jr r9
"""
        code, _ = assemble(source, 0x200000)
        model = ModuleModel([(0x200000, code)], call_policy="fallthrough-hypothesis")
        for value, expected in ((0, 2), (1, 2), (2, 1), (0xffffffff, 1)):
            regs = initial_registers(); regs[3] = value
            result = model.run(0x200000, Memory([]), regs)
            self.assertEqual(result["registers"][4], expected)


if __name__ == "__main__":
    unittest.main()
