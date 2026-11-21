# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27ea14,0x27ea1e); byte-exact only; hardware untested.
    bg.movhi r7, 0x3d
    bg.lhz r3, -0x4790(r7)
    bt.jr r9
