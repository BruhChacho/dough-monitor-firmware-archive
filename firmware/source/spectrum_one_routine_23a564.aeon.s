# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23a564,0x23a594); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bg.movhi r7, 0x3b
    bg.lwz r7, 0x5f38(r7)
    bn.lbz r3, 0x5a(r7)
    bg.jal 0x206e24
    bg.sfleui r10, 0xff
    bn.ori r7, r0, 0xff
    bn.cmov_0 r10, r10, r7
    bn.exthz r3, r10
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
