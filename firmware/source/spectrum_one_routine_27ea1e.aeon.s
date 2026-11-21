# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27ea1e,0x27ea28); byte-exact only; hardware untested.
    bg.movhi r7, 0x45
    bg.sbz 0x79ce(r7), r3
    bt.jr r9
