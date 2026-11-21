# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27e9c4,0x27e9e6); byte-exact only; hardware untested.
    bg.movhi r7, 0x3d
    bg.sw_0 -0x478c(r7), r3
    bg.movhi r7, 0x3d
    bg.sw_0 -0x4788(r7), r5
    bg.movhi r7, 0x3d
    bg.sw_0 -0x4784(r7), r4
    bg.movhi r7, 0x3d
    bg.sw_0 -0x4780(r7), r6
    bt.jr r9
