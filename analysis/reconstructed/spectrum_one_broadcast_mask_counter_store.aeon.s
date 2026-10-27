# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23e13b,0x23e152); Store the supplied value at fixed address 0x455214 when the selector is nonzero, otherwise store zero; semantics are unknown.
# Fixed original addresses; not a hardware-validated implementation.
    bn.beqi r4, 0x0, loc_23e148
    bg.movhi r7, 0x45
    bg.sw_1 0x5214(r7), r3
    bt.jr r9
loc_23e148:
    bg.movhi r7, 0x45
    bg.sw_1 0x5214(r7), r0
    bt.jr r9
