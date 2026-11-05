"""Bounded execution of channel assignment and its two recovered neighbors.

The RAM regions are explicit synthetic inputs. CALL fallthrough, unsigned
low-halfword loads, little-endian memory, and plain bytes remain model
hypotheses. Unknown dispatch services are never substituted.
"""
import json

from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel
from build_dc9_source_baseline import ROOT, LAYOUT, sha
from reconstruct_dc9_channel_assignment import SPANS
from validate_dc9_module import inputs, stack_region
from validate_dc9_transfer import plain, regs, named

ASSIGN = 0x22701c
STATE = 0x222ce8
DISPATCH = 0x220c76
UNKNOWN_CALL = 0x220c95
METADATA = 0x3b4950
ENGINE = 0x47fa9c
CHANNELS = 0x4821ec
SELECTOR_TABLE = 0x2af120
SERVICE_STATE = 0x4543bc


def fixture(expanded, *, metadata_index=1, engine_index=2, mode=0,
            selector=2, channel=1, channel_flag=0, state=0,
            initialize=0, with_service=False):
    """Keep each firmware address family in a distinct, bounded region."""
    metadata = bytearray([0xa5] * (6 * 176))
    base = metadata_index * 176
    metadata[base:base + 4] = selector.to_bytes(4, 'little')
    metadata[base + 4:base + 8] = (0x2468ace0).to_bytes(4, 'little')
    metadata[base + 0xc:base + 0x10] = state.to_bytes(4, 'little')
    metadata[base + 0x10] = mode
    metadata[base + 0x12:base + 0x14] = (0x8001).to_bytes(2, 'little')
    metadata[base + 0x70] = 0x5a
    engines = bytearray([0x5a] * (13 * 124))
    engines[engine_index * 124 + 0x10] = channel
    channels = bytearray([0x39] * (4 * 168))
    channels[channel * 168 + 0x81] = channel_flag
    regions = [stack_region(), plain(METADATA, metadata, 'metadata'),
               plain(ENGINE, engines, 'engines'),
               plain(CHANNELS, channels, 'channels'),
               plain(0x45508c, bytes([initialize]), 'initialize', False)]
    if initialize:
        regions += [plain(0x3b4288, bytes([0xc3] * (6 * 24)), 'auxiliary'),
                    plain(0x3b4281, bytes([0x80] * 6), 'auxiliary_first', False),
                    plain(0x3b427b, bytes([0xfe] * 6), 'auxiliary_second', False)]
    if with_service:
        regions += [plain(SELECTOR_TABLE,
                          expanded[SELECTOR_TABLE - 0x200000:SELECTOR_TABLE - 0x200000 + 32],
                          'selector_table', False),
                    plain(SERVICE_STATE, bytes(40), 'service_state')]
    return Memory(regions)


def data_writes(memory):
    return [write for write in memory.writes if write[0] != 'stack']


def validate():
    expanded, segments, _ = inputs()
    model = ModuleModel(segments, call_policy='fallthrough-hypothesis')
    counts = {}
    visited = set()

    def note(name, result):
        counts[name] = counts.get(name, 0) + 1
        visited.update(result['visited'])

    # The state helper reads METADATA +c and changes only ENGINE +8.
    for index in (0, 1, 5):
        for source, output in ((2, 5), (4, 2), (0, 1), (0x80000004, 1)):
            memory = fixture(expanded, metadata_index=index, engine_index=index,
                             state=source)
            before = regs(index, index)
            old_metadata = bytes(named(memory, 'metadata').data)
            old_engines = bytes(named(memory, 'engines').data)
            result = model.run(STATE, memory, before)
            assert result['termination'] == 'return'
            assert result['registers'][1] == before[1]
            assert result['registers'][10:23] == before[10:23]
            assert memory.reads == [('metadata', METADATA + index * 176 + 0xc, 4)]
            assert data_writes(memory) == [('engines', ENGINE + index * 124 + 8, 4, output)]
            assert bytes(named(memory, 'metadata').data) == old_metadata
            expected = bytearray(old_engines)
            expected[index * 124 + 8:index * 124 + 12] = output.to_bytes(4, 'little')
            assert named(memory, 'engines').data == expected
            note('state_map_return', result)

    # Index 6 exits after its frame operations, without touching data records.
    memory = Memory([stack_region()])
    before = regs(6, 0x55)
    result = model.run(ASSIGN, memory, before)
    assert result['termination'] == 'return' and result['registers'][3] == 6
    assert not [read for read in memory.reads if read[0] != 'stack']
    assert not data_writes(memory)
    assert result['registers'][1] == before[1]
    assert result['registers'][10:23] == before[10:23]
    note('assignment_index_six_guard', result)

    # Non-four metadata merges a low halfword mask, stores selector byte,
    # calls the real state helper, then reaches the unknown dispatch service.
    for metadata_index, engine_index, mode, state in ((0, 0, 0, 2), (1, 2, 3, 4),
                                                       (5, 12, 7, 9)):
        memory = fixture(expanded, metadata_index=metadata_index,
                         engine_index=engine_index, mode=mode, state=state)
        before = regs(metadata_index, engine_index)
        result = model.run(ASSIGN, memory, before, stop_before=(UNKNOWN_CALL,))
        expected_state = {2: 5, 4: 2}.get(state, 1)
        assert result['termination'] == 'breakpoint'
        assert result['stopped_before'] == UNKNOWN_CALL
        assert [target for _, target, _ in result['calls']] == [STATE]
        assert result['registers'][1] == before[1] - 12
        assert result['registers'][4] == engine_index
        assert result['registers'][12:23] == before[12:23]
        assert data_writes(memory) == [
            ('metadata', METADATA + metadata_index * 176 + 0x12, 2,
             0x8001 | (1 << engine_index) & 0xffff),
            ('engines', ENGINE + engine_index * 124 + 0x1d, 1, metadata_index),
            ('engines', ENGINE + engine_index * 124 + 8, 4, expected_state),
        ]
        note('assignment_nonfour_dispatch_prefix', result)

    # Metadata type four uses the recovered engine-channel lookup. A nonzero
    # channel flag clears metadata state and continues to dispatch.
    memory = fixture(expanded, mode=4, channel=3, channel_flag=1)
    before = regs(1, 2)
    result = model.run(ASSIGN, memory, before, stop_before=(UNKNOWN_CALL,))
    assert result['termination'] == 'breakpoint'
    assert [target for _, target, _ in result['calls']] == [0x2227ef, STATE]
    assert data_writes(memory) == [
        ('metadata', METADATA + 176 + 0x10, 1, 2),
        ('metadata', METADATA + 176 + 0x12, 2, 4),
        ('metadata', METADATA + 176 + 0x1c, 1, 1),
        ('metadata', METADATA + 176 + 0xc, 4, 0),
        ('metadata', METADATA + 176 + 0x70, 1, 0),
        ('engines', ENGINE + 2 * 124 + 0x1d, 1, 1),
        ('engines', ENGINE + 2 * 124 + 8, 4, 1),
    ]
    note('assignment_four_flagged_dispatch_prefix', result)

    # Initialization copies two distinct source bytes to separate full words.
    memory = fixture(expanded, mode=4, channel=3, channel_flag=1, initialize=1)
    before_auxiliary = bytes(named(memory, 'auxiliary').data)
    result = model.run(ASSIGN, memory, regs(1, 2), stop_before=(UNKNOWN_CALL,))
    assert result['termination'] == 'breakpoint'
    assert [target for _, target, _ in result['calls']] == [0x2227ef, STATE]
    assert data_writes(memory) == [
        ('metadata', METADATA + 176 + 0x10, 1, 2),
        ('metadata', METADATA + 176 + 0x12, 2, 4),
        ('metadata', METADATA + 176 + 0x1c, 1, 1),
        ('metadata', METADATA + 176 + 0xc, 4, 0),
        ('metadata', METADATA + 176 + 0x70, 1, 0),
        ('auxiliary', 0x3b4288 + 24, 1, 1),
        ('auxiliary', 0x3b4288 + 24 + 1, 1, 1),
        ('auxiliary', 0x3b4288 + 24 + 0x11, 1, 0),
        ('auxiliary', 0x3b4288 + 24 + 4, 4, 0x80),
        ('auxiliary', 0x3b4288 + 24 + 8, 4, 0xfe),
        ('engines', ENGINE + 2 * 124 + 0x1d, 1, 1),
        ('engines', ENGINE + 2 * 124 + 8, 4, 1),
    ]
    expected_auxiliary = bytearray(before_auxiliary)
    offset = 24
    expected_auxiliary[offset:offset + 2] = bytes([1, 1])
    expected_auxiliary[offset + 0x11] = 0
    expected_auxiliary[offset + 4:offset + 8] = (0x80).to_bytes(4, 'little')
    expected_auxiliary[offset + 8:offset + 12] = (0xfe).to_bytes(4, 'little')
    assert named(memory, 'auxiliary').data == expected_auxiliary
    assert not any(name in ('auxiliary_first', 'auxiliary_second')
                   for name, *_ in memory.writes)
    note('assignment_four_initialized_dispatch_prefix', result)

    # A zero channel flag enters the real metadata state service. Stop before
    # its common downstream service, retaining its already committed writes.
    memory = fixture(expanded, mode=4, channel_flag=0, with_service=True)
    result = model.run(ASSIGN, memory, regs(1, 2), stop_before=(0x20f28c,))
    assert result['termination'] == 'breakpoint'
    assert [target for _, target, _ in result['calls']] == [0x2227ef, 0x20f1ef, 0x20e687]
    assert data_writes(memory)[:4] == [
        ('metadata', METADATA + 176 + 0x10, 1, 2),
        ('metadata', METADATA + 176 + 0x12, 2, 4),
        ('metadata', METADATA + 176 + 0x1c, 1, 1),
        ('metadata', METADATA + 176 + 0xc, 4, 1),
    ]
    assert data_writes(memory)[4:] == [
        ('service_state', SERVICE_STATE + 5, 1, 2),
        ('service_state', SERVICE_STATE + 7, 1, 2),
        ('service_state', SERVICE_STATE + 11, 1, 2),
        ('service_state', SERVICE_STATE + 12, 1, 2),
    ]
    note('assignment_four_zero_flag_service_prefix', result)

    # The dispatch computes a 0x20/2/4 mode before its first unknown call.
    for engine_index, expected_mode in ((4, 0x20), (0, 2), (1, 4), (2, 2), (3, 4)):
        memory = Memory([stack_region()])
        before = regs(0x1234, engine_index)
        result = model.run(DISPATCH, memory, before, stop_before=(UNKNOWN_CALL,))
        assert result['termination'] == 'breakpoint'
        assert result['registers'][4] == engine_index
        assert result['registers'][11] == expected_mode
        assert not result['calls']
        assert not [read for read in memory.reads if read[0] != 'stack']
        assert not data_writes(memory)
        note('dispatch_first_service_arguments', result)

    return {'source_layout_sha256': sha(LAYOUT.read_bytes()), **decoder_identity(),
            'status': 'bounded assignment and state paths; unknown dispatch services remain unresolved',
            'cases': counts, 'strict_cases': sum(counts.values()),
            'conditional_cases': 0,
            'visited_instruction_count': len(visited),
            'source_spans': [
                {'name': name, 'address': hex(start), 'end_exclusive': hex(end),
                 'size': end - start,
                 'sha256': sha(expanded[start - 0x200000:end - 0x200000]),
                 'visited_instructions': sum(start <= pc < end for pc in visited)}
                for name, start, end, _, _ in SPANS],
            'limitations': [
                'The 0x21ddcf and 0x226bb5 dispatch services are not modeled.',
                'The active metadata service stops at its real common-service boundary.',
                'Plain RAM, unsigned low-halfword loads, little-endian data and CALL fallthrough are hypotheses; no hardware behavior is established.',
            ],
            'tools_sha256': {name: sha((ROOT / 'scripts' / name).read_bytes()) for name in
                             ('validate_dc9_channel_assignment.py',
                              'reconstruct_dc9_channel_assignment.py',
                              'aeon_module_model.py', 'aeon_subset_assembler.py')}}


if __name__ == '__main__':
    report = validate()
    (ROOT / 'analysis/dc9-channel-assignment-validation.json').write_text(
        json.dumps(report, indent=2) + '\n')
    print(f"Channel assignment: {report['strict_cases']} strict, {report['conditional_cases']} conditional cases")
