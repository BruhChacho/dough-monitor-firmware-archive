"""Bounded channel-storage execution and full inactive apply, without service stubs."""
import json

from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel
from build_dc9_source_baseline import ROOT, LAYOUT, sha
from reconstruct_dc9_channel_storage import SPANS
from validate_dc9_module import inputs, stack_region
from validate_dc9_transfer import plain, regs, named
from validate_dc9_timer import seed, peek
from validate_dc9_metadata import RECORDS, ENGINES
from validate_dc9_masked import POLICIES
from validate_dc9_engine_mode import apply_fixture

OUTPUT_OFFSETS = (0x5c, 0x68, 0x74, 0x60, 0x6c, 0x78, 0x64, 0x70, 0x7c)


def record_fixture(active=None, width=100, height=200, mask=1, fill=0xa5):
    memory = Memory([stack_region(), plain(RECORDS, bytes([fill])*4*168, 'records')])
    for index in range(4):
        seed(memory, RECORDS+index*168, int(index == active), 1)
        seed(memory, RECORDS+index*168+0x1c, width, 2)
        seed(memory, RECORDS+index*168+0x1e, height, 2)
        seed(memory, RECORDS+index*168+0x2a, mask, 2)
    return memory


def expected_clears(count=4):
    # The eight-iteration loop addresses floor(iteration/2): each inactive
    # channel receives the same nine zero word stores twice.
    return [('records', RECORDS+index*168+offset, 4, 0)
            for index in range(count) for repeat in range(2) for offset in OUTPUT_OFFSETS]


def validate():
    expanded, segments, _ = inputs()
    strict = ModuleModel(segments, call_policy='fallthrough-hypothesis')
    cases = {}; conditional = {}; visited = set()

    def note(name, result, policy=None):
        group = cases if policy is None else conditional.setdefault(policy, {})
        group[name] = group.get(name, 0)+1
        visited.update(result['visited'])

    values = (0, *[1 << i for i in range(32)], 3, 0xffffffff, 0x80000001, 0x80004000)
    for value in values:
        memory = Memory([])
        result = strict.run(0x2402c4, memory, regs(value))
        expected = 0 if not value else (value & -value).bit_length()-1
        assert result['termination'] == 'return' and result['registers'][3] == expected
        assert not memory.reads and not memory.writes
        note('lowest_set_bit_return', result)
    for index in range(4):
        for mask in (0, 1, 2, 4, 0x8000, 0xffff):
            memory = record_fixture(mask=mask)
            before = regs(index)
            result = strict.run(0x2250c5, memory, before)
            assert result['termination'] == 'return'
            assert result['registers'][3] == (0 if not mask else (mask & -mask).bit_length()-1)
            assert result['registers'][1] == before[1]
            assert [r for r in memory.reads if r[0] != 'stack'] == [
                ('records', RECORDS+index*168+0x2a, 2)]
            assert not [w for w in memory.writes if w[0] != 'stack']
            note('channel_mask_lookup_return', result)

    for fill in (0, 0x5a, 0xa5, 0xff):
        memory = record_fixture(fill=fill)
        old = bytes(named(memory, 'records').data); before = regs()
        result = strict.run(0x2250e8, memory, before)
        assert result['termination'] == 'return' and not result['calls']
        assert result['registers'][1] == before[1]
        assert result['registers'][10:23] == before[10:23]
        expected = bytearray(old)
        for index in range(4):
            for offset in OUTPUT_OFFSETS:expected[index*168+offset:index*168+offset+4] = bytes(4)
        assert named(memory, 'records').data == expected
        assert [w for w in memory.writes if w[0] != 'stack'] == expected_clears()
        note('inactive_channel_storage_return', result)

    for index in range(4):
        for width, height in ((0, 0), (0, 65535), (65535, 0)):
            memory = record_fixture(index, width, height)
            old = bytes(named(memory, 'records').data)
            result = strict.run(0x2250e8, memory, regs())
            assert result['termination'] == 'return'
            expected = bytearray(old)
            expected[index*168+0x1c:index*168+0x20] = bytes.fromhex('0a000a00')
            assert named(memory, 'records').data == expected
            assert [w for w in memory.writes if w[0] != 'stack'] == [
                ('records', RECORDS+index*168+0x1c, 2, 10),
                ('records', RECORDS+index*168+0x1e, 2, 10)]
            assert [t for _, t, _ in result['calls']] == [0x2250c5, 0x2402c4]
            note('zero_area_dimension_repair_return', result)
        for width, height in ((1, 1), (1920, 1080), (65535, 65535)):
            for mask in (1, 0x8000):
                memory = record_fixture(index, width, height, mask)
                old = bytes(named(memory, 'records').data)
                result = strict.run(0x2250e8, memory, regs(), stop_before=(0x2252be,))
                assert result['termination'] == 'breakpoint'
                assert result['registers'][3:7] == [395, 0, width*height, 0]
                assert [w for w in memory.writes if w[0] != 'stack'] == expected_clears(index)
                assert bytes(named(memory, 'records').data[index*168:(index+1)*168]) == old[index*168:(index+1)*168]
                note('positive_area_arithmetic_prefix', result)

    for policy in POLICIES:
        model = ModuleModel(segments, call_policy='fallthrough-hypothesis', store_policy=policy)
        for config, active in ((0x20, 1), (0, 0)):
            memory = apply_fixture(expanded, config, active); before = regs()
            result = model.run(0x23fad0, memory, before, max_steps=100000)
            assert result['termination'] == 'return' and result['registers'][3] == 1
            assert result['registers'][1] == before[1]
            assert result['registers'][10:23] == before[10:23]
            targets = [t for _, t, _ in result['calls']]
            assert targets.count(0x21ffb3) == 4 and targets.count(0x222634) == 13
            assert targets.count(0x2250e8) == targets.count(0x226100) == 1
            assert not any(t in (0x2aacb9, 0x2ab331, 0x22eb07) for t in targets)
            assert [w for w in memory.writes if w[0] == 'records'] == [
                ('records', RECORDS+i*168+0x5b, 1, 0) for i in range(4)] + expected_clears()
            for index in range(13):
                assert peek(memory, ENGINES+index*124+8, 4) == 0
                assert peek(memory, ENGINES+index*124+0xf) == 1
            assert not any(n in ('config', 'config_pointer', 'active') for n, *_ in memory.writes)
            assert not any(a == 0x455208 for _, a, _, _ in memory.writes)
            note('full_inactive_apply_return', result, policy)

    return {'source_layout_sha256': sha(LAYOUT.read_bytes()), **decoder_identity(),
            'status': 'full apply returns for explicit inactive-channel fixture; active arithmetic and final services remain unresolved',
            'cases': cases, 'strict_cases': sum(cases.values()),
            'conditional_cases_by_policy': conditional,
            'conditional_cases': sum(sum(v.values()) for v in conditional.values()),
            'visited_instruction_count': len(visited),
            'source_spans': [{'name': n, 'address': hex(a), 'end_exclusive': hex(b), 'size': b-a,
                              'sha256': sha(expanded[a-0x200000:b-0x200000]),
                              'visited_instructions': sum(a <= pc < b for pc in visited)}
                             for n, a, b, _ in SPANS],
            'limitations': ['Inactive full apply uses explicit wait bypass, synthetic fifth owner record, writable size globals and plain bus.',
                            'Active channel arithmetic stops before 0x2aacb9/0x2ab331; flagged final channels require other unrecovered services.',
                            'CPU, CALL, store, low-halfword and little-endian semantics remain hypotheses; no physical behavior is modeled.'],
            'tools_sha256': {n: sha((ROOT/'scripts'/n).read_bytes()) for n in
                             ('validate_dc9_channel_storage.py', 'reconstruct_dc9_channel_storage.py', 'aeon_module_model.py')}}


if __name__ == '__main__':
    print(json.dumps(validate(), indent=2))
