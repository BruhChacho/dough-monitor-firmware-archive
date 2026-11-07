"""Check selector/state accumulation up to shared services and publication tails.

This focused gate stops both paths before the same common service. Tail
publication is tested independently here; validate_dc9_metadata_registers checks
complete chain returns under explicit store policies.
"""
import json

from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel
from build_dc9_source_baseline import ROOT, LAYOUT, sha
from reconstruct_dc9_metadata_service import SPANS
from validate_dc9_module import inputs, stack_region
from validate_dc9_transfer import plain, regs, named
from validate_dc9_masked import POLICIES

STATE=0x4543bc
TABLE=0x2af120
MASKS=(0x80,1,2,4,8,16,32,64)


def fixture(expanded, gate=0, fill=0xa5):
    data=bytearray([fill]*40);data[0]=gate
    return Memory([stack_region(),plain(TABLE,expanded[0xaf120:0xaf140],'selector_table',False),
                   plain(STATE,data,'state')])


def contract(before, enabled, selector, flags):
    expected=bytearray(before)
    mask=MASKS[selector] if selector <8 else 0
    if before[0]==0:
        if flags &1:expected[1]=1
        for bit,offset in ((2,3),(4,6),(8,4),(0x400,5),(0x10,10),(0x20,7),
                           (0x100,8),(0x200,9),(0x40000,13),(0x6000,11)):
            if flags &bit:expected[offset] |=mask
        # This bit is consulted only inside the 0x400 branch.
        if flags &0x400 and flags &0x20000:expected[20] |=mask
    expected[12]=(expected[12]|mask) if enabled else (expected[12]&~mask)
    return expected


def validate():
    expanded,segments,_=inputs()
    strict=ModuleModel(segments,call_policy='fallthrough-hypothesis')
    visited=set();counts={};conditional={}

    def record(name,result,policy=None):
        group=counts if policy is None else conditional.setdefault(policy,{})
        group[name]=group.get(name,0)+1;visited.update(result['visited'])

    for selector in (*range(256),256,65535,0xffffffff):
        memory=fixture(expanded)
        result=strict.run(0x20e687,memory,regs(selector))
        assert result['termination']=='return'
        assert result['registers'][3]==(MASKS[selector] if selector<8 else 0)
        assert not memory.writes
        assert memory.reads==([('selector_table',TABLE+4*selector,4)] if selector<8 else [])
        record('selector_return',result)

    flags_values=(0,*[1<<bit for bit in range(32)],0x20400,0x20408,0x6000,0x46000,0x7fffffff,0xffffffff)
    for selector in (*range(9),256,0xffffffff):
        for flags in flags_values:
            for gate in (0,1):
                for enabled in (0,1,0xffffffff):
                    memory=fixture(expanded,gate)
                    expected=contract(named(memory,'state').data,enabled,selector,flags)
                    result=strict.run(0x20f1ef,memory,regs(enabled,selector,flags),stop_before=(0x20f28c,))
                    assert result['termination']=='breakpoint'
                    assert named(memory,'state').data==expected
                    assert all(n in ('stack','state') for n,_,_,_ in memory.writes)
                    assert [target for _,target,_ in result['calls']]==[0x20e687]
                    assert result['registers'][3]==(MASKS[selector] if selector<8 else 0)
                    record('accumulation_before_common_services',result)

    for policy in POLICIES:
        model=ModuleModel(segments,call_policy='fallthrough-hypothesis',store_policy=policy)
        for first in (0,1,65535,0x12345678,0xffffffff):
            for second in (0,1,65535,0x87654321,0xffffffff):
                for flag in (0,0x91,255):
                    original=bytearray.fromhex('a5005a5baabbccdd');original[1]=flag
                    memory=Memory([plain(0x4543dc,original,'publication')])
                    result=model.run(0x20ff1b,memory,regs(first,second))
                    expected=bytearray(original)
                    if policy=='sleigh-store':
                        expected[0:2]=(first>>16).to_bytes(2,'little')
                        expected[4:8]=second.to_bytes(4,'little')
                    else:
                        expected[2:4]=(first&65535).to_bytes(2,'little')
                        expected[4:6]=(second&65535).to_bytes(2,'little')
                    expected[1] |=2
                    assert named(memory,'publication').data==expected
                    assert result['termination']=='return' and not result['calls']
                    record('isolated_publication_tail',result,policy)

    return {'source_layout_sha256':sha(LAYOUT.read_bytes()),**decoder_identity(),
            'status':'selector returns and state accumulation prefixes; publication tails tested independently',
            'cases':counts,'strict_cases':sum(counts.values()),'conditional_cases_by_policy':conditional,
            'conditional_cases':sum(sum(x.values()) for x in conditional.values()),
            'visited_instruction_count':len(visited),
            'source_spans':[{'name':name,'address':hex(start),'end_exclusive':hex(end),'size':end-start,
                             'sha256':sha(expanded[start-0x200000:end-0x200000]),
                             'visited_instructions':sum(start<=pc<end for pc in visited)} for name,start,end,_ in SPANS],
            'selector_outputs':list(MASKS),'dispatch_targets':[hex(int.from_bytes(expanded[0xaf120+4*i:0xaf124+4*i],'little'))for i in range(8)],
            'common_stop_before':'0x20f28c','common_service_target':'0x20e76c',
            'limitations':['Both enable and disable branches invoke the same common service; this focused gate stops before it. Complete conditional runs are in dc9-metadata-registers-validation.json.',
                           'Publication-tail return is isolated and does not prove the preceding service chain ran.',
                           'Shared flag0x4543dd is overwritten by literal bg.sh before OR2, while the +2 low-halfword policy preserves its other bits.',
                           'Conditional store policies, low-byte/halfword semantics, little-endian data and fallthrough CALL remain model hypotheses.',
                           'Selector order is80,01,02,04,08,10,20,40, not a descending bit shift; physical channel assignment unknown.'],
            'tools_sha256':{name:sha((ROOT/'scripts'/name).read_bytes())for name in ('validate_dc9_metadata_service.py','reconstruct_dc9_metadata_service.py','aeon_module_model.py','aeon_subset_assembler.py')}}


if __name__=='__main__':
    report=validate()
    (ROOT/'analysis/dc9-metadata-service-validation.json').write_text(json.dumps(report,indent=2)+'\n')
    print(f"Metadata service: {report['strict_cases']} strict and {report['conditional_cases']} conditional cases")
