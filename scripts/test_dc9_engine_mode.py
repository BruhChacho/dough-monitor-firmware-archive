"""Preserve engine-mode fault order and partial integration boundaries."""
import unittest

from aeon_module_model import ModuleModel
from validate_dc9_module import inputs
from validate_dc9_engine_mode import ENTRY, ENGINES, fixture, apply_fixture
from validate_dc9_engine_apply import apply_fixture as previous_fixture
from validate_dc9_transfer import regs, named
from validate_dc9_timer import peek


class EngineModeTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.expanded, segments, _ = inputs()
        cls.strict = ModuleModel(segments, call_policy='fallthrough-hypothesis')
        cls.model = ModuleModel(segments, call_policy='fallthrough-hypothesis',
                                store_policy='halfword-lane-hypothesis')

    def test_invalid_index_reads_before_guard(self):
        memory = fixture(12)
        with self.assertRaisesRegex(ValueError, r'Unmapped memory access: 0x4800ec\+4'):
            self.strict.run(ENTRY, memory, regs(0, 13))
        self.assertFalse([w for w in memory.writes if w[0] != 'stack'])

    def test_strict_rejection_keeps_earlier_mode_byte(self):
        memory = fixture(2)
        with self.assertRaisesRegex(ValueError, 'unresolved store semantics'):
            self.strict.run(ENTRY, memory, regs(4, 2))
        self.assertEqual(peek(memory, ENGINES+2*124+0xd), 4)
        self.assertEqual([w for w in memory.writes if w[0] != 'stack'],
                         [('engines', ENGINES+2*124+0xd, 1, 4)] * 2)

    def test_active_engine_one_does_not_stub_missing_service(self):
        memory = fixture(1)
        with self.assertRaisesRegex(ValueError, 'Outside modeled instruction boundaries: 0x21fb61'):
            self.model.run(ENTRY, memory, regs(0, 1))
        self.assertEqual(peek(memory, ENGINES+124+0xd), 0)
        self.assertFalse([w for w in memory.writes if w[0].startswith('bus_')])

    def test_previous_apply_fixture_does_not_invent_adjacent_dimension(self):
        memory = previous_fixture(self.expanded)
        with self.assertRaisesRegex(ValueError, r'Unmapped memory access: 0x343c16\+2'):
            self.model.run(0x23fad0, memory, regs(), max_steps=100000)
        self.assertEqual(len(named(memory, 'global_halfword').data), 2)
        self.assertFalse([w for w in memory.writes if w[0] == 'global_halfword'])

    def test_completed_inactive_apply_preserves_reset_results(self):
        memory = apply_fixture(self.expanded)
        result = self.model.run(0x23fad0, memory, regs(), max_steps=100000)
        self.assertEqual((result['termination'], result['registers'][3]), ('return', 1))
        for index in range(13):
            self.assertEqual(peek(memory, ENGINES+index*124+0xf), 1)
            self.assertEqual(peek(memory, ENGINES+index*124+8, 4), 0)
        self.assertEqual(bytes(named(memory, 'global_halfword').data), bytes.fromhex('ef08a013'))


if __name__ == '__main__':
    unittest.main()
