"""Fail-closed boundaries for timer interleaving and indirect execution."""
import unittest

from aeon_subset_assembler import assemble
from aeon_module_model import Memory, ModuleModel
from validate_dc9_module import inputs
from validate_dc9_timer import fixture, seed, peek, TickOnPoll, TICK, DELAY, WAIT_COUNT, WAIT_FLAG
from validate_dc9_transfer import regs


class TimerTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        _, cls.segments, _ = inputs()
        cls.strict = ModuleModel(cls.segments, call_policy='fallthrough-hypothesis')
        cls.models = {p: ModuleModel(cls.segments, call_policy='fallthrough-hypothesis', store_policy=p)
                      for p in ('sleigh-store', 'halfword-lane-hypothesis')}

    def test_delay_and_tick_stores_still_require_explicit_policy(self):
        for entry in (TICK, DELAY):
            memory = fixture()
            with self.subTest(entry=hex(entry)), self.assertRaisesRegex(ValueError, 'unresolved store'):
                self.strict.run(entry, memory, regs(2))
            self.assertTrue(all(name == 'stack' for name, *_ in memory.writes))

    def test_no_external_tick_means_wait_does_not_finish(self):
        for policy, model in self.models.items():
            with self.subTest(policy=policy), self.assertRaisesRegex(ValueError, 'budget'):
                model.run(DELAY, fixture(), regs(2), max_steps=100)

    def test_counter_flag_adjacency_distinguishes_store_hypotheses(self):
        for policy, model in self.models.items():
            memory = TickOnPoll(fixture(), model)
            result = model.run(DELAY, memory, regs(3))
            self.assertEqual(result['termination'], 'return')
            self.assertEqual(len(memory.tick_results), 3 if policy == 'halfword-lane-hypothesis' else 1)
            self.assertEqual(peek(memory, WAIT_COUNT, 2), 0 if policy == 'halfword-lane-hypothesis' else 2)
            self.assertEqual(peek(memory, WAIT_FLAG), 0)

    def test_scheduled_tick_budget_is_not_a_successful_return(self):
        model = self.models['halfword-lane-hypothesis']
        memory = TickOnPoll(fixture(), model, max_ticks=2)
        with self.assertRaisesRegex(ValueError, 'Scheduled timer budget'):
            model.run(DELAY, memory, regs(3))
        self.assertEqual(peek(memory, WAIT_COUNT, 2), 1)
        self.assertEqual(peek(memory, WAIT_FLAG), 1)

    def test_indirect_callback_cannot_escape_or_enter_instruction_interior(self):
        for destination in (0x24209a, 0x12345678):
            memory = fixture(); seed(memory, 0x4551e1, 1); seed(memory, 0x4824ac, destination, 4)
            with self.subTest(destination=hex(destination)), self.assertRaisesRegex(ValueError, 'instruction boundaries'):
                self.models['halfword-lane-hypothesis'].run(DELAY, memory, regs(1))
            self.assertEqual(peek(memory, WAIT_FLAG), 0)

    def test_indirect_call_reads_target_before_overwriting_link_alias(self):
        # r9 is a valid source, and the caller saves/restores its incoming link.
        source = ('bt.mov r10,r9\nbg.movhi r9,0x20\nbg.addi r9,r9,16\n'
                  'bt.jalr r9\nbt.mov r9,r10\nbt.jr r9\nbt.nop 0\nbt.jr r9')
        code, listing = assemble(source, 0x200000)
        self.assertEqual(listing[-2]['address'], '0x200010')
        model = ModuleModel([(0x200000, code)], call_policy='fallthrough-hypothesis')
        result = model.run(0x200000, Memory([]), regs())
        self.assertEqual(result['calls'], [(0x20000a, 0x200010, 0x20000c)])
        legacy = ModuleModel([(0x200000, code)], call_policy='sleigh-link')
        with self.assertRaisesRegex(ValueError, 'Unexpected return'):
            legacy.run(0x200000, Memory([]), regs())

    def test_unsigned_division_alias_boundaries_and_zero_rejection(self):
        code, _ = assemble('bn.divu r3,r3,r4\nbt.jr r9', 0x200000)
        model = ModuleModel([(0x200000, code)], call_policy='fallthrough-hypothesis')
        for numerator, denominator in ((0, 1), (0xffffffff, 1), (0xffffffff, 10), (0x80000000, 3), (2, 3)):
            result = model.run(0x200000, Memory([]), regs(numerator, denominator))
            self.assertEqual(result['registers'][3], numerator // denominator)
        with self.assertRaisesRegex(ValueError, 'division by zero'):
            model.run(0x200000, Memory([]), regs(1, 0))

    def test_nop_encoding_range_and_execution_limit(self):
        for value in (-1, 16):
            with self.assertRaises(ValueError):
                assemble(f'bt.nop {value}', 0x200000)
        code, _ = assemble('bt.nop 1\nbt.jr r9', 0x200000)
        model = ModuleModel([(0x200000, code)], call_policy='fallthrough-hypothesis')
        with self.assertRaisesRegex(ValueError, 'Only observed'):
            model.run(0x200000, Memory([]))


if __name__ == '__main__':
    unittest.main()
