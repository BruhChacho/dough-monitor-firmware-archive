"""Regression boundaries that keep conditional store experiments explicit."""
import unittest

from aeon_subset_assembler import assemble
from aeon_module_model import Memory, ModuleModel, Region
from validate_dc9_module import inputs
from validate_dc9_transfer import fixture, regs, named


class TransferTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.expanded, cls.segments, _ = inputs()

    def test_unknown_store_policy_is_rejected(self):
        with self.assertRaisesRegex(ValueError, 'store policy'):
            ModuleModel(self.segments, call_policy='fallthrough-hypothesis', store_policy='automatic')

    def test_new_ambiguous_store_remains_rejected_by_default(self):
        code, _ = assemble('bg.sh 0(r3),r4\nbt.jr r9', 0x200000)
        model = ModuleModel([(0x200000, code)], call_policy='fallthrough-hypothesis')
        memory = Memory([Region('setting', 0x600000, bytearray.fromhex('a5a5a5a5'), True)])
        with self.assertRaisesRegex(ValueError, 'Unsupported instruction: bg.sh'):
            model.run(0x200000, memory, regs(0x600000, 75))
        self.assertFalse(memory.writes)

    def test_narrow_mapping_does_not_hide_word_store_overrun(self):
        code, _ = assemble('bg.sw_1 0(r3),r4\nbt.jr r9', 0x200000)
        for policy in ('sleigh-store', 'halfword-lane-hypothesis'):
            model = ModuleModel([(0x200000, code)], call_policy='fallthrough-hypothesis', store_policy=policy)
            memory = Memory([Region('counter', 0x600000, bytearray(2), True)])
            if policy == 'sleigh-store':
                with self.assertRaisesRegex(ValueError, 'Unmapped memory access'):
                    model.run(0x200000, memory, regs(0x600000, 1))
                self.assertFalse(memory.writes)
            else:
                result = model.run(0x200000, memory, regs(0x600000, 1))
                self.assertEqual(result['store_policy'], policy)
                self.assertEqual(memory.regions[0].data, bytes.fromhex('0100'))

    def test_full_followup_does_not_silently_enable_store_hypothesis(self):
        model = ModuleModel(self.segments, call_policy='fallthrough-hypothesis')
        memory = fixture(self.expanded, 0, bytes([4, 0, 0x11, 0, 0, 0]))
        with self.assertRaisesRegex(ValueError, 'Unsupported instruction: bg.sw_1'):
            model.run(0x20d2b7, memory, regs(0))

    def test_followup_copy_rejects_frame_longer_than_slot(self):
        model = ModuleModel(self.segments, call_policy='fallthrough-hypothesis')
        memory = fixture(self.expanded, 0, bytes([127, 0]))
        with self.assertRaisesRegex(ValueError, 'Unmapped memory access: 0x47ec00'):
            model.run(0x20d2b7, memory, regs(0))


if __name__ == '__main__':
    unittest.main()
