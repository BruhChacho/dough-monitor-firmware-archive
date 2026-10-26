"""Targeted regression coverage for the bounded masked-register validator."""
import unittest

from aeon_module_model import ModuleModel, Region
from validate_dc9_masked import (POLICIES, WRITE8, WRITE16, _byte, fixture,
                                 validate)
from validate_dc9_module import initial_registers, inputs
from validate_dc9_registers import byte_address


class MaskedRegisterTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.report = validate()
        _, cls.segments, _ = inputs()
        cls.strict = ModuleModel(cls.segments, call_policy='fallthrough-hypothesis')
        cls.models = {policy: ModuleModel(cls.segments,
                                          call_policy='fallthrough-hypothesis',
                                          store_policy=policy)
                      for policy in POLICIES}

    def test_default_model_rejects_each_ambiguous_counter_store(self):
        logical, old, counter = 0x1234, 0x6d, 0xfffe
        memory = fixture([logical], [old], counter)
        counter_before = next(region for region in memory.regions
                              if region.name == 'counter').data[:]
        regs = initial_registers(0x91627354)
        regs[3:6] = [logical, 0x1ed, 0xff]
        with self.assertRaisesRegex(ValueError, 'unresolved store'):
            self.strict.run(WRITE8, memory, regs)
        self.assertEqual(_byte(memory, byte_address(logical)), old)
        self.assertEqual(next(region for region in memory.regions
                              if region.name == 'counter').data, counter_before)
        self.assertTrue(memory.writes)
        self.assertTrue(all(name == 'stack' for name, *_ in memory.writes))
        self.assertEqual(self.report['strict_cases'], 32)

    def test_direct_16bit_update_preserves_unmasked_and_adjacent_bytes(self):
        logical, old, value, mask = 0x1240, 0xa55a, 0x1234, 0x0f0f
        target = byte_address(logical)
        memory = fixture([logical, logical + 1], [old & 0xff, old >> 8], 1)
        memory.regions.extend((Region('before_sentinel', target - 1, bytearray([0x6d]), True),
                               Region('after_sentinel', target + 2, bytearray([0xb2]), True)))
        regs = initial_registers(0x91627354)
        regs[3:6] = [logical, value, mask]
        result = self.models['halfword-lane-hypothesis'].run(WRITE16, memory, regs)
        expected = (old & (~mask & 0xffff)) | (value & mask)
        actual = _byte(memory, target) | (_byte(memory, target + 1) << 8)
        self.assertEqual(actual, expected)
        self.assertEqual((old ^ actual) & (~mask & 0xffff), 0)
        self.assertEqual(_byte(memory, target - 1), 0x6d)
        self.assertEqual(_byte(memory, target + 2), 0xb2)
        self.assertEqual(result['termination'], 'return')

    def test_both_explicit_store_hypotheses_cover_direct_paged_masks_and_counter_edges(self):
        self.assertEqual(self.report['conditional_cases'], 64)
        self.assertEqual(self.report['cases_per_policy'], 32)
        self.assertEqual(self.report['counter_values'], [0, 1, 0xfffe, 0xffff])
        self.assertEqual(set(self.report['coverage']),
                         {'sleigh-store', 'halfword-lane-hypothesis'})
        for coverage in self.report['coverage'].values():
            self.assertGreater(coverage['visited_instruction_count'], 0)
            self.assertGreater(coverage['entries']['0x23dfe1'], 0)
            self.assertGreater(coverage['entries']['0x23e152'], 0)
        rows = self.report['direct_and_paged_cases']
        for width in (8, 16):
            matching = [row for row in rows if row['width'] == width]
            self.assertEqual(len(matching), 4)
            self.assertEqual({row['mask'] for row in matching},
                             {'0x0', hex((1 << (width + 1)) - 1)})
            self.assertEqual(sum(bool(int(row['logical'], 16) & 0x800000)
                                 for row in matching), 2)
            self.assertEqual(sum(not (int(row['logical'], 16) & 0x800000)
                                 for row in matching), 2)

    def test_unmapped_high_byte_reports_prior_low_byte_write(self):
        failure = self.report['partial_write_failure']
        self.assertIn('Unmapped memory access:', failure['rejection'])
        self.assertEqual(len(failure['visible_bus_writes']), 1)
        self.assertEqual(failure['low_byte_after_failure'], '0xef')


if __name__ == '__main__':
    unittest.main()
