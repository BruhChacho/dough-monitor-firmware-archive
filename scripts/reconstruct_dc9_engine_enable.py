"""Recover adjacent engine-enable and metadata consumers with byte checks."""
import json
from pathlib import Path

from aeon_subset_assembler import assemble
from build_dc9_source_baseline import LAYOUT, ROOT, load_original, sha
from reconstruct_dc9_receive import recover

SPANS = [
    ('engine_mask_enable', 0x22607c, 0x226100,
     'Read the engine-bank word at offset 4, then set or clear mask 2 at logical address 0x10800032 + bank according to odd or even bank parity.'),
    ('channel_reference_count', 0x23ee2c, 0x23eee9,
     'Count matching active channels and return the resulting count.'),
    ('metadata_word6c_read', 0x23eee9, 0x23ef0c,
     'Read a 32-bit word from the metadata structure at offset 0x6c.'),
    ('metadata_word0c_zero_test', 0x23ea03, 0x23ea1e,
     'Test whether the 32-bit metadata word at offset 0x0c is zero.'),
    ('metadata_state_write_selected_engines', 0x23ea1e, 0x23ea6e,
     'Write a metadata state value and apply it to selected engine records at word offset 0x08.'),
    ('metadata_flag_read_1', 0x23ea6e, 0x23ea99,
     'For metadata indices 0..5, require a nonzero halfword at metadata offset 0xac, then return bit 3 of byte offset 0x98.'),
    ('metadata_flag_read_2', 0x23ea99, 0x23eac4,
     'For metadata indices 0..5, require a nonzero halfword at metadata offset 0xac, then return bit 5 of byte offset 0x98.'),
    ('metadata_flag_read_3', 0x23eac4, 0x23eb05,
     'Walk stride-0xb0 records; for type 4 with a nonzero halfword at metadata base offset 0xac (base+0xa0 plus 0x0c), subtract 50 decimal from that halfword.'),
    ('broadcast_mask_counter_store', 0x23e13b, 0x23e152,
     'Store the supplied value at fixed address 0x455214 when the selector is nonzero, otherwise store zero; semantics are unknown.'),
    ('global_halfword_read', 0x21bd1e, 0x21bd28,
     'Read and return a global halfword.'),
    ('register_pair_configuration', 0x220995, 0x220a8b,
     'Configure a pair of registers from the supplied values; register semantics are unresolved.'),
]


def main():
    original_layout = json.loads(LAYOUT.read_text())
    original_routines = list(original_layout['routines'])
    original_names = {r['name'] for r in original_routines}
    original_tables = list(original_layout['tables'])
    _, expanded, _ = load_original()

    # The shared helper performs decoding, branch checks, strict assembly, and
    # collision rejection before it creates any new source file.
    recover(SPANS)

    layout = json.loads(LAYOUT.read_text())
    expected = {name for name, *_ in SPANS}
    additions = [r for r in layout['routines'] if r['name'] not in original_names]
    if {r['name'] for r in additions} != expected - original_names:
        raise ValueError('Recovery did not add exactly the requested routine records')
    if layout['tables'] != original_tables:
        raise ValueError('Unexpected table mutation')
    if [r for r in layout['routines'] if r['name'] in original_names] != original_routines:
        raise ValueError('Existing routine records were changed or reordered')
    recovered_records = [r for r in layout['routines'] if r['name'] in expected]
    if {r['name'] for r in recovered_records} != expected:
        raise ValueError('One or more requested routine records are missing')
    for name, start, end, _ in SPANS:
        code = expanded[start - 0x200000:end - 0x200000]
        source_path = next(r['source'] for r in recovered_records if r['name'] == name)
        source = (ROOT / source_path).read_text()
        encoded, _ = assemble(source, start)
        if encoded != code or sha(encoded) != sha(code):
            raise ValueError(f'Byte mismatch for {name}')

    print(f'Byte-exact recovery verified for {len(SPANS)} routines; existing records and tables preserved.')


if __name__ == '__main__':
    main()
