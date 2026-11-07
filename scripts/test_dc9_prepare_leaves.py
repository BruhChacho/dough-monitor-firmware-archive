"""Failure-boundary regressions for pair and deferred request leaves."""
import unittest

from aeon_module_model import Memory
from validate_dc9_module import stack_region
from validate_dc9_transfer import regs
from validate_dc9_prepare_leaves import (
    BUS_B18, BUS_F18, PAIR, model_fixture, pair_memory,
)


class PrepareLeafBoundaryTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.model = model_fixture()

    def test_direct_pair_return_writes_each_low16_byte_in_order(self):
        value = 0x12ab
        memory = pair_memory()
        before = regs(value)
        result = self.model.run(PAIR, memory, before)
        self.assertEqual(result['termination'], 'return')
        self.assertEqual(result['registers'][1], before[1])
        writes = [w for w in memory.writes if w[0] == 'register_bus'
                  and w[1] in (BUS_F18, BUS_F18 + 1, BUS_B18, BUS_B18 + 1)]
        self.assertEqual(writes, [
            ('register_bus', BUS_F18, 1, 0xab),
            ('register_bus', BUS_F18 + 1, 1, 0x12),
            ('register_bus', BUS_B18, 1, 0xab),
            ('register_bus', BUS_B18 + 1, 1, 0x12),
        ])

    def test_pair_deferred_path_stops_at_unmapped_service_tail(self):
        memory = pair_memory(mode=1)
        before = regs(0x1234)
        result = self.model.run(PAIR, memory, before, stop_before=(0x23e5cd,))
        self.assertEqual((result['termination'], result['stopped_before']),
                         ('breakpoint', 0x23e5cd))
        self.assertEqual(result['registers'][3:7], [0x10902f18, 0x1234, 0xffff, 0])
        self.assertEqual(result['registers'][1], before[1] - 0x10)
        self.assertFalse([w for w in memory.writes if w[0] == 'register_bus'])

    def test_odd_deferred_request_prefix_shifts_and_masks_arguments(self):
        # Masked halfword request truncates shifted operands to ff00; shifted
        # byte request retains the complete 32-bit left shift.
        halfword = self.model.run(0x23e4a6, Memory([stack_region()]),
                                  regs(0x101, 0x12345678, 0x89abcdef),
                                  stop_before=(0x23e4d2,))
        self.assertEqual(halfword['registers'][3:7], [0x101, 0x7800, 0xef00, 0])
        self.assertEqual(halfword['registers'][1], regs()[1] - 0x10)

        shifted_byte = self.model.run(0x23e4f4, Memory([]),
                                      regs(0x101, 0x12345678, 0x89abcdef),
                                      stop_before=(0x23e502,))
        self.assertEqual(shifted_byte['registers'][3:7],
                         [0x101, 0x34567800, 0xabcdef00, 0])

    def test_dispatch_trampolines_leave_service_targets_unmapped(self):
        with self.assertRaisesRegex(ValueError,
                                    'Outside modeled instruction boundaries: 0x27aa7f'):
            self.model.run(0x23e49c, Memory([]), regs())
        with self.assertRaisesRegex(ValueError,
                                    'Outside modeled instruction boundaries: 0x27b4e2'):
            self.model.run(0x23e4a0, Memory([]), regs())


if __name__ == '__main__':
    unittest.main()
