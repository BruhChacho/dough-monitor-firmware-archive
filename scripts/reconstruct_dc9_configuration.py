"""Recover six-layout channel configuration and its data dependencies."""
import json

from reconstruct_dc9_receive import recover
from build_dc9_source_baseline import ROOT, LAYOUT, load_original, sha, assemble_routines, assemble_tables

SPANS = [
    ('channel_layout_configure', 0x260824, 0x260c02,
     'Select one of six rectangle layouts, clear four channel records, configure active records and call external apply routine.'),
    ('channel_record_configure', 0x23e7f6, 0x23e8a2,
     'Populate channel record with two copies of four packed halfwords and flags; wide store semantics conditional.'),
    ('channel_record_reset', 0x23e8a2, 0x23e999,
     'Reset selected fields of a 168-byte channel record; not a full memset; wide store semantics conditional.'),
    ('channel_record_set95', 0x23e734, 0x23e74a, 'Write low byte r4 to channel record offset 0x95.'),
    ('layout_size_first', 0x260459, 0x26047c, 'Return 1344/1536/1728/1920 for selector 0/1/2/3, otherwise zero.'),
    ('layout_size_second', 0x26047c, 0x26049f, 'Return 756/864/972/1080 for selector 0/1/2/3, otherwise zero.'),
]
TABLES = [
    ('channel_layout_dispatch', 0x328168, 24, 'Six little-endian uint32 instruction targets for layout IDs 0..5.'),
    ('channel_layout_rectangles', 0x3c5d10, 192, 'Six groups of four records, each four little-endian uint16 values; geometry interpretation inferred.'),
    ('channel_record_reset_template', 0x2af620, 8, 'Eight-byte reset template copied to four channel record regions.'),
]


def main():
    recover(SPANS)
    _, expanded, _ = load_original(); layout = json.loads(LAYOUT.read_text())
    for name, address, size, purpose in TABLES:
        data = expanded[address-0x200000:address-0x200000+size]
        record = {'name': name, 'address': hex(address), 'size': size,
                  'original_data_sha256': sha(data), 'values': [hex(x) for x in data], 'purpose': purpose}
        prior = [t for t in layout['tables'] if t['name'] == name]
        if prior and prior != [record]:
            raise ValueError(f'Existing table differs: {name}')
        if not prior: layout['tables'].append(record)
    assembled, _ = assemble_routines(expanded, layout)
    assembled, _ = assemble_tables(assembled, layout)
    if assembled != expanded: raise ValueError('Configuration recovery changed original bytes')
    LAYOUT.write_text(json.dumps(layout, indent=2)+'\n')
    print(f'Added or verified {len(TABLES)} exact data tables')


if __name__ == '__main__':
    main()
