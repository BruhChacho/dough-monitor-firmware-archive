"""Validate engine register selection and consumers against bounded byte memory.

Strict means ambiguous stores reject, not physical ISA validation. Conditional
writes run both existing store hypotheses; no unknown services are stubbed.
"""
import json
from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel
from build_dc9_source_baseline import ROOT, LAYOUT, sha
from reconstruct_dc9_engine_control import SPANS
from validate_dc9_module import inputs
from validate_dc9_transfer import plain, regs, named
from validate_dc9_timer import seed, peek
from validate_dc9_masked import fixture as bus_fixture, POLICIES
from validate_dc9_registers import byte_address
from validate_dc9_metadata import ENGINES, METADATA, KEYS

BASES = (0, 0xfff30a00, 0xfff30c00, 0xfff30e00, 0xfff31000,
         0xfff30200, 0xfff30400, 0xfff30600, 0xfff31200)
TABLES = ((0x2af554, 36), (0x2af578, 36))


def add_tables(memory, expanded):
    memory.regions.extend(plain(a, expanded[a-0x200000:a-0x200000+n],
                                f'control_table_{a:x}', False) for a,n in TABLES)
    return Memory(memory.regions)


def fixture(expanded, *, keys=KEYS, mapping=tuple(i % 6 for i in range(13)), values=None):
    values = {} if values is None else values
    memory = bus_fixture(list(values), list(values.values()), 0)
    engines = bytearray(124*len(mapping)); metadata = bytearray(176*len(keys))
    for i,index in enumerate(mapping): engines[i*124+0x1d] = index
    for i,key in enumerate(keys): metadata[i*176:i*176+4] = key.to_bytes(4,'little')
    memory.regions.extend((plain(ENGINES, engines, 'engines'), plain(METADATA, metadata, 'metadata')))
    return add_tables(memory, expanded)


def apply_fixture(expanded):
    from validate_dc9_layout_setup import fixture as setup_fixture
    memory = setup_fixture(expanded, integrate=True)
    memory.regions.append(plain(0x455210, b'\0', 'range_mode'))
    # The first engine maps metadata index0/key5. Add only the byte its new
    # control read needs, including its real page selector. Existing regions
    # can alias the page selector; preserve their initial values.
    extra = bus_fixture([BASES[5]+4], [0xa5], 0)
    for region in extra.regions:
        if not region.name.startswith('bus_'): continue
        if not any(r.address <= region.address < r.address+len(r.data) for r in memory.regions):
            memory.regions.append(region)
    return add_tables(memory, expanded)


def data_writes(memory, logicals):
    targets = {byte_address(a) for a in logicals}
    return [(a,v) for _,a,_,v in memory.writes if a in targets]


def preserved(result, before):
    assert result['termination'] == 'return'
    assert result['registers'][1] == before[1]
    # register_write8 intentionally uses r23 as broadcast scratch.
    assert result['registers'][10:23] == before[10:23]
    assert result['registers'][24:] == before[24:]


def validate():
    expanded, segments, _ = inputs()
    strict = ModuleModel(segments, call_policy='fallthrough-hypothesis')
    counts = {}; conditional = {}; visited = set()
    def record(name, result, policy=None):
        group = counts if policy is None else conditional.setdefault(policy,{})
        group[name] = group.get(name,0)+1; visited.update(result['visited'])

    # Each metadata index and dispatch key is independent of engine index.
    for index in range(13):
        for key in (*range(10),255,0xffffffff):
            memory = fixture(expanded, keys=(key,)*6)
            before = regs(index); result = strict.run(0x21d3b1,memory,before)
            assert result['registers'][3] == (BASES[key] if key < 9 else 0)
            preserved(result,before)
            assert all(n=='stack' for n,_,_,_ in memory.writes)
            expected = [('engines',ENGINES+index*124+0x1d,1), ('metadata',METADATA+(index%6)*176,4)]
            if key < 9: expected.append(('control_table_2af554',0x2af554+4*key,4))
            assert [r for r in memory.reads if r[0]!='stack'] == expected
            record('base_selector_returns',result)
    for selector in (6,7,255):
        memory=fixture(expanded,mapping=(selector,));before=regs(0)
        result=strict.run(0x21d3b1,memory,before);preserved(result,before)
        assert result['registers'][3]==0
        assert [r for r in memory.reads if r[0]!='stack']==[('engines',ENGINES+0x1d,1)]
        record('metadata_index_guard_returns',result)

    readers=((0x21d709,0x42,1,4,1),(0x21d72c,0x45,1,0,255),
             (0x21d749,0x43,1,3,1),(0x21d76c,6,1,6,1),
             (0x21d78e,0xe,2,0,0x7fff),(0x21d7b1,0xc,2,0,0x1fff),
             (0x21d7d4,8,2,0,0x1fff),(0x21d7f7,0x3d,1,0,255),
             (0x21d8f7,4,1,0,255),(0x21d814,0x41,1,7,1))
    for entry,offset,width,shift,mask in readers:
        for index in (0,1,5,12):
            for key in range(9):
                for value in ((0,0x7f,0x80,0xff) if width==1 else (0,0x1fff,0x8000,0xffff)):
                    logical=BASES[key]+offset
                    memory=fixture(expanded,keys=(key,)*6,values={logical+i:(value>>(8*i))&255 for i in range(width)})
                    before=regs(index);result=strict.run(entry,memory,before);preserved(result,before)
                    assert result['registers'][3] == ((value>>shift)&mask if key else 0)
                    assert not data_writes(memory,[logical+i for i in range(width)])
                    assert [(a,n) for name,a,n in memory.reads if name.startswith('bus_')]==([(byte_address(logical+i),1) for i in reversed(range(width))] if key else [])
                    page_writes=[(0xa0000000+2*((logical+i)&0x7fff00),1,((logical+i)>>24)&255) for i in reversed(range(width))] if key else []
                    assert [(a,n,v) for name,a,n,v in memory.writes if name!='stack']==page_writes
                    assert result['registers'][10:]==before[10:]
                    record('register_reader_returns',result)

    for index in (0,1,5,12):
        for raw in (0,1,0x1fff,0x8000,0xffff):
            for factor_a in (0,1,255):
                for factor_b in (0,1,2,255):
                    key=KEYS[index%6];logical=BASES[key]+0x50
                    memory=fixture(expanded,values={logical:raw&255,logical+1:raw>>8})
                    seed(memory,METADATA+(index%6)*176+0x88,factor_a,1)
                    seed(memory,METADATA+(index%6)*176+0x89,factor_b,1)
                    before=regs(index);result=strict.run(0x21d913,memory,before);preserved(result,before)
                    assert result['registers'][3]==(((raw&0x1fff)+1)*(factor_a+1)*factor_b-1)&65535
                    assert not data_writes(memory,[logical,logical+1])
                    record('metadata_scaled_size_returns',result)

    # Empty masks return without touching metadata or register data.
    bit_writers=((0x21d4c1,0x90,0x20),(0x21d51e,0x90,0x10),(0x21d57b,0x90,8),
                 (0x21d650,0x90,1),(0x21d6ac,0x90,0x40),(0x21d89d,5,4))
    for entry,_,_ in (*bit_writers,(0x21d5ef,0x90,6)):
        memory=fixture(expanded);before=regs(0,1) if entry==0x21d89d else regs(1,0)
        result=strict.run(entry,memory,before);preserved(result,before)
        assert all(n=='stack' for n,_,_ in memory.reads)
        assert all(n=='stack' for n,_,_,_ in memory.writes)
        record('empty_mask_returns',result)

    # Assert logical arguments before register helpers, because the plain bus
    # aliases page windows and could otherwise hide a wrong high address byte.
    for entry,offset,bits in bit_writers:
        for index in range(13):
            for enabled in (0,1):
                memory=fixture(expanded)
                before=regs(1<<index,enabled) if entry==0x21d89d else regs(enabled,1<<index)
                result=strict.run(entry,memory,before,stop_before=(0x23dead,))
                logical=BASES[KEYS[index%6]]+offset+(0x2800000 if entry==0x21d57b and not index&1 else 0)
                assert result['termination']=='breakpoint'
                assert result['registers'][3:6]==[logical&0xffffffff,enabled,bits]
                assert all(n=='stack' for n,_,_,_ in memory.writes)
                record('selected_bit_update_argument_prefixes',result)
    for index in range(13):
        for value in (0,3,4,0xffffffff):
            memory=fixture(expanded)
            result=strict.run(0x21d5ef,memory,regs(value,1<<index),stop_before=(0x23dfe1,))
            assert result['termination']=='breakpoint'
            assert result['registers'][3:6]==[BASES[KEYS[index%6]]+0x90,(value&3)<<1,6]
            assert all(n=='stack' for n,_,_,_ in memory.writes)
            record('selected_field_update_argument_prefixes',result)

    for key,bits in ((1,0x10),(2,0x20),(3,0x40),(4,0x80),(5,1),(6,2),(7,4),(8,1)):
        for enabled in (0,1,0xffffffff):
            memory=fixture(expanded,keys=(key,)*6)
            result=strict.run(0x21d977,memory,regs(0,enabled),stop_before=(0x23dead,))
            assert result['termination']=='breakpoint'
            assert result['registers'][3:6]==[0xfff01f84 if key==8 else 0xfff01f83,enabled,bits]
            assert all(n=='stack' for n,_,_,_ in memory.writes)
            record('metadata_key_update_argument_prefixes',result)

    for policy in POLICIES:
        model=ModuleModel(segments,call_policy='fallthrough-hypothesis',store_policy=policy)
        for entry,offset,bits in bit_writers:
            for mask in (1,2,0x15,0x1fff):
                for enabled in (0,1,0xffffffff):
                    logicals=[BASES[KEYS[i%6]]+offset+(0x2800000 if entry==0x21d57b and not i&1 else 0) for i in range(13)]
                    memory=fixture(expanded,values={a:0xa5 for a in logicals})
                    before=regs(mask,enabled) if entry==0x21d89d else regs(enabled,mask)
                    result=model.run(entry,memory,before);preserved(result,before)
                    expected={byte_address(a):0xa5 for a in logicals};writes=[]
                    for i,logical in enumerate(logicals):
                        if not mask&(1<<i):continue
                        address=byte_address(logical);value=(expected[address]|bits) if enabled else (expected[address]&~bits)
                        expected[address]=value;writes.append((address,value))
                    assert data_writes(memory,logicals)==writes
                    assert all(peek(memory,a)==v for a,v in expected.items())
                    assert peek(memory,0x4551a8,2)==0 and peek(memory,0xa0203034)==0
                    record('selected_engine_bit_updates',result,policy)
        for value in (0,1,2,3,4,255,0xffffffff):
            for mask in (1,2,0x15,0x1fff):
                logicals=[BASES[KEYS[i%6]]+0x90 for i in range(13)]
                memory=fixture(expanded,values={a:0xa5 for a in logicals})
                before=regs(value,mask);result=model.run(0x21d5ef,memory,before);preserved(result,before)
                expected=(0xa5&~6)|((value&3)<<1)
                assert data_writes(memory,logicals)==[(byte_address(logicals[i]),expected) for i in range(13) if mask&(1<<i)]
                record('selected_engine_field_updates',result,policy)
        for index in range(6):
            for mode in (0,1,2,3,4,255):
                base=BASES[KEYS[index]];logicals=(base+0xf,base+0x11)
                memory=fixture(expanded,values={a:0x25 for a in logicals})
                seed(memory,METADATA+index*176+0x89,mode,1)
                before=regs(index);result=model.run(0x21d430,memory,before);preserved(result,before)
                expected=[] if mode not in (1,2,4) else [(byte_address(logicals[0]),0xa5 if mode==2 else 0x25),(byte_address(logicals[1]),0xa5 if mode==4 else 0x25)]
                assert data_writes(memory,logicals)==expected
                record('metadata_mode_updates',result,policy)
        for index in range(6):
            for enabled in (0,1,0xffffffff):
                logical=BASES[KEYS[index]]+7
                memory=fixture(expanded,values={logical:0x25})
                before=regs(enabled,index);result=model.run(0x21d86d,memory,before);preserved(result,before)
                assert data_writes(memory,[logical])==[(byte_address(logical),0xa5 if enabled else 0x25)]
                record('engine_bit80_updates',result,policy)
        for key in (*range(10),255,0xffffffff):
            for enabled in (0,1):
                logical=0xfff01f84 if key==8 else 0xfff01f83
                memory=fixture(expanded,keys=(key,)*6,values={logical:0xa5})
                before=regs(0,enabled);result=model.run(0x21d977,memory,before);preserved(result,before)
                bits={1:0x10,2:0x20,3:0x40,4:0x80,5:1,6:2,7:4,8:1}.get(key)
                expected=[] if bits is None else [(byte_address(logical),(0xa5|bits) if enabled else (0xa5&~bits))]
                assert data_writes(memory,[logical])==expected
                record('metadata_key_bit_updates',result,policy)
        # Disable control completes for both engine parities when global mode
        # byte engines+0x89 avoids the unresolved special mode9/10 branch.
        for index in range(13):
            logical=BASES[KEYS[index%6]]+4
            memory=fixture(expanded,values={logical:0xa5})
            before=regs(0,index);result=model.run(0x220a8b,memory,before);preserved(result,before)
            assert data_writes(memory,[logical])==[(byte_address(logical),0x25)]
            record('control_disable_returns',result,policy)
        memory=apply_fixture(expanded)
        # Stops at the actual call instruction before unresolved 0x22607c.
        result=model.run(0x23fad0,memory,regs(),stop_before=(0x220bc7,))
        assert result['termination']=='breakpoint' and result['registers'][3:5]==[1,1]
        assert len([t for _,t,_ in result['calls'] if t==0x20f1ef])==6
        assert [t for _,t,_ in result['calls'] if t in (0x21d3b1,0x21d8f7)]==[0x21d3b1,0x21d8f7,0x21d3b1]
        record('full_apply_before_engine_enable_service',result,policy)

    return {'source_layout_sha256':sha(LAYOUT.read_bytes()),**decoder_identity(),
        'status':'engine control helpers return; historical apply prefix retained at enable-service entry',
        'cases':counts,'strict_cases':sum(counts.values()),'conditional_cases_by_policy':conditional,
        'conditional_cases':sum(sum(v.values()) for v in conditional.values()),'visited_instruction_count':len(visited),
        'source_spans':[{'name':n,'address':hex(a),'end_exclusive':hex(b),'size':b-a,'sha256':sha(expanded[a-0x200000:b-0x200000]),'visited_instructions':sum(a<=pc<b for pc in visited)} for n,a,b,_ in SPANS],
        'key_to_logical_base':[hex(a) for a in BASES],
        'limitations':['Physical ISA, CALL, endianness and counter-store semantics remain hypotheses.',
            'Plain bus bytes do not implement page isolation, hardware effects, time or interrupts.',
            'This validator retains the historical apply prefix at0x22607c; engine-enable validation continues it.',
            'Mapping13 software engine records does not establish physical engine count or complete uint32 inputs.'],
        'tools_sha256':{n:sha((ROOT/'scripts'/n).read_bytes()) for n in ('validate_dc9_engine_control.py','reconstruct_dc9_engine_control.py','aeon_module_model.py','aeon_subset_assembler.py')}}

if __name__=='__main__':
    report=validate();(ROOT/'analysis/dc9-engine-control-validation.json').write_text(json.dumps(report,indent=2)+'\n')
    print(f"Engine control: {report['strict_cases']} strict, {report['conditional_cases']} conditional")
