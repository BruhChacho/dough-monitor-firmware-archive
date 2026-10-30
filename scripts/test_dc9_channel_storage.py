"""Fault ordering and active-path limits of the channel-storage reconstruction."""
import unittest

from aeon_module_model import Memory, ModuleModel
from validate_dc9_module import inputs, stack_region
from validate_dc9_transfer import plain, regs, named
from validate_dc9_timer import peek, seed
from validate_dc9_channel_storage import RECORDS, record_fixture, expected_clears, apply_fixture


class ChannelStorageTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.expanded, segments, _ = inputs()
        cls.strict = ModuleModel(segments, call_policy='fallthrough-hypothesis')
        cls.model = ModuleModel(segments, call_policy='fallthrough-hypothesis',
                                store_policy='halfword-lane-hypothesis')

    def test_lookup_missing_record_fails_without_index_guard(self):
        memory = record_fixture()
        with self.assertRaisesRegex(ValueError, r'Unmapped memory access: 0x4824b6\+2'):
            self.strict.run(0x2250c5, memory, regs(4))
        self.assertFalse([w for w in memory.writes if w[0] != 'stack'])

    def test_late_readonly_channel_preserves_prior_clears(self):
        original = bytes(named(record_fixture(), 'records').data)
        memory = Memory([stack_region(), plain(RECORDS, original[:3*168], 'records'),
                         plain(RECORDS+3*168, original[3*168:], 'last_record', False)])
        with self.assertRaisesRegex(ValueError, 'Write to read-only region'):
            self.strict.run(0x2250e8, memory, regs())
        self.assertEqual([w for w in memory.writes if w[0] != 'stack'], expected_clears(3))
        self.assertEqual(bytes(named(memory, 'last_record').data), original[3*168:])

    def test_zero_area_second_store_failure_retains_first_dimension(self):
        original = bytes(named(record_fixture(0, 0, 0), 'records').data)
        memory = Memory([stack_region(), plain(RECORDS, original[:0x1e], 'head'),
                         plain(RECORDS+0x1e, original[0x1e:], 'tail', False)])
        with self.assertRaisesRegex(ValueError, 'Write to read-only region'):
            self.strict.run(0x2250e8, memory, regs())
        self.assertEqual(peek(memory, RECORDS+0x1c, 2), 10)
        self.assertEqual(peek(memory, RECORDS+0x1e, 2), 0)
        self.assertEqual([w for w in memory.writes if w[0] != 'stack'],
                         [('head', RECORDS+0x1c, 2, 10)])

    def test_positive_area_does_not_stub_arithmetic_service(self):
        memory = record_fixture(2, 1920, 1080)
        old = bytes(named(memory, 'records').data)
        with self.assertRaisesRegex(ValueError, 'Outside modeled instruction boundaries: 0x2aacb9'):
            self.strict.run(0x2250e8, memory, regs())
        self.assertEqual([w for w in memory.writes if w[0] != 'stack'], expected_clears(2))
        self.assertEqual(bytes(named(memory, 'records').data[2*168:]), old[2*168:])

    def test_full_apply_active_channel_requires_assignment(self):
        memory = apply_fixture(self.expanded)
        seed(memory, RECORDS, 1, 1)
        seed(memory, RECORDS+0x1c, 100, 2); seed(memory, RECORDS+0x1e, 200, 2)
        with self.assertRaisesRegex(ValueError, 'Outside modeled instruction boundaries: 0x22701c'):
            self.model.run(0x23fad0, memory, regs(), max_steps=100000)
        self.assertEqual(peek(memory, RECORDS+0x1c, 2), 100)
        self.assertEqual(peek(memory, RECORDS+0x1e, 2), 200)

    def test_full_apply_flagged_final_channel_requires_its_service(self):
        memory = apply_fixture(self.expanded)
        seed(memory, RECORDS+0x81, 1, 1)
        with self.assertRaisesRegex(ValueError, 'Outside modeled instruction boundaries: 0x22eb07'):
            self.model.run(0x23fad0, memory, regs(), max_steps=100000)
        self.assertEqual(peek(memory, RECORDS+0x81), 1)


if __name__ == '__main__':
    unittest.main()
