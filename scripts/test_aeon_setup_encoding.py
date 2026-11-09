"""Archived encoding and bounded semantics for newly recovered setup ops."""
import unittest

from aeon_helper_emulator import context
from aeon_module_model import Memory, ModuleModel
from aeon_subset_assembler import assemble, encode
from build_dc9_source_baseline import load_original
from validate_dc9_module import initial_registers, inputs


ARCHIVED = {
    0x220b7e: (bytes.fromhex("5cfff9"), "bn.sfgtsi", ["r7", "-0x1"]),
    0x220b81: (bytes.fromhex("48e00a"), "bn.cmovsi_2", ["r7", "r0", "0x1"]),
    0x220bf5: (bytes.fromhex("d061f601"), "bg.bleui", ["r3", "0x1", "0x220ab5"]),
    0x21fbea: (bytes.fromhex("d0e20d20"), "bg.blesi", ["r7", "0x2", "0x21fd8e"]),
    0x21fcc1: (bytes.fromhex("d0600a30"), "bg.blesi", ["r3", "0x0", "0x21fe07"]),
    0x21fcf5: (bytes.fromhex("d0600778"), "bg.blesi", ["r3", "0x0", "0x21fde4"]),
    0x20ee6e: (bytes.fromhex("5ca706"), "bn.exths", ["r5", "r7"]),
    0x215236: (bytes.fromhex("d14a0244"), "bg.bgtsi", ["r10", "0xa", "0x21527e"]),
    0x22490c: (bytes.fromhex("d4a700b8"), "bg.bles", ["r5", "r7", "0x224923"]),
    0x22d1b2: (bytes.fromhex("40c607"), "bn.addc", ["r6", "r6", "r0"]),
    0x270a05: (bytes.fromhex("f4000005"), "bg.syncwritebuffer", []),
    0x2aae70: (bytes.fromhex("5d060d"), "bn.sfne", ["r8", "r6"]),
    0x2abdc9: (bytes.fromhex("2bfe7c"), "bn.jal", ["0x2abc45"]),
    0x2abe75: (bytes.fromhex("5ce605"), "bn.sfeq", ["r7", "r6"]),
    0x2ac605: (bytes.fromhex("dd08ffff"), "bg.addci_maybe", ["r8", "r8", "-0x1"]),
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
                decoded_args = [part.strip() for part in row.body.rstrip(",").split(",")] if row.body.strip() else []
                self.assertEqual((row.mnem, decoded_args), (mnemonic, operands))
                self.assertEqual(encode(row.mnem, decoded_args, address, {}), expected)

    def test_encoder_only_signed_branch_endpoints_and_rejections(self):
        base = 0x200000
        for op, bits, prefix in (("bn.jal", 18, []),
                                 ("bg.bles", 13, ["r0", "r31"]),
                                 ("bg.bgtsi", 13, ["r31", "-16"])):
            low, high = -(1 << (bits - 1)), (1 << (bits - 1)) - 1
            for delta in (low, high):
                with self.subTest(op=op, delta=delta):
                    raw = encode(op, prefix + [hex(base + delta)], base, {})
                    row = self.decoder.disassemble(raw, base_address=base).instructions[0]
                    self.assertEqual(row.mnem, op)
                    self.assertEqual(int(row.body.split(",")[-1], 0), base + delta)
            for delta in (low - 1, high + 1):
                with self.subTest(op=op, delta=delta), self.assertRaisesRegex(ValueError, "range"):
                    encode(op, prefix + [hex(base + delta)], base, {})
        raw, _ = assemble("bn.jal next\nnext:\nbt.jr r9", base)
        row = self.decoder.disassemble(raw, base_address=base).instructions[0]
        self.assertEqual(int(row.body, 0), base + 3)

    def test_encoder_only_operands_and_immediate_bounds(self):
        for op, args, index, edges in (
            ("bg.bgtsi", ["r0", "0", "0x200000"], 1, (-16, 15)),
            ("bg.addci_maybe", ["r0", "r31", "0"], 2, (-32768, 32767)),
        ):
            for value in edges:
                operands = list(args); operands[index] = str(value)
                row = self.decoder.disassemble(encode(op, operands, 0x200000, {}),
                                               base_address=0x200000).instructions[0]
                self.assertEqual(int(row.body.split(",")[index], 0), value)
            for value in (edges[0] - 1, edges[1] + 1):
                operands = list(args); operands[index] = str(value)
                with self.subTest(op=op, value=value), self.assertRaisesRegex(ValueError, "range"):
                    encode(op, operands, 0x200000, {})
        for source in ("bn.sfeq r32,r0", "bn.sfne r0,r32", "bn.exths r-1,r0",
                       "bn.addc r0,r31,r32", "bg.bles r32,r0,0x200000",
                       "bg.syncwritebuffer 0", "bn.jal", "bg.addci_maybe r0,r32,0"):
            with self.subTest(source=source), self.assertRaises(ValueError):
                assemble(source, 0x200000)

    def test_encoder_only_forms_remain_rejected_by_cpu_model(self):
        for source in ("bn.sfeq r0,r31", "bn.sfne r31,r0", "bn.exths r0,r31",
                       "bn.jal 0x200003", "bg.bles r0,r31,0x200004",
                       "bg.bgtsi r31,-16,0x200004", "bn.addc r0,r31,r31",
                       "bg.syncwritebuffer", "bg.addci_maybe r0,r31,-1"):
            with self.subTest(source=source):
                code, _ = assemble(source + "\nbt.jr r9", 0x200000)
                model = ModuleModel([(0x200000, code)], call_policy="fallthrough-hypothesis")
                with self.assertRaisesRegex(ValueError, "Unsupported instruction: " + source.split()[0]):
                    model.run(0x200000, Memory([]), initial_registers())

    def test_complete_source_inputs_construct_without_executing_new_forms(self):
        _, segments, _ = inputs()
        model = ModuleModel(segments, call_policy="fallthrough-hypothesis")
        self.assertEqual(model.instructions[0x270a05], (4, "bg.syncwritebuffer", []))
        with self.assertRaisesRegex(ValueError, "Unsupported instruction: bg.syncwritebuffer"):
            model.run(0x270a05, Memory([]), initial_registers())

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

    def test_signed_long_branch_semantics_and_bounds(self):
        source = """bg.blesi r3,2,yes
bt.movi r4,1
bt.j end
yes:
bt.movi r4,2
end:
bt.jr r9
"""
        code, _ = assemble(source, 0x200000)
        model = ModuleModel([(0x200000, code)], call_policy="fallthrough-hypothesis")
        for value, expected in ((0xffffffff, 2), (0, 2), (2, 2), (3, 1)):
            regs = initial_registers(); regs[3] = value
            self.assertEqual(model.run(0x200000, Memory([]), regs)["registers"][4], expected)
        for immediate in (-17, 16):
            with self.assertRaises(ValueError):
                encode('bg.blesi', ['r3', str(immediate), '0x200004'], 0x200000, {})


if __name__ == "__main__":
    unittest.main()
