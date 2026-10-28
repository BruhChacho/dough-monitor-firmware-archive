"""Failure-path regressions for persistent writes in channel leaf routines."""
import unittest

from aeon_module_model import Memory, ModuleModel
from validate_dc9_channel_leaves import CHANNELS, ENGINE
from validate_dc9_module import inputs, stack_region
from validate_dc9_transfer import plain, regs


class ChannelLeafValidationTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        _, segments, _ = inputs()
        cls.model = ModuleModel(segments, call_policy='fallthrough-hypothesis')

    def test_rectangle_assign_retains_channel_mask_before_unmapped_engine_fault(self):
        memory = Memory([plain(CHANNELS, bytearray(168), 'channels')])
        with self.assertRaisesRegex(ValueError, 'Unmapped memory access'):
            self.model.run(0x2229f8, memory, regs(2, 0))
        self.assertEqual(memory.writes, [('channels', CHANNELS + 0x2a, 2, 1 << 2)])
        self.assertEqual(memory.read(CHANNELS + 0x2a, 2), 1 << 2)

    def test_metadata_bit_update_retains_owner_state_before_unmapped_service(self):
        channels = bytearray(4 * 168)
        engines = bytearray(13 * 124)
        memory = Memory([plain(CHANNELS, channels, 'channels'),
                         plain(ENGINE, engines, 'engines'), stack_region()])
        with self.assertRaisesRegex(ValueError, 'Outside modeled instruction boundaries: 0x22701c'):
            self.model.run(0x227145, memory, regs(1, 0x55))
        self.assertEqual(memory.read(CHANNELS + 168 + 0x2c, 2), 1 << 5)
        self.assertEqual(memory.read(ENGINE + 5 * 124 + 0x10, 1), 1)
        self.assertEqual(memory.read(ENGINE + 5 * 124 + 8, 4), 1)
        self.assertEqual(memory.writes[-3:], [
            ('channels', CHANNELS + 168 + 0x2c, 2, 1 << 5),
            ('engines', ENGINE + 5 * 124 + 0x10, 1, 1),
            ('engines', ENGINE + 5 * 124 + 8, 4, 1),
        ])

    def test_overlap_flags_short_record_keeps_first_store_before_second_fault(self):
        short_record = bytearray(0x36)
        short_record[0x18:0x1a] = (0x700).to_bytes(2, 'little')
        short_record[0x1c:0x1e] = (0x100).to_bytes(2, 'little')
        memory = Memory([plain(CHANNELS, short_record, 'channels')])
        registers = regs(0)
        registers[1] = 0x123456ab
        with self.assertRaisesRegex(ValueError, 'Unmapped memory access'):
            self.model.run(0x222843, memory, registers)
        self.assertEqual(memory.writes, [('channels', CHANNELS + 0x35, 1, 1)])
        self.assertEqual(memory.read(CHANNELS + 0x35, 1), 1)


if __name__ == '__main__':
    unittest.main()
