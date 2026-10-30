"""Behavioral tests for the bounded two-pair storage-register setup."""
import unittest

from aeon_module_model import ModuleModel
from validate_dc9_module import inputs
from validate_dc9_transfer import regs
from validate_dc9_registers import byte_address
from validate_dc9_storage_registers import (ENTRY, fixture, bus_writes,
                                            expected_writes)


class StorageRegistersTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.expanded, segments, _ = inputs()
        cls.strict = ModuleModel(segments, call_policy='fallthrough-hypothesis')
        cls.models = {policy: ModuleModel(segments, call_policy='fallthrough-hypothesis',
                                          store_policy=policy)
                      for policy in ('sleigh-store', 'halfword-lane-hypothesis')}

    def test_high_bit_width_and_distinct_configured_halfwords(self):
        pairs = ((1, 0x8000, 0x100, 0x7788, 0x5566), (0, 0, 0, 0, 0))
        for policy, model in self.models.items():
            with self.subTest(policy=policy):
                memory = fixture(pairs=pairs)
                before = regs()
                result = model.run(ENTRY, memory, before)
                self.assertEqual(result['termination'], 'return')
                self.assertEqual(result['registers'][1], before[1])
                self.assertEqual(result['registers'][10:13], before[10:13])
                writes = bus_writes(memory)
                self.assertEqual(writes, expected_writes(0x200, pairs))
                for logical, value in ((0x2080022a, 0x66), (0x2080022b, 0x55),
                                       (0x2080022c, 0x88), (0x2080022d, 0x77)):
                    self.assertIn((byte_address(logical), value), writes)

    def test_full_branch_paths_preserve_order_and_page_selection(self):
        cases = (
            ((0, 0x100, 0x20, 0x3344, 0x1122), (0, 0, 0, 0, 0)),
            ((1, 0, 0x20, 0x3344, 0x1122), (0, 0, 0, 0, 0)),
            ((1, 0x1300, 0x100, 0x3344, 0x1122), (0, 0, 0, 0, 0)),
            ((1, 0x1301, 0x100, 0x7788, 0x5566), (0, 0, 0, 0, 0)),
            ((1, 0x1301, 0x100, 0x7788, 0x5566), (1, 0x100, 0x20, 0x5566, 0x1122)),
        )
        for policy, model in self.models.items():
            for pairs in cases:
                with self.subTest(policy=policy, pairs=pairs):
                    memory = fixture(pairs=pairs)
                    before = bytes(next(r for r in memory.regions if r.name == 'engines').data)
                    result = model.run(ENTRY, memory, regs())
                    self.assertEqual(result['termination'], 'return')
                    self.assertEqual(bus_writes(memory), expected_writes(0x200, pairs))
                    self.assertEqual(bytes(next(r for r in memory.regions if r.name == 'engines').data), before)
                    self.assertTrue(any(value == 0x32 for _, value in bus_writes(memory)))

    def test_threshold_dispatch_has_exact_masked_call_arguments(self):
        cases = ((0, 0x100, 0x20, 0), (1, 0, 0x20, 0),
                 (1, 0x1300, 0x100, 0), (1, 0x1301, 0x100, 1))
        for state, width, partner_width, expected_enable in cases:
            pairs = ((state, width, partner_width, 0x7788, 0x5566), (0, 0, 0, 0, 0))
            with self.subTest(state=state, width=width, partner_width=partner_width):
                memory = fixture(pairs=pairs)
                result = self.strict.run(ENTRY, memory, regs(), stop_before=(0x23dead,))
                self.assertEqual(result['termination'], 'breakpoint')
                self.assertEqual(result['registers'][3:6], [0x20800247, expected_enable, 8])
                self.assertEqual(bus_writes(memory), expected_writes(0x200, pairs)[:20])

    def test_default_rejects_ambiguous_store_after_six_direct_writes(self):
        pairs = ((0, 0, 0, 0, 0), (0, 0, 0, 0, 0))
        memory = fixture(pairs=pairs)
        with self.assertRaisesRegex(ValueError, 'unresolved store'):
            self.strict.run(ENTRY, memory, regs())
        self.assertEqual(bus_writes(memory), expected_writes(0x200, pairs)[:20])

    def test_missing_and_read_only_bus_byte_keep_prior_writes(self):
        pairs = ((0, 0, 0, 0, 0), (0, 0, 0, 0, 0))
        target = byte_address(0x328002af)
        expected = expected_writes(0x200, pairs)
        for field, message in (('missing', f'Unmapped memory access: {target:#x}+1'),
                               ('read_only', 'Write to read-only region')):
            with self.subTest(field=field):
                memory = fixture(pairs=pairs, **{field: target})
                with self.assertRaisesRegex(ValueError, message.replace('+', r'\+')):
                    self.models['halfword-lane-hypothesis'].run(ENTRY, memory, regs())
                self.assertEqual(bus_writes(memory), expected[:7])

    def test_zero_bank_skips_bus_writes_without_expanding_mapping(self):
        pairs = ((1, 0x1300, 0x100, 0x3344, 0x1122), (1, 0x1301, 0x100, 0x7788, 0x5566))
        for policy, model in self.models.items():
            with self.subTest(policy=policy):
                memory = fixture(bank=0, pairs=pairs)
                result = model.run(ENTRY, memory, regs())
                self.assertEqual(result['termination'], 'return')
                self.assertEqual(bus_writes(memory), [])


if __name__ == '__main__':
    unittest.main()
