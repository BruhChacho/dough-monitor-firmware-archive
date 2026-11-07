"""Full active apply reaches the real delay poll with explicit bus/timer inputs."""
import json

from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel
from build_dc9_source_baseline import ROOT, LAYOUT, sha
from validate_dc9_module import inputs
from validate_dc9_assignment_apply import fixture as assignment_fixture
from validate_dc9_engine_enable import add_bus
from validate_dc9_transfer import plain, regs, named
from validate_dc9_timer import peek
from validate_dc9_registers import byte_address, BUS
from validate_dc9_masked import POLICIES

ROUTE_REGISTERS = (0xfff01f8d, 0xfff02e02)
WAIT_COUNT = 0x455204
WAIT_FLAG = WAIT_COUNT + 2
POLL = 0x2420b2


def fixture(expanded, channel=0, *, timer=True):
    memory = add_bus(assignment_fixture(expanded, channel), ROUTE_REGISTERS)
    if timer:
        memory = Memory(memory.regions + [
            plain(WAIT_COUNT, bytes.fromhex('a55ac33c'), 'dispatch_wait')])
    return memory


def route_bus_writes(memory):
    addresses = {byte_address(a) for a in ROUTE_REGISTERS}
    addresses.update(BUS + 2*(a & 0x7fff00) for a in ROUTE_REGISTERS)
    return [(a, v) for _, a, _, v in memory.writes if a in addresses]


EXPECTED_ROUTE_WRITES = [(0xa0e03e00, 255), (0xa0e03e00, 255),
                         (0xa0e03f19, 0x81), (0xa0e05c00, 255),
                         (0xa0e05c04, 0)]


def validate():
    expanded, segments, _ = inputs()
    counts = {}; steps = {}; visited = set()
    for policy in POLICIES:
        model = ModuleModel(segments, call_policy='fallthrough-hypothesis', store_policy=policy)
        for channel in range(4):
            memory = fixture(expanded, channel)
            result = model.run(0x23fad0, memory, regs(), max_steps=100000, stop_before=(POLL,))
            assert result['termination'] == 'breakpoint' and result['stopped_before'] == POLL
            calls = [target for _, target, _ in result['calls']]
            assert calls.count(0x21ddcf) == calls.count(0x21bfca) == calls.count(0x24209d) == 1
            assert not any(target in (0x21be27, 0x21dcee, 0x2250e8) for target in calls)
            assert route_bus_writes(memory) == EXPECTED_ROUTE_WRITES
            assert [w for w in memory.writes if w[0] == 'dispatch_wait'] == [
                ('dispatch_wait', WAIT_COUNT, 4 if policy == 'sleigh-store' else 2, 2),
                ('dispatch_wait', WAIT_FLAG, 1, 1)]
            assert bytes(named(memory, 'dispatch_wait').data) == bytes.fromhex(
                '02000100' if policy == 'sleigh-store' else '0200013c')
            assert not any(a == WAIT_FLAG for _, a, _ in memory.reads)
            assert peek(memory, 0x4551a8, 2) == 0
            assert peek(memory, 0xa0203034) == 0
            assert not any(n == 'assignment_config' for n, *_ in memory.writes)
            visited.update(result['visited']); counts[policy] = counts.get(policy, 0)+1
            steps[f'{policy}/channel{channel}'] = result['steps']
    return {'source_layout_sha256': sha(LAYOUT.read_bytes()), **decoder_identity(),
            'status': 'active full apply arms real delay and stops before first completion-flag poll',
            'conditional_cases_by_policy': counts, 'conditional_cases': sum(counts.values()),
            'steps': steps, 'visited_instruction_count': len(visited),
            'limitations': ['New logical bus bytes and a four-byte writable wait region are explicit fixture inputs.',
                            'Execution stops before polling; no timer tick, completion or hardware time is invented.',
                            'Both store-width interpretations are hypotheses and differ in the adjacent sentinel.',
                            'Other active states and unrecovered services remain incomplete.'],
            'tools_sha256': {n: sha((ROOT/'scripts'/n).read_bytes()) for n in
                             ('validate_dc9_dispatch_apply.py', 'validate_dc9_assignment_apply.py', 'aeon_module_model.py')}}


if __name__ == '__main__':
    print(json.dumps(validate(), indent=2))
