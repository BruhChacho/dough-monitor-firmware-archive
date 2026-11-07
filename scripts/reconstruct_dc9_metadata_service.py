"""Recover metadata state accumulation, selector table and shared return path."""
import json

from reconstruct_dc9_receive import recover
from build_dc9_source_baseline import LAYOUT, load_original, sha, assemble_routines, assemble_tables

SPANS = [
    ('channel_selector_mask',0x20e687,0x20e6c5,
     'Table-dispatched selector:0->0x80,1..7->1<<(index-1),larger uint32->0; physical channel meaning unknown.'),
    ('metadata_state_accumulate',0x20f1ef,0x20f401,
     'Accumulate flag-selected channel bits in global state and dispatch common services; both enable and disable paths call services.'),
    ('metadata_state_publish',0x20fe64,0x20fe85,
     'Store two state values and OR flag0x4543dd with2; wide-store semantics conditional.'),
    ('metadata_state_publish_jump',0x20ff1b,0x20ff1f,
     'Tail jump to shared metadata state publication routine.'),
]


def main():
    recover(SPANS)
    _,expanded,_=load_original();layout=json.loads(LAYOUT.read_text())
    data=expanded[0xaf120:0xaf140]
    record={'name':'channel_selector_dispatch','address':'0x2af120','size':32,
            'original_data_sha256':sha(data),'values':[hex(x) for x in data],
            'purpose':'Eight little-endian uint32 instruction targets for selector0..7; output mapping80,01,02,04,08,10,20,40.'}
    prior=[t for t in layout['tables'] if t['name']==record['name']]
    if prior and prior != [record]:raise ValueError('Existing selector dispatch differs')
    if not prior:layout['tables'].append(record)
    assembled,_=assemble_routines(expanded,layout);assembled,_=assemble_tables(assembled,layout)
    if assembled != expanded:raise ValueError('Metadata service recovery changed original bytes')
    LAYOUT.write_text(json.dumps(layout,indent=2)+'\n')
    print('Verified selector dispatch and exact original assembly')


if __name__=='__main__':
    main()
