"""Pinned encoding and explicit flag semantics for channel compare ops."""
import unittest

from aeon_helper_emulator import context
from aeon_module_model import Memory, ModuleModel
from aeon_subset_assembler import assemble, encode
from build_dc9_source_baseline import load_original
from validate_dc9_module import initial_registers


BASE = 0x200000
OPS = {
    'bg.sflesi': (-32768, 32767),
    'bg.sfleui': (0, 65535),
    'bg.sfgtsi': (-32768, 32767),
}


class ChannelCompareEncodingTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        _, cls.expanded, _ = load_original()
        cls.decoder = context()

    def test_original_channel_instruction_roundtrips(self):
        address = 0x22ab72
        raw = self.expanded[address - BASE:address - BASE + 4]
        row = self.decoder.disassemble(raw, base_address=address).instructions[0]
        self.assertEqual(row.mnem, 'bg.sflesi')
        operands = [part.strip() for part in row.body.split(',')]
        self.assertEqual(operands, ['r7', '0x780'])
        self.assertEqual(encode(row.mnem, operands, address, {}), raw)

    def test_signed_unsigned_selector_and_immediate_boundaries(self):
        for op, (low, high) in OPS.items():
            for immediate_value in (low, -1 if low < 0 else 0, high):
                with self.subTest(op=op, imm=immediate_value):
                    raw = encode(op, ['r7', str(immediate_value)], BASE, {})
                    row = self.decoder.disassemble(raw, base_address=BASE).instructions[0]
                    self.assertEqual(row.mnem, op)
                    self.assertEqual([x.strip() for x in row.body.split(',')],
                                     ['r7', hex(immediate_value) if immediate_value >= 0 else f'-0x{-immediate_value:x}'])
                    self.assertEqual(encode(row.mnem, [x.strip() for x in row.body.split(',')], BASE, {}), raw)
            for out_of_range in (low - 1, high + 1):
                with self.subTest(op=op, out_of_range=out_of_range), self.assertRaises(ValueError):
                    encode(op, ['r7', str(out_of_range)], BASE, {})

    def test_signed_vs_unsigned_flag_results(self):
        programs = {
            'bg.sflesi': ('bg.sflesi r3, 0\nbn.bf yes\nbt.movi r4, 0\nbt.jr r9\nyes:\nbt.movi r4, 1\nbt.jr r9',
                          ((0xffffffff, 1), (0, 1), (1, 0))),
            'bg.sfleui': ('bg.sfleui r3, 0\nbn.bf yes\nbt.movi r4, 0\nbt.jr r9\nyes:\nbt.movi r4, 1\nbt.jr r9',
                          ((0xffffffff, 0), (0, 1), (1, 0))),
            'bg.sfgtsi': ('bg.sfgtsi r3, 0\nbn.bf yes\nbt.movi r4, 0\nbt.jr r9\nyes:\nbt.movi r4, 1\nbt.jr r9',
                          ((0xffffffff, 0), (0, 0), (1, 1))),
        }
        for op, (source, cases) in programs.items():
            code, _ = assemble(source, BASE)
            model = ModuleModel([(BASE, code)], call_policy='fallthrough-hypothesis')
            for value, expected in cases:
                with self.subTest(op=op, value=hex(value)):
                    regs = initial_registers(); regs[3] = value
                    result = model.run(BASE, Memory([]), regs)
                    self.assertEqual(result['registers'][4], expected)


if __name__ == '__main__':
    unittest.main()
