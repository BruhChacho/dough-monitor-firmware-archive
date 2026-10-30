"""Validate callback table setup and the timer dispatch continuation offline.

The initialization tail is entered with an explicit saved caller frame after an
unrecovered configuration call. Dispatch tests enter after timer_tick. These are
continuation tests, not complete startup or full timer-handler executions.
"""
import json

from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel, RETURN
from build_dc9_source_baseline import ROOT, LAYOUT, sha
from reconstruct_dc9_callbacks import SPANS
from trace_dc9_commands import direct_target
from validate_dc9_module import inputs, stack_region
from validate_dc9_timer import peek, seed
from validate_dc9_transfer import plain, regs

TABLE = 0x48248c
RECORDS = 0x4821ec
EXPECTED = [0x2621f0, 0x2623d2, 0x261abd, 0x261560, 0x26062f, 0x26154e, 0, 0, 0, 0x260673]


def initialization_tail(model, fill):
    memory = Memory([stack_region(), plain(RECORDS, bytes([fill] * (4 * 168 + 40)), 'records_and_callbacks'),
                     plain(0x4551e1, b'\0', 'callback_gate')])
    before = regs(); before[1] -= 8
    seed(memory, before[1], before[10], 4)
    seed(memory, before[1] + 4, RETURN, 4)
    result = model.run(0x2614c3, memory, before)
    assert result['termination'] == 'return'
    assert result['registers'][1] == before[1] + 8 and result['registers'][10:] == before[10:]
    table = [peek(memory, TABLE + i * 4, 4) for i in range(10)]
    assert table == EXPECTED
    assert peek(memory, 0x4551e1) == 1
    for index in range(4):
        assert peek(memory, RECORDS + index * 168 + 0x34) == 0
    record_region = next(r for r in memory.regions if r.name == 'records_and_callbacks')
    expected = bytearray([fill] * (4 * 168))
    for index in range(4): expected[index * 168 + 0x34] = 0
    assert record_region.data[:4 * 168] == expected
    return result, memory


def dispatch_tail(model, total, fractional, hundred, thousand, countdown_a, countdown_b):
    memory = Memory([stack_region(), plain(0x453cf8, bytes(0x24), 'dispatch_counters')])
    for address, value, width in ((0x453d00, total, 4), (0x453d18, fractional, 1),
                                 (0x453d14, hundred, 4), (0x453cfc, thousand, 4),
                                 (0x453d04, countdown_a, 4), (0x453d08, countdown_b, 4)):
        seed(memory, address, value, width)
    before = regs(); before[1] -= 4; seed(memory, before[1], RETURN, 4)
    result = model.run(0x27083f, memory, before)
    total = (total + 1) & 0xffffffff
    fractional = (fractional + 1) & 255
    expected = {0x453d00: total, 0x453d18: 0 if fractional > 99 else fractional,
                0x453d14: (hundred + int(fractional > 99)) & 0xffffffff,
                0x453cfc: (thousand + int(total % 1000 == 0)) & 0xffffffff,
                0x453d04: max(0, countdown_a - 1), 0x453d08: max(0, countdown_b - 1)}
    for address, value in expected.items():
        assert peek(memory, address, 1 if address == 0x453d18 else 4) == value
    assert result['registers'][1] == before[1] + 4 and result['registers'][10:] == before[10:]
    assert result['termination'] == 'return' and not result['calls']
    return result


def validate():
    expanded, segments, _ = inputs()
    model = ModuleModel(segments, call_policy='fallthrough-hypothesis')
    counts = {}; visited = set()

    def record(name, result):
        counts[name] = counts.get(name, 0) + 1
        visited.update(result['visited'])

    for index in (*range(10), 0x40000000, 0x80000000, 0xc0000000):
        for pointer in (0, 0x242099, 0xffffffff, 0x12345678):
            memory = Memory([plain(TABLE, bytes([0xa5] * 40), 'callbacks')])
            before = regs(index, pointer); result = model.run(0x23e62c, memory, before)
            address = (TABLE + (index << 2)) & 0xffffffff
            assert memory.writes == [('callbacks', address, 4, pointer)]
            assert result['registers'][3] == address and result['registers'][10:] == before[10:]
            record('callback_set', result)

    for fill in (0, 0xa5, 255):
        memory = Memory([stack_region(), plain(TABLE, bytes([fill] * 40), 'callbacks')])
        before = regs(); result = model.run(0x23e63e, memory, before)
        assert all(peek(memory, TABLE + i * 4, 4) == 0 for i in range(10))
        assert [(address, value) for name, address, _, value in memory.writes if name == 'callbacks'] == [(TABLE+i*4, 0) for i in range(10)]
        assert result['registers'][1] == before[1] and result['registers'][10:] == before[10:]
        record('callback_clear', result)
        result, _ = initialization_tail(model, fill)
        record('initialization_tail_after_configuration_call', result)

    for index in range(4):
        for value in (0, 1, 255, 256, 0xffffffff):
            memory = Memory([plain(RECORDS, bytes(4 * 168), 'records')])
            result = model.run(0x23e709, memory, regs(index, value))
            assert memory.writes == [('records', RECORDS + index*168 + 0x34, 1, value & 255)]
            record('channel_record_byte', result)

    for total in (0, 1, 998, 999, 1000, 1999, 0xfffffffe, 0xffffffff):
        for fraction in range(256):
            record('dispatch_tail_after_timer_tick', dispatch_tail(model, total, fraction,
                    0xffffffff if fraction & 1 else 0, 0xffffffff if total & 1 else 0,
                    (0, 1, 2, 0xffffffff)[fraction & 3], (0, 1, 2, 0xffffffff)[(fraction + 1) & 3]))

    # Explicit early stop: registration passes these arguments to the recovered
    # wrapper, which still calls an unrecovered allocator/configuration layer.
    result = model.run(0x27081c, Memory([]), regs(), stop_before=(0x279e04,))
    assert result['registers'][3:8] == [0x270836, 0, 1, 1, 0x33cb9d]
    assert result['termination'] == 'breakpoint'
    record('timer_registration_prefix', result)
    assert expanded[0x13cb9d:0x13cba9] == b'Check timer\0'

    # Register arguments passed to the unrecovered configuration routine at
    # startup. This is a prefix, and is kept separate from the initialization tail.
    for a, b in ((0, 0), (5, 3), (255, 255)):
        config = bytearray(0x61); config[0x59], config[0x60] = a, b
        memory = Memory([stack_region(), plain(0x3b5f38, (0x600000).to_bytes(4, 'little'), 'config_pointer', False),
                         plain(0x600000, config, 'config', False)])
        result = model.run(0x2614a9, memory, regs(), stop_before=(0x2614bf,))
        assert result['registers'][3:5] == [a, b] and result['termination'] == 'breakpoint'
        record('initialization_configuration_prefix', result)

    targets = {0x23e62c, 0x23e63e, 0x2614a9, 0x27081c, 0x2417f1}
    refs = []
    for offset in range(len(expanded)):
        candidate = direct_target(expanded, offset)
        if candidate and candidate[0] in targets:
            refs.append({'site': hex(offset + 0x200000), 'target': hex(candidate[0]),
                         'instruction_boundary_in_source_layout': offset + 0x200000 in model.instructions})
    return {'source_layout_sha256': sha(LAYOUT.read_bytes()), **decoder_identity(),
            'status': 'strict model contracts and explicitly entered continuations; startup and physical timing unvalidated',
            'cases': counts, 'total_cases': sum(counts.values()),
            'visited_instruction_count': len(visited),
            'source_spans': [{'name': n, 'address': hex(a), 'end_exclusive': hex(b), 'size': b-a,
                             'sha256': sha(expanded[a-0x200000:b-0x200000]),
                             'visited_instructions': sum(a <= pc < b for pc in visited)} for n,a,b,_ in SPANS],
            'initialization_table': [{'index': i, 'address': hex(TABLE + i*4), 'value': hex(value)} for i, value in enumerate(EXPECTED)],
            'timer_callback_after_initialization': 0, 'delay_callback_after_initialization': 0,
            'timer_registration': {'name': 'Check timer', 'callback': '0x270836', 'arguments_4_5_6': [0, 1, 1],
                                   'wrapper': '0x279e04', 'external_calls': ['0x2a9646', '0x2a94d3', '0x2a94c4', '0x2a9488']},
            'direct_reference_candidates': refs,
            'limitations': ['Little-endian data, fallthrough links and low-halfword assumptions remain explicit.',
                            'Initialization configuration call 0x260824 is not executed. Tail fixtures supply its saved caller frame.',
                            'Dispatch tests start after timer_tick; their return is not a complete timer-dispatch validation.',
                            'Two callback slots are zero after the recovered setup path; runtime mutation/indirect writers remain possible.',
                            'Callback setter has no local index bound. Mapping failures establish only isolated memory bounds.',
                            'Timer registration numeric arguments do not establish milliseconds or physical tick rate.'],
            'tools_sha256': {name: sha((ROOT/'scripts'/name).read_bytes()) for name in (
                'validate_dc9_callbacks.py', 'reconstruct_dc9_callbacks.py', 'aeon_module_model.py', 'aeon_subset_assembler.py')}}


if __name__ == '__main__':
    report = validate()
    (ROOT / 'analysis/dc9-callback-validation.json').write_text(json.dumps(report, indent=2)+'\n')
    print(f"Callbacks and timer dispatch: {report['total_cases']} strict cases with explicit continuation boundaries")
