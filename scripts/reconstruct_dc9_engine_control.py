"""Recover the DC9 engine-control family and its two instruction tables."""
import json

from aeon_helper_emulator import context
from build_dc9_source_baseline import LAYOUT, load_original, sha, assemble_routines, assemble_tables
from reconstruct_dc9_receive import local_branch, recover

BOUNDARIES = [
    0x21d3b1, 0x21d430, 0x21d4c1, 0x21d51e, 0x21d57b, 0x21d5ef,
    0x21d650, 0x21d6ac, 0x21d709, 0x21d72c, 0x21d749, 0x21d76c,
    0x21d78e, 0x21d7b1, 0x21d7d4, 0x21d7f7, 0x21d814, 0x21d86d,
    0x21d89d, 0x21d8f7, 0x21d913, 0x21d977, 0x21da5e,
]
SPANS = [
    ('engine_metadata_control_mask_lookup', 0x21d3b1, 0x21d430,
     'Map metadata index 0..5 to a uint32 metadata key; key 0..8 returns a logical base value, otherwise zero.'),
    ('engine_control_metadata_flags_apply', 0x21d430, 0x21d4c1,
     'Read metadata flags and write 0x80 to engine control registers at offsets 0x0f/0x11 for selected flag values.'),
    ('engine_control_metadata_mask20_update', 0x21d4c1, 0x21d51e,
     'For each selected engine bit, masked-update control register offset 0x90 with mask 0x20.'),
    ('engine_control_metadata_mask10_update', 0x21d51e, 0x21d57b,
     'For each selected engine bit, masked-update control register offset 0x90 with mask 0x10.'),
    ('engine_control_channel_mask08_update', 0x21d57b, 0x21d5ef,
     'For each selected engine bit, choose control offset 0x90 or 0x02800090 from channel parity and masked-update bit 3.'),
    ('engine_control_mode_bits_write', 0x21d5ef, 0x21d650,
     'For each selected engine bit, write two mode bits through the control register at offset 0x90.'),
    ('engine_control_bit01_update', 0x21d650, 0x21d6ac,
     'For each selected engine bit, masked-update control register offset 0x90 with mask 0x01.'),
    ('engine_control_bit40_update', 0x21d6ac, 0x21d709,
     'For each selected engine bit, masked-update control register offset 0x90 with mask 0x40.'),
    ('engine_register_bit04_read', 0x21d709, 0x21d72c,
     'Read engine register offset 0x42 and return bit 4.'),
    ('engine_register_value45_read', 0x21d72c, 0x21d749,
     'Read and return engine register offset 0x45.'),
    ('engine_register_bit08_read', 0x21d749, 0x21d76c,
     'Read engine register offset 0x43 and return bit 3.'),
    ('engine_register_bit40_read', 0x21d76c, 0x21d78e,
     'Read engine register offset 0x06 and return bit 6.'),
    ('engine_register_word0e_read', 0x21d78e, 0x21d7b1,
     'Read engine halfword offset 0x0e and mask to 15 bits.'),
    ('engine_register_word0c_read', 0x21d7b1, 0x21d7d4,
     'Read engine halfword offset 0x0c and mask to 13 bits.'),
    ('engine_register_word08_read', 0x21d7d4, 0x21d7f7,
     'Read engine halfword offset 0x08 and mask to 13 bits.'),
    ('engine_register_value3d_read', 0x21d7f7, 0x21d814,
     'Read and return engine register offset 0x3d.'),
    ('engine_register_flag41_test', 0x21d814, 0x21d86d,
     'Read engine register offset 0x41 and return its sign bit; parity paths implement the same test.'),
    ('engine_register_flag07_write', 0x21d86d, 0x21d89d,
     'Write 0x80 or zero to engine register offset 0x07 according to the first argument.'),
    ('engine_control_flag05_mask_update', 0x21d89d, 0x21d8f7,
     'For each selected engine bit, masked-update engine register offset 0x05 with mask 0x04.'),
    ('engine_register_value04_read', 0x21d8f7, 0x21d913,
     'Read and return engine register offset 0x04.'),
    ('engine_control_geometry_size_calculate', 0x21d913, 0x21d977,
     'Derive a 16-bit size from engine register offset 0x50 and metadata bytes at offsets 0x88/0x89.'),
    ('engine_metadata_control_update_dispatch', 0x21d977, 0x21da5e,
     'Dispatch metadata values 0..8 through a second table to masked control-register updates; unsupported values return without update.'),
]
TABLES = [
    ('engine_control_dispatch_primary', 0x2af554, 36,
     'Nine little-endian 32-bit absolute code targets used by engine-control dispatch.'),
    ('engine_control_dispatch_secondary', 0x2af578, 36,
     'Nine little-endian 32-bit absolute code targets used by engine-control dispatch.'),
]


def main():
    if len(BOUNDARIES) != len(SPANS) + 1 or any(
        (start, end) != (BOUNDARIES[i], BOUNDARIES[i + 1])
        for i, (_, start, end, _) in enumerate(SPANS)
    ):
        raise ValueError('Span boundaries do not match the recovered family')
    _, expanded, _ = load_original()
    layout = json.loads(LAYOUT.read_text())
    # Decode the two tables and confirm their targets are instruction boundaries in this family.
    ctx = context()
    instruction_addresses = set()
    for name, start, end, _ in SPANS:
        rows = ctx.disassemble(expanded[start-0x200000:end-0x200000], base_address=start).instructions
        if sum(row.length for row in rows) != end-start:
            raise ValueError(f'Incomplete decode: {name}')
        addresses = {row.addr.offset for row in rows}
        local_targets = {int(row.body.rstrip(',').split(',')[-1], 0)
                         for row in rows if local_branch(row.mnem)}
        if not {target for target in local_targets if start <= target < end}.issubset(addresses):
            raise ValueError(f'Invalid local branch target in {name}')
        instruction_addresses.update(addresses)
    table_records = []
    for name, address, size, purpose in TABLES:
        data = expanded[address-0x200000:address-0x200000+size]
        targets = [int.from_bytes(data[i:i+4], 'little') for i in range(0, size, 4)]
        if any(target not in instruction_addresses for target in targets):
            raise ValueError(f'{name} has a target outside recovered instruction boundaries')
        record = {'name':name, 'address':hex(address), 'size':size,
                  'original_data_sha256':sha(data), 'values':[hex(byte) for byte in data],
                  'decoded_values':[hex(target) for target in targets], 'purpose':purpose}
        prior = [row for row in layout['tables'] if row['name'] == name]
        if prior and prior != [record]:
            raise ValueError(f'Existing table differs: {name}')
        table_records.append(record)
        print(f'{name}: {[hex(target) for target in targets]}')

    recover(SPANS)
    layout = json.loads(LAYOUT.read_text())
    for record in table_records:
        prior = [row for row in layout['tables'] if row['name'] == record['name']]
        if prior and prior != [record]:
            raise ValueError(f'Existing table differs: {record["name"]}')
        if not prior:
            layout['tables'].append(record)
    assembled, _ = assemble_routines(expanded, layout)
    assembled, _ = assemble_tables(assembled, layout)
    if assembled != expanded:
        raise ValueError('Engine-control recovery changed original bytes')
    LAYOUT.write_text(json.dumps(layout, indent=2) + '\n')
    print(f'Recovered {len(SPANS)} routines; verified {len(table_records)} tables and all original bytes.')

if __name__ == '__main__':
    main()
