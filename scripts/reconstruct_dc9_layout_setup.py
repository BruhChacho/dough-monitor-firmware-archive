"""Recover layout setup and its immediate register consumers without byte changes."""
import json
from reconstruct_dc9_receive import recover
from build_dc9_source_baseline import LAYOUT, load_original, sha, assemble_routines, assemble_tables

SPANS = [
    ('engine_records_initialize',0x22dc46,0x22dd9a,
     'Initialize selected records among thirteen stride124 records, optionally configure register paths, then prepare masks.'),
    ('auxiliary_records_reset',0x222fca,0x223027,
     'Reset selected low four mask bits in stride24 records using an eight-byte template.'),
    ('engine_range_configure',0x22d986,0x22dc46,
     'Derive start/end values and route four word writes plus a control-bit update according to engine parity and mode.'),
    ('engine_control_configure',0x220a8b,0x220c76,
     'Coordinate engine control, metadata gates and register updates; several dependencies remain unrecovered.'),
    ('register_write32',0x23e2b8,0x23e2fd,
     'Write four low-to-high bytes at consecutive logical register addresses.'),
    ('register_deferred_write32',0x23e50c,0x23e58a,
     'Split a word into aligned mask/value requests to unresolved service0x27b707.'),
    ('register_deferred_write8',0x23e5d1,0x23e5ed,
     'Align a byte request into a masked halfword request to unresolved service0x27b707.'),
    ('register_deferred_update_bits',0x23e5ed,0x23e62c,
     'Read byte, set or clear selected bits, then submit a deferred masked write.'),
]

def main():
    recover(SPANS)
    _,expanded,_=load_original();layout=json.loads(LAYOUT.read_text())
    data=expanded[0xaf628:0xaf630]
    record={'name':'auxiliary_reset_template','address':'0x2af628','size':8,
            'original_data_sha256':sha(data),'values':[hex(v) for v in data],
            'purpose':'Eight source bytes copied into selected stride24 records; physical interpretation unknown.'}
    prior=[t for t in layout['tables'] if t['name']==record['name']]
    if prior and prior!=[record]:raise ValueError('Existing reset template differs')
    if not prior:layout['tables'].append(record)
    result,_=assemble_routines(expanded,layout);result,_=assemble_tables(result,layout)
    if result!=expanded:raise ValueError('Setup recovery changed original bytes')
    LAYOUT.write_text(json.dumps(layout,indent=2)+'\n')
    print('Verified reset template and all original source bytes')

if __name__=='__main__':main()
