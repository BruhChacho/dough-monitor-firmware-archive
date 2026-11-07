"""Focused boundary tests for the recovered reference-count routine."""
import unittest

from aeon_module_model import ModuleModel
from validate_dc9_module import inputs
from validate_dc9_reference_count import ENTRY, fixture, registers


class ReferenceCountTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        _, segments, _ = inputs()
        cls.model = ModuleModel(segments, call_policy='fallthrough-hypothesis')

    def rows(self, first):
        return [first, (0, 0, 0), (0, 0, 0), (0, 0, 0)]

    def metadata(self):
        return [(1, []), (1, []), (1, []), (1, [])]

    def test_out_of_range_source_index_is_not_silently_ignored(self):
        memory = fixture(self.rows((1, 4, 1)), self.metadata())
        with self.assertRaisesRegex(ValueError, 'Unmapped memory access'):
            self.model.run(ENTRY, memory, registers(0))

    def test_out_of_range_target_metadata_access_is_not_silently_ignored(self):
        memory = fixture(self.rows((1, 1, 1)), self.metadata())
        with self.assertRaisesRegex(ValueError, 'Unmapped memory access'):
            self.model.run(ENTRY, memory, registers(4))

    def test_255_bound_nonmatch_hits_instruction_budget_after_counter_wrap(self):
        md = [(0, []), (0x202, []), (1, []), (0, [])]
        md[2] = (255, [2] * 4)
        memory = fixture(self.rows((1, 2, 1)), md, metadata_tail=128)
        with self.assertRaisesRegex(ValueError, 'Instruction budget exceeded'):
            self.model.run(ENTRY, memory, registers(1), max_steps=5000)

    def test_special_bound_four_scans_through_inclusive_index_three(self):
        md = self.metadata()
        md[1] = (4, [3, 3, 3, 2])
        memory = fixture(self.rows((1, 1, 1)), md)
        result = self.model.run(ENTRY, memory, registers(2))
        self.assertEqual(result['termination'], 'return')
        self.assertEqual(result['registers'][3], 1)
        self.assertIn(('metadata', 0x3b4950 + 176 + 0x7f, 1), memory.reads)

    def test_special_bound_four_does_not_scan_index_four(self):
        md = self.metadata()
        md[1] = (4, [3, 3, 3, 3])
        memory = fixture(self.rows((1, 1, 1)), md)
        result = self.model.run(ENTRY, memory, registers(2))
        self.assertEqual(result['termination'], 'return')
        self.assertEqual(result['registers'][3], 0)
        self.assertNotIn(('metadata', 0x3b4950 + 176 + 0x80, 1), memory.reads)


if __name__ == '__main__':
    unittest.main()
