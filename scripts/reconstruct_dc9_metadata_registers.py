"""Recover register-update dependencies of the metadata consumer chain."""
from reconstruct_dc9_receive import recover

SPANS = [
    ('channel_register_bank_offset', 0x211855, 0x211874,
     'Map indices 1/2/3 to 0x300/0x800/0xb00, all other uint32 values to0.'),
    ('channel_enable_registers', 0x213b64, 0x213bbb,
     'Store enable byte and update two masked register fields; register meaning and ISA assumptions unresolved.'),
    ('metadata_register_mask40', 0x212d95, 0x212e18,
     'Clear bit0x40 in three logical registers, then set selected bits from input mask0x70.'),
    ('metadata_register_mask01', 0x212e18, 0x212e89,
     'Set bit0 in selected registers and accumulate corresponding low bits at an argument pointer.'),
]

if __name__ == '__main__':
    recover(SPANS)
