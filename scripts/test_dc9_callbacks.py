"""Callback and dispatch bounds; no fabricated startup completion."""
import unittest

from aeon_module_model import Memory, ModuleModel
from aeon_subset_assembler import assemble
from validate_dc9_module import inputs
from validate_dc9_transfer import plain, regs
from validate_dc9_callbacks import TABLE, initialization_tail, dispatch_tail
from validate_dc9_timer import peek, fixture


class CallbackTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        _, segments, _ = inputs()
        cls.model = ModuleModel(segments, call_policy='fallthrough-hypothesis')

    def test_out_of_table_setter_is_rejected_without_writing(self):
        for index in (10, 255, 0xffffffff):
            memory = Memory([plain(TABLE, bytes(40), 'callbacks')])
            with self.subTest(index=index), self.assertRaisesRegex(ValueError, 'Unmapped memory'):
                self.model.run(0x23e62c, memory, regs(index, 0x242099))
            self.assertFalse(memory.writes)

    def test_initialization_tail_leaves_tick_and_delay_callbacks_null(self):
        _, memory = initialization_tail(self.model, 0xa5)
        self.assertEqual(peek(memory, 0x4824a4, 4), 0)
        self.assertEqual(peek(memory, 0x4824ac, 4), 0)
        self.assertEqual(peek(memory, 0x4551e1), 1)

    def test_dispatch_continuation_does_not_imply_complete_handler(self):
        result = dispatch_tail(self.model, 0xffffffff, 255, 0xffffffff, 0xffffffff, 0, 1)
        self.assertEqual(result['termination'], 'return')
        with self.assertRaisesRegex(ValueError, 'unresolved store'):
            self.model.run(0x270836, fixture(), regs())

    def test_unsigned_less_or_equal_handles_top_bit_and_boundary(self):
        code, _ = assemble('bn.sfleui r3,99\nbt.jr r9', 0x200000)
        model = ModuleModel([(0x200000, code)], call_policy='fallthrough-hypothesis')
        for value in (0, 98, 99, 100, 255, 0x80000000, 0xffffffff):
            self.assertEqual(model.run(0x200000, Memory([]), regs(value))['flag'], value <= 99)


if __name__ == '__main__':
    unittest.main()
