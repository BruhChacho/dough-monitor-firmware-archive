"""Fault and boundary regressions for recovered engine preparation."""
import unittest

from aeon_module_model import Memory, ModuleModel
from validate_dc9_module import inputs
from validate_dc9_transfer import plain, regs, named
from validate_dc9_channel_apply import apply_fixture
from validate_dc9_engine_prepare import (GLOBAL_HALFWORD, isolated_fixture,
                                         mapped_return_fixture)


class EnginePrepareTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.expanded, segments, _ = inputs()
        cls.model = ModuleModel(segments, call_policy='fallthrough-hypothesis',
                                store_policy='halfword-lane-hypothesis')

    def test_index_13_reads_engine_entry_before_range_guard(self):
        # The fixture contains exactly the 13 valid entries (0 through 12).
        # Pass index 13 separately so fixture construction itself stays valid;
        # the recovered function reads the entry before reaching its guard.
        memory = isolated_fixture(12)
        self.assertEqual(len(named(memory, 'engines').data), 13 * 124)
        with self.assertRaisesRegex(ValueError,
                                    r'Unmapped memory access: 0x4800ec\+4'):
            self.model.run(0x21ffb3, memory, regs(13))
        self.assertEqual([w for w in memory.writes if w[0] != 'stack'], [])

    def test_selected_mode_one_returns_with_explicit_bus_bytes(self):
        for index in range(4):
            memory = mapped_return_fixture(index)
            original = bytes(named(memory, 'engines').data)
            result = self.model.run(0x21ffb3, memory, regs(index),
                                    max_steps=30000)
            self.assertEqual(result['termination'], 'return')
            self.assertEqual(bytes(named(memory, 'engines').data), original)
            self.assertEqual(len([w for w in memory.writes
                                  if w[0].startswith('bus_') and
                                  w[1] != 0xa0000000 + 2 * (0x200 + index * 0x100)]), 10)

    def test_selected_zero_bank_returns_without_bus_data_writes(self):
        for index in range(4):
            memory = mapped_return_fixture(index, zero_bank=True)
            result = self.model.run(0x21ffb3, memory, regs(index),
                                    max_steps=30000)
            self.assertEqual(result['termination'], 'return')
            self.assertFalse(any(w[0].startswith('bus_') for w in memory.writes))

    def test_global_size_required_and_divisor_zero_rejected(self):
        memory = isolated_fixture(0, 1)
        memory.regions = [r for r in memory.regions if r.name != 'global_halfword']
        with self.assertRaisesRegex(ValueError,
                                    r'Unmapped memory access: 0x343c14\+2'):
            self.model.run(0x21ffb3, memory, regs(0),
                           stop_before=(0x22020d,))
        self.assertEqual([w for w in memory.writes if w[0] != 'stack'], [])

        memory = isolated_fixture(0, 1, global_value=0)
        with self.assertRaisesRegex(ValueError, 'Unmodeled division by zero'):
            self.model.run(0x21ffb3, memory, regs(0),
                           stop_before=(0x22020d,))

    def test_full_apply_owner_record_is_explicit(self):
        memory = apply_fixture(self.expanded, 0x20, 1)
        memory = Memory(memory.regions + [plain(GLOBAL_HALFWORD,
                         (1000).to_bytes(2, 'little'), 'global_halfword', False)])
        with self.assertRaisesRegex(ValueError,
                                    r'Unmapped memory access: 0x4824c4\+1'):
            self.model.run(0x23fad0, memory, regs(), max_steps=100000)
        self.assertIn(('global_halfword', GLOBAL_HALFWORD, 2), memory.reads)
        self.assertEqual(len(named(memory, 'records').data), 4 * 168)

    def test_bounded_full_apply_preserves_configuration_inputs(self):
        memory = apply_fixture(self.expanded, 0, 0)
        named(memory, 'records').data.extend(bytes(168))
        memory = Memory(memory.regions + [plain(GLOBAL_HALFWORD,
                         (1000).to_bytes(2, 'little'), 'global_halfword', False)])
        result = self.model.run(0x23fad0, memory, regs(), max_steps=100000,
                                stop_before=(0x22020d,))
        self.assertEqual(result['termination'], 'breakpoint')
        self.assertEqual([t for _, t, _ in result['calls'][-5:]],
                         [0x21ffb3, 0x2227ef, 0x21bd8d, 0x21bd1e, 0x21bd1e])
        self.assertEqual([w for w in memory.writes if w[0] in
                          ('config_pointer', 'config', 'active', 'global_halfword')], [])


if __name__ == '__main__':
    unittest.main()
