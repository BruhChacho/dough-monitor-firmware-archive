"""Active full-apply prefix through real assignment, without missing-service stubs."""
import json

from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel
from build_dc9_source_baseline import ROOT, LAYOUT, sha
from validate_dc9_module import inputs
from validate_dc9_engine_mode import apply_fixture
from validate_dc9_transfer import plain, regs
from validate_dc9_timer import seed, peek
from validate_dc9_metadata import RECORDS, METADATA, ENGINES
from validate_dc9_masked import POLICIES

CONFIG = 0x45508c
STOP = 0x220c95


def fixture(expanded, channel=0, config=0):
    memory = apply_fixture(expanded)
    # One new read-only input, not automatic expansion of unmapped memory.
    memory = Memory(memory.regions + [plain(CONFIG, bytes([config]), 'assignment_config', False)])
    seed(memory, RECORDS+channel*168, 1, 1)
    seed(memory, RECORDS+channel*168+0x1c, 100, 2)
    seed(memory, RECORDS+channel*168+0x1e, 200, 2)
    return memory


def assignment_writes():
    return [('metadata', METADATA+0x10, 1, 1),
            ('metadata', METADATA+0x12, 2, 2),
            ('metadata', METADATA+0x1c, 1, 1),
            ('metadata', METADATA+0xc, 4, 1),
            ('metadata', METADATA+0x70, 1, 0),
            ('engines', ENGINES+124+0x1d, 1, 0),
            ('engines', ENGINES+124+8, 4, 1)]


def validate():
    expanded, segments, _ = inputs()
    counts = {}; visited = set(); steps = {}
    for policy in POLICIES:
        model = ModuleModel(segments, call_policy='fallthrough-hypothesis', store_policy=policy)
        for channel in range(4):
            memory = fixture(expanded, channel)
            result = model.run(0x23fad0, memory, regs(), max_steps=100000, stop_before=(STOP,))
            assert result['termination'] == 'breakpoint' and result['stopped_before'] == STOP
            assert result['registers'][3:5] == [0, 1]
            # The assignment frame has unwound; dispatch's 12-byte frame and
            # caller frames remain live at this unresolved CALL boundary.
            calls = [target for _, target, _ in result['calls']]
            assert calls.count(0x22701c) == calls.count(0x222ce8) == 1
            assert calls.count(0x20f1ef) == 7
            assert not any(t in (0x21ddcf, 0x226bb5, 0x2250e8) for t in calls)
            writes = [w for w in memory.writes if w[0] in ('metadata', 'engines')]
            assert writes[-7:] == assignment_writes()
            assert peek(memory, ENGINES+124+0x10) == channel
            assert peek(memory, RECORDS+channel*168+0x1c, 2) == 100
            assert peek(memory, RECORDS+channel*168+0x1e, 2) == 200
            assert ('assignment_config', CONFIG, 1) in memory.reads
            assert not any(n == 'assignment_config' for n, *_ in memory.writes)
            visited.update(result['visited'])
            counts[policy] = counts.get(policy, 0)+1
            steps[f'{policy}/channel{channel}'] = result['steps']
    return {'source_layout_sha256': sha(LAYOUT.read_bytes()), **decoder_identity(),
            'status': 'active full apply reaches call 0x220c95 before unresolved 0x21ddcf',
            'conditional_cases_by_policy': counts, 'conditional_cases': sum(counts.values()),
            'steps': steps, 'visited_instruction_count': len(visited),
            'limitations': ['Explicit read-only configuration byte 0x45508c=0 extends the earlier fixture.',
                            'One active channel with dimensions100x200 and all metadata selectors zero; not general active operation.',
                            'CPU, CALL and both store interpretations remain hypotheses; plain bus bytes have no device behavior.',
                            'The earlier fixture faults at the missing config byte; unknown services and timers are not stubbed.'],
            'tools_sha256': {n: sha((ROOT/'scripts'/n).read_bytes()) for n in
                             ('validate_dc9_assignment_apply.py', 'validate_dc9_engine_mode.py', 'aeon_module_model.py')}}


if __name__ == '__main__':
    print(json.dumps(validate(), indent=2))
