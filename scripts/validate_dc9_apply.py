"""Check apply continuations and guards without substituting hardware services.

Entered continuations explicitly supply state that unrecovered calls could have
produced. They are isolated contracts, never evidence of complete layout apply.
"""
import json

from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel, RETURN
from build_dc9_source_baseline import ROOT, LAYOUT, sha
from reconstruct_dc9_apply import SPANS
from validate_dc9_module import inputs, stack_region
from validate_dc9_timer import peek, seed
from validate_dc9_transfer import plain, regs, named

RECORDS = 0x4821ec
ENGINES = 0x47fa9c


def fixture():
    return Memory([stack_region(), plain(RECORDS, bytes(4 * 168), 'records'),
                   plain(ENGINES, bytes([0xa5] * (16 * 124)), 'mask_targets')])


def apply_frame(memory):
    before = regs()
    before[1] -= 28
    for i, register in enumerate(range(15, 8, -1)):
        seed(memory, before[1] + i * 4, RETURN if register == 9 else before[register], 4)
    # Explicit supplied result from the earlier external update-range call.
    before[15] = 0x12345678
    return before


def rectangle_copy_prefix(model, record_index, mask):
    if not 0 <= record_index < 3 or not 0 < mask <= 65535:
        raise ValueError('Expected record0..2 and nonzero uint16 mask')
    memory = fixture()
    payload = bytes((17 * record_index + i * 29) & 255 for i in range(8))
    record = RECORDS + record_index * 168
    named(memory, 'records').data[record_index*168+0x18:record_index*168+0x20] = payload
    before = apply_frame(memory)
    before[10], before[11], before[12], before[13], before[14] = mask, 0, record + 0x81, record_index, record
    result = model.run(0x23fbb1, memory, before, stop_before=(0x23fc04,))
    bit = (mask & -mask).bit_length() - 1
    expected = bytearray([0xa5] * (16 * 124))
    expected[bit*124+0x20:bit*124+0x28] = payload
    assert named(memory, 'mask_targets').data == expected
    assert result['registers'][3] == bit
    assert result['termination'] == 'breakpoint' and not result['calls']
    assert memory.writes == [('mask_targets', ENGINES + bit*124 + 0x20+i, 1, b) for i,b in enumerate(payload)]
    return result, memory


def validate():
    expanded, segments, _ = inputs()
    model = ModuleModel(segments, call_policy='fallthrough-hypothesis')
    cases = {}; visited = set()

    def record(name, result):
        cases[name] = cases.get(name, 0) + 1
        visited.update(result['visited'])

    # Recovered entry reaches the metadata reset dependency, but no external
    # preparation service is invented to allow it to continue.
    memory = fixture()
    result = model.run(0x23fad0, memory, regs(), stop_before=(0x22acaf,))
    assert result['registers'][3:5] == [0, 15]
    assert result['termination'] == 'breakpoint'
    assert [call[1] for call in result['calls']] == [0x22aca0]
    record('apply_entry_before_metadata_service', result)

    # Three-record loop follows external setup. The fourth record's flag is
    # deliberately nonzero to verify this particular loop does not visit it.
    for fill in (1, 255):
        memory = fixture(); seed(memory, RECORDS + 3*168 + 0x81, fill)
        before = apply_frame(memory)
        result = model.run(0x23fb3f, memory, before)
        assert result['termination'] == 'return' and result['registers'][3] == 0x12345678
        assert result['registers'][1] == before[1]+28
        assert result['registers'][10:] == regs()[10:]
        assert not memory.writes and not result['calls']
        assert [a for n,a,_ in memory.reads if n == 'records'] == [RECORDS+i*168+0x81 for i in range(3)]
        record('apply_empty_three_record_continuation', result)

    for index in range(3):
        for mask in (0, 1, 0x8000, 0xffff):
            memory = fixture(); base = RECORDS + index*168
            seed(memory, base+0x81, 1); seed(memory, base+0x2a, mask, 2)
            seed(memory, base+8, 0x12345678, 4); seed(memory, base+12, 0x87654321, 4)
            result = model.run(0x23fb3f, memory, apply_frame(memory), stop_before=(0x23fb91,))
            assert result['registers'][3:6] == [index, 0x12345678, 0x87654321]
            assert result['registers'][10] == mask and not result['calls'] and not memory.writes
            record('apply_active_record_before_service', result)
        for mask in (*[1 << bit for bit in range(16)], *[(1 << bit) | 0x8000 for bit in range(15)], 3, 0x5555, 0xaaaa, 0xffff):
            result, _ = rectangle_copy_prefix(model, index, mask)
            record('rectangle_first_set_bit_copy_prefix', result)

    for index in range(4):
        for source in (*range(256), 256, 0xffffffff):
            for mask in (0, 1):
                memory = fixture(); base = RECORDS + index*168
                seed(memory, base+0x28, 5); seed(memory, base+0x2c, mask, 2)
                before = regs(index, source)
                result = model.run(0x23fc0a, memory, before, stop_before=(0x23fc4a,))
                allowed = source <= 5 and mask != 0
                assert result['termination'] == ('breakpoint' if allowed else 'return')
                assert not result['calls']
                assert all(name == 'stack' for name,_,_,_ in memory.writes)
                if not allowed:
                    assert result['registers'][1] == before[1] and result['registers'][10:] == before[10:]
                record('source_switch_guard_prefix' if allowed else 'source_switch_guard_return', result)

    for index in (*range(256), 256, 0xffffffff):
        memory = Memory([stack_region()]); before = regs(index)
        result = model.run(0x204000, memory, before, stop_before=(0x20401d,))
        assert result['termination'] == ('breakpoint' if index <= 3 else 'return')
        assert not result['calls']
        if index > 3:
            assert result['registers'][1] == before[1] and result['registers'][10:] == before[10:]
        record('engine_guard_prefix' if index <= 3 else 'engine_guard_return', result)

    for config in range(256):
        for active in (0, 1):
            data = bytearray(0x4d); data[0x4c] = config
            memory = Memory([stack_region(), plain(0x3b5f38, (0x600000).to_bytes(4,'little'), 'config_pointer', False),
                             plain(0x600000, data, 'config', False), plain(0x4551e8, bytes([active]), 'active', False)])
            before = regs()
            result = model.run(0x2421d3, memory, before, stop_before=(0x2421fe,))
            bypass = bool(config & 0x20) or active == 0
            assert result['termination'] == ('return' if bypass else 'breakpoint')
            assert not result['calls'] and all(name == 'stack' for name,_,_,_ in memory.writes)
            if bypass:
                assert result['registers'][1] == before[1] and result['registers'][10:] == before[10:]
            else:
                assert result['registers'][7] == 50
            record('poll_bypass_return' if bypass else 'poll_before_ambiguous_countdown_store', result)

    for index in range(5):
        memory = fixture(); named(memory, 'records').data[:] = bytes([0xa5] * (4*168))
        result = model.run(0x22ac17, memory, regs(index, 7), stop_before=(0x22ac52,))
        selected = 0 if index == 4 else index
        assert result['registers'][3] == selected and result['registers'][12] == (3 if index == 4 else index)
        assert [(a,s,v) for n,a,s,v in memory.writes if n == 'records'] == [(RECORDS + selected*168 + 0x5b, 1, 0)]
        assert result['termination'] == 'breakpoint' and not result['calls']
        record('update_range_first_record_prefix', result)

    for index in range(6):
        memory = Memory([plain(0x3b4950, bytes([0xa5] * (6*176)), 'metadata')])
        before = regs(); before[10] = 0x3b4960 + index*176; before[11] = 4
        # Independent iteration continuation after setup / preceding service;
        # no assertion that an actual service returns or preserves this state.
        result = model.run(0x22acbd, memory, before, stop_before=(0x22acd1,))
        expected = bytearray([0xa5] * (6*176)); offset = index*176
        expected[offset+16] = 4; expected[offset+18:offset+20] = bytes(2)
        expected[offset+12:offset+16] = bytes(4); expected[offset+112] = 0
        assert named(memory, 'metadata').data == expected
        assert result['registers'][3:6] == [0, 0xa5a5a5a5, 0xa5a5a5a5]
        assert result['termination'] == 'breakpoint' and not result['calls']
        record('metadata_reset_iteration_prefix', result)

    dependencies = []
    for pc, (_, op, args) in sorted(model.instructions.items()):
        if any(start <= pc < end for _,start,end,_ in SPANS) and op in ('bg.jal', 'bg.j'):
            target = int(args[0], 0)
            if not any(start <= target < end for _,start,end,_ in SPANS):
                dependencies.append({'site': hex(pc), 'target': hex(target), 'kind': 'call' if op == 'bg.jal' else 'jump',
                                     'recovered_in_layout': target in model.instructions})
    return {'source_layout_sha256': sha(LAYOUT.read_bytes()), **decoder_identity(),
            'status': 'strict guards and explicitly supplied continuation states; full apply unexecuted',
            'cases': cases, 'total_cases': sum(cases.values()), 'visited_instruction_count': len(visited),
            'source_spans': [{'name': name, 'address': hex(start), 'end_exclusive': hex(end), 'size': end-start,
                              'sha256': sha(expanded[start-0x200000:end-0x200000]),
                              'visited_instructions': sum(start <= pc < end for pc in visited)} for name,start,end,_ in SPANS],
            'external_dependencies': dependencies,
            'record_geometry_copy': {'source_base': hex(RECORDS), 'source_stride': 168, 'source_offset': '0x18',
                                     'destination_base': hex(ENGINES), 'destination_stride': 124, 'destination_offset': '0x20',
                                     'byte_count': 8, 'destination_index': 'lowest remaining set bit of uint16 record mask'},
            'limitations': ['Little-endian data, fallthrough CALL and low-halfword semantics remain model hypotheses.',
                            'External services are never stubbed. Continuations supply explicit states; they do not validate prior calls.',
                            'Only the first mask-selected copy is executed before service0x23d4fc; later iteration and hardware effects unverified.',
                            'Sixteen mapped mask destinations are a synthetic uint16 fixture, not a physical engine count.',
                            'Three-record flag loop follows four-engine preparation; earlier service effects remain unresolved.',
                            'Conditional poll execution stops before unresolved countdown store; no timing or device completion claim.'],
            'tools_sha256': {name: sha((ROOT/'scripts'/name).read_bytes()) for name in (
                'validate_dc9_apply.py', 'reconstruct_dc9_apply.py', 'aeon_module_model.py', 'aeon_subset_assembler.py')}}


if __name__ == '__main__':
    report = validate()
    (ROOT/'analysis/dc9-apply-validation.json').write_text(json.dumps(report, indent=2)+'\n')
    print(f"Apply guards and explicit continuations: {report['total_cases']} cases")
