"""Integrated engine preparation with explicit fifth owner record and plain bus."""
import json
from aeon_helper_emulator import decoder_identity
from aeon_module_model import ModuleModel
from build_dc9_source_baseline import ROOT, LAYOUT, sha
from reconstruct_dc9_engine_prepare import SPANS
from validate_dc9_module import inputs
from validate_dc9_channel_apply import apply_fixture as previous_fixture
from validate_dc9_engine_enable import add_bus
from validate_dc9_engine_control import BASES
from validate_dc9_transfer import plain, regs, named
from validate_dc9_timer import peek
from validate_dc9_metadata import KEYS, ENGINES
from validate_dc9_masked import POLICIES
from validate_dc9_registers import byte_address


def apply_fixture(expanded,config=0x20,active=1,size=1000):
    memory=previous_fixture(expanded,config,active)
    # Enabled setup stored owner index4. This synthetic fifth record is
    # explicit additional input; it is not evidence of a fifth physical input.
    named(memory,'records').data.extend(bytes(168))
    memory.regions.append(plain(0x343c14,size.to_bytes(2,'little'),'global_halfword',False))
    # Wrapper204000 calls real21d86d after preparation; it clears bit80 at
    # each selected engine's metadata-key bank+7. Plain bytes have no devices.
    return add_bus(memory,[BASES[k]+7 for k in KEYS])


def validate():
    expanded,segments,_=inputs();conditional={};visited=set()
    for policy in POLICIES:
        model=ModuleModel(segments,call_policy='fallthrough-hypothesis',store_policy=policy)
        for config,active in ((0x20,1),(0,0)):
            for size in (1,1000,65535):
                memory=apply_fixture(expanded,config,active,size)
                result=model.run(0x23fad0,memory,regs(),max_steps=100000,stop_before=(0x23fb33,))
                assert result['termination']=='breakpoint'
                targets=[t for _,t,_ in result['calls']]
                assert targets.count(0x21ffb3)==targets.count(0x204000)==targets.count(0x21d86d)==4
                assert targets.count(0x220a8b)==targets.count(0x22d986)==17
                assert targets.count(0x2271a9)==4 and 0x23d349 not in targets
                assert not any(n in ('global_halfword','config_pointer','config','active') for n,_,_,_ in memory.writes)
                assert not any(a==0x455208 for _,a,_,_ in memory.writes)
                for i in range(4):
                    assert peek(memory,ENGINES+i*124+0x10)==4
                    assert peek(memory,byte_address(BASES[KEYS[i]]+7))==0x25
                conditional[policy]=conditional.get(policy,0)+1;visited.update(result['visited'])
    return {'source_layout_sha256':sha(LAYOUT.read_bytes()),**decoder_identity(),
        'status':'full apply completes four engine preparations and stops before service0x23d349',
        'conditional_cases_by_policy':conditional,'conditional_cases':sum(conditional.values()),
        'visited_instruction_count':len(visited),
        'source_spans':[{'name':n,'address':hex(a),'end_exclusive':hex(b),'size':b-a,
                         'sha256':sha(expanded[a-0x200000:b-0x200000]),
                         'visited_instructions':sum(a<=pc<b for pc in visited)} for n,a,b,_ in SPANS],
        'limitations':['Full apply has not returned; no unknown service or timer is stubbed.',
                       'Synthetic nonzero global size, fifth owner record, zero banks and plain register bytes are explicit fixture inputs.',
                       'Store, CALL, little-endian data and instruction semantics remain conditional; no device behavior is modeled.'],
        'tools_sha256':{n:sha((ROOT/'scripts'/n).read_bytes()) for n in ('validate_dc9_engine_apply.py','reconstruct_dc9_engine_prepare.py','aeon_module_model.py','aeon_subset_assembler.py')}}

if __name__=='__main__':
    report=validate();(ROOT/'analysis/dc9-engine-apply-validation.json').write_text(json.dumps(report,indent=2)+'\n')
    print(f"Engine apply: {report['conditional_cases']} conditional")
