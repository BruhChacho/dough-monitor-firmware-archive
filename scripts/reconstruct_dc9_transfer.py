"""Recover exact transfer-service dependencies without replacing edited source."""
from reconstruct_dc9_receive import recover

SPANS = [
    ('slot_lookup_channel', 0x20c711, 0x20c73b, 'Return first matching channel-table index for slot+1; sentinel 6 when absent.'),
    ('slot_followup', 0x20d2b7, 0x20d33c, 'Copy received frame to shadow buffer, format response, prepare transmit and write final marker.'),
    ('indirect_buffer_write8', 0x20e3be, 0x20e43a, 'Indirect byte write with busy polling and masked-update dependency; store semantics unresolved.'),
    ('indirect_buffer_write32_reverse', 0x20e43a, 0x20e47e, 'Write r3 bytes from least to most significant at descending indirect addresses 0x4fff..0x4ffc.'),
    ('memory_copy', 0x2aab1e, 0x2aab77, 'Forward copy using aligned words and byte remainder; overlap is not handled as memmove.'),
    ('slot_response_format', 0x26bdd1, 0x26bf22, 'Format selector-1/3 responses and update mirrored settings; bg.sh address lane unresolved.'),
    ('slot_transmit_prepare', 0x20cd94, 0x20cf64, 'Add header/checksum, set transmit metadata, queue initial bytes and arm slot control.'),
    ('slot_wait_and_clear', 0x20cd4a, 0x20cd94, 'Poll slot state with up to twenty calls to an unresolved delay helper, then clear it.'),
]

if __name__ == '__main__':
    recover(SPANS)
