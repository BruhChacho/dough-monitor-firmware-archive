"""Full-apply dependency and polling guards stay explicit."""
import unittest
from aeon_module_model import ModuleModel
from validate_dc9_module import inputs
from validate_dc9_engine_enable import apply_fixture as previous_fixture
from validate_dc9_channel_apply import apply_fixture
from validate_dc9_transfer import regs
from validate_dc9_timer import peek
from validate_dc9_metadata import RECORDS


class ChannelApplyTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.expanded,segments,_=inputs()
        cls.model=ModuleModel(segments,call_policy='fallthrough-hypothesis',store_policy='halfword-lane-hypothesis')

    def test_old_fixture_requires_real_poll_configuration(self):
        memory=previous_fixture(self.expanded)
        with self.assertRaisesRegex(ValueError,'Unmapped memory access: 0x3b5f38'):
            self.model.run(0x23fad0,memory,regs(),max_steps=100000)
        for i in range(4):self.assertEqual(peek(memory,RECORDS+i*168+0x5b),0)

    def test_active_poll_does_not_invent_timer_completion(self):
        memory=apply_fixture(self.expanded,0,1)
        with self.assertRaisesRegex(ValueError,'Unmapped memory access: 0x455208'):
            self.model.run(0x23fad0,memory,regs(),max_steps=100000)
        self.assertIn(('active',0x4551e8,1),memory.reads)

    def test_full_apply_requires_engine_prepare_service(self):
        for config,active in ((0x20,1),(0,0)):
            memory=apply_fixture(self.expanded,config,active)
            with self.assertRaisesRegex(ValueError,'Outside modeled instruction boundaries: 0x21ffb3'):
                self.model.run(0x23fad0,memory,regs(),max_steps=100000)
            self.assertFalse(any(a==0x455208 for _,a,_,_ in memory.writes))


if __name__=='__main__':unittest.main()
