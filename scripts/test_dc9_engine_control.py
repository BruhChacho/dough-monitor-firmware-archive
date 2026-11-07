"""Focused boundary regressions for the recovered engine-control routines."""
import unittest

from aeon_module_model import Memory, ModuleModel
from validate_dc9_module import inputs
from validate_dc9_transfer import plain, regs
from validate_dc9_masked import fixture as bus_fixture
from validate_dc9_metadata import ENGINES, METADATA
from validate_dc9_registers import byte_address


PRIMARY = 0x2af554
SECONDARY = 0x2af578
ENGINE_STRIDE = 124
METADATA_STRIDE = 176
KEY5_BASE = 0xfff30200


def memory_for(expanded, *, engine_count=1, metadata_keys=(5,), engine_index=0,
               table_target=None, bus_values=None):
    """Build only the plain regions touched by the chosen path."""
    bus_values = {} if bus_values is None else bus_values
    memory = bus_fixture(list(bus_values), list(bus_values.values()), 0)
    engines = bytearray(engine_count * ENGINE_STRIDE)
    for i in range(engine_count):
        engines[i * ENGINE_STRIDE + 0x1d] = engine_index
    metadata = bytearray(len(metadata_keys) * METADATA_STRIDE)
    for i, key in enumerate(metadata_keys):
        metadata[i * METADATA_STRIDE:i * METADATA_STRIDE + 4] = (key & 0xffffffff).to_bytes(4, 'little')
    memory.regions.extend((plain(ENGINES, engines, 'engines'),
                           plain(METADATA, metadata, 'metadata', False)))
    primary = bytearray(expanded[PRIMARY - 0x200000:PRIMARY - 0x200000 + 36])
    if table_target is not None:
        primary[:4] = table_target.to_bytes(4, 'little')
    memory.regions.extend((plain(PRIMARY, primary, 'control_table_primary', False),
                           plain(SECONDARY,
                                 expanded[SECONDARY - 0x200000:SECONDARY - 0x200000 + 36],
                                 'control_table_secondary', False)))
    return Memory(memory.regions)


class EngineControlBoundaryTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.expanded, segments, _ = inputs()
        cls.segments = segments
        cls.strict = ModuleModel(segments, call_policy='fallthrough-hypothesis')

    def test_engine_metadata_index_six_reads_engine_then_returns_zero(self):
        memory = memory_for(self.expanded, engine_count=7, metadata_keys=(5,), engine_index=6)
        result = self.strict.run(0x21d3b1, memory, regs(6))
        self.assertEqual(result['termination'], 'return')
        self.assertEqual(result['registers'][3], 0)
        self.assertEqual([r for r in memory.reads if r[0] != 'stack'],
                         [('engines', ENGINES + 6 * ENGINE_STRIDE + 0x1d, 1)])

    def test_unmapped_engine_record_rejects_before_metadata_access(self):
        memory = memory_for(self.expanded, engine_count=1, metadata_keys=(5,))
        with self.assertRaisesRegex(ValueError, 'Unmapped memory access: 0x47fb35'):
            self.strict.run(0x21d3b1, memory, regs(1))
        self.assertFalse(any(name == 'metadata' for name, _, _ in memory.reads))

    def test_unsupported_metadata_key_returns_without_dispatch_table_read(self):
        memory = memory_for(self.expanded, metadata_keys=(9,))
        result = self.strict.run(0x21d3b1, memory, regs(0))
        self.assertEqual(result['termination'], 'return')
        self.assertEqual(result['registers'][3], 0)
        self.assertEqual([r for r in memory.reads if r[0] != 'stack'],
                         [('engines', ENGINES + 0x1d, 1), ('metadata', METADATA, 4)])

    def test_bad_dispatch_target_fails_at_unknown_instruction_boundary(self):
        memory = memory_for(self.expanded, metadata_keys=(0,), table_target=0xdeadbeef)
        with self.assertRaisesRegex(ValueError, 'Outside modeled instruction boundaries: 0xdeadbeef'):
            self.strict.run(0x21d3b1, memory, regs(0))
        self.assertIn(('control_table_primary', PRIMARY, 4), memory.reads)

    def test_metadata_update_dispatch_has_no_metadata_index_six_guard(self):
        memory = memory_for(self.expanded, engine_count=7, metadata_keys=(5,) * 6, engine_index=6)
        # Engine six selects metadata record six; this wrapper lacks the index guard.
        before = regs(6, 1)
        with self.assertRaisesRegex(ValueError, 'Unmapped memory access: 0x3b4d70'):
            self.strict.run(0x21d977, memory, before)

    def test_strict_ambiguous_counter_store_keeps_engine_bit_state(self):
        memory = memory_for(self.expanded, metadata_keys=(5,),
                            bus_values={KEY5_BASE + 7: 0xa5})
        strict = ModuleModel(self.segments, call_policy='fallthrough-hypothesis')
        with self.assertRaisesRegex(ValueError, 'unresolved store'):
            strict.run(0x21d86d, memory, regs(1, 0))
        self.assertTrue(all(name == 'stack' for name, *_ in memory.writes))
        self.assertEqual(next(r for r in memory.regions if r.name == 'counter').data[:2], b'\0\0')
        self.assertEqual(next(r for r in memory.regions if r.name == 'lock').data, b'\0')
        physical = byte_address(KEY5_BASE + 7)
        self.assertEqual(next(r for r in memory.regions if r.name.startswith('bus_') and
                              r.address == physical).data, b'\xa5')


if __name__ == '__main__':
    unittest.main()
