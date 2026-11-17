# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x237d4a,0x237d54); byte-exact only; hardware untested.
    bg.movhi r7, 0x45
    bg.sbz 0x5076(r7), r3
    bt.jr r9
