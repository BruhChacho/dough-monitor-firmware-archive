"""Encoder and bounded-model checks for FF1 and CMOV1."""
import unittest

from aeon_helper_emulator import context
from aeon_module_model import Memory, ModuleModel
from aeon_subset_assembler import encode
from build_dc9_source_baseline import load_original
from validate_dc9_module import initial_registers


ARCHIVED = {
    0x213b90: (bytes.fromhex('488401'), 'bn.cmov_1', ['r4', 'r4', 'r0']),
    0x213b99: (bytes.fromhex('5d4a08'), 'bn.ff1', ['r10', 'r10']),
}


def model_for(source):
    from aeon_subset_assembler import assemble
    code, _ = assemble(source, 0x200000)
    return ModuleModel([(0x200000, code)], call_policy='fallthrough-hypothesis')


class ConsumerEncodingTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        _, cls.expanded, _ = load_original()
        cls.decoder = context()

    def test_archived_bytes_disassemble_and_reencode(self):
        for address, (expected, mnemonic, operands) in ARCHIVED.items():
            with self.subTest(address=hex(address)):
                offset = address - 0x200000
                actual = self.expanded[offset:offset + 3]
                self.assertEqual(actual, expected)
                row = self.decoder.disassemble(actual, base_address=address).instructions[0]
                self.assertEqual(row.mnem, mnemonic)
                self.assertEqual([part.strip() for part in row.body.split(',')], operands)
                self.assertEqual(encode(mnemonic, operands, address, {}), expected)

    def test_ff1_zero_and_low_bit_first_position(self):
        model = model_for('bn.ff1 r3,r4\nbt.jr r9')
        cases = ((0, 0), (1, 1), (2, 2), (3, 1),
                 (0x80000000, 32), (0x40000000, 31),
                 (0x80000001, 1), (0x80000008, 4))
        for source, expected in cases:
            with self.subTest(source=hex(source)):
                regs = initial_registers(); regs[4] = source
                result = model.run(0x200000, Memory([]), regs)
                self.assertEqual(result['registers'][3], expected)

    def test_ff1_archived_destination_source_alias(self):
        model = model_for('bn.ff1 r10,r10\nbt.jr r9')
        for source, expected in ((0, 0), (0x80000000, 32), (0x80000008, 4)):
            regs = initial_registers(); regs[10] = source
            result = model.run(0x200000, Memory([]), regs)
            self.assertEqual(result['registers'][10], expected)

    def test_cmov1_condition_and_archived_destination_alias(self):
        model = model_for('bn.sfeqi r3,0\nbn.cmov_1 r4,r4,r0\nbt.jr r9')
        for condition_value, old_r4, expected in ((0, 0x12345678, 0x12345678),
                                                  (1, 0x12345678, 0)):
            with self.subTest(condition_value=condition_value):
                regs = initial_registers(); regs[3], regs[4] = condition_value, old_r4
                result = model.run(0x200000, Memory([]), regs)
                self.assertEqual(result['registers'][4], expected)


if __name__ == '__main__':
    unittest.main()
