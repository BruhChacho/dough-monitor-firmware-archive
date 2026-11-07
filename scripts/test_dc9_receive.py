"""Regression boundaries for the recovered receive service, entirely offline."""
import unittest

from aeon_module_model import Memory, ModuleModel, Region
from validate_dc9_module import inputs, SLOT
from validate_dc9_receive import base_memory, registers, region, BUS, writes


class ReceiveTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        _, segments, _ = inputs()
        cls.model = ModuleModel(segments, call_policy='fallthrough-hypothesis')

    def copy_store(self, count):
        packet = region('slot', SLOT, 128, 0xa5)
        counter = region('count', 0x45414c, 1, count)
        regs = registers(); regs[3] = 0x42
        regs[10], regs[13], regs[14] = count, SLOT, 0x45414c
        memory = Memory([packet, counter])
        result = self.model.run(0x20d949, memory, regs, stop_before=(0x20d957,))
        return result, packet, counter

    def test_copy_store_at_last_slot_byte_is_bounded_partial_result(self):
        result, packet, counter = self.copy_store(127)
        self.assertEqual(result['termination'], 'breakpoint')
        self.assertEqual(packet.data, bytes([0xa5] * 127 + [0x42]))
        self.assertEqual(counter.data, bytes([128]))

    def test_copy_store_does_not_silently_cross_slot_boundary(self):
        with self.assertRaisesRegex(ValueError, 'Unmapped memory access: 0x47ec00'):
            self.copy_store(128)

    def test_busy_indirect_read_exhausts_budget_without_faking_completion(self):
        memory = base_memory([region('bus', BUS + 0x780c, 1, 0x20)])
        with self.assertRaisesRegex(ValueError, 'Instruction budget exceeded'):
            self.model.run(0x20e47e, memory, registers(0x4700), max_steps=1000)
        self.assertFalse(writes(memory, 'bus'))
        self.assertGreater(len([r for r in memory.reads if r[0] == 'bus']), 1)

    def test_packet_xor_cannot_read_129_bytes_from_128_byte_slot(self):
        memory = Memory([region('slot', SLOT, 128)])
        with self.assertRaisesRegex(ValueError, 'Unmapped memory access: 0x47ec00'):
            self.model.run(0x20cd13, memory, registers(0, 129))


if __name__ == '__main__':
    unittest.main()
