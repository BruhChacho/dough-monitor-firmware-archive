"""Continue real full-apply execution through bounded inactive channel fixtures.

Poll bypasses are explicit input state. No service or timer is substituted.
"""
import json
from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel
from build_dc9_source_baseline import ROOT, LAYOUT, sha
from reconstruct_dc9_channel_update import SPANS
from validate_dc9_module import inputs, stack_region
from validate_dc9_engine_enable import apply_fixture as previous_fixture
from validate_dc9_transfer import plain, regs, named
from validate_dc9_timer import seed, peek
from validate_dc9_metadata import RECORDS, METADATA
from validate_dc9_masked import POLICIES


def apply_fixture(expanded, config=0x20, active=1):
    memory=previous_fixture(expanded)
    memory.regions += [plain(0x3b5f38,(0x600000).to_bytes(4,'little'),'config_pointer',False),
                       plain(0x600000,bytes(0x4c)+bytes([config]),'config',False),
                       plain(0x4551e8,bytes([active]),'active',False)]
    return Memory(memory.regions)


def validate():
    expanded,segments,_=inputs()
    strict=ModuleModel(segments,call_policy='fallthrough-hypothesis')
    cases={};conditional={};visited=set()
    def record(name,result,policy=None):
        group=cases if policy is None else conditional.setdefault(policy,{})
        group[name]=group.get(name,0)+1;visited.update(result['visited'])

    # The actual range wrapper returns with inactive records, including one
    # selected channel or selector4's full 0..3 range. Byte5b must still clear.
    for selector in range(5):
        for mask in (0,0xf,0xffffffff):
            records=bytearray(4*168)
            for i in range(4): records[i*168+0x5b]=0xa5;records[i*168+0x28]=i
            memory=Memory([stack_region(),plain(RECORDS,records,'records'),
                           plain(METADATA,bytes(6*176),'metadata')])
            before=regs(selector,mask)
            result=strict.run(0x22ac17,memory,before)
            selected=list(range(4)) if selector==4 else [selector]
            assert result['termination']=='return' and result['registers'][3]==1
            assert result['registers'][1]==before[1] and result['registers'][10:]==before[10:]
            assert [(a,w,v) for n,a,w,v in memory.writes if n!='stack']==[(RECORDS+i*168+0x5b,1,0) for i in selected]
            assert [t for _,t,_ in result['calls']]==[t for _ in selected for t in (0x2271a9,0x2227da)]+[0x22ab1c,0x22aa4e]
            for i in range(4):assert peek(memory,RECORDS+i*168+0x5b)==(0 if i in selected else 0xa5)
            record('inactive_channel_update_range_returns',result)

    for policy in POLICIES:
        model=ModuleModel(segments,call_policy='fallthrough-hypothesis',store_policy=policy)
        for config,active in ((0x20,1),(0,0)):
            memory=apply_fixture(expanded,config,active)
            for i in range(4):seed(memory,RECORDS+i*168+0x5b,0xa5,1)
            result=model.run(0x23fad0,memory,regs(),max_steps=100000,stop_before=(0x20401d,))
            assert result['termination']=='breakpoint' and result['registers'][3]==0
            targets=[t for _,t,_ in result['calls']]
            assert targets.count(0x2271a9)==4
            assert targets.count(0x22ab1c)==targets.count(0x22aa4e)==targets.count(0x2421d3)==1
            assert targets.count(0x220a8b)==14 and targets.count(0x22d986)==13
            assert targets.count(0x20f1ef)==6 and targets.count(0x222fca)==1
            assert targets[-1]==0x204000 and 0x21ffb3 not in targets
            assert not any(n in ('config_pointer','config','active') for n,_,_,_ in memory.writes)
            assert not any(a==0x455208 for _,a,_,_ in memory.writes)
            assert ('active',0x4551e8,1) in memory.reads if config==0 else ('active',0x4551e8,1) not in memory.reads
            for i in range(4):assert peek(memory,RECORDS+i*168+0x5b)==0
            record('full_apply_after_channel_update_prefix',result,policy)

    return {'source_layout_sha256':sha(LAYOUT.read_bytes()),**decoder_identity(),
        'status':'inactive channel range returns; full apply stops before engine preparation service 0x21ffb3',
        'cases':cases,'strict_cases':sum(cases.values()),'conditional_cases_by_policy':conditional,
        'conditional_cases':sum(sum(v.values()) for v in conditional.values()),
        'visited_instruction_count':len(visited),
        'source_spans':[{'name':n,'address':hex(a),'end_exclusive':hex(b),'size':b-a,
                         'sha256':sha(expanded[a-0x200000:b-0x200000]),
                         'visited_instructions':sum(a<=pc<b for pc in visited)} for n,a,b,_ in SPANS],
        'limitations':['Full apply is not complete; no unknown dependency is stubbed.',
                       'Four inactive channel records and explicit polling bypass inputs are bounded synthetic fixtures.',
                       'Store, CALL and byte/little-endian semantics remain conditional; no physical timing or bus behavior is modeled.'],
        'tools_sha256':{n:sha((ROOT/'scripts'/n).read_bytes()) for n in ('validate_dc9_channel_apply.py','reconstruct_dc9_channel_update.py','aeon_module_model.py','aeon_subset_assembler.py')}}

if __name__=='__main__':
    report=validate();(ROOT/'analysis/dc9-channel-apply-validation.json').write_text(json.dumps(report,indent=2)+'\n')
    print(f"Channel apply: {report['strict_cases']} strict, {report['conditional_cases']} conditional")
