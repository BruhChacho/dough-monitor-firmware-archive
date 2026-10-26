"""Validate channel configuration up to the unmodeled hardware-apply call.

Four halfwords are interpreted as x/y/width/height from their archived patterns;
the tests prove record construction, not displayed output. Wide store policies
remain conditional, and the 24-bit stores retain the existing low-halfword model.
"""
import json
import struct

from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel
from build_dc9_source_baseline import ROOT, LAYOUT, sha
from reconstruct_dc9_configuration import SPANS
from validate_dc9_module import inputs, stack_region
from validate_dc9_transfer import plain, regs
from build_dc9_layout_experiment import encode_rectangles, DEFAULT_SOURCE, EXAMPLE_SOURCE

RECORDS = 0x4821ec
RECTANGLES = 0x3c5d10
DISPATCH = 0x328168
STOPS = (0x2608e5, 0x260abe)


def reset_contract(initial, template):
    out = bytearray(initial)
    for start, end in ((0, 1), (4, 8), (0x28, 0x31), (0x32, 0x3a),
                       (0x3c, 0x58), (0x59, 0x85), (0x88, 0x99), (0xa2, 0xa6)):
        out[start:end] = bytes(end-start)
    for start in (8, 16, 24, 32): out[start:start+8] = template
    out[0x58] &= 0xfe
    out[0xa5] = 1
    return out


def configure_contract(initial, rectangle, source, flag):
    out = bytearray(initial)
    out[0] = 1; out[4:8] = (1).to_bytes(4, 'little')
    data = struct.pack('<4H', *rectangle)
    out[0x18:0x20] = data; out[0x20:0x28] = data
    out[0x28], out[0x29] = source & 255, flag & 255
    for start, end in ((0x2a, 0x2f), (0x59, 0x74), (0x81, 0x85), (0x88, 0x94),
                       (0x98, 0x99), (0xa2, 0xa6)):
        out[start:end] = bytes(end-start)
    out[0x97] = out[0xa5] = 1
    return out


def fixture(expanded, *, fill=0xa5, position=(101, 203), rectangles=None):
    config = bytearray(0x6c)
    config[0x5b:0x5f] = bytes([0x11, 0x22, 0x33, 0x44])
    config[0x68:0x6c] = struct.pack('<2H', *position)
    data = expanded[RECTANGLES-0x200000:RECTANGLES-0x200000+192] if rectangles is None else rectangles
    memory = Memory([stack_region(), plain(RECORDS, bytes([fill] * (4*168)), 'records'),
                     plain(0x3b5f38, (0x600000).to_bytes(4, 'little'), 'config_pointer', False),
                     plain(0x600000, config, 'configuration', False),
                     plain(0x48256d, b'\x55', 'third_source', False),
                     plain(DISPATCH, expanded[DISPATCH-0x200000:DISPATCH-0x200000+24], 'dispatch', False),
                     plain(RECTANGLES, data, 'rectangles', False),
                     plain(0x2af620, expanded[0xaf620:0xaf628], 'reset_template', False)])
    return memory, data


def configuration_case(model, expanded, mode, submode, *, fill=0xa5, position=(101, 203), rectangles=None):
    memory, data = fixture(expanded, fill=fill, position=position, rectangles=rectangles)
    result = model.run(0x260824, memory, regs(mode, submode), stop_before=STOPS)
    assert result['termination'] == 'breakpoint' and result['stopped_before'] in STOPS
    record = next(r for r in memory.regions if r.name == 'records')
    original = bytearray([fill]*168)
    expected = [bytearray(original) for _ in range(4)]
    if 0 <= mode <= 5:
        expected = [reset_contract(original, expanded[0xaf620:0xaf628]) for _ in range(4)]
        number = (1, 2, 2, 2, 3, 4)[mode]
        for index in range(number):
            rect = list(struct.unpack_from('<4H', data, mode*32 + index*8))
            if mode == 0: rect = [0, 0, 3840, 2160]  # immediate stack defaults, not table group zero
            if mode == 1 and index == 1:
                if submode <= 3:
                    rect = [*position, (1344, 1536, 1728, 1920)[submode], (756, 864, 972, 1080)[submode]]
                rect[0] &= 0xfffc
            source = 0x55 if mode == 4 and index == 2 else (0x11, 0x22, 0x33, 0x44)[index]
            expected[index] = configure_contract(expected[index], rect, source, 0)
        if mode == 0: expected[0][0x95] = 1
    assert record.data == b''.join(expected), (mode, submode, model.store_policy)
    assert all(name in ('stack', 'records') for name, *_ in memory.writes)
    return result, memory


def validate():
    expanded, segments, _ = inputs()
    assert encode_rectangles(json.loads(DEFAULT_SOURCE.read_text())) == expanded[0x1c5d10:0x1c5dd0]
    strict = ModuleModel(segments, call_policy='fallthrough-hypothesis')
    policies = {p: ModuleModel(segments, call_policy='fallthrough-hypothesis', store_policy=p)
                for p in ('sleigh-store', 'halfword-lane-hypothesis')}
    counts = {'strict': {}, **{p: {} for p in policies}}; visited = {p: set() for p in counts}

    def record(group, name, result):
        counts[group][name] = counts[group].get(name, 0) + 1; visited[group].update(result['visited'])

    for argument in (*range(256), 0xffff, 0x80000000, 0xffffffff):
        for entry, values in ((0x260459, (1344,1536,1728,1920)), (0x26047c, (756,864,972,1080))):
            before = regs(argument); result = strict.run(entry, Memory([]), before)
            assert result['registers'][3] == (values[argument] if argument < 4 else 0)
            assert result['registers'][10:] == before[10:]
            record('strict', 'size_selection', result)
    for mode in (6, 7, 255, 0xffffffff):
        result, _ = configuration_case(strict, expanded, mode, 0)
        record('strict', 'invalid_layout_prefix', result)
    for index in range(4):
        for value in (0, 1, 255, 256, 0xffffffff):
            memory = Memory([plain(RECORDS, bytes(4*168), 'records')])
            result = strict.run(0x23e734, memory, regs(index, value))
            assert memory.writes == [('records', RECORDS+index*168+0x95, 1, value & 255)]
            record('strict', 'record_flag95', result)

    for policy, model in policies.items():
        for index in range(4):
            for fill in (0, 0x5a, 0xff):
                for template in (bytes(8), bytes.fromhex('0102030405060708')):
                    initial = bytes([fill] * 168)
                    memory = Memory([plain(RECORDS, initial * 4, 'records'), plain(0x2af620, template, 'template', False)])
                    result = model.run(0x23e8a2, memory, regs(index))
                    expected = bytearray(initial * 4)
                    expected[index*168:(index+1)*168] = reset_contract(initial, template)
                    assert memory.regions[0].data == expected
                    record(policy, 'record_reset', result)
                for rectangle in ((0,0,3840,2160), (101,203,1344,756), (65535,65535,65535,65535)):
                    memory = Memory([stack_region(), plain(RECORDS, bytes([fill] * (4*168)), 'records')])
                    before = regs(index, 0x1234, 0x5678)
                    before[6], before[7] = struct.unpack('<2I', struct.pack('<4H', *rectangle))
                    result = model.run(0x23e7f6, memory, before)
                    expected = bytearray([fill] * (4*168))
                    expected[index*168:(index+1)*168] = configure_contract(bytes([fill]*168), rectangle, 0x1234, 0x5678)
                    assert next(r for r in memory.regions if r.name == 'records').data == expected
                    assert result['registers'][1] == before[1]
                    record(policy, 'record_configure', result)
        for mode in range(6):
            for submode in (*range(8), 255, 0xffffffff):
                for position in ((0,0), (101,203), (65535,65535)):
                    result, _ = configuration_case(model, expanded, mode, submode, position=position)
                    record(policy, 'six_layout_prefix', result)
        # A meaningful data-source edit: asymmetric mode-2 split, with the same
        # overall 3840-wide geometry. Other modes must keep identical records.
        modified = bytearray(expanded[RECTANGLES-0x200000:RECTANGLES-0x200000+192])
        struct.pack_into('<4H', modified, 64, 0, 0, 1600, 2160)
        struct.pack_into('<4H', modified, 72, 1600, 0, 2240, 2160)
        assert modified == encode_rectangles(json.loads(EXAMPLE_SOURCE.read_text()))
        for mode in range(6):
            result, memory = configuration_case(model, expanded, mode, 0, rectangles=modified)
            _, baseline = configuration_case(model, expanded, mode, 0)
            output = next(r.data for r in memory.regions if r.name == 'records')
            old = next(r.data for r in baseline.regions if r.name == 'records')
            assert (output != old) == (mode == 2)
            record(policy, 'edited_mode2_prefix', result)

    return {'source_layout_sha256': sha(LAYOUT.read_bytes()), **decoder_identity(),
            'status': 'source-exact configuration with record contracts; execution stops before external hardware apply',
            'cases': counts, 'strict_cases': sum(counts['strict'].values()),
            'conditional_cases': sum(sum(counts[p].values()) for p in policies),
            'source_spans': [{'name': n, 'address': hex(a), 'size': b-a, 'sha256': sha(expanded[a-0x200000:b-0x200000]),
                              'instruction_count': sum(a <= pc < b for pc in strict.instructions),
                              'visited_by_policy': {p: sum(a <= pc < b for pc in v) for p,v in visited.items()}}
                             for n,a,b,_ in SPANS],
            'layout_records_uint16_le': [[list(struct.unpack_from('<4H', expanded, RECTANGLES-0x200000+m*32+i*8)) for i in range(4)] for m in range(6)],
            'dispatch_targets': [hex(struct.unpack_from('<I', expanded, DISPATCH-0x200000+i*4)[0]) for i in range(6)],
            'hardware_apply_target': '0x23fad0', 'stops_before_calls': [hex(x) for x in STOPS],
            'limitations': ['x/y/width/height interpretation is inferred from values and layout behavior, not display hardware execution.',
                            'All six-layout runs stop before applying records to hardware; no framebuffer, scaler or connector behavior is validated.',
                            '24-bit sh_2 follows existing low-halfword sh_1/lh assumptions; pinned SLEIGH uses register-subfield semantics.',
                            'Wide sw_1/sh remain rejected by default; both explicit policies agree here because those stores write zero.',
                            'Physical ISA, data endian, call ABI, runtime table mutation and layout reachability remain unverified.',
                            'Most of the application remains vendor input; editable data tables do not count as recovered executable code.'],
            'tools_sha256': {n: sha((ROOT/'scripts'/n).read_bytes()) for n in ('validate_dc9_configuration.py','reconstruct_dc9_configuration.py','aeon_module_model.py','aeon_subset_assembler.py')}}


if __name__ == '__main__':
    result = validate()
    (ROOT/'analysis/dc9-configuration-validation.json').write_text(json.dumps(result,indent=2)+'\n')
    print(f"Configuration: {result['strict_cases']} strict cases, {result['conditional_cases']} conditional cases")
