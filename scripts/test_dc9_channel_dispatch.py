"""Focused regression checks for the bounded channel dispatch validation."""
import unittest

from aeon_module_model import Memory, ModuleModel, Region
from validate_dc9_channel_dispatch import (
    APPLY, APPLY_LOGICAL, METADATA, POLICIES, ROUTE, ROUTE_LOGICAL, SELECTOR,
    SELECTOR_LOGICAL, bus_byte, bus_writes, mapped_fixture, page_write, registers,
)
from validate_dc9_module import inputs
from validate_dc9_registers import byte_address


class ChannelDispatchTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        _, segments, _ = inputs()
        cls.strict = ModuleModel(segments, call_policy='fallthrough-hypothesis')
        cls.models = {p: ModuleModel(segments, call_policy='fallthrough-hypothesis',
                                    store_policy=p) for p in POLICIES}

    def test_invalid_selector_returns_without_bus_access(self):
        memory = mapped_fixture([], [])
        before = registers(0x12345678, 4)
        result = self.strict.run(SELECTOR, memory, before)
        self.assertEqual(result['termination'], 'return')
        self.assertEqual(result['registers'][3:6], before[3:6])
        self.assertEqual(memory.writes, [])

    def test_route_invalid_engine_still_reads_metadata(self):
        memory = mapped_fixture([], [], keys=(0x12345678,))
        result = self.strict.run(ROUTE, memory, registers(0, 4))
        self.assertEqual(result['termination'], 'return')
        self.assertIn(('metadata', METADATA, 4), memory.reads)
        self.assertEqual(bus_writes(memory), [])

    def test_strict_rejects_ambiguous_store_before_bus_data(self):
        memory = mapped_fixture([SELECTOR_LOGICAL[0], ROUTE_LOGICAL[0]],
                                [0xa5, 0x5a], keys=(1,))
        with self.assertRaisesRegex(ValueError, 'bg.sw_1; unresolved store semantics'):
            self.strict.run(ROUTE, memory, registers(0, 0))
        self.assertEqual(bus_writes(memory), [])
        self.assertEqual(bus_byte(memory, SELECTOR_LOGICAL[0]), 0xa5)

    def test_route_key_boundaries_and_ordered_bus_oracle(self):
        for policy in POLICIES:
            for key, mapped in ((4, 7), (5, 0), (7, 2), (8, 8), (0x12345678, 0x78)):
                selector, route = SELECTOR_LOGICAL[1], ROUTE_LOGICAL[1]
                memory = mapped_fixture([selector, route], [0xa5, 0x5a], counter=1,
                                        keys=(key,))
                result = self.models[policy].run(ROUTE, memory, registers(0, 1))
                self.assertEqual(result['termination'], 'return')
                self.assertEqual(bus_byte(memory, route), mapped)
                selected = (0xa5 & ~0x7c) | ((mapped << 2) & 0x7c)
                self.assertEqual(bus_writes(memory),
                                 [page_write(selector), page_write(selector),
                                  (byte_address(selector), selected), page_write(route),
                                  (byte_address(route), mapped)])

    def test_high_only_missing_second_byte_retains_first_byte(self):
        for policy in POLICIES:
            memory = mapped_fixture([APPLY_LOGICAL], [0xa5])
            with self.assertRaisesRegex(ValueError, 'Unmapped memory access'):
                self.models[policy].run(APPLY, memory, registers(0x1234ab00, 2))
            self.assertEqual(bus_byte(memory, APPLY_LOGICAL), 0xab)
            self.assertEqual(bus_writes(memory),
                             [page_write(APPLY_LOGICAL), (byte_address(APPLY_LOGICAL), 0xab),
                              page_write(APPLY_LOGICAL + 1)])

    def test_low_byte_path_retains_fault_and_stops_at_real_timer_poll(self):
        for policy in POLICIES:
            memory = mapped_fixture([], [])
            width = 4 if policy == 'sleigh-store' else 2
            with self.assertRaisesRegex(ValueError, fr'Unmapped memory access: 0x455204\+{width}'):
                self.models[policy].run(APPLY, memory, registers(1, 0))
            self.assertEqual(bus_writes(memory), [])
            timer = Region('timer', 0x455204, bytearray.fromhex('0000003c'), True)
            memory = Memory(mapped_fixture([], []).regions + [timer])
            result = self.models[policy].run(APPLY, memory, registers(1, 0),
                                             stop_before=(0x2420b2,))
            self.assertEqual(result['stopped_before'], 0x2420b2)
            self.assertEqual([t for _, t, _ in result['calls']], [0x24209d])
            self.assertEqual([(a, w, v) for n, a, w, v in memory.writes if n == 'timer'],
                             [(0x455204, width, 2), (0x455206, 1, 1)])


if __name__ == '__main__':
    unittest.main()
