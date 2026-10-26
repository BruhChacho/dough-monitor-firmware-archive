"""Semantic boundaries for aggregated metadata state and apply dispatch."""
import unittest

from aeon_module_model import ModuleModel
from validate_dc9_module import inputs
from validate_dc9_metadata_consumers import fixture, STATE
from validate_dc9_transfer import regs, named


class MetadataConsumerTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.expanded, segments, _ = inputs()
        cls.model = ModuleModel(segments, call_policy='fallthrough-hypothesis')

    def test_all_byte_inputs_for_each_aggregate_lane(self):
        for offset in (1, 3, 4, 6, 7):
            for value in range(256):
                memory = fixture(self.expanded, {offset: value})
                result = self.model.run(0x20e76c, memory, regs())
                base = STATE - 0x454000
                raw = named(memory, 'globals').data
                expected = (raw[base + 7] | (0x80 if raw[base + 1] else 0),
                            raw[base + 7] | raw[base + 3] | raw[base + 6] | raw[base + 4],
                            raw[base + 7])
                self.assertEqual(tuple(result['registers'][3:6]), expected)
                self.assertEqual(memory.writes,[('globals',0x454160+i,1,v) for i,v in enumerate(expected)])

    def test_aliases_and_low_byte_store_preserve_neighbors(self):
        memory = fixture(self.expanded, {0: 0, 1: 1, 3: 0x12, 4: 0x24, 6: 0x48, 7: 0x81})
        globals_region = named(memory, 'globals')
        sentinel_before = globals_region.data[0x15f]
        sentinel_after = globals_region.data[0x163]
        result = self.model.run(0x20e76c, memory, regs())
        self.assertEqual(tuple(result['registers'][3:6]), (0x81, 0xff, 0x81))
        self.assertEqual(globals_region.data[0x160:0x163], bytes([0x81, 0xff, 0x81]))
        self.assertEqual(globals_region.data[0x15f], sentinel_before)
        self.assertEqual(globals_region.data[0x163], sentinel_after)
        self.assertEqual([entry[1] for entry in memory.writes], [0x454160, 0x454161, 0x454162])

    def test_accumulation_prefix_executes_actual_channel_state_consumer(self):
        memory = fixture(self.expanded, {0: 0, 1: 0, 3: 0x12, 4: 0x24, 6: 0x48, 7: 0x81})
        before = regs(1, 0, 0)
        result = self.model.run(0x20f1ef, memory, before, stop_before=(0x20f2ae,))
        self.assertEqual(result['termination'], 'breakpoint')
        self.assertNotIn(0x20f2ae, result['visited'])
        self.assertEqual([target for _, target, _ in result['calls']][:3], [0x20e687, 0x20e76c,0x23417c])
        self.assertEqual(named(memory, 'globals').data[0x160:0x163], bytes([0x81, 0xff, 0x81]))


if __name__ == '__main__':
    unittest.main()
