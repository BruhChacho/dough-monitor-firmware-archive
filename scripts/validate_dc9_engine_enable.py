"""Validate enabled control/setup with explicit memory and store hypotheses.

No missing service is stubbed. Complete helper/setup returns below describe
bounded fixtures only; neither full display apply nor hardware is established.
"""
import json
from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel
from build_dc9_source_baseline import ROOT, LAYOUT, sha
from reconstruct_dc9_engine_enable import SPANS
from validate_dc9_module import inputs, stack_region
from validate_dc9_transfer import plain, regs, named
from validate_dc9_timer import seed, peek
from validate_dc9_masked import fixture as bus_fixture, POLICIES
from validate_dc9_registers import byte_address
from validate_dc9_engine_control import apply_fixture as previous_apply_fixture, BASES
from validate_dc9_metadata import ENGINES, METADATA, KEYS
from validate_dc9_layout_setup import initialized


def enable_fixture(banks):
    logicals=[(bank+0x10800032)&0xffffffff for bank in banks]
    memory=bus_fixture(logicals,[0xa5]*len(logicals),0)
    engines=bytearray(len(banks)*124)
    for i,bank in enumerate(banks):engines[i*124+4:i*124+8]=bank.to_bytes(4,'little')
    memory.regions.append(plain(ENGINES,engines,'engines'))
    return Memory(memory.regions)


def add_bus(memory,logicals):
    for region in bus_fixture(logicals,[0xa5]*len(logicals),0).regions:
        if not region.name.startswith('bus_'):continue
        if not any(r.address<=region.address<r.address+len(r.data) for r in memory.regions):
            memory.regions.append(region)
    return Memory(memory.regions)


def apply_fixture(expanded):
    memory=previous_apply_fixture(expanded)
    # Literal broadcast-mask stores touch two extra neighboring bytes. Preserve
    # them as visible sentinels rather than treating both store policies alike.
    named(memory,'broadcast_mask').data.extend(b'\xa5\x5a')
    named(memory,'broadcast_mask').writable=True
    logicals=[BASES[key]+4 for key in KEYS]
    logicals += [0x20902f32,0x0f902fac,0,0x32,0xac]
    # Broadcast mask0xa chooses engine-pairs0 and2. Zero bank fixtures alias
    # both destinations at bus+0x64 / bus+0x158; page writes land at bus+0.
    memory=add_bus(memory,logicals)
    for key in KEYS:seed(memory,byte_address(BASES[key]+4),0x25,1)
    return memory


def data_writes(memory,logicals):
    addresses={byte_address(a) for a in logicals}
    return [(a,v) for _,a,_,v in memory.writes if a in addresses]


def validate():
    expanded,segments,_=inputs()
    strict=ModuleModel(segments,call_policy='fallthrough-hypothesis')
    counts={};conditional={};visited=set()
    def record(name,result,policy=None):
        group=counts if policy is None else conditional.setdefault(policy,{})
        group[name]=group.get(name,0)+1;visited.update(result['visited'])

    banks=[0x200+(i//2)*0x100 for i in range(13)]
    for index in range(13):
        for enabled in (0,1,0xffffffff):
            memory=enable_fixture(banks)
            result=strict.run(0x22607c,memory,regs(1<<index,enabled),stop_before=(0x23dead,))
            assert result['termination']=='breakpoint'
            assert result['registers'][3:6]==[banks[index]+0x10800032,enabled,2 if index&1 else 0x20]
            assert all(n=='stack' for n,_,_,_ in memory.writes)
            assert [r for r in memory.reads if r[0]=='engines']==[('engines',ENGINES+index*124+4,4)]
            record('enable_logical_argument_prefixes',result)
    memory=Memory([stack_region()]);before=regs(0,1)
    result=strict.run(0x22607c,memory,before)
    assert result['termination']=='return' and result['registers'][1]==before[1]
    assert result['registers'][10:]==before[10:]
    record('empty_enable_mask_return',result)

    for value in (0,1,255,256,32768,65535):
        memory=Memory([plain(0x343c14,value.to_bytes(2,'little'),'global_halfword',False)])
        result=strict.run(0x21bd1e,memory,regs())
        assert result['termination']=='return' and result['registers'][3]==value
        assert memory.reads==[('global_halfword',0x343c14,2)] and not memory.writes
        record('global_halfword_returns',result)

    pair=(0x10902f1a,0x10902b1a)
    for value in (0,1,0x12345678,0xffffffff):
        for mode,flag in ((0,0),(0,1),(1,0),(1,1),(255,1)):
            logicals=[a+i for a in pair for i in range(2)]
            memory=bus_fixture(logicals,[0xa5]*4,0)
            memory.regions.append(plain(0x455210,bytes((mode,flag)),'pair_mode'))
            stops=() if mode==flag==0 else (0x220a51,) if mode==0 else (0x2209d1,)
            result=strict.run(0x220995,memory,regs(value),stop_before=stops)
            if not stops:
                assert result['termination']=='return'
                assert data_writes(memory,logicals)==[(byte_address(a+i),(value>>(i*8))&255) for a in pair for i in range(2)]
                record('direct_register_pair_returns',result)
            else:
                assert result['termination']=='breakpoint'
                if mode:assert result['registers'][3:5]==[pair[0],value]
                else:assert peek(memory,0x455210)==1
                assert not any(n.startswith('bus_') for n,_,_,_ in memory.writes)
                record('deferred_pair_service_prefixes',result)

    for policy in POLICIES:
        model=ModuleModel(segments,call_policy='fallthrough-hypothesis',store_policy=policy)
        for mask in (0,1,2,3,0x1555,0xaaa,0x1fff):
            for enabled in (0,1,0xffffffff):
                memory=enable_fixture(banks);before=regs(mask,enabled)
                result=model.run(0x22607c,memory,before)
                assert result['termination']=='return' and result['registers'][1]==before[1]
                assert result['registers'][10:23]==before[10:23]
                logicals=[bank+0x10800032 for bank in banks]
                expected={byte_address(a):0xa5 for a in logicals};writes=[]
                for i,a in enumerate(logicals):
                    if not mask&(1<<i):continue
                    bits=2 if i&1 else 0x20;address=byte_address(a)
                    expected[address]=(expected[address]|bits) if enabled else (expected[address]&~bits)
                    writes.append((address,expected[address]))
                assert data_writes(memory,logicals)==writes
                assert all(peek(memory,a)==v for a,v in expected.items())
                assert not any(n=='engines' for n,_,_,_ in memory.writes)
                record('selected_engine_enable_returns',result,policy)
        for value in (0,0xa,0x12345678,0xffffffff):
            for enabled in (0,1,0xffffffff):
                memory=Memory([plain(0x455214,b'\x11\x22\xa5\x5a','broadcast_mask')])
                result=model.run(0x23e13b,memory,regs(value,enabled))
                v=value if enabled else 0;width=4 if policy=='sleigh-store' else 2
                expected=v.to_bytes(4,'little') if width==4 else (v&65535).to_bytes(2,'little')+b'\xa5\x5a'
                assert named(memory,'broadcast_mask').data==expected and result['termination']=='return'
                assert memory.writes==[('broadcast_mask',0x455214,width,v&((1<<(width*8))-1))]
                record('broadcast_mask_store_returns',result,policy)
        for index in range(13):
            memory=apply_fixture(expanded)
            result=model.run(0x220a8b,memory,regs(1,index))
            assert result['termination']=='return'
            logical=BASES[KEYS[index if index<4 else 0]]+4
            assert peek(memory,byte_address(logical))==0xa5
            assert peek(memory,0x455214,2)==0
            record('enabled_control_normal_mode_returns',result,policy)
        for index in (0,1,3,12):
            selected=index if index<4 else 0
            logical=BASES[KEYS[selected]]+4
            for state in (0,1,0xffffffff):
                for flags in (0,4,8,12):
                    memory=apply_fixture(expanded)
                    seed(memory,METADATA+selected*176+0xc,state,4)
                    seed(memory,METADATA+selected*176+0x20,flags,1)
                    for channel in (0,1):
                        seed(memory,0x4821ec+channel*168+4,1,4)
                        seed(memory,0x4821ec+channel*168+0x28,selected,1)
                    result=model.run(0x220a8b,memory,regs(1,index))
                    assert result['termination']=='return'
                    assert peek(memory,byte_address(logical))==(0xa5 if flags or state==0 else 0x25)
                    assert len([t for _,t,_ in result['calls'] if t==0x23ee2c])==int(not flags)
                    assert len([t for _,t,_ in result['calls'] if t==0x23ea03])==int(not flags)
                    record('enabled_control_metadata_gate_returns',result,policy)
        for mode in (9,10):
            for size in (0,1000):
                memory=apply_fixture(expanded)
                seed(memory,ENGINES+0x89,mode,1)
                named(memory,'range_mode').data.extend(b'\0')
                memory.regions.append(plain(0x343c14,size.to_bytes(2,'little'),'global_halfword',False))
                memory=add_bus(memory,[0x1a,0x1b,0x10902f1a,0x10902f1b,0x10902b1a,0x10902b1b])
                result=model.run(0x220a8b,memory,regs(1,1))
                assert result['termination']=='return'
                assert len([t for _,t,_ in result['calls'] if t==0x21bd1e])==1
                assert len([t for _,t,_ in result['calls'] if t==0x220995])==1
                value=(size-1)&65535
                assert data_writes(memory,[0x1a,0x1b])==[(byte_address(0x1a+i),(value>>(8*i))&255) for _ in range(2) for i in range(2) for _ in range(2)]
                assert peek(memory,0x455214,2)==0
                record('enabled_special_mode_pair_returns',result,policy)
        for mask in (0,1,2,3,0x1555,0xaaa,0x1fff):
            memory=apply_fixture(expanded);before=bytes(named(memory,'engines').data)
            result=model.run(0x22dc46,memory,regs(mask,1))
            assert result['termination']=='return'
            assert named(memory,'engines').data==initialized(before,mask,expanded[0xaf620:0xaf628])
            assert len([t for _,t,_ in result['calls'] if t==0x220a8b])==mask.bit_count()
            assert len([t for _,t,_ in result['calls'] if t==0x22607c])==mask.bit_count()
            record('complete_enabled_record_setup_returns',result,policy)
        memory=apply_fixture(expanded)
        result=model.run(0x23fad0,memory,regs(),max_steps=100000,stop_before=(0x22ac52,))
        assert result['termination']=='breakpoint' and result['registers'][3]==0
        assert len([t for _,t,_ in result['calls'] if t==0x220a8b])==13
        assert len([t for _,t,_ in result['calls'] if t==0x22d986])==13
        assert len([t for _,t,_ in result['calls'] if t==0x20f1ef])==6
        assert [t for _,t,_ in result['calls'] if t==0x222fca]==[0x222fca]
        for index in range(13):
            assert peek(memory,ENGINES+index*124+0x10)==4
        for index in range(4):
            assert peek(memory,0x47fa3c+index*24)==0
            assert peek(memory,0x47fa3c+index*24+21)==0
        record('full_apply_after_enabled_setup_prefix',result,policy)

    return {'source_layout_sha256':sha(LAYOUT.read_bytes()),**decoder_identity(),
        'status':'enabled control and selected record setup return under explicit store hypotheses; full apply remains partial',
        'cases':counts,'strict_cases':sum(counts.values()),'conditional_cases_by_policy':conditional,
        'conditional_cases':sum(sum(v.values()) for v in conditional.values()),'visited_instruction_count':len(visited),
        'source_spans':[{'name':n,'address':hex(a),'end_exclusive':hex(b),'size':b-a,'sha256':sha(expanded[a-0x200000:b-0x200000]),'visited_instructions':sum(a<=pc<b for pc in visited)} for n,a,b,_ in SPANS],
        'limitations':['Conditional stores, CALL, endianness and low-byte/halfword semantics remain unproven CPU hypotheses.',
            'Bus bytes do not model pages, time, interrupts or peripherals; synthetic zero-bank setup fixtures alias broadcast targets.',
            'Selected enabled mode9/10 cases return; deferred and special disable paths remain incomplete. Full setup returns are bounded fixtures, not display operation.'],
        'tools_sha256':{n:sha((ROOT/'scripts'/n).read_bytes()) for n in ('validate_dc9_engine_enable.py','reconstruct_dc9_engine_enable.py','aeon_module_model.py','aeon_subset_assembler.py')}}

if __name__=='__main__':
    report=validate();(ROOT/'analysis/dc9-engine-enable-validation.json').write_text(json.dumps(report,indent=2)+'\n')
    print(f"Engine enable: {report['strict_cases']} strict, {report['conditional_cases']} conditional")
