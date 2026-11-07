"""Bounded active-engine guards and full-apply divergence under store hypotheses."""
import json

from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel
from build_dc9_source_baseline import LAYOUT, ROOT, sha
from validate_dc9_dispatch_selection import scheduled_fixture, WRITE_LOGICAL
from validate_dc9_masked import POLICIES
from validate_dc9_module import inputs, stack_region
from validate_dc9_registers import byte_address
from validate_dc9_timer import peek
from validate_dc9_transfer import plain, regs, named
from validate_dc9_wide_arithmetic import BIT_LENGTH


def validate():
    expanded, segments, _ = inputs()
    strict = ModuleModel(segments, call_policy='fallthrough-hypothesis')
    counts = {}; visited = set()
    for value in (0, *(1 << bit for bit in range(32)), 3, 0xffffffff, 0x80000001):
        memory = Memory([])
        result = strict.run(0x2402ab, memory, regs(value))
        assert result['termination'] == 'return'
        assert result['registers'][3] == max(0, value.bit_length()-1)
        assert not memory.reads and not memory.writes
        visited.update(result['visited']); counts['highest_bit'] = counts.get('highest_bit', 0)+1
    for mode in (0, 1, 4, 6, 255):
        memory = Memory([stack_region(), plain(0x47fb25, bytes([mode]), 'engine_mode', False)])
        before = regs()
        result = strict.run(0x21fb2b, memory, before)
        assert result['termination'] == 'return' and result['registers'][3] == 120
        assert result['registers'][1] == before[1] and result['registers'][10:23] == before[10:23]
        assert not result['calls'] and all(name == 'stack' for name, *_ in memory.writes)
        visited.update(result['visited']); counts['default_value'] = counts.get('default_value', 0)+1
    for width, height in ((0, 0), (100, 0), (0, 200)):
        memory = Memory([stack_region(), plain(0x47fb25, b'\0', 'engine_mode', False),
                         plain(0x343c14, width.to_bytes(2, 'little')+height.to_bytes(2, 'little'), 'dimensions', False)])
        before = regs(60)
        result = strict.run(0x21fb61, memory, before)
        assert result['termination'] == 'return' and result['registers'][3] == 0
        assert result['registers'][1] == before[1] and result['registers'][10:23] == before[10:23]
        assert all(name == 'stack' for name, *_ in memory.writes)
        visited.update(result['visited']); counts['zero_dimension'] = counts.get('zero_dimension', 0)+1
    full = {}
    for policy in POLICIES:
        model = ModuleModel(segments, call_policy='fallthrough-hypothesis', store_policy=policy)
        memory = scheduled_fixture(expanded, model)
        memory.regions += [
            plain(BIT_LENGTH, expanded[BIT_LENGTH-0x200000:BIT_LENGTH-0x200000+256], 'bit_length', False),
            plain(0x454824, b'\x5a', 'engine_input', False)]
        before = regs()
        result = model.run(0x23fad0, memory, before, max_steps=100000, stop_before=(0x21fcc9,))
        targets = [target for _, target, _ in result['calls']]
        assert targets.count(0x21fb61) == targets.count(0x21fb2b) == 1
        assert [value for _, address, width, value in memory.writes
                if address == byte_address(WRITE_LOGICAL[5]) and width == 1] == [1, 0]
        assert not any(name in ('engine_input', 'bit_length') for name, *_ in memory.writes)
        if policy == 'sleigh-store':
            assert result['termination'] == 'return' and result['registers'][3] == 1
            assert result['registers'][1] == before[1] and result['registers'][10:23] == before[10:23]
            assert bytes(named(memory, 'global_halfword').data).hex() == 'ef080000'
            assert 0x2250e8 in targets and 0x226100 in targets
            assert targets.count(0x2aacb9) == targets.count(0x2ab331) == 2
            assert not any(name == 'engine_input' for name, *_ in memory.reads)
            assert len(memory.tick_results) == 4
            outcome = 'conditional return; literal store cleared adjacent dimension, triggering engine early return'
        else:
            assert result['termination'] == 'breakpoint' and result['stopped_before'] == 0x21fcc9
            assert bytes(named(memory, 'global_halfword').data).hex() == 'ef08a013'
            assert result['registers'][3:5] == [0, 405]  # 90 * 0x480000000
            assert 0x2aad0b in targets and 0x2250e8 not in targets
            assert ('engine_input', 0x454824, 1) in memory.reads
            assert len(memory.tick_results) == 8
            outcome = 'stopped before unrecovered conversion 0x2aae3d'
        visited.update(result['visited'])
        full[policy] = {'outcome': outcome, 'steps': result['steps'],
                        'ticks': len(memory.tick_results),
                        'dimension_bytes': bytes(named(memory, 'global_halfword').data).hex()}
    return {'source_layout_sha256': sha(LAYOUT.read_bytes()), **decoder_identity(),
            'strict_cases': sum(counts.values()), 'cases': counts,
            'conditional_full_apply_cases': len(full), 'full_apply': full,
            'visited_instruction_count': len(visited),
            'limitations': ['Literal-store return does not establish active-engine completion: it cleared a dimension and took an early return.',
                            'Lane-store execution reaches unrecovered conversion code; no service result is fabricated.',
                            'The 0x5a engine input is explicit synthetic fixture data, not measured device state.',
                            'Mode5 helper, multi-channel cases, interrupt timing, ISA and physical device behavior remain unverified.'],
            'tools_sha256': {n: sha((ROOT/'scripts'/n).read_bytes()) for n in
                             ('validate_dc9_active_engine.py', 'validate_dc9_dispatch_selection.py', 'aeon_module_model.py')}}


if __name__ == '__main__':
    print(json.dumps(validate(), indent=2))
