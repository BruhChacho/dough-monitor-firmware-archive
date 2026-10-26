"""Regression boundaries for selector dispatch and shared metadata services."""
import unittest

from aeon_module_model import ModuleModel, Memory
from validate_dc9_module import inputs
from validate_dc9_metadata_service import fixture, TABLE
from validate_dc9_transfer import regs, plain, named


class MetadataServiceTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.expanded,segments,_=inputs()
        cls.model=ModuleModel(segments,call_policy='fallthrough-hypothesis')

    def test_selector_table_cannot_jump_into_an_instruction(self):
        memory=fixture(self.expanded)
        named(memory,'selector_table').data[:4]=(0x20e6a0).to_bytes(4,'little')
        with self.assertRaisesRegex(ValueError,'Outside modeled instruction boundaries: 0x20e6a0'):
            self.model.run(0x20e687,memory,regs(0))

    def test_both_enable_states_require_mapped_consumer_outputs(self):
        for enabled in (0,1):
            memory=fixture(self.expanded)
            with self.subTest(enabled=enabled),self.assertRaisesRegex(ValueError,'Unmapped memory access: 0x454160'):
                self.model.run(0x20f1ef,memory,regs(enabled,0,0))
            self.assertEqual(named(memory,'state').data[12],0xa5|0x80 if enabled else 0xa5&~0x80)

    def test_publication_rejects_ambiguous_store_by_default(self):
        memory=Memory([plain(0x4543dc,bytes([0xa5]*8),'state')])
        with self.assertRaisesRegex(ValueError,'unresolved store'):
            self.model.run(0x20ff1b,memory,regs(0x12345678,0x87654321))
        self.assertFalse(memory.writes)
        self.assertEqual(named(memory,'state').data,bytes([0xa5]*8))


if __name__=='__main__':
    unittest.main()
