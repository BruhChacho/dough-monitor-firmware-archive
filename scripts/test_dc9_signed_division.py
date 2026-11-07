"""Narrow tests for signed AEON divide encoding and explicit model policy."""
import unittest

from aeon_helper_emulator import context
from aeon_module_model import Memory, ModuleModel
from aeon_subset_assembler import assemble, encode
from build_dc9_source_baseline import load_original
from validate_dc9_module import initial_registers

BASE = 0x200000
ARCHIVED_ADDRESS = 0x2201ef
ARCHIVED_BYTES = bytes.fromhex('40 e6 18')


def model_for(source):
    code, _ = assemble(source, BASE)
    return ModuleModel([(BASE, code)], call_policy='fallthrough-hypothesis')


class SignedDivisionTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        _, cls.expanded, _ = load_original()
        cls.decoder = context()

    def test_archived_instruction_decodes_and_reencodes(self):
        offset = ARCHIVED_ADDRESS - BASE
        raw = self.expanded[offset:offset + len(ARCHIVED_BYTES)]
        self.assertEqual(raw, ARCHIVED_BYTES)
        row = self.decoder.disassemble(raw, base_address=ARCHIVED_ADDRESS).instructions[0]
        self.assertEqual((row.mnem, row.body), ('bn.divs', 'r7, r6, r3'))
        self.assertEqual(encode(row.mnem, [x.strip() for x in row.body.split(',')],
                                ARCHIVED_ADDRESS, {}), raw)

    def test_signed_division_truncates_toward_zero_at_boundaries(self):
        model = model_for('bn.divs r5, r3, r4\nbt.jr r9')
        cases = ((0xfffffff9, 3, 0xfffffffe),  # -7 / 3 = -2
                 (7, 0xfffffffd, 0xfffffffe),  # 7 / -3 = -2
                 (0xfffffff9, 0xfffffffd, 2),  # -7 / -3 = 2
                 (1, 0xfffffffe, 0),           # 1 / -2 truncates to zero
                 (0x80000000, 1, 0x80000000),  # INT_MIN / 1
                 (0, 0xffffffff, 0))
        for numerator, denominator, expected in cases:
            with self.subTest(numerator=hex(numerator), denominator=hex(denominator)):
                regs = initial_registers(); regs[3], regs[4] = numerator, denominator
                result = model.run(BASE, Memory([]), regs)
                self.assertEqual(result['registers'][5], expected)

    def test_source_destination_aliases_read_both_inputs_before_write(self):
        left_alias = model_for('bn.divs r3, r3, r4\nbt.jr r9')
        regs = initial_registers(); regs[3], regs[4] = 0xfffffff9, 3
        self.assertEqual(left_alias.run(BASE, Memory([]), regs)['registers'][3], 0xfffffffe)

        right_alias = model_for('bn.divs r4, r3, r4\nbt.jr r9')
        regs = initial_registers(); regs[3], regs[4] = 7, 0xfffffffd
        self.assertEqual(right_alias.run(BASE, Memory([]), regs)['registers'][4], 0xfffffffe)

    def test_zero_divisor_and_signed_overflow_fail_closed(self):
        model = model_for('bn.divs r5, r3, r4\nbt.jr r9')
        for numerator, denominator, message in (
            (7, 0, 'Unmodeled signed division by zero'),
            (0x80000000, 0xffffffff, 'Unmodeled signed division overflow'),
        ):
            regs = initial_registers(); regs[3], regs[4] = numerator, denominator
            with self.subTest(numerator=hex(numerator), denominator=hex(denominator)), \
                    self.assertRaisesRegex(ValueError, message):
                model.run(BASE, Memory([]), regs)


if __name__ == '__main__':
    unittest.main()
