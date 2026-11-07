"""Retain partial writes and explicit mapping boundaries in engine enable."""
import unittest
from aeon_module_model import Memory, ModuleModel
from validate_dc9_module import inputs
from validate_dc9_engine_enable import enable_fixture
from validate_dc9_masked import POLICIES
from validate_dc9_registers import byte_address
from validate_dc9_timer import peek
from validate_dc9_transfer import plain, regs


class EngineEnableBoundaryTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        _,cls.segments,_=inputs()

    def test_later_unmapped_engine_retains_first_register_update(self):
        for policy in POLICIES:
            memory=enable_fixture([0x200])
            model=ModuleModel(self.segments,call_policy='fallthrough-hypothesis',store_policy=policy)
            with self.assertRaisesRegex(ValueError,'Unmapped memory access: 0x47fb1c'):
                model.run(0x22607c,memory,regs(3,0))
            self.assertEqual(peek(memory,byte_address(0x10800232)),0x85)
            self.assertEqual(peek(memory,0x4551a8,2),0)
            self.assertFalse(any(n=='engines' for n,_,_,_ in memory.writes))

    def test_broadcast_store_requires_mapping_for_chosen_width(self):
        for policy in ('reject',*POLICIES):
            memory=Memory([plain(0x455214,b'\x11\x22','broadcast_mask')])
            model=ModuleModel(self.segments,call_policy='fallthrough-hypothesis',store_policy=policy)
            if policy=='halfword-lane-hypothesis':
                result=model.run(0x23e13b,memory,regs(0x12345678,1))
                self.assertEqual(result['termination'],'return')
                self.assertEqual(memory.regions[0].data,b'\x78\x56')
            else:
                message='unresolved store' if policy=='reject' else 'Unmapped memory access'
                with self.assertRaisesRegex(ValueError,message):model.run(0x23e13b,memory,regs(0x12345678,1))
                self.assertEqual(memory.regions[0].data,b'\x11\x22')
                self.assertFalse(memory.writes)


if __name__=='__main__':unittest.main()
