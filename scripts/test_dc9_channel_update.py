"""Boundary checks for channel metadata update paths."""
import unittest

from aeon_module_model import ModuleModel
from validate_dc9_module import inputs, stack_region
from validate_dc9_channel_update import channel_fixture
from validate_dc9_transfer import regs


class ChannelUpdateBoundaryTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        _, cls.segments, _ = inputs()
        cls.model = ModuleModel(cls.segments, call_policy='fallthrough-hypothesis')

    def test_guarded_returns_do_not_enter_external_leaves(self):
        for active, word in ((0, 1), (1, 0)):
            memory = channel_fixture(active=active, metadata_word=word)
            memory.regions.append(stack_region())
            memory = type(memory)(memory.regions)
            result = self.model.run(0x2271a9, memory, regs(0))
            self.assertEqual(result['termination'], 'return')
            self.assertEqual(result['registers'][3], 1)
            self.assertEqual([target for _, target, _ in result['calls']], [0x2227da])
            self.assertEqual([name for name, *_ in memory.writes], ['stack'] * 6)

    def test_open_guard_stops_before_unresolved_leaf_without_losing_stack(self):
        memory = channel_fixture(index=0, source=1, active=1, metadata_word=0x80000000,
                                 reference_index=2)
        memory.regions.append(stack_region())
        memory = type(memory)(memory.regions)
        result = self.model.run(0x2271a9, memory, regs(0), stop_before=(0x227145,))
        self.assertEqual(result['termination'], 'breakpoint')
        self.assertEqual(result['registers'][3], 0)
        self.assertTrue(all(name == 'stack' for name, *_ in memory.writes))
        self.assertEqual(memory.reads[:3], [
            ('records', 0x4821ec + 0x28, 1),
            ('metadata', 0x3b4950 + 176 + 0x80, 4),
            ('records', 0x4821ec + 0x94, 1),
        ])

    def test_missing_record_retains_fault_before_any_update(self):
        from aeon_module_model import Memory
        from validate_dc9_transfer import plain
        memory = Memory([plain(0x3b4950, bytes(6*176), 'metadata'), stack_region()])
        with self.assertRaisesRegex(ValueError, 'Unmapped memory access: 0x482214'):
            self.model.run(0x2271a9, memory, regs(0))
        self.assertEqual([name for name, *_ in memory.writes], ['stack'] * 6)


if __name__ == '__main__':
    unittest.main()
