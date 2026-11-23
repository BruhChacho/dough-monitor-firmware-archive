# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23836f,0x238379); byte-exact only; hardware untested.
    bg.movhi r7, 0x45
    bg.lbz r3, 0x3c28(r7)
    bt.jr r9
