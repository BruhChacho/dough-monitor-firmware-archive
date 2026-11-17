# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27057f,0x270591); byte-exact only; hardware untested.
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.sw_1 0x5810(r7), r0
    bg.sw_1 0x5814(r7), r0
    bt.jr r9
