# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2684dd,0x2684e9); byte-exact only; hardware untested.
    bg.movhi r7, 0x47
    bg.sbz -0x2d53(r7), r3
    bg.j 0x23a594
