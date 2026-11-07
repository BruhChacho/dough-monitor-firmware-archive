"""Regression tests for the bounded model's concrete failure boundaries."""
import unittest

from aeon_module_model import Memory, ModuleModel, Region
from aeon_subset_assembler import assemble
from validate_dc9_module import command_case, inputs, initial_registers, PLANE


class ModuleTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        _, cls.segments, cls.tables = inputs()
        cls.model = ModuleModel(cls.segments, call_policy='fallthrough-hypothesis')

    def test_command_120_bytes_stays_in_slot_but_121_is_rejected(self):
        command_case(self.model, self.tables, plane=2, offset=250, count=120)
        with self.assertRaisesRegex(ValueError, 'Unmapped memory access: 0x47ec00'):
            command_case(self.model, self.tables, plane=2, offset=250, count=121)

    def test_old_call_link_cannot_execute_the_router(self):
        legacy = ModuleModel(self.segments, call_policy='sleigh-link')
        with self.assertRaisesRegex(ValueError, 'Outside modeled instruction boundaries'):
            command_case(legacy, self.tables, plane=0, offset=0, count=1)

    def test_parent_reads_selector_from_packet_and_preserves_stack(self):
        for selector in (0xcc, 0xf0, 0xf1):
            command_case(self.model, self.tables, plane=2, offset=319, count=120,
                         parent=True, selector=selector)
        with self.assertRaisesRegex(ValueError, 'Unmapped memory access: 0x47ec00'):
            command_case(self.model, self.tables, plane=2, offset=319, count=121, parent=True)

    def test_unknown_handler_is_not_treated_as_success(self):
        with self.assertRaisesRegex(ValueError, 'Outside modeled instruction boundaries: 0x26e335'):
            command_case(self.model, self.tables, command=0x90, plane=0, offset=0, count=0)

    def test_memory_rejects_overlap_crossing_and_readonly_write(self):
        with self.assertRaisesRegex(ValueError, 'Overlapping'):
            Memory([Region('a', 100, bytearray(4)), Region('b', 103, bytearray(4))])
        memory = Memory([Region('a', 100, bytearray(4))])
        with self.assertRaisesRegex(ValueError, 'Unmapped'):
            memory.read(103, 2)
        with self.assertRaisesRegex(ValueError, 'read-only'):
            memory.write(100, 1, 0)

    def test_memory_stores_low_bits_in_little_endian(self):
        region = Region('ram', 100, bytearray(8), True)
        memory = Memory([region])
        memory.write(100, 4, 0x12345678)
        memory.write(104, 2, 0x12345678)
        memory.write(106, 1, 0x12345678)
        self.assertEqual(region.data, bytes.fromhex('7856341278567800'))

    def test_unsigned_bounds_reject_negative_looking_values(self):
        region = Region('planes', PLANE, bytearray(960), True)
        memory = Memory([region]); regs = initial_registers()
        regs[3:6] = [0, 0xffffffff, 0xa5]
        self.model.run(0x204144, memory, regs)
        self.assertFalse(memory.writes)

    def test_aliased_load_uses_address_before_destination_write(self):
        code, _ = assemble('bg.lhz r7,0(r7)\nbt.jr r9', 0x200000)
        model = ModuleModel([(0x200000, code)], call_policy='fallthrough-hypothesis')
        memory = Memory([Region('ram', 0x340000, bytearray.fromhex('3412'))])
        regs = initial_registers(); regs[7] = 0x340000
        self.assertEqual(model.run(0x200000, memory, regs)['registers'][7], 0x1234)

    def test_bad_branch_budget_and_overlapping_code_fail_closed(self):
        code, _ = assemble('bt.j 0x200001', 0x200000)
        model = ModuleModel([(0x200000, code)], call_policy='fallthrough-hypothesis')
        with self.assertRaisesRegex(ValueError, 'instruction boundaries'):
            model.run(0x200000, Memory([]))
        loop, _ = assemble('bt.j 0x200000', 0x200000)
        model = ModuleModel([(0x200000, loop)], call_policy='fallthrough-hypothesis')
        with self.assertRaisesRegex(ValueError, 'budget'):
            model.run(0x200000, Memory([]), max_steps=3)
        with self.assertRaisesRegex(ValueError, 'Overlapping code'):
            ModuleModel([(0x200000, code), (0x200001, code)], call_policy='fallthrough-hypothesis')

    def test_unresolved_store_width_is_rejected_without_writing(self):
        code, _ = assemble('bg.sw_1 0(r3),r4\nbt.jr r9', 0x200000)
        model = ModuleModel([(0x200000, code)], call_policy='fallthrough-hypothesis')
        region = Region('counter_and_neighbor', 0x4551a8, bytearray.fromhex('3412cdab'), True)
        memory = Memory([region])
        regs = initial_registers(); regs[3:5] = [0x4551a8, 0x1235]
        with self.assertRaisesRegex(ValueError, 'Unsupported instruction: bg.sw_1'):
            model.run(0x200000, memory, regs)
        self.assertEqual(region.data, bytes.fromhex('3412cdab'))
        self.assertFalse(memory.writes)

    def test_breakpoint_stops_before_store_and_rejects_interior_address(self):
        code, _ = assemble('bg.sw_1 0(r3),r4\nbt.jr r9', 0x200000)
        model = ModuleModel([(0x200000, code)], call_policy='fallthrough-hypothesis')
        memory = Memory([])
        result = model.run(0x200000, memory, stop_before=(0x200000,))
        self.assertEqual(result['termination'], 'breakpoint')
        self.assertEqual(result['steps'], 0)
        self.assertEqual(result['visited'], [])
        self.assertFalse(memory.writes)
        with self.assertRaisesRegex(ValueError, 'Stop address outside'):
            model.run(0x200000, memory, stop_before=(0x200001,))

    def test_new_halfword_load_alias_and_unsigned_branch(self):
        source = 'bn.lh r7,0(r7)\nbg.bgt r3,r4,taken\nbt.movi r7,0\ntaken:\nbt.jr r9'
        code, _ = assemble(source, 0x200000)
        model = ModuleModel([(0x200000, code)], call_policy='fallthrough-hypothesis')
        regs = initial_registers(); regs[3:5] = [0xffffffff, 0]; regs[7] = 0x340000
        memory = Memory([Region('ram', 0x340000, bytearray.fromhex('ffff'))])
        self.assertEqual(model.run(0x200000, memory, regs)['registers'][7], 0xffff)


if __name__ == '__main__':
    unittest.main()
