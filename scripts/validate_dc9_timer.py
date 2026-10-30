"""Offline timer contracts; ambiguous stores and scheduled ticks stay explicit.

TickOnPoll runs a recovered timer prefix on each completion-flag read. This is
a deterministic interleaving experiment, not CPU interrupts or physical time.
The rest of timer_tick is stopped before external service calls.
"""
import json

from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel, Region
from build_dc9_source_baseline import ROOT, LAYOUT, sha
from reconstruct_dc9_timer import SPANS
from validate_dc9_module import inputs, stack_region
from validate_dc9_transfer import plain, regs

TICK = 0x2417f1
DELAY = 0x2420bb
WAIT_COUNT = 0x455204
WAIT_FLAG = 0x455206
RELOAD = 0x3b4948
POLICIES = ('sleigh-store', 'halfword-lane-hypothesis')


def peek(memory, address, size=1):
    region, offset = memory.locate(address, size)
    return int.from_bytes(region.data[offset:offset + size], 'little')


def seed(memory, address, value, size=1):
    region, offset = memory.locate(address, size)
    region.data[offset:offset + size] = value.to_bytes(size, 'little')


def fixture():
    memory = Memory([stack_region(), plain(0x710000, bytes(512), 'tick_stack'),
                     plain(0x455000, bytes(0x3000), 'globals'),
                     plain(0x3b4940, bytes(0x500), 'timer_and_channels'),
                     plain(0x4824a4, bytes(12), 'callbacks'),
                     plain(0x453b76, bytes(8), 'slot_states')])
    seed(memory, RELOAD, 1000, 2)
    return memory


class TickOnPoll(Memory):
    def __init__(self, memory, model, *, max_ticks=1024, clear_slot_after=None):
        super().__init__(memory.regions)
        self.model, self.max_ticks = model, max_ticks
        self.tick_results = []
        self.clear_slot_after = clear_slot_after
        self.in_tick = False

    def read(self, address, size):
        if address == WAIT_FLAG and not self.in_tick:
            if size != 1 or len(self.tick_results) >= self.max_ticks:
                raise ValueError('Scheduled timer budget exhausted or wrong poll width')
            self.in_tick = True
            try:
                registers = regs(); registers[1] = 0x710200
                result = self.model.run(TICK, self, registers, stop_before=(0x241841,))
                assert result['termination'] == 'breakpoint'
                self.tick_results.append(result)
                if self.clear_slot_after and len(self.tick_results) == self.clear_slot_after[1]:
                    self.write(0x453b76 + self.clear_slot_after[0], 1, 0)
            finally:
                self.in_tick = False
        return super().read(address, size)


def validate():
    expanded, segments, _ = inputs()
    strict = ModuleModel(segments, call_policy='fallthrough-hypothesis')
    models = {p: ModuleModel(segments, call_policy='fallthrough-hypothesis', store_policy=p) for p in POLICIES}
    counts = {'strict': {}, **{p: {} for p in POLICIES}}
    visits = {p: set() for p in counts}
    examples = []

    def record(group, name, result, stopped=None):
        assert result['termination'] == ('breakpoint' if stopped is not None else 'return')
        if stopped is not None:
            assert result['stopped_before'] == stopped
        counts[group][name] = counts[group].get(name, 0) + 1
        visits[group].update(result['visited'])

    # No ambiguous stores on the zero-duration and bounded nop-repeat paths.
    for entry in (0x24209d, DELAY):
        memory = fixture(); before = regs(0)
        result = strict.run(entry, memory, before)
        assert all(name == 'stack' for name, *_ in memory.writes)
        assert result['registers'][1] == before[1] and result['registers'][10:] == before[10:]
        record('strict', 'zero_delay', result)
    for argument in (*range(256), 0x100, 0x1ff, 0xffff, 0xffffffff):
        memory = fixture(); before = regs(argument)
        result = strict.run(0x24211b, memory, before)
        assert len(result['calls']) == argument & 255
        assert result['registers'][1] == before[1] and result['registers'][10:] == before[10:]
        record('strict', 'nop_repeat', result)

    # Validate all nine indexed halfword counters from their local loop entry.
    for channel in range(9):
        for initial in (0, 1, 2, 255, 256, 65535):
            for enabled in (0, 1, 255):
                memory = fixture()
                seed(memory, 0x4551b1 + channel, enabled)
                seed(memory, 0x4551ba + channel * 2, initial, 2)
                seed(memory, 0x4551db, 1)  # skip independent ambiguous sh path
                result = strict.run(0x24188e, memory, regs(), stop_before=(0x2418db,))
                expected = (initial - 1) & 65535 if enabled else initial
                assert peek(memory, 0x4551ba + channel * 2, 2) == expected
                assert peek(memory, 0x4551b1 + channel) == (0 if enabled and expected == 0 else enabled)
                assert all(0x4551b1 <= address < 0x4551cc for _, address, *_ in memory.writes)
                record('strict', 'nine_countdown_prefix', result, 0x2418db)

    for policy, model in models.items():
        lane = policy == 'halfword-lane-hypothesis'
        # Tick prefix: independent expected counter/flag transitions and sentinels.
        for count in (*range(0, 257), 0x7fff, 0x8000, 0xfffe, 0xffff):
            for enabled in (0, 1, 255):
                memory = fixture()
                seed(memory, WAIT_COUNT, count, 2); seed(memory, WAIT_FLAG, enabled)
                seed(memory, WAIT_FLAG + 1, 0xa5)
                result = model.run(TICK, memory, regs(), stop_before=(0x241841,))
                expected = count - 1 if enabled and count else count
                flag = (0 if count <= 1 or not lane else enabled) if enabled else 0
                assert peek(memory, WAIT_COUNT, 2) == expected
                assert peek(memory, WAIT_FLAG) == flag
                assert peek(memory, WAIT_FLAG + 1) == (0 if enabled and count and not lane else 0xa5)
                record(policy, 'delay_countdown_prefix', result, 0x241841)
                if enabled == 1 and count in (0, 1, 2, 1000, 65535):
                    examples.append({'policy': policy, 'initial_count': count, 'next_count': expected, 'next_flag': flag})

        # Periodic flags and reload are compared against arithmetic, stopping
        # before the unresolved external service at 0x2384f1. Channel timers zero.
        for initial in (*range(0, 1002), 32768, 65535):
            memory = fixture(); seed(memory, RELOAD, initial, 2); seed(memory, 0x45520e, 7)
            result = model.run(TICK, memory, regs(), stop_before=(0x2419cf,))
            decremented = (initial - 1) & 65535
            counter = decremented or 1000
            assert peek(memory, RELOAD, 2) == counter
            assert peek(memory, 0x4551e2) == (decremented == 0)
            assert peek(memory, 0x4551ce) == (decremented == 0)
            assert peek(memory, 0x45520e) == (6 if decremented == 0 else 7)
            for address, period in ((0x4551dc, 10), (0x4551dd, 30), (0x4551de, 50),
                                    (0x4551df, 100), (0x4551e0, 500)):
                assert peek(memory, address) == (counter % period == 0)
            record(policy, 'periodic_flags_prefix', result, 0x2419cf)

        # A second paired load/store constraint: decrement at decoded 0x4551f4
        # versus lhz at 0x4551f6 and flag at 0x4551e7.
        for count in (0, 1, 2, 255, 256, 65535):
            memory = fixture(); seed(memory, 0x4551e7, 1)
            seed(memory, 0x4551f4, 0xa5a5, 2); seed(memory, 0x4551f6, count, 2)
            result = model.run(TICK, memory, regs(), stop_before=(0x2418db,))
            expected = (count - 1) & 65535 if lane else count
            assert peek(memory, 0x4551f6, 2) == expected
            assert peek(memory, 0x4551f4, 2) == (0xa5a5 if lane else 0)
            assert peek(memory, 0x4551e7) == (expected != 0)
            record(policy, 'halfword_lane_prefix', result, 0x2418db)

        # Drive actual recovered tick code on every poll, without a host callback
        # pretending the wait succeeded. The callback destination is archived nop.
        for entry in (0x24209d, DELAY):
            for duration in (0, 1, 2, 3, 20, 100, 256, 0x10000, 0x10002):
                for enabled, pointer in ((0, 0), (1, 0), (1, 0x242099)):
                    memory = fixture(); seed(memory, 0x4551e1, enabled)
                    seed(memory, 0x4824ac, pointer, 4); seed(memory, 0x4824a4, pointer, 4)
                    memory = TickOnPoll(memory, model); before = regs(duration)
                    result = model.run(entry, memory, before)
                    low = duration & 65535
                    ticks = max(1, low) if duration and lane else int(bool(duration))
                    assert len(memory.tick_results) == ticks
                    assert peek(memory, WAIT_COUNT, 2) == (0 if lane else max(0, low - 1))
                    assert peek(memory, WAIT_FLAG) == 0
                    expected_callback = bool(duration and entry == DELAY and enabled and pointer)
                    assert len(result['calls']) == expected_callback
                    assert sum(len(r['calls']) for r in memory.tick_results) == ticks * bool(enabled and pointer)
                    assert result['registers'][1] == before[1] and result['registers'][10:] == before[10:]
                    record(policy, 'delay_with_scheduled_tick_prefix', result)

        # State six calls delay(1) at most twenty times. A separate explicit
        # stimulus may clear state during those ticks; the timer does not do it.
        for slot in range(8):
            for clear_after in (None, 1, 5, 19):
                memory = fixture(); seed(memory, 0x453b76 + slot, 6)
                memory = TickOnPoll(memory, model, clear_slot_after=(slot, clear_after) if clear_after else None)
                before = regs(slot); result = model.run(0x20cd4a, memory, before)
                expected = clear_after or 20
                assert len(memory.tick_results) == expected
                assert sum(target == DELAY for _, target, _ in result['calls']) == expected
                assert peek(memory, 0x453b76 + slot) == 0
                assert result['registers'][1] == before[1] and result['registers'][10:12] == before[10:12]
                record(policy, 'slot_wait_with_scheduled_tick_prefix', result)

        memory = fixture(); seed(memory, 0x4551e2, 0xff)
        result = model.run(0x242105, memory, regs())
        assert peek(memory, RELOAD, 2) == 1000 and peek(memory, 0x4551e2) == 0
        record(policy, 'timer_initialize', result)

    report = {
        'source_layout_sha256': sha(LAYOUT.read_bytes()), **decoder_identity(),
        'status': 'bounded contracts under explicit data, CALL and store assumptions; no hardware execution',
        'counts': counts, 'strict_cases': sum(counts['strict'].values()),
        'conditional_cases': sum(sum(counts[p].values()) for p in POLICIES),
        'visited_instruction_counts': {p: len(v) for p, v in visits.items()},
        'timer_instruction_coverage': {p: len(v & {pc for pc in strict.instructions if TICK <= pc < 0x241b18})
                                       for p, v in visits.items()},
        'store_counterexamples': examples,
        'routines': [{'name': n, 'address': hex(a), 'end_exclusive': hex(b), 'size': b-a,
                      'sha256': sha(expanded[a-0x200000:b-0x200000])} for n, a, b, _ in SPANS],
        'callback_slots': {'tick': '0x4824a4', 'delay': '0x4824ac'},
        'tick_contract': {'wait_count': hex(WAIT_COUNT), 'completion_flag': hex(WAIT_FLAG),
                          'reload_count': 1000, 'periodic_divisors': [10, 30, 50, 100, 500],
                          'physical_tick_period': None},
        'limitations': [
            'Raw scaler application; conventional executable imports are not applicable. Dependencies are direct calls and pointer slots.',
            'Byte-exact assembly and this model share the pinned decoder; not independent ISA validation.',
            'All modeled data uses little endian; pinned SLEIGH declares big endian.',
            'Literal-store and halfword-lane policies are hypotheses; default execution still rejects ambiguous stores.',
            'Every timer_tick execution is a prefix, stopped at 0x241841, 0x2418db or 0x2419cf before external service calls.',
            'Scheduled ticks occur on poll reads, not on a measured clock or hardware interrupt. Nested execution uses a separate synthetic stack.',
            'Nonzero callbacks are tested with an archived nop-return target, not resolved production callback assignments.',
            'Physical timing, scheduler/interrupt entry, MMIO side effects and external service tails remain unvalidated.'],
        'tools_sha256': {name: sha((ROOT / 'scripts' / name).read_bytes()) for name in (
            'validate_dc9_timer.py', 'reconstruct_dc9_timer.py', 'aeon_subset_assembler.py', 'aeon_module_model.py')},
    }
    return report


if __name__ == '__main__':
    report = validate()
    (ROOT / 'analysis/dc9-timer-validation.json').write_text(json.dumps(report, indent=2) + '\n')
    print(f"Timer: {report['strict_cases']} strict cases; {report['conditional_cases']} conditional cases")
