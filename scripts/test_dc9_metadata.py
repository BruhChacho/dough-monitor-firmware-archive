"""Boundary and integration regressions for metadata-driven register setup."""
import unittest

from aeon_module_model import ModuleModel
from validate_dc9_module import inputs
from validate_dc9_metadata import fixture, logical_register, KEYS
from validate_dc9_registers import byte_address
from validate_dc9_timer import peek
from validate_dc9_transfer import regs


class MetadataTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        _, segments, _ = inputs()
        cls.strict = ModuleModel(segments, call_policy='fallthrough-hypothesis')
        cls.conditional = ModuleModel(segments, call_policy='fallthrough-hypothesis', store_policy='halfword-lane-hypothesis')

    def test_geometry_reads_engine_before_rejecting_index(self):
        with self.assertRaisesRegex(ValueError, 'Unmapped memory access: 0x47fc9c'):
            self.strict.run(0x23d4fc, fixture(), regs(4))
        memory = fixture(mapping=(0,1,2,3,0))
        result = self.strict.run(0x23d4fc, memory, regs(4))
        self.assertEqual(result['termination'], 'return')
        self.assertEqual(result['registers'][3], 0)
        self.assertTrue(all(name == 'stack' for name,_,_,_ in memory.writes))

    def test_mapping_guard_does_not_prevent_prior_metadata_read(self):
        with self.assertRaisesRegex(ValueError, 'Unmapped memory access: 0x3b4d70'):
            self.strict.run(0x21d1e5, fixture(mapping=(6,1,2,3)), regs(0,0x86))
        memory = fixture(keys=(*KEYS,5), mapping=(6,1,2,3))
        result = self.strict.run(0x21d1e5, memory, regs(0,0x86))
        self.assertEqual(result['termination'], 'return')
        self.assertTrue(all(name == 'stack' for name,_,_,_ in memory.writes))

    def test_default_preparation_failure_retains_earlier_mask_write(self):
        memory = fixture()
        with self.assertRaisesRegex(ValueError, 'unresolved store'):
            self.strict.run(0x23d3a0, memory, regs(0,1))
        logical = logical_register(KEYS[0])
        self.assertEqual(peek(memory,byte_address(logical+2)),0x86)
        self.assertEqual(peek(memory,byte_address(logical+3)),0)
        self.assertEqual(peek(memory,byte_address(logical)),0xa5)
        self.assertEqual(peek(memory,0x4551a8,2),0)

    def test_full_apply_completes_reset_then_requires_next_service(self):
        from validate_dc9_channel_apply import apply_fixture
        expanded,_,_=inputs()
        memory = apply_fixture(expanded)
        with self.assertRaisesRegex(ValueError, 'Outside modeled instruction boundaries: 0x21ffb3'):
            self.conditional.run(0x23fad0, memory, regs(), max_steps=100000)
        for index in range(6):
            self.assertEqual(peek(memory,0x3b4960+176*index),4)


if __name__ == '__main__':
    unittest.main()
