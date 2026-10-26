"""Encoding and bounded execution regressions for variable arithmetic shift."""
import unittest

from aeon_helper_emulator import context
from aeon_module_model import Memory, ModuleModel
from aeon_subset_assembler import encode
from build_dc9_source_baseline import load_original
from validate_dc9_module import initial_registers


ARCHIVED = {
    0x23412d: (bytes.fromhex('4ced56'), 'bn.sra', ['r7', 'r13', 'r10']),
    0x23413d: (bytes.fromhex('4ce756'), 'bn.sra', ['r7', 'r7', 'r10']),
    0x234194: (bytes.fromhex('4cec56'), 'bn.sra', ['r7', 'r12', 'r10']),
}


def model_for(source):
    from aeon_subset_assembler import assemble
    code, _ = assemble(source, 0x200000)
    return ModuleModel([(0x200000, code)], call_policy='fallthrough-hypothesis')


class ArithmeticShiftTests(unittest.TestCase):
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

    def test_signed_and_unsigned_boundary_values(self):
        model = model_for('bn.sra r3,r4,r5\nbt.jr r9')
        cases = ((0x80000000, 1, 0xc0000000),
                 (0x7fffffff, 1, 0x3fffffff),
                 (0xffffffff, 31, 0xffffffff),
                 (0x80000000, 31, 0xffffffff),
                 (0x40000000, 2, 0x10000000),
                 (0x81234567, 0, 0x81234567))
        for source, count, expected in cases:
            with self.subTest(source=hex(source), count=count):
                regs = initial_registers(); regs[4], regs[5] = source, count
                result = model.run(0x200000, Memory([]), regs)
                self.assertEqual(result['registers'][3], expected)

    def test_source_and_count_aliases_read_before_destination_write(self):
        source_alias = model_for('bn.sra r3,r3,r5\nbt.jr r9')
        regs = initial_registers(); regs[3], regs[5] = 0x80000000, 1
        self.assertEqual(source_alias.run(0x200000, Memory([]), regs)['registers'][3],
                         0xc0000000)

        count_alias = model_for('bn.sra r5,r4,r5\nbt.jr r9')
        regs = initial_registers(); regs[4], regs[5] = 0x80000000, 1
        self.assertEqual(count_alias.run(0x200000, Memory([]), regs)['registers'][5],
                         0xc0000000)

    def test_variable_counts_at_or_above_32_are_rejected(self):
        model = model_for('bn.sra r3,r4,r5\nbt.jr r9')
        for count in (32, 0xffffffff):
            regs = initial_registers(); regs[4], regs[5] = 0x80000000, count
            with self.subTest(count=hex(count)), self.assertRaisesRegex(
                    ValueError, 'Unresolved variable shift count >=32'):
                model.run(0x200000, Memory([]), regs)


if __name__ == '__main__':
    unittest.main()
