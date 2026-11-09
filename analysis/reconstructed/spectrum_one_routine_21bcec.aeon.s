# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21bcec,0x21bcf6); byte-exact only; hardware untested.
    bg.movhi r7, 0x45
    bg.sw_1 0x4830(r7), r3
    bt.jr r9
