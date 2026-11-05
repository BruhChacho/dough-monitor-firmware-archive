"""Fault ordering and unresolved-service regressions for channel assignment."""
import unittest

from aeon_module_model import Memory, ModuleModel
from validate_dc9_module import inputs, stack_region
from validate_dc9_transfer import plain, regs, named
from validate_dc9_channel_assignment import (
    ASSIGN, DISPATCH, STATE, METADATA, ENGINE, fixture, data_writes,
)


class ChannelAssignmentTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.expanded, segments, _ = inputs()
        cls.model = ModuleModel(segments, call_policy='fallthrough-hypothesis')

    def test_state_helper_requires_metadata_word_before_any_engine_store(self):
        memory = Memory([stack_region(), plain(ENGINE, bytes(13 * 124), 'engines')])
        with self.assertRaisesRegex(ValueError, 'Unmapped memory access'):
            self.model.run(STATE, memory, regs(1, 2))
        self.assertFalse(data_writes(memory))

    def test_state_helper_rejects_readonly_engine_without_changing_metadata(self):
        memory = fixture(self.expanded, state=2)
        named(memory, 'engines').writable = False
        old = bytes(named(memory, 'metadata').data)
        with self.assertRaisesRegex(ValueError, 'Write to read-only region'):
            self.model.run(STATE, memory, regs(1, 2))
        self.assertEqual(bytes(named(memory, 'metadata').data), old)
        self.assertFalse(data_writes(memory))

    def test_nonfour_mask_store_fault_precedes_engine_changes(self):
        memory = fixture(self.expanded, mode=3, state=4)
        named(memory, 'metadata').writable = False
        engine_before = bytes(named(memory, 'engines').data)
        with self.assertRaisesRegex(ValueError, 'Write to read-only region'):
            self.model.run(ASSIGN, memory, regs(1, 2))
        self.assertEqual(bytes(named(memory, 'engines').data), engine_before)
        self.assertFalse(data_writes(memory))

    def test_nonfour_engine_store_fault_retains_metadata_mask(self):
        memory = fixture(self.expanded, mode=3, state=4)
        named(memory, 'engines').writable = False
        with self.assertRaisesRegex(ValueError, 'Write to read-only region'):
            self.model.run(ASSIGN, memory, regs(1, 2))
        self.assertEqual(data_writes(memory),
                         [('metadata', METADATA + 176 + 0x12, 2, 0x8005)])

    def test_four_second_metadata_store_fault_retains_selector_byte(self):
        memory = fixture(self.expanded, mode=4)
        original = bytes(named(memory, 'metadata').data)
        memory.regions = [region for region in memory.regions if region.name != 'metadata']
        split = 176 + 0x12
        memory.regions += [plain(METADATA, original[:split], 'metadata_head'),
                           plain(METADATA + split, original[split:],
                                 'metadata_tail', False)]
        memory = Memory(memory.regions)
        with self.assertRaisesRegex(ValueError, 'Write to read-only region'):
            self.model.run(ASSIGN, memory, regs(1, 2))
        self.assertEqual(data_writes(memory),
                         [('metadata_head', METADATA + 176 + 0x10, 1, 2)])
        self.assertEqual(memory.read(METADATA + 176 + 0x10, 1), 2)
        self.assertEqual(memory.read(METADATA + 176 + 0x12, 2), 0x8001)

    def test_dispatch_reaches_unrecovered_service_without_substitution(self):
        memory = Memory([stack_region()])
        with self.assertRaisesRegex(ValueError,
                                    'Outside modeled instruction boundaries: 0x21ddcf'):
            self.model.run(DISPATCH, memory, regs(1, 4))
        self.assertFalse(data_writes(memory))
        self.assertEqual([name for name, *_ in memory.writes], ['stack'] * 3)

    def test_initialize_missing_second_source_retains_first_word(self):
        memory = fixture(self.expanded, mode=4, channel=3, channel_flag=1,
                         initialize=1)
        memory = Memory([region for region in memory.regions
                         if region.name != 'auxiliary_second'])
        with self.assertRaisesRegex(ValueError, 'Unmapped memory access'):
            self.model.run(ASSIGN, memory, regs(1, 2))
        base = 0x3b4288 + 24
        self.assertEqual(data_writes(memory)[-4:], [
            ('auxiliary', base, 1, 1),
            ('auxiliary', base + 1, 1, 1),
            ('auxiliary', base + 0x11, 1, 0),
            ('auxiliary', base + 4, 4, 0x80),
        ])
        self.assertEqual(memory.read(base + 4, 4), 0x80)
        self.assertEqual(memory.read(base + 8, 4), 0xc3c3c3c3)


if __name__ == '__main__':
    unittest.main()
