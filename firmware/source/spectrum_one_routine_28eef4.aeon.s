# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x28eef4,0x28ef3c); byte-exact only; hardware untested.
    bg.movhi r23, 0x3f
    bg.sw_0 0x5480(r23), r3
    bg.movhi r23, 0x3f
    bg.sw_0 0x5484(r23), r4
    bg.movhi r4, 0x3f
    bg.sw_0 0x5488(r4), r5
    bg.movhi r5, 0x3f
    bg.sw_0 0x548c(r5), r6
    bg.movhi r6, 0x3f
    bg.sw_0 0x5490(r6), r7
    bg.movhi r7, 0x3f
    bg.sw_0 0x5494(r7), r8
    bn.lwz r6, 0x0(r1)
    bg.movhi r7, 0x3f
    bg.sw_0 0x5498(r7), r6
    bn.lwz r6, 0x4(r1)
    bg.movhi r7, 0x3f
    bg.sw_0 0x549c(r7), r6
    bt.jr r9
