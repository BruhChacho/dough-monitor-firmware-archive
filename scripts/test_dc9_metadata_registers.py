"""Regressions for complete metadata paths and failed partial register updates."""
import unittest

from aeon_module_model import ModuleModel
from validate_dc9_module import inputs
from validate_dc9_metadata_registers import fixture, apply_fixture, CHANNEL, OFFSETS, bus_value
from validate_dc9_registers import byte_address
from validate_dc9_timer import peek
from validate_dc9_transfer import regs


class MetadataRegisterTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.expanded,segments,_=inputs()
        cls.model=ModuleModel(segments,call_policy='fallthrough-hypothesis',store_policy='halfword-lane-hypothesis')

    def test_boolean_enable_does_not_imply_mask4_set(self):
        memory=fixture(self.expanded,old=0xff)
        self.model.run(0x213b64,memory,regs(2,1))
        self.assertEqual(bus_value(memory,CHANNEL[0]+OFFSETS[2]),0xfb)
        self.assertEqual(bus_value(memory,CHANNEL[1]+OFFSETS[2]),0xfc)
        self.assertEqual(peek(memory,0x453ba6),1)
        self.assertEqual(peek(memory,0x453ba5),0xa5)

    def test_missing_second_register_retains_first_update(self):
        memory=fixture(self.expanded)
        missing=byte_address(CHANNEL[1])
        memory.regions=[r for r in memory.regions if r.address!=missing]
        with self.assertRaisesRegex(ValueError,f'Unmapped memory access: {missing:#x}'):
            self.model.run(0x213b64,memory,regs(0,1))
        self.assertEqual(bus_value(memory,CHANNEL[0]),0xa1)
        self.assertEqual(peek(memory,0x453ba4),1)
        # Failure interrupts counter cleanup; no rollback is modeled.
        self.assertEqual(peek(memory,0x4551a8,2),1)

    def test_reset_returns_after_all_six_real_accumulation_calls(self):
        memory=apply_fixture(self.expanded)
        result=self.model.run(0x22aca0,memory,regs())
        self.assertEqual(result['termination'],'return')
        self.assertEqual(sum(t==0x20f1ef for _,t,_ in result['calls']),6)
        for index in range(6):self.assertEqual(peek(memory,0x3b4960+176*index),4)


if __name__=='__main__':
    unittest.main()
