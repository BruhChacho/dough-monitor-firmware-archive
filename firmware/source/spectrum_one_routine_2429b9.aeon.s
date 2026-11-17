# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2429b9,0x2429c3); byte-exact only; hardware untested.
    bg.movhi r7, 0x45
    bg.lwz r3, 0x5230(r7)
    bt.jr r9
