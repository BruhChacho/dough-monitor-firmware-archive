"""Focused boundary, partial-update, and ambiguous-store regressions."""
import unittest

from aeon_module_model import ModuleModel
from validate_dc9_module import inputs
from validate_dc9_transfer import regs
from validate_dc9_enable_leaf import (
    COUNTER_SCAN, FLAG_READERS, METADATA, METADATA_STRIDE, STATE_WRITE,
    ZERO_TEST, fixture, named,
)


class EnableLeafBoundaryTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        _, cls.segments, _ = inputs()
        cls.strict = ModuleModel(cls.segments, call_policy='fallthrough-hypothesis')

    def test_zero_predicate_boundary_is_zero_only(self):
        for value, expected in ((0, 1), (1, 0), (0x80000000, 0), (0xffffffff, 0)):
            with self.subTest(value=value):
                memory = fixture(states={0: value})
                result = self.strict.run(ZERO_TEST, memory, regs(0))
                self.assertEqual(result['termination'], 'return')
                self.assertEqual(result['registers'][3], expected)

    def test_guard_readers_accept_index_five_and_reject_six(self):
        for entry, bit in FLAG_READERS:
            for index, expected in ((5, 1), (6, 0)):
                with self.subTest(entry=hex(entry), index=index):
                    memory = fixture(gates={5: 1}, flags={5: 1 << bit})
                    result = self.strict.run(entry, memory, regs(index))
                    self.assertEqual(result['registers'][3], expected)
                    self.assertEqual([row for row in memory.reads if row[0] != 'stack'],
                                     ([] if index == 6 else [
                                         ('metadata', METADATA + 5 * METADATA_STRIDE + 0xac, 2),
                                         ('metadata', METADATA + 5 * METADATA_STRIDE + 0x98, 1)]))

    def test_selected_engine_store_failure_leaves_metadata_write_committed(self):
        # The routine stores the metadata state before it walks the selected
        # engine mask. Mapping only engine 0 makes the later engine-2 store
        # fail, documenting that the sequence is not transactional.
        memory = fixture(engine_count=1, selections={0: 1 << 2})
        with self.assertRaisesRegex(ValueError, 'Unmapped memory access'):
            self.strict.run(STATE_WRITE, memory, regs(0, 4))
        self.assertEqual(named(memory, 'metadata').data[0x0c:0x10], (4).to_bytes(4, 'little'))
        self.assertEqual([name for name, *_ in memory.writes if name != 'stack'], ['metadata'])

    def test_ambiguous_counter_store_stays_strict_and_width_hypotheses_diverge(self):
        memory = fixture(states={0: 4}, counter_states={0: 1})
        before = bytes(named(memory, 'metadata').data)
        with self.assertRaisesRegex(ValueError, 'unresolved store'):
            self.strict.run(COUNTER_SCAN, memory, regs())
        self.assertEqual(bytes(named(memory, 'metadata').data), before)
        self.assertTrue(all(name == 'stack' for name, *_ in memory.writes))

        outcomes = {}
        for policy in ('sleigh-store', 'halfword-lane-hypothesis'):
            memory = fixture(states={0: 4}, counter_states={0: 1})
            metadata = named(memory, 'metadata').data
            metadata[0xae:0xb0] = b'\xa5\x5a'
            # Keep the exact recovered instruction map and make only the store
            # interpretation explicit for each conditional run.
            model = ModuleModel(self.segments, call_policy='fallthrough-hypothesis', store_policy=policy)
            model.run(COUNTER_SCAN, memory, regs())
            outcomes[policy] = bytes(named(memory, 'metadata').data[0xac:0xb0])
        self.assertEqual(outcomes['sleigh-store'], bytes.fromhex('cfffffff'))
        self.assertEqual(outcomes['halfword-lane-hypothesis'], bytes.fromhex('cfffa55a'))


if __name__ == '__main__':
    unittest.main()
