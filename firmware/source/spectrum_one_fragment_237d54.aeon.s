# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x237d54,0x237d5e); byte-exact only; hardware untested.
    bg.movhi r7, 0x3b
    bg.sw_1 0x426c(r7), r3
    bt.jr r9
