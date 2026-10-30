"""Validate recovered metadata routing with explicit RAM/register fixtures.

Complete mask-preparation runs below use conditional counter-store policies.
The register space is plain memory, not a peripheral or page-window emulator.
Geometry and whole-apply runs stop before remaining services; no calls are stubbed.
"""
import json

from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel
from build_dc9_source_baseline import ROOT, LAYOUT, sha
from reconstruct_dc9_metadata import SPANS
from validate_dc9_module import inputs, stack_region
from validate_dc9_transfer import plain, regs, named
from validate_dc9_timer import seed, peek
from validate_dc9_registers import byte_address
from validate_dc9_masked import fixture as register_fixture, POLICIES

ENGINES = 0x47fa9c
METADATA = 0x3b4950
RECORDS = 0x4821ec
KEYS = (5, 6, 4, 2, 1, 3)


def bank(key):
    return ((key+3) if key <= 4 else (key-5) if key <= 7 else key) & 255


def logical_register(key):
    return (0xfff30380 + bank(key)*512) & 0xffffffff


def fixture(keys=KEYS, mapping=(0, 1, 2, 3), *, flags=(0, 0, 0), counter=0):
    logicals = sorted({logical_register(k)+i for k in keys for i in range(4)})
    memory = register_fixture(logicals, [0xa5]*len(logicals), counter)
    engines = bytearray(124*len(mapping))
    metadata = bytearray(176*len(keys))
    for index, value in enumerate(mapping):
        engines[index*124+0x10] = index % 4
        engines[index*124+0x1d] = value
    for index, key in enumerate(keys):
        metadata[index*176:index*176+4] = key.to_bytes(4,'little')
        metadata[index*176+4:index*176+8] = flags[2].to_bytes(4,'little')
        metadata[index*176+0x8a] = flags[0]
        metadata[index*176+0x8b] = flags[1]
    memory.regions += [plain(ENGINES, engines, 'engines'), plain(METADATA, metadata, 'metadata'),
                       plain(RECORDS, bytes(4*168), 'records')]
    # Recheck every region after combining fixtures; do not hide overlaps.
    return Memory(memory.regions)


def preparation_case(model, mask, enabled, flags=(0, 0, 0)):
    memory = fixture(flags=flags)
    before = regs(enabled, mask)
    result = model.run(0x23d3a0, memory, before)
    assert result['termination'] == 'return'
    expected_registers = before[10:].copy()
    if mask:
        # Existing register_write8 loads broadcast_mask into r23 at 0x23ddca
        # without saving it. The zero-mask fixture therefore clobbers r23.
        expected_registers[23-10] = 0
    assert result['registers'][1] == before[1] and result['registers'][10:] == expected_registers
    expected = {region.address: region.data[0] for region in fixture().regions if region.name.startswith('bus_')}
    expected_writes = []
    update_mask = 6 if flags[0] and flags[2] & 0x20 else 0x86
    for index in range(4):
        if not mask & (1 << index): continue
        logical = logical_register(KEYS[index])
        # First helper writes mask0x86 at +2, second masks the word at +0.
        value = ((0xa5a5 & ~update_mask) | (update_mask if enabled == 0 else 0)) & 65535
        for offset, byte in ((2, 0x86), (3, 0), (0, value & 255), (1, value >> 8)):
            address = byte_address(logical+offset)
            expected[address] = byte; expected_writes.append((address, byte))
    actual = {region.address: region.data[0] for region in memory.regions if region.name.startswith('bus_')}
    assert actual == expected
    # Page-selection writes have a low register offset of zero; data writes
    # below have offsets 0x80..0x83, so separate their physical addresses.
    data_addresses = {byte_address(logical_register(k)+i) for k in KEYS for i in range(4)}
    writes = [(address, value) for name,address,_,value in memory.writes if name.startswith('bus_') and address in data_addresses]
    assert writes == expected_writes
    assert not any(name in ('metadata','engines','records') for name,_,_,_ in memory.writes)
    assert peek(memory, 0x4551a8, 2) == 0 and peek(memory, 0xa0203034) == 0
    return result, memory


def validate():
    expanded, segments, _ = inputs()
    strict = ModuleModel(segments, call_policy='fallthrough-hypothesis')
    counts = {}; conditional = {}; visited = set()

    def record(name, result, policy=None):
        target = counts if policy is None else conditional.setdefault(policy, {})
        target[name] = target.get(name, 0)+1
        visited.update(result['visited'])

    accessors = ((0x2227da, RECORDS, 168, 0x28, 1, 4),
                 (0x2227ef, ENGINES, 124, 0x10, 1, 4),
                 (0x222804, ENGINES, 124, 0x1d, 1, 4),
                 (0x222819, METADATA, 176, 0x10, 1, 6),
                 (0x22282e, METADATA, 176, 0x12, 2, 6))
    for entry, base, stride, offset, width, length in accessors:
        for index in range(length):
            for value in ((0,1,127,128,255) if width == 1 else (0,1,255,256,32768,65535)):
                memory = Memory([plain(base, bytes([0xa5] * (length*stride)), 'table', False)])
                seed(memory, base+index*stride+offset, value, width)
                result = strict.run(entry, memory, regs(index))
                assert result['termination'] == 'return' and result['registers'][3] == value
                assert memory.reads == [('table', base+index*stride+offset, width)] and not memory.writes
                record('indexed_accessors', result)

    for key in (*range(9), 255, 256, 0xffffffff):
        for index in range(4):
            memory = fixture(keys=(key,)*6)
            result = strict.run(0x21d1e5, memory, regs(index,0x12345678), stop_before=(0x23dfb6,))
            assert result['termination'] == 'breakpoint'
            assert result['registers'][3:5] == [logical_register(key)+2, 0x12345678]
            assert all(name == 'stack' for name,_,_,_ in memory.writes)
            record('bank_selection_write_prefix', result)
            for enabled in (0,1,0xffffffff):
                memory = fixture(keys=(key,)*6)
                result = strict.run(0x21d2bf, memory, regs(enabled,index,0x1234abcd), stop_before=(0x23e152,))
                assert result['registers'][3:6] == [logical_register(key), 65535 if enabled == 0 else 0, 0x1234abcd]
                assert result['termination'] == 'breakpoint'
                assert all(name == 'stack' for name,_,_,_ in memory.writes)
                record('bank_selection_update_prefix', result)

    for index in range(4):
        for a in (0,1):
            for b in (0,1):
                for bits in (0,8,0x20,0x28):
                    memory = fixture(flags=(a,b,bits))
                    result = strict.run(0x23d3a0, memory, regs(7,1<<index), stop_before=(0x23d44f,0x23d4b9))
                    special = bool((a or b) and bits & 8)
                    assert result['stopped_before'] == (0x23d4b9 if special else 0x23d44f)
                    assert result['registers'][3:5] == ([KEYS[index],3] if special else [index,0x86])
                    assert result['registers'][14] == (6 if a and bits & 0x20 else 0x86)
                    assert all(name == 'stack' for name,_,_,_ in memory.writes)
                    record('metadata_branch_prefix', result)

    for index in range(4):
        for flags in range(256):
            for active in (0,1):
                memory = fixture()
                seed(memory, METADATA+index*176+0x20, flags)
                seed(memory, RECORDS+index*168+0x81, active)
                before = regs(index)
                result = strict.run(0x23d4fc, memory, before, stop_before=(0x23d58d,))
                rejected = bool(flags & 0x20 or (flags & 12 and not active))
                assert result['termination'] == ('return' if rejected else 'breakpoint')
                if rejected:
                    assert result['registers'][3] == 0 and result['registers'][1] == before[1]
                    assert result['registers'][10:] == before[10:]
                assert all(name == 'stack' for name,_,_,_ in memory.writes)
                record('geometry_guard_return' if rejected else 'geometry_guard_prefix', result)

    for value in (0,1,0xffffffff):
        result = strict.run(0x23d3a0, Memory([stack_region()]), regs(value,0))
        assert result['termination'] == 'return' and not result['calls']
        record('empty_mask_return', result)

    for policy in POLICIES:
        model = ModuleModel(segments, call_policy='fallthrough-hypothesis', store_policy=policy)
        for mask in range(16):
            for enabled in (0,1,0xffffffff):
                for flags in ((0,0,0),(1,0,0x20),(0,1,0)):
                    result, _ = preparation_case(model,mask,enabled,flags)
                    record('complete_mask_preparation',result,policy)
        memory = fixture()
        result = model.run(0x23fad0, memory, regs(), stop_before=(0x22acd1,))
        assert result['termination'] == 'breakpoint'
        # First reset record is reached after all four selected mask updates.
        actual = named(memory,'metadata').data
        expected = named(fixture(),'metadata').data
        expected[16] = 4; expected[18:20] = bytes(2); expected[12:16] = bytes(4); expected[112] = 0
        assert actual == expected
        assert result['registers'][3:6] == [0, KEYS[0], 0]
        record('apply_entry_through_mask_preparation_prefix', result, policy)

    dependencies=[]
    for pc,(_,op,args) in sorted(strict.instructions.items()):
        if op in ('bg.jal','bg.j') and any(start <= pc < end for _,start,end,_ in SPANS):
            target=int(args[0],0)
            if target not in strict.instructions:
                dependencies.append({'site':hex(pc),'target':hex(target),'kind':op})
    return {'source_layout_sha256':sha(LAYOUT.read_bytes()), **decoder_identity(),
            'status':'metadata guards and conditional complete mask preparation; full apply remains partial',
            'cases':counts,'strict_cases':sum(counts.values()),'conditional_cases_by_policy':conditional,
            'conditional_cases':sum(sum(x.values()) for x in conditional.values()),
            'visited_instruction_count':len(visited),
            'source_spans':[{'name':name,'address':hex(start),'end_exclusive':hex(end),'size':end-start,
                             'sha256':sha(expanded[start-0x200000:end-0x200000]),
                             'visited_instructions':sum(start <= pc < end for pc in visited)} for name,start,end,_ in SPANS],
            'unrecovered_dependencies':dependencies,
            'observations':{'engine_metadata_index':'byte[0x47fa9c + engine*124 +0x1d]',
                            'metadata_key':'uint32[0x3b4950 + metadata_index*176]',
                            'bank':'key<=4:low8(key+3); key<=7:low8(key-5); otherwise low8(key)',
                            'mask_register':'0xfff30382 + bank*512', 'update_register':'0xfff30380 + bank*512',
                            'register_clobber':'nonempty tested mask preparation leaves r23=0 via register_write8 loading broadcast mask',
                            'apply_stop_before':'0x22acd1 (call0x20f1ef)'},
            'limitations':['All bus, page-selection and lock addresses are ordinary bytes without device side effects.',
                           'Complete mask-preparation runs require an explicit ambiguous counter-store policy; default still rejects it.',
                           'Full apply stops before metadata service0x20f1ef. Special metadata branch stops before0x20ece9; geometry stops before0x2686dd.',
                           'The engine channel read occurs before the geometry index>3 guard; mapped-memory bounds are not caller validation.',
                           'Metadata key/bank relationships are observed address calculations, not physical connector assignments.',
                           'Low-byte extbs, little-endian data and fallthrough CALL remain explicit model assumptions; variable shifts>=32 rejected.'],
            'tools_sha256':{name:sha((ROOT/'scripts'/name).read_bytes()) for name in ('validate_dc9_metadata.py','reconstruct_dc9_metadata.py','validate_dc9_masked.py','aeon_module_model.py','aeon_subset_assembler.py')}}


if __name__ == '__main__':
    report=validate()
    (ROOT/'analysis/dc9-metadata-validation.json').write_text(json.dumps(report,indent=2)+'\n')
    print(f"Metadata: {report['strict_cases']} strict and {report['conditional_cases']} conditional cases")
