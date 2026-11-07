"""Bounded validation for recovered channel metadata updates.

The fixtures model plain RAM and explicit service boundaries. They do not
stand in for channel, display, or peripheral behavior.
"""
import json

from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel
from build_dc9_source_baseline import ROOT, LAYOUT, sha
from reconstruct_dc9_channel_update import SPANS
from validate_dc9_module import inputs, stack_region
from validate_dc9_transfer import plain, regs
from validate_dc9_timer import seed, peek

RECORDS = 0x4821ec
METADATA = 0x3b4950


def channel_fixture(index=0, source=0, active=1, metadata_word=1, reference_index=None,
                    references=None):
    records = bytearray(4 * 168)
    records[index * 168 + 0x28] = source
    records[index * 168 + 0x94] = active
    metadata = bytearray(6 * 176)
    seed_region = plain(METADATA, metadata, 'metadata')
    memory = Memory([plain(RECORDS, records, 'records'), seed_region])
    seed(memory, METADATA + source * 176 + 0x80, metadata_word, 4)
    # The metadata record also supplies its index byte at +0x7c.
    if reference_index is None:
        reference_index = source
    seed(memory, METADATA + source * 176 + 0x7c, reference_index, 1)
    for offset, value in (references or {}).items():
        seed(memory, METADATA + source * 176 + offset, value, 1)
    return memory


def range_fixture(start=0, end=3, *, active_indices=(), x=0, y=0, count=4):
    records = bytearray(count * 168)
    for index in active_indices:
        records[index * 168] = 1
        records[index * 168 + 0x18:index * 168 + 0x1a] = x.to_bytes(2, 'little')
        records[index * 168 + 0x1c:index * 168 + 0x1e] = y.to_bytes(2, 'little')
    memory = Memory([plain(RECORDS, records, 'records'), stack_region(),
                     plain(0x47fa9c, bytearray(13*124), 'engines', True)])
    return memory, start, end


def validate():
    expanded, segments, _ = inputs()
    model = ModuleModel(segments, call_policy='fallthrough-hypothesis')
    cases = {}; visited = set()
    def record(name,result):
        cases[name]=cases.get(name,0)+1;visited.update(result['visited'])
    def finish(result,before,value):
        assert result['termination']=='return' and result['registers'][3]==value
        assert result['registers'][1]==before[1] and result['registers'][10:23]==before[10:23]
    for index in range(4):
        for source in range(6):
            for active,word in ((0,1),(0,0xffffffff),(1,0)):
                memory=channel_fixture(index,source,active,word)
                memory=Memory(memory.regions+[stack_region()]);before=regs(index)
                result=model.run(0x2271a9,memory,before);finish(result,before,1)
                assert all(n=='stack' for n,_,_,_ in memory.writes)
                assert [r for r in memory.reads if r[0]!='stack']==[
                    ('records',RECORDS+index*168+0x28,1),('metadata',METADATA+source*176+0x80,4),
                    ('records',RECORDS+index*168+0x94,1)]
                record('guarded_success_returns',result)
            for word in (1,2,3,4,0xffffffff):
                refs={o:source for o in range(0x7c,0x80)}
                memory=channel_fixture(index,source,1,word,references=refs)
                memory=Memory(memory.regions+[stack_region()]);before=regs(index)
                result=model.run(0x2271a9,memory,before);finish(result,before,1)
                offsets=[0x7c,0x7d]+([0x7e] if word>1 else [])+([0x7f] if word>2 else [])
                assert [a-(METADATA+source*176) for n,a,w in memory.reads if n=='metadata' and w==1]==offsets
                assert [t for _,t,_ in result['calls']]==[0x2227da]
                record('matching_reference_returns',result)
            for position in range(4):
                refs={o:source for o in range(0x7c,0x80)};refs[0x7c+position]=(source+1)%6
                memory=channel_fixture(index,source,1,3,references=refs)
                memory=Memory(memory.regions+[stack_region()]);before=regs(index)
                result=model.run(0x2271a9,memory,before,stop_before=(0x227145,))
                assert result['termination']=='breakpoint'
                assert result['registers'][3:5]==[index,(source+1)%6]
                assert all(n=='stack' for n,_,_,_ in memory.writes)
                record('reference_assignment_prefixes',result)
                # Exhaustion propagates a real failure without touching state.
                engines=bytearray(13*124)
                for i in range(5,13):engines[i*124+8:i*124+12]=(1).to_bytes(4,'little')
                memory=channel_fixture(index,source,1,3,references=refs)
                memory=Memory(memory.regions+[plain(0x47fa9c,engines,'engines'),stack_region()])
                result=model.run(0x2271a9,memory,before);finish(result,before,0)
                assert [t for _,t,_ in result['calls']]==[0x2227da,0x227145,0x222b65]
                assert all(n=='stack' for n,_,_,_ in memory.writes)
                record('reference_assignment_exhaustion_returns',result)

    for entry in (0x22ab1c,0x22aa4e):
        for first,last,count in ((2,1,4),(0,3,4),(254,254,256),(255,254,256)):
            memory,_,_=range_fixture(first,last,count=count);before=regs(first,last,0)
            result=model.run(entry,memory,before);finish(result,before,1)
            assert all(n=='stack' for n,_,_,_ in memory.writes)
            record('inactive_or_empty_range_returns',result)
        memory,_,_=range_fixture(0,255,count=256)
        try:model.run(entry,memory,regs(0,255,0),max_steps=20000)
        except ValueError as error:assert str(error)=='Instruction budget exceeded'
        else:raise AssertionError('Byte-index wrap must not invent completion')
        cases['inclusive_255_expected_budget_rejections']=cases.get('inclusive_255_expected_budget_rejections',0)+1
        for x,width in ((0,0),(0,1920),(1919,1),(1920,1),(65535,65535),(1792,256),(0,1921),(1919,2),(0,65535)):
            crossing=x<=1919 and x+width>1920
            for subtype in (0,1,2,3):
                memory,_,_=range_fixture(0,0,active_indices=(0,),x=x,y=width)
                seed(memory,RECORDS+0x29,subtype,1);before=regs(0,0,0xf);before[1]=0x7001c7
                result=model.run(entry,memory,before);finish(result,before,1)
                targets=[t for _,t,_ in result['calls']]
                selected=([1,3] if crossing else []) if entry==0x22ab1c else ([] if crossing else [3 if x>1919 else 1])
                assert targets.count(0x2229f8)==len(selected)
                assert peek(memory,RECORDS+0x2a,2)==sum(1<<i for i in selected)
                if entry==0x22ab1c:
                    expected36=((before[1]-32)&255) if crossing and x+(width>>1)==1920 else 0
                    assert peek(memory,RECORDS+0x35)==int(crossing)
                    assert peek(memory,RECORDS+0x36)==expected36
                for i in selected:
                    assert peek(memory,0x47fa9c+i*124+8,4)==1
                    assert peek(memory,0x47fa9c+i*124+0x10)==0
                record('range_geometry_assignment_returns',result)

    for mask,stop,engine in ((0,0x22ac11,1),(2,0x22abf0,3),(8,0x22ac11,1)):
        memory,_,_=range_fixture(0,0,active_indices=(0,),x=1792,y=256)
        seed(memory,RECORDS+0x28,5,1)
        result=model.run(0x22ab1c,memory,regs(0,0,mask),stop_before=(stop,))
        assert result['termination']=='breakpoint' and result['registers'][3:5]==[5,engine]
        assert peek(memory,RECORDS+0x2a,2)==0xa
        assert [t for _,t,_ in result['calls']]==[0x222ace,0x222af1,0x2229f8,0x2229f8]
        record('crossing_external_update_prefixes',result)
    for x,width,engine in ((0,100,1),(1920,100,3)):
        memory,_,_=range_fixture(0,0,active_indices=(0,),x=x,y=width)
        seed(memory,RECORDS+0x28,5,1)
        result=model.run(0x22aa4e,memory,regs(0,0,0),stop_before=(0x22aad5,))
        assert result['termination']=='breakpoint' and result['registers'][3:5]==[5,engine]
        assert peek(memory,RECORDS+0x2a,2)==1<<engine
        record('noncrossing_external_update_prefixes',result)
    for unavailable_pair in (0,1):
        memory,_,_=range_fixture(0,0,active_indices=(0,),x=1792,y=256)
        for i in (unavailable_pair*2,unavailable_pair*2+1):seed(memory,0x47fa9c+i*124+8,1,4)
        before=regs(0,0,0xf);result=model.run(0x22ab1c,memory,before);finish(result,before,0)
        assert [t for _,t,_ in result['calls']]==[0x222ace,0x222af1]
        assert not any(n=='records' for n,_,_,_ in memory.writes)
        record('crossing_unavailable_pair_returns',result)
    for x,engine in ((0,0),(1920,2)):
        memory,_,_=range_fixture(0,0,active_indices=(0,),x=x,y=1)
        for i in (engine,engine+1):seed(memory,0x47fa9c+i*124+8,1,4)
        before=regs(0,0,0xf);result=model.run(0x22aa4e,memory,before);finish(result,before,0)
        assert not any(n=='records' for n,_,_,_ in memory.writes)
        record('noncrossing_unavailable_pair_returns',result)

    return {'source_layout_sha256':sha(LAYOUT.read_bytes()),**decoder_identity(),
        'status':'bounded channel metadata and range paths validated; service 0x22701c remains unexecuted',
        'cases':cases,'case_count':sum(cases.values()),'visited_instruction_count':len(visited),
        'source_spans':[{'name':n,'address':hex(a),'end_exclusive':hex(b),'size':b-a,
                         'sha256':sha(expanded[a-0x200000:b-0x200000]),
                         'visited_instructions':sum(a<=pc<b for pc in visited)} for n,a,b,_ in SPANS],
        'limitations':['Inclusive end255 wraps the byte iterator; two synthetic fixtures hit the instruction budget.',
                       'Unknown calls are not stubbed. Plain bytes do not model hardware, display, timing or interrupts.',
                       'CALL, little-endian data and low-byte/halfword instructions retain existing model hypotheses.'],
        'tools_sha256':{n:sha((ROOT/'scripts'/n).read_bytes()) for n in ('validate_dc9_channel_update.py','reconstruct_dc9_channel_update.py','aeon_module_model.py','aeon_subset_assembler.py')}}


if __name__=='__main__':
    report=validate();(ROOT/'analysis/dc9-channel-update-validation.json').write_text(json.dumps(report,indent=2)+'\n')
    print(f"Channel update: {report['case_count']} bounded cases")
