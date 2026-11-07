"""Focused regressions for engine-mode global setter/getter leaves."""
import unittest

from aeon_module_model import Memory
from validate_dc9_module import stack_region
from validate_dc9_transfer import plain, regs
from validate_dc9_engine_mode_leaves import (
    ADJACENT_HALFWORD_READ, APPLY_WRAPPER, GLOBAL, GLOBAL_NAME,
    HALFWORD_SET, INITIAL_GLOBAL, POLICIES, RESET, WORD_SET, model_fixture,
    nonstack_writes,
)


class EngineModeLeafTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.models = {policy: model_fixture(policy) for policy in POLICIES}
        cls.strict = model_fixture()

    def global_memory(self, data=INITIAL_GLOBAL, *, writable=True):
        return Memory([plain(GLOBAL, data, GLOBAL_NAME, writable), stack_region()])

    def test_default_policy_rejects_both_ambiguous_setters_without_writes(self):
        for entry, operation, value in (
                (HALFWORD_SET, 'bg.sh', 0x89abcdef),
                (WORD_SET, 'bg.sw_1', 0x76543210)):
            with self.subTest(operation=operation):
                memory = self.global_memory()
                with self.assertRaisesRegex(
                        ValueError,
                        f'Unsupported instruction: {operation}; unresolved store semantics'):
                    self.strict.run(entry, memory, regs(value))
                self.assertEqual(bytes(memory.regions[0].data), INITIAL_GLOBAL)
                self.assertEqual(nonstack_writes(memory), [])

    def test_store_hypotheses_write_explicit_width_and_lanes(self):
        cases = (
            (HALFWORD_SET, 0x89abcdef, {
                'sleigh-store': (bytes.fromhex('ab893344'), (GLOBAL, 2, 0x89ab)),
                'halfword-lane-hypothesis': (bytes.fromhex('1122efcd'),
                                             (GLOBAL + 2, 2, 0xcdef)),
            }),
            (WORD_SET, 0x76543210, {
                'sleigh-store': (bytes.fromhex('10325476'), (GLOBAL, 4, 0x76543210)),
                'halfword-lane-hypothesis': (bytes.fromhex('10323344'),
                                             (GLOBAL, 2, 0x3210)),
            }),
        )
        for entry, value, expected_by_policy in cases:
            for policy, model in self.models.items():
                with self.subTest(entry=hex(entry), policy=policy):
                    memory = self.global_memory()
                    result = model.run(entry, memory, regs(value))
                    self.assertEqual(result['termination'], 'return')
                    self.assertEqual(bytes(memory.regions[0].data),
                                     expected_by_policy[policy][0])
                    address, width, written = expected_by_policy[policy][1]
                    self.assertEqual(nonstack_writes(memory), [
                        (GLOBAL_NAME, address, width, written)])

    def test_adjacent_halfword_getter_reads_only_upper_sentinel_halfword(self):
        data = bytes.fromhex('3412cdab')
        memory = self.global_memory(data)
        result = self.strict.run(ADJACENT_HALFWORD_READ, memory, regs())
        self.assertEqual(result['termination'], 'return')
        self.assertEqual(result['registers'][3], 0xabcd)
        self.assertEqual(memory.reads, [(GLOBAL_NAME, GLOBAL + 2, 2)])
        self.assertEqual(bytes(memory.regions[0].data), data)
        self.assertEqual(memory.writes, [])

    def test_unmapped_and_readonly_global_writes_retain_memory(self):
        for entry, policy, address, width in (
                (HALFWORD_SET, 'sleigh-store', GLOBAL, 2),
                (HALFWORD_SET, 'halfword-lane-hypothesis', GLOBAL + 2, 2),
                (WORD_SET, 'sleigh-store', GLOBAL, 4),
                (WORD_SET, 'halfword-lane-hypothesis', GLOBAL, 2)):
            value = 0x89abcdef if entry == HALFWORD_SET else 0x76543210
            with self.subTest(entry=hex(entry), policy=policy):
                unmapped = Memory([stack_region()])
                with self.assertRaisesRegex(
                        ValueError,
                        f'Unmapped memory access: {address:#x}\\+{width}'):
                    self.models[policy].run(entry, unmapped, regs(value))
                self.assertEqual(nonstack_writes(unmapped), [])

                readonly = self.global_memory(writable=False)
                before = bytes(readonly.regions[0].data)
                with self.assertRaisesRegex(ValueError, 'Write to read-only region'):
                    self.models[policy].run(entry, readonly, regs(value))
                self.assertEqual(bytes(readonly.regions[0].data), before)
                self.assertEqual(nonstack_writes(readonly), [])

    def test_reset_stops_at_configuration_call_with_policy_specific_globals(self):
        expected_global = {
            'sleigh-store': bytes.fromhex('ef080000'),
            'halfword-lane-hypothesis': bytes.fromhex('ef08a013'),
        }
        for policy, model in self.models.items():
            with self.subTest(policy=policy):
                memory = self.global_memory()
                before = regs(7)
                result = model.run(RESET, memory, before,
                                   stop_before=(0x2213d0,))
                self.assertEqual((result['termination'], result['stopped_before']),
                                 ('breakpoint', 0x2213d0))
                self.assertEqual([target for _, target, _ in result['calls']],
                                 [HALFWORD_SET, WORD_SET, 0x2213d0])
                self.assertEqual(result['registers'][3:5], [0, 7])
                self.assertEqual(result['registers'][1], before[1] - 8)
                self.assertEqual(bytes(memory.regions[0].data),
                                 expected_global[policy])

    def test_apply_wrapper_prefix_reaches_first_reset_without_entering_mode(self):
        expected_global = {
            'sleigh-store': bytes.fromhex('ef080000'),
            'halfword-lane-hypothesis': bytes.fromhex('ef08a013'),
        }
        for policy, model in self.models.items():
            with self.subTest(policy=policy):
                memory = Memory([
                    plain(GLOBAL, INITIAL_GLOBAL, GLOBAL_NAME, True),
                    plain(0x47fa9c, bytes(13 * 124), 'engines'),
                    stack_region(),
                ])
                before = regs()
                result = model.run(APPLY_WRAPPER, memory, before,
                                   stop_before=(0x2213d0,))
                self.assertEqual((result['termination'], result['stopped_before']),
                                 ('breakpoint', 0x2213d0))
                self.assertEqual([target for _, target, _ in result['calls']],
                                 [RESET, HALFWORD_SET, WORD_SET, 0x2213d0])
                self.assertEqual(result['registers'][3:5], [0, 0])
                self.assertEqual(result['registers'][1], before[1] - 16)
                self.assertEqual(bytes(memory.regions[0].data),
                                 expected_global[policy])


if __name__ == '__main__':
    unittest.main()
