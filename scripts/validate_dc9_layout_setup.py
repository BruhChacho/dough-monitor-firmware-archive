"""Check setup records and register routing with explicit ordinary-memory fixtures."""
import json
from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel
from build_dc9_source_baseline import ROOT, LAYOUT, sha
from reconstruct_dc9_layout_setup import SPANS
from validate_dc9_module import inputs, stack_region
from validate_dc9_transfer import plain, regs, named
from validate_dc9_timer import seed, peek
from validate_dc9_masked import fixture as bus_fixture, POLICIES
from validate_dc9_registers import byte_address
from validate_dc9_metadata_registers import apply_fixture

ENGINES=0x47fa9c
AUX=0x47fa3c
TEMPLATE=0x2af620


def logicals(index,bank=0):
    offsets=(0x80,0x84,0xc8,0xcc) if index&1 else (0x88,0x8c,0xd0,0xd4)
    return [bank+0x0d800000+x for x in offsets], bank+0x32800000+(0x0e if index&1 else 0x8e)


def fixture(expanded, *, integrate=False):
    memory=apply_fixture(expanded) if integrate else Memory([stack_region()])
    if integrate:
        old=named(memory,'engines');old.data.extend(bytes(124*9))
    else:
        memory.regions.append(plain(ENGINES,bytes([0xa5]*(13*124)),'engines'))
    memory.regions += [plain(TEMPLATE,expanded[0xaf620:0xaf630],'templates',False),
                       plain(AUX,bytes([0xa5]*96),'auxiliary')]
    return Memory(memory.regions)


def initialized(before,mask,template):
    expected=bytearray(before)
    for i in range(13):
        if not mask&(1<<i):continue
        base=i*124+8
        expected[base:base+4]=bytes(4)
        for offset in (0x18,0x44,0x34,0x2c,0x3c):expected[base+offset:base+offset+8]=template
        expected[base+0x2a]=i
        for offset in (0x21,0x50,0x4c,0x4d):expected[base+offset]=0
        expected[base+8]=4
    return expected


def range_fixture(index,mode,subtype=0,bank=0,start=0xc0000060,length=0x80):
    words,control=logicals(index,bank)
    addresses=[x+i for x in words for i in range(4)]+[control]
    memory=bus_fixture(addresses,[0xa5]*len(addresses),0)
    engines=bytearray(13*124);channels=bytearray(4*168)
    engines[index*124+4:index*124+8]=bank.to_bytes(4,'little')
    engines[index*124+0x10]=2
    engines[index*124+0x78]=subtype
    for offset in (0x5c,0x60,0x64):channels[2*168+offset:2*168+offset+4]=start.to_bytes(4,'little')
    for offset in (0x68,0x6c,0x70):channels[2*168+offset:2*168+offset+4]=length.to_bytes(4,'little')
    memory.regions += [plain(ENGINES,engines,'engines'),plain(0x4821ec,channels,'records'),
                       plain(0x455210,bytes([mode]),'range_mode')]
    return Memory(memory.regions)


def validate():
    expanded,segments,_=inputs()
    strict=ModuleModel(segments,call_policy='fallthrough-hypothesis')
    counts={};conditional={};visited=set()
    def record(name,result,policy=None):
        group=counts if policy is None else conditional.setdefault(policy,{})
        group[name]=group.get(name,0)+1;visited.update(result['visited'])

    for mask in (*range(16),0x10,0x80000000,0xffffffff):
        memory=fixture(expanded);before=bytes(named(memory,'auxiliary').data)
        result=strict.run(0x222fca,memory,regs(mask))
        expected=bytearray(before)
        for i in range(4):
            if mask&(1<<i):
                expected[i*24]=0;expected[i*24+12:i*24+20]=expanded[0xaf628:0xaf630];expected[i*24+21]=0
        assert named(memory,'auxiliary').data==expected and result['termination']=='return'
        record('auxiliary_reset_returns',result)

    for template in (expanded[0xaf620:0xaf628],bytes(range(1,9))):
        for mask in (0,*[1<<i for i in range(13)],0x1555,0xaaa,0x1fff,0x2000,0x80000000,0xffffffff):
            memory=fixture(expanded);named(memory,'templates').data[:8]=template
            before=bytes(named(memory,'engines').data)
            result=strict.run(0x22dc46,memory,regs(mask,0),stop_before=(0x23d3a0,))
            assert result['termination']=='breakpoint' and result['registers'][3:5]==[0,mask]
            assert named(memory,'engines').data==initialized(before,mask,template)
            assert result['registers'][1]==regs()[1] and result['registers'][10:]==regs()[10:]
            assert not result['calls']
            record('thirteen_record_reset_before_mask_prepare',result)

    for index in range(13):
        memory=fixture(expanded);before=bytes(named(memory,'engines').data)
        result=strict.run(0x22dc46,memory,regs(1<<index,1),stop_before=(0x22dd50,))
        assert result['registers'][3:5]==[index,1] and result['termination']=='breakpoint'
        assert not result['calls']
        assert named(memory,'engines').data==initialized(before,1<<index,expanded[0xaf620:0xaf628])
        record('selected_record_before_range_configuration',result)

    # Direct four-byte register writes, including odd logical addresses.
    for logical in (0x1234,0x1235,0x0d801080,0x0d801081,0x0d800080):
        for value in (0,1,0x12345678,0x80000000,0xffffffff):
            memory=bus_fixture([logical+i for i in range(4)],[0xa5]*4,0)
            result=strict.run(0x23e2b8,memory,regs(logical,value))
            expected=[(byte_address(logical+i),(value>>(8*i))&255) for i in range(4) if (logical+i)&0x7fff00]
            targets={byte_address(logical+i) for i in range(4)}
            assert [(a,v) for _,a,_,v in memory.writes if a in targets]==expected
            assert result['termination']=='return'
            record('direct_register_word_returns',result)

    for index in range(4):
        for mode in (0,1):
            for enabled in (0,1):
                for subtype in (0,1,2,255):
                    for start,length in ((0xc0000060,0x80),(0xffffffff,0xffffffff)):
                        memory=range_fixture(index,mode,subtype,0x200,start,length)
                        words,control=logicals(index,0x200)
                        a=(start&0x3fffffff)>>5 if not enabled else 0
                        b=(((start&0x3fffffff)+length)&0xffffffff)>>5 if not enabled else 0
                        stop=(0x23e56b,) if mode else (0x23dead,)
                        result=strict.run(0x22d986,memory,regs(index,enabled),stop_before=stop)
                        assert result['termination']=='breakpoint'
                        if mode:
                            assert result['registers'][3:7]==[words[0],a&65535,65535,0]
                            assert not any(n.startswith('bus_') for n,_,_,_ in memory.writes)
                        else:
                            assert result['registers'][3:6]==[control,enabled,1]
                            expected=[(byte_address(word+i),(value>>(8*i))&255) for word,value in zip(words,(a,b,a,b)) for i in range(4)]
                            targets={x for x,_ in expected}
                            assert [(ad,v) for _,ad,_,v in memory.writes if ad in targets]==expected
                        # True selection of the 0/1/2 source offsets, not merely
                        # equal values in those source slots, is checked by reads.
                        offset={1:0x60,2:0x64}.get(subtype,0x5c)
                        reads=[(ad,size) for n,ad,size in memory.reads if n=='records']
                        assert reads==([] if enabled else [(0x4821ec+2*168+offset,4),(0x4821ec+2*168+offset+12,4)])
                        record('range_first_deferred_request' if mode else 'range_after_four_word_writes',result)

    for entry in (0x23e50c,0x23e5d1,0x23e5ed):
        for logical in (0x1234,0x1235):
            for value in (0,1,0x12345678,0xffffffff):
                memory=bus_fixture([logical],[0xa5],0)
                stops={0x23e50c:(0x23e531,0x23e56b),0x23e5d1:(0x23e5e0,0x23e5e9),0x23e5ed:(0x23e5e0,0x23e5e9)}[entry]
                result=strict.run(entry,memory,regs(logical,value,0x12),stop_before=stops)
                effective=value if entry!=0x23e5ed else ((0xa5|0x12) if value else (0xa5&~0x12))
                width=0xff if entry!=0x23e50c or logical&1 else 0xffff
                expected_value=(effective&width)<<(8 if logical&1 else 0)
                if entry==0x23e5d1:expected_value=(effective<<(8 if logical&1 else 0))&0xffffffff
                expected_mask=width<<(8 if logical&1 else 0)
                assert result['registers'][3:7]==[logical,expected_value,expected_mask,0]
                assert result['termination']=='breakpoint'
                record('deferred_request_prefixes',result)

    # Retain the historical entry-prefix argument check. The engine-control
    # validator now executes these dependencies and checks the next boundary.
    for index in (0,1,3,12,255):
        for enabled in (0,1):
            result=strict.run(0x220a8b,Memory([stack_region()]),regs(enabled,index),stop_before=(0x220aa3,))
            assert result['registers'][3]==index and result['termination']=='breakpoint'
            record('control_first_dependency_prefix',result)

    for policy in POLICIES:
        model=ModuleModel(segments,call_policy='fallthrough-hypothesis',store_policy=policy)
        for index in range(4):
            for enabled in (0,1):
                memory=range_fixture(index,0,bank=0x200)
                result=model.run(0x22d986,memory,regs(index,enabled))
                _,control=logicals(index,0x200)
                # Plain page bytes alias: even control offset0x8e overlaps the
                # third byte of the preceding end-word at0x8c. No page-window
                # isolation is invented for this model.
                prior=0xa5 if index&1 else 0
                assert peek(memory,byte_address(control))==((prior|1) if enabled else (prior&~1))
                words,_=logicals(index,0x200)
                a=0 if enabled else 3;b=0 if enabled else 7
                expected=[(byte_address(w+i),(v>>(8*i))&255) for w,v in zip(words,(a,b,a,b)) for i in range(4)]
                expected.append((byte_address(control),(prior|1) if enabled else (prior&~1)))
                targets={a for a,_ in expected}
                assert [(a,v) for _,a,_,v in memory.writes if a in targets]==expected
                assert result['termination']=='return' and result['registers'][1]==regs()[1]
                record('direct_range_configuration_returns',result,policy)
                inactive=range_fixture(index,0,bank=0)
                result=model.run(0x22d986,inactive,regs(index,enabled))
                assert result['termination']=='return'
                assert not any(n.startswith('bus_') for n,_,_,_ in inactive.writes)
                record('zero_bank_range_guard_returns',result,policy)
        for mask in (0,1,8,0xf,0x1000,0x1fff):
            memory=fixture(expanded,integrate=True);before=bytes(named(memory,'engines').data)
            result=model.run(0x22dc46,memory,regs(mask,0))
            assert result['termination']=='return'
            assert named(memory,'engines').data==initialized(before,mask,expanded[0xaf620:0xaf628])
            record('complete_setup_without_control_calls',result,policy)

        memory=fixture(expanded,integrate=True)
        memory.regions.append(plain(0x455210,b'\0','range_mode'))
        before=bytes(named(memory,'engines').data)
        result=model.run(0x23fad0,memory,regs(),stop_before=(0x220aa3,))
        assert result['termination']=='breakpoint' and result['registers'][3]==0
        assert named(memory,'engines').data==initialized(before,1,expanded[0xaf620:0xaf628])
        assert len([t for _,t,_ in result['calls'] if t==0x20f1ef])==6
        assert [t for _,t,_ in result['calls'] if t in (0x22dc46,0x22d986,0x220a8b)]==[0x22dc46,0x22d986,0x220a8b]
        record('full_apply_first_control_dependency_prefix',result,policy)

    return {'source_layout_sha256':sha(LAYOUT.read_bytes()),**decoder_identity(),
        'status':'strict setup and request prefixes; direct range and no-control setup return under store hypotheses',
        'cases':counts,'strict_cases':sum(counts.values()),'conditional_cases_by_policy':conditional,
        'conditional_cases':sum(sum(v.values()) for v in conditional.values()),'visited_instruction_count':len(visited),
        'source_spans':[{'name':n,'address':hex(a),'end_exclusive':hex(b),'size':b-a,'sha256':sha(expanded[a-0x200000:b-0x200000]),'visited_instructions':sum(a<=pc<b for pc in visited)}for n,a,b,_ in SPANS],
        'templates':{'engine':expanded[0xaf620:0xaf628].hex(),'auxiliary':expanded[0xaf628:0xaf630].hex()},
        'limitations':['Thirteen software records do not establish physical engine count.',
            'Enabled setup still requires control service dependencies; deferred requests stop before0x27b707.',
            'Plain bus bytes do not model pages, queued transactions, hardware effects or timing; even control0x8e aliases the end-word byte at0x8c+2.',
            'Store policies, low-byte/halfword operations, CALL and data endianness remain hypotheses.',
            'Synthetic nonzero engine templates test copy behavior; archived engine template is all zero.'],
        'tools_sha256':{n:sha((ROOT/'scripts'/n).read_bytes())for n in ('validate_dc9_layout_setup.py','reconstruct_dc9_layout_setup.py','aeon_module_model.py','aeon_subset_assembler.py')}}

if __name__=='__main__':
    report=validate();(ROOT/'analysis/dc9-layout-setup-validation.json').write_text(json.dumps(report,indent=2)+'\n')
    print(f"Layout setup: {report['strict_cases']} strict, {report['conditional_cases']} conditional")
