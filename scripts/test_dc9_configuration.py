"""Source-edit boundaries for channel layouts and inferred halfword records."""
import copy
import json
import unittest

from aeon_subset_assembler import assemble
from aeon_module_model import Memory, ModuleModel
from build_dc9_layout_experiment import DEFAULT_SOURCE, encode_rectangles
from validate_dc9_configuration import fixture, RECORDS, configuration_case
from validate_dc9_module import inputs
from validate_dc9_transfer import plain, regs


class ConfigurationTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.expanded, segments, _ = inputs()
        cls.strict = ModuleModel(segments, call_policy='fallthrough-hypothesis')
        cls.conditional = ModuleModel(segments, call_policy='fallthrough-hypothesis', store_policy='halfword-lane-hypothesis')

    def test_second_lane_encoding_and_neighbor_preservation(self):
        for offset in (-2, 0, 1, 4, 128, 130):
            with self.assertRaises(ValueError): assemble(f'bn.sh_2 {offset}(r3),r4', 0x200000)
        code, _ = assemble('bn.sh_2 2(r3),r4\nbt.jr r9', 0x200000)
        model = ModuleModel([(0x200000, code)], call_policy='fallthrough-hypothesis')
        memory = Memory([plain(0x600000, bytes.fromhex('aabbccddeeff'), 'ram')])
        model.run(0x200000, memory, regs(0x600000, 0x12345678))
        self.assertEqual(memory.regions[0].data, bytes.fromhex('aabb7856eeff'))

    def test_valid_layout_still_rejects_unresolved_wide_stores_by_default(self):
        memory, _ = fixture(self.expanded)
        with self.assertRaisesRegex(ValueError, 'unresolved store'):
            self.strict.run(0x260824, memory, regs(2, 0))

    def test_record_index_outside_fixture_is_not_silently_accepted(self):
        memory, _ = fixture(self.expanded)
        with self.assertRaisesRegex(ValueError, 'Unmapped memory'):
            self.conditional.run(0x23e8a2, memory, regs(4))
        self.assertFalse(memory.writes)

    def test_apply_is_not_faked_by_successful_record_construction(self):
        result, _ = configuration_case(self.conditional, self.expanded, 2, 0)
        self.assertEqual(result['termination'], 'breakpoint')
        memory, _ = fixture(self.expanded)
        with self.assertRaisesRegex(ValueError, 'Unmapped memory access'):
            self.conditional.run(0x260824, memory, regs(2, 0))

    def test_structured_fields_reject_truncation_booleans_and_bad_shapes(self):
        source = json.loads(DEFAULT_SOURCE.read_text())
        for value in (-1, 65536, True, 1.5, '1600'):
            altered = copy.deepcopy(source); altered['modes'][0][0]['width'] = value
            with self.subTest(value=value), self.assertRaisesRegex(ValueError, 'uint16'):
                encode_rectangles(altered)
        for mutation in ('mode', 'record', 'field'):
            altered = copy.deepcopy(source)
            if mutation == 'mode': altered['modes'].pop()
            elif mutation == 'record': altered['modes'][0].pop()
            else: altered['modes'][0][0]['unknown'] = 1
            with self.assertRaises(ValueError): encode_rectangles(altered)


if __name__ == '__main__':
    unittest.main()
