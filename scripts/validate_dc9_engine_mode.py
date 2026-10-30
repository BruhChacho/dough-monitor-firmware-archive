"""Bounded engine-mode guards and direct writes; no missing services are stubbed."""
import json

from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel
from build_dc9_source_baseline import ROOT, LAYOUT, sha
from validate_dc9_module import inputs
from validate_dc9_masked import fixture as bus_fixture, POLICIES
from validate_dc9_transfer import plain, regs, named
from validate_dc9_timer import seed, peek
from validate_dc9_registers import byte_address
from validate_dc9_metadata import ENGINES, RECORDS, METADATA
from validate_dc9_engine_apply import apply_fixture as previous_apply_fixture

ENTRY = 0x2213d0


def fixture(index, *, state=4, bank=0x200, engine_mode=0, previous=0x55):
    logicals = [bank + 0x10800021, bank + 0x32800002]
    memory = bus_fixture(logicals, [0x25, 0x25], 0)
    mask = named(memory, 'broadcast_mask')
    mask.data.extend(b'\xa5\x5a'); mask.writable = True
    engines = bytearray(13 * 124)
    engines[index*124+4:index*124+8] = bank.to_bytes(4, 'little')
    engines[index*124+8:index*124+12] = state.to_bytes(4, 'little')
    engines[index*124+0xc] = engine_mode
    engines[index*124+0xd] = previous
    memory.regions += [plain(ENGINES, engines, 'engines'),
                       plain(RECORDS, bytes(4*168), 'records'),
                       plain(METADATA, bytes(6*176), 'metadata')]
    return Memory(memory.regions)


def apply_fixture(expanded, config=0x20, active=1):
    memory = previous_apply_fixture(expanded, config, active)
    # New setters write two adjacent dimensions. Keep both lanes explicit.
    size = named(memory, 'global_halfword')
    size.data.extend(b'\xa5\x5a'); size.writable = True
    return Memory(memory.regions)


def validate():
    expanded, segments, _ = inputs()
    strict = ModuleModel(segments, call_policy='fallthrough-hypothesis')
    counts = {}; conditional = {}; visited = set()

    def note(name, result, policy=None):
        group = counts if policy is None else conditional.setdefault(policy, {})
        group[name] = group.get(name, 0) + 1
        visited.update(result['visited'])

    for index in range(13):
        for state in (0, 7):
            memory = fixture(index, state=state)
            before = regs(0, index)
            result = strict.run(ENTRY, memory, before)
            assert result['termination'] == 'return'
            assert result['registers'][1] == before[1]
            assert result['registers'][10:23] == before[10:23]
            assert not [w for w in memory.writes if w[0] != 'stack']
            assert [t for _, t, _ in result['calls']] == [0x222804]
            assert memory.reads[:3] == [('engines', ENGINES+index*124+4, 4),
                                       ('engines', ENGINES+index*124+0x1d, 1),
                                       ('engines', ENGINES+index*124+0xd, 1)]
            note('inactive_or_out_of_range_return', result)
    for index in range(4):
        memory = fixture(index, previous=9)
        result = strict.run(ENTRY, memory, regs(9, index))
        assert result['termination'] == 'return'
        assert not [w for w in memory.writes if w[0] != 'stack']
        note('unchanged_mode_nine_return', result)
    for index in (0, 2, 3):
        for mode in (0, 1, 5, 9, 10, 0xffffffff):
            memory = fixture(index)
            result = strict.run(ENTRY, memory, regs(mode, index), stop_before=(0x23e13b,))
            assert result['termination'] == 'breakpoint'
            assert result['registers'][3:5] == [0, 1]
            assert [w for w in memory.writes if w[0] != 'stack'] == [
                ('engines', ENGINES+index*124+0xd, 1, mode & 255)] * 2
            note('broadcast_prefix_after_mode_store', result)
    memory = fixture(1)
    result = strict.run(ENTRY, memory, regs(0, 1), stop_before=(0x22169e,))
    assert result['termination'] == 'breakpoint' and result['registers'][3] == 0
    assert [w for w in memory.writes if w[0] != 'stack'] == [
        ('engines', ENGINES+124+0xd, 1, 0)]
    note('selected_engine_one_service_prefix', result)

    for policy in POLICIES:
        model = ModuleModel(segments, call_policy='fallthrough-hypothesis', store_policy=policy)
        for index in (0, 2, 3):
            for bank in (0, 0x200):
                for engine_mode in (0, 1):
                    for mode in (0, 1, 4, 8, 11, 0xffffffff):
                        memory = fixture(index, bank=bank, engine_mode=engine_mode)
                        before = regs(mode, index)
                        old_engines = bytes(named(memory, 'engines').data)
                        result = model.run(ENTRY, memory, before)
                        assert result['termination'] == 'return'
                        assert result['registers'][1] == before[1]
                        assert result['registers'][10:23] == before[10:23]
                        expected = bytearray(old_engines); expected[index*124+0xd] = mode & 255
                        assert named(memory, 'engines').data == expected
                        assert not any(n in ('records', 'metadata') for n, *_ in memory.writes)
                        addresses = [byte_address(bank+a) for a in (0x10800021, 0x32800002)]
                        data_writes = [(a, v) for n, a, _, v in memory.writes if a in addresses]
                        assert data_writes == ([] if bank == 0 else [
                            (addresses[0], 0xa5), (addresses[1], 0x25 if engine_mode else 0xa5)])
                        page = 0xa0000000 + 2*bank
                        all_bus_writes = [(a, width, v) for n, a, width, v in memory.writes
                                          if n.startswith('bus_')]
                        assert all_bus_writes == ([] if bank == 0 else [
                            (page, 1, 0x10), (page, 1, 0x10), (addresses[0], 1, 0xa5),
                            (page, 1, 0x32), (page, 1, 0x32),
                            (addresses[1], 1, 0x25 if engine_mode else 0xa5)])
                        assert peek(memory, 0x455214, 2) == 0
                        note('direct_mode_return', result, policy)
        for config, active in ((0x20, 1), (0, 0)):
            memory = apply_fixture(expanded, config, active)
            result = model.run(0x23fad0, memory, regs(), max_steps=100000,
                               stop_before=(0x23fb37,))
            assert result['termination'] == 'breakpoint'
            targets = [t for _, t, _ in result['calls']]
            assert targets.count(0x21ffb3) == 4
            assert targets.count(0x222634) == targets.count(ENTRY) == 13
            assert targets.count(0x21bd00) == targets.count(0x21bd0a) == 13
            assert 0x2250e8 not in targets and 0x21fb61 not in targets
            for index in range(13):
                assert peek(memory, ENGINES+index*124+0xf) == 1
                assert peek(memory, ENGINES+index*124+8, 4) == 0
            assert bytes(named(memory, 'global_halfword').data) == (
                bytes.fromhex('ef080000') if policy == 'sleigh-store' else bytes.fromhex('ef08a013'))
            note('full_apply_thirteen_reset_prefix', result, policy)

    return {'source_layout_sha256': sha(LAYOUT.read_bytes()), **decoder_identity(),
            'status': 'bounded direct engine-mode returns; full apply completes thirteen inactive resets and stops before 0x2250e8',
            'cases': counts, 'strict_cases': sum(counts.values()),
            'conditional_cases_by_policy': conditional,
            'conditional_cases': sum(sum(c.values()) for c in conditional.values()),
            'visited_instruction_count': len(visited),
            'new_main_instructions_visited': sum(ENTRY <= pc < 0x222634 for pc in visited),
            'limitations': ['Plain bus, explicit memory and CPU/store/CALL hypotheses only.',
                            'Full apply uses inactive engine states; active engine-one configuration still stops before 0x21fb61.',
                            'bn.subb remains rejected; most engine-mode paths are not executed.'],
            'tools_sha256': {n: sha((ROOT/'scripts'/n).read_bytes()) for n in
                             ('validate_dc9_engine_mode.py', 'aeon_module_model.py', 'aeon_subset_assembler.py')}}


if __name__ == '__main__':
    report = validate()
    print(json.dumps(report, indent=2))
