"""Ensure apply prefixes cannot be mistaken for completed device operation."""
import unittest

from aeon_module_model import Memory, ModuleModel
from validate_dc9_module import inputs, stack_region
from validate_dc9_transfer import plain, regs, named
from validate_dc9_apply import fixture, apply_frame, RECORDS, ENGINES


class ApplyTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        _, segments, _ = inputs()
        cls.model = ModuleModel(segments, call_policy='fallthrough-hypothesis')

    def test_apply_requires_explicit_metadata_memory(self):
        # The newly recovered service reads engine-to-metadata mappings. This
        # older partial fixture must not turn missing metadata into success.
        with self.assertRaisesRegex(ValueError, 'Unmapped memory access'):
            self.model.run(0x23fad0, fixture(), regs())

    def test_nonzero_poll_requires_explicit_store_policy(self):
        memory = Memory([stack_region(), plain(0x3b5f38, (0x600000).to_bytes(4,'little'), 'pointer'),
                         plain(0x600000, bytes(0x4d), 'config'), plain(0x4551e8, b'\x01', 'active')])
        with self.assertRaisesRegex(ValueError, 'unresolved store'):
            self.model.run(0x2421d3, memory, regs())
        self.assertTrue(all(name == 'stack' for name,_,_,_ in memory.writes))

    def test_source_switch_does_not_claim_hardware_success(self):
        memory = fixture(); named(memory, 'records').data[0x2a] = 1
        with self.assertRaisesRegex(ValueError, 'Outside modeled instruction boundaries: 0x22e68a'):
            self.model.run(0x23fc0a, memory, regs(0, 5))
        self.assertTrue(all(name == 'stack' for name,_,_,_ in memory.writes))

    def test_mask_copy_requires_explicitly_mapped_destination(self):
        memory = fixture()
        named(memory, 'mask_targets').data = bytearray(4 * 124)
        before = apply_frame(memory)
        before[10], before[11], before[12] = 1 << 4, 0, RECORDS + 0x81
        with self.assertRaisesRegex(ValueError, 'Unmapped memory'):
            self.model.run(0x23fbb1, memory, before, stop_before=(0x23fc04,))
        self.assertFalse(memory.writes)


if __name__ == '__main__':
    unittest.main()
