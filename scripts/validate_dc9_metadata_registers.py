"""Validate metadata consumers through real recovered register dependencies.

All bus bytes are plain memory. Complete returns below are conditional on the
explicit wide-store policy, little-endian data and fallthrough CALL assumptions.
"""
import json
from itertools import product

from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel
from build_dc9_source_baseline import ROOT, LAYOUT, sha
from reconstruct_dc9_metadata_registers import SPANS
from reconstruct_dc9_metadata_consumers import SPANS as CONSUMER_SPANS
from validate_dc9_module import inputs
from validate_dc9_masked import fixture as bus_fixture, POLICIES
from validate_dc9_metadata_service import fixture as state_fixture, contract
from validate_dc9_registers import byte_address
from validate_dc9_timer import peek, seed
from validate_dc9_transfer import plain, regs, named

OFFSETS=(0,0x300,0x800,0xb00)
DIRECT=(0x11c4,0x12c4,0x13c4)
CHANNEL=(0xfff71074,0xfff71075)


def fixture(expanded, *, gate=0, fill=0, old=0xa5):
    logicals=[base+offset for offset in OFFSETS for base in CHANNEL]+list(DIRECT)
    memory=bus_fixture(logicals,[old]*len(logicals),0)
    memory.regions += [r for r in state_fixture(expanded,gate,fill).regions if r.name!='stack']
    memory.regions += [plain(0x453ba4,bytes([0xa5]*4),'enable_bytes'),
                       plain(0x453bcc,bytes([0xa5]*16),'channel_globals'),
                       plain(0x45415f,bytes([0xa5]*5),'combined'),
                       plain(0x454468,bytes([0xa5]*6),'apply_globals'),
                       plain(0x4800e8,bytes([0xa5]*(4*132)),'channel_words')]
    return Memory(memory.regions)


def bus_value(memory,logical):
    return peek(memory,byte_address(logical))


def data_writes(memory,logicals):
    addresses={byte_address(n) for n in logicals}
    return [(a,v) for _,a,_,v in memory.writes if a in addresses]


def apply_fixture(expanded):
    from validate_dc9_metadata import fixture as metadata_fixture
    memory=metadata_fixture()
    for region in fixture(expanded).regions:
        matches=[r for r in memory.regions if r.address==region.address and len(r.data)==len(region.data)]
        if matches:
            assert matches[0].data==region.data and matches[0].writable==region.writable
        else:memory.regions.append(region)
    return Memory(memory.regions)


def validate():
    expanded,segments,_=inputs()
    strict=ModuleModel(segments,call_policy='fallthrough-hypothesis')
    counts={};conditional={};visited=set()

    def record(name,result,policy=None):
        group=counts if policy is None else conditional.setdefault(policy,{})
        group[name]=group.get(name,0)+1;visited.update(result['visited'])

    for index in (*range(256),256,0xffffffff):
        memory=Memory([])
        result=strict.run(0x211855,memory,regs(index))
        assert result['registers'][3]==(OFFSETS[index] if index<4 else 0)
        assert result['termination']=='return' and not memory.reads and not memory.writes
        record('bank_offset_returns',result)

    # Default rejection retains the earlier software byte store, but has not
    # changed either addressed register. No transaction rollback is promised.
    for index in range(4):
        memory=fixture(expanded)
        try:strict.run(0x213b64,memory,regs(index,1))
        except ValueError as error:assert 'unresolved store' in str(error),error
        else:raise AssertionError('Default policy accepted ambiguous counter store')
        assert peek(memory,0x453ba4+index)==1
        assert all(bus_value(memory,base+OFFSETS[index])==0xa5 for base in CHANNEL)
        counts['default_counter_rejections']=counts.get('default_counter_rejections',0)+1

    for policy in POLICIES:
        model=ModuleModel(segments,call_policy='fallthrough-hypothesis',store_policy=policy)
        for index in range(4):
            for value in (0,1,2,4,255,0x100,0x80000000,0xffffffff):
                memory=fixture(expanded);before=regs(index,value)
                result=model.run(0x213b64,memory,before)
                assert result['termination']=='return'
                assert peek(memory,0x453ba4+index)==value&255
                first=(0xa5&~4)|(value&4)
                second=(0xa5&~3)|(0 if value else 1)
                assert [bus_value(memory,x+OFFSETS[index]) for x in CHANNEL]==[first,second]
                assert data_writes(memory,[x+OFFSETS[index] for x in CHANNEL])==[
                    (byte_address(CHANNEL[0]+OFFSETS[index]),first),
                    (byte_address(CHANNEL[1]+OFFSETS[index]),second)]
                for other in range(4):
                    if other==index:continue
                    assert peek(memory,0x453ba4+other)==0xa5
                    assert all(bus_value(memory,x+OFFSETS[other])==0xa5 for x in CHANNEL)
                assert data_writes(memory,[x+o for o in OFFSETS for x in CHANNEL])==[
                    (byte_address(CHANNEL[0]+OFFSETS[index]),first),
                    (byte_address(CHANNEL[1]+OFFSETS[index]),second)]
                assert result['registers'][1]==before[1]
                assert result['registers'][10:23]==before[10:23]
                record('channel_register_returns',result,policy)

        for mask in (*range(256),0x80000000,0xffffffff):
            memory=fixture(expanded)
            result=model.run(0x2341c8,memory,regs(mask))
            assert result['termination']=='return'
            assert named(memory,'enable_bytes').data==bytes((mask>>i)&1 for i in range(4))
            for i,offset in enumerate(OFFSETS):
                assert bus_value(memory,CHANNEL[0]+offset)==0xa1
                assert bus_value(memory,CHANNEL[1]+offset)==(0xa4 if mask&(1<<i) else 0xa5)
            assert data_writes(memory,[x+o for o in OFFSETS for x in CHANNEL])==[
                item for i,o in enumerate(OFFSETS) for item in (
                    (byte_address(CHANNEL[0]+o),0xa1),
                    (byte_address(CHANNEL[1]+o),0xa4 if mask&(1<<i) else 0xa5))]
            record('four_channel_dispatch_returns',result,policy)

        for mask in range(256):
            old=0xa4 if mask%2==0 else 0xff
            memory=fixture(expanded,old=old);seed(memory,0x45446a,0x80)
            result=model.run(0x212e18,memory,regs(mask,0x45446a))
            assert result['termination']=='return'
            assert peek(memory,0x45446a)==0x80|((mask>>4)&7)
            expected=[(byte_address(logical),old|1) for i,logical in enumerate(DIRECT) if mask&(0x10<<i)]
            assert data_writes(memory,DIRECT)==expected
            record('register_mask01_returns',result,policy)

            memory=fixture(expanded,old=old)
            result=model.run(0x212d95,memory,regs(mask))
            assert result['termination']=='return'
            expected=[(byte_address(x),old&~0x40) for x in DIRECT]
            expected += [(byte_address(x),(old&~0x40)|0x40) for i,x in enumerate(DIRECT) if mask&(0x10<<i)]
            assert data_writes(memory,DIRECT)==expected
            assert [bus_value(memory,x) for x in DIRECT]==[(old&~0x40)|(0x40 if mask&(0x10<<i) else 0) for i in range(3)]
            record('register_mask40_returns',result,policy)

        for gate in (0,1,0x80,0xff):
            for mask in (0,0x10,0x20,0x40,0x70,0xff):
                memory=fixture(expanded);seed(memory,0x45446c,gate);seed(memory,0x45446a,0x80)
                result=model.run(0x2112a0,memory,regs(0x12345678,0xabcdef12,mask,mask))
                assert result['termination']=='return'
                assert peek(memory,0x454468)==(0xa5 if gate&1 else 0x78)
                assert peek(memory,0x45446d)==(0xa5 if gate&1 else 0x12)
                assert peek(memory,0x45446a)==0x80|((mask>>4)&7)
                assert [bus_value(memory,x) for x in DIRECT]==[(0xa5&~0x40)|(0x40 if mask&(0x10<<i) else 0) for i in range(3)]
                record('metadata_register_apply_returns',result,policy)

        # Run the complete accumulation chain with no replacements or external
        # call stubs, then compare separately derived state and register effects.
        flags_values=(0,*[1<<i for i in range(20)],0x20400,0xffffffff)
        for gate,fill,enabled in product((0,1),(0,0x5a),(0,1)):
            for selector in (*range(9),0xffffffff):
                for flags in flags_values:
                    memory=fixture(expanded,gate=gate,fill=fill)
                    expected=contract(named(memory,'state').data,enabled,selector,flags)
                    result=model.run(0x20f1ef,memory,regs(enabled,selector,flags))
                    assert result['termination']=='return'
                    initial=regs(enabled,selector,flags)
                    assert result['registers'][1]==initial[1] and result['registers'][10:23]==initial[10:23]
                    assert result['registers'][25:]==initial[25:]
                    assert peek(memory,0x4551a8,2)==0 and peek(memory,0xa0203034)==0
                    assert named(memory,'counter').data[2:]==(bytes(2) if policy=='sleigh-store' else bytes.fromhex('a55a'))
                    published=bytearray(expected)
                    if policy=='sleigh-store':
                        published[32:34]=(expected[10]>>16).to_bytes(2,'little')
                        published[36:40]=expected[12].to_bytes(4,'little')
                    else:
                        published[34:36]=expected[10].to_bytes(2,'little')
                        published[36:38]=expected[12].to_bytes(2,'little')
                    published[33] |=2
                    assert named(memory,'state').data==published
                    assert named(memory,'combined').data==bytes([0xa5,expected[7]|(0x80 if expected[1] else 0),
                        expected[7]|expected[3]|expected[6]|expected[4],expected[7],0xa5])
                    for i in range(4):
                        assert peek(memory,0x4800fc+i*132,4)==(1 if expected[12]&(1<<i) else 4)
                        assert peek(memory,0x453ba4+i)==((expected[20]>>i)&1)
                        assert bus_value(memory,CHANNEL[0]+OFFSETS[i])==0xa1
                        assert bus_value(memory,CHANNEL[1]+OFFSETS[i])==(0xa4 if expected[20]&(1<<i) else 0xa5)
                    assert [bus_value(memory,x) for x in DIRECT]==[(0xa5&~0x40)|(0x40 if expected[12]&(0x10<<i) else 0) for i in range(3)]
                    assert peek(memory,0x45446a)==0xa5|((expected[7]>>4)&7)
                    record('complete_accumulation_returns',result,policy)

        for entry,stop in ((0x22aca0,()),(0x23fad0,(0x23faf2,))):
            memory=apply_fixture(expanded)
            for index in range(6):
                base=0x3b4950+index*176
                for offset,value,size in ((0xc,0x12345678,4),(0x10,0xdd,1),(0x11,0xab,1),
                                          (0x12,0xeeee,2),(0x14,0xcd,1),(0x70,0xcc,1),(0x71,0xef,1)):
                    seed(memory,base+offset,value,size)
            expected=bytearray(named(memory,'metadata').data)
            for index in range(6):
                base=index*176;expected[base+0xc:base+0x10]=bytes(4)
                expected[base+0x10]=4;expected[base+0x12:base+0x14]=bytes(2);expected[base+0x70]=0
            result=model.run(entry,memory,regs(),stop_before=stop)
            assert result['termination']==('breakpoint' if stop else 'return')
            assert named(memory,'metadata').data==expected
            assert len([t for _,t,_ in result['calls'] if t==0x20f1ef])==6
            if stop:assert result['registers'][3:5]==[0x1fff,1]
            record('apply_after_complete_six_record_reset' if stop else 'complete_six_record_reset_returns',result,policy)

    return {'source_layout_sha256':sha(LAYOUT.read_bytes()),**decoder_identity(),
            'status':'complete consumer and accumulated-state returns under explicit store policies',
            'cases':counts,'strict_cases':sum(counts.values()),'conditional_cases_by_policy':conditional,
            'conditional_cases':sum(sum(v.values()) for v in conditional.values()),
            'visited_instruction_count':len(visited),
            'source_spans':[{'name':n,'address':hex(a),'end_exclusive':hex(b),'size':b-a,
                'sha256':sha(expanded[a-0x200000:b-0x200000]),'visited_instructions':sum(a<=pc<b for pc in visited)}for n,a,b,_ in [*CONSUMER_SPANS,*SPANS]],
            'limitations':['Plain memory does not model hardware page windows, locks, interrupts or physical registers.',
                'Complete accumulation is conditional on wide-store policies, low-byte operations, little-endian data and fallthrough CALL links.',
                'Boolean enable1 clears register mask4 under current CMOV1 semantics; no correction or physical interpretation is inferred.',
                'These complete routine returns do not establish full display application or firmware boot.'],
            'tools_sha256':{n:sha((ROOT/'scripts'/n).read_bytes())for n in ('validate_dc9_metadata_registers.py','reconstruct_dc9_metadata_registers.py','aeon_module_model.py','aeon_subset_assembler.py')}}


if __name__=='__main__':
    report=validate()
    (ROOT/'analysis/dc9-metadata-registers-validation.json').write_text(json.dumps(report,indent=2)+'\n')
    print(f"Metadata registers: {report['strict_cases']} strict and {report['conditional_cases']} conditional cases")
