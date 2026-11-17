# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x237d5e,0x237d68); byte-exact only; hardware untested.
    bg.movhi r7, 0x45
    bg.sbz 0x5075(r7), r3
    bt.jr r9
