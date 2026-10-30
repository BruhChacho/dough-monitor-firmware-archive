"""Recover metadata selection and masked register operations used by apply."""
from reconstruct_dc9_receive import recover

SPANS = [
    ('channel_source_read', 0x2227da, 0x2227ef,
     'Read byte at channel record base0x4821ec + index*168 +0x28; no local bound.'),
    ('engine_channel_read', 0x2227ef, 0x222804,
     'Read byte at engine record base0x47fa9c + index*124 +0x10; no local bound.'),
    ('engine_metadata_read', 0x222804, 0x222819,
     'Read metadata index byte at engine record base0x47fa9c + index*124 +0x1d; no local bound.'),
    ('metadata_engine_read', 0x222819, 0x22282e,
     'Read byte at metadata base0x3b4950 + index*176 +0x10; no local bound.'),
    ('metadata_mask_read', 0x22282e, 0x222843,
     'Read low halfword at metadata base0x3b4950 + index*176 +0x12; halfword semantics assumed.'),
    ('engine_mask_register_write', 0x21d1e5, 0x21d2bf,
     'Map engine to metadata key and select paged register bank, then write the supplied 16-bit mask.'),
    ('engine_mask_register_update', 0x21d2bf, 0x21d3b1,
     'Map engine to metadata key and mask-update selected 16-bit paged register; zero argument sets bits, nonzero clears.'),
    ('channel_mask_prepare', 0x23d3a0, 0x23d4fc,
     'Iterate selected engine bits, consult channel metadata, and dispatch register preparation; physical effects unverified.'),
    ('engine_geometry_service', 0x23d4fc, 0x23d71e,
     'Metadata/configuration guards and engine mode service after rectangle copy; external services and full execution unverified.'),
    ('register_mask_write8', 0x23dfe1, 0x23e0b6,
     'Read-modify-write byte as (old & ~mask) | (value & mask), with lock and unresolved counter-store semantics.'),
    ('register_mask_write16', 0x23e152, 0x23e18c,
     'Two masked byte updates for low and high halves; conditional store semantics inherited from byte helper.'),
]

if __name__ == '__main__':
    recover(SPANS)
