# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x205190,0x205200); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bg.movhi r10, 0x3b
    bg.lwz r7, 0x5f38(r10)
    bn.lbz r3, 0x5a(r7)
    bg.ori r4, r0, 0x400
    bg.ori r5, r0, 0x400
    bg.ori r6, r0, 0x400
    bg.jal 0x204d6f
    bg.lwz r7, 0x5f38(r10)
    bn.lbz r3, 0x5a(r7)
    bg.ori r4, r0, 0x400
    bg.ori r5, r0, 0x400
    bg.ori r6, r0, 0x400
    bg.jal 0x204f79
    bg.lwz r7, 0x5f38(r10)
    bn.lbz r3, 0x5a(r7)
    bg.ori r4, r0, 0x400
    bg.ori r5, r0, 0x400
    bg.ori r6, r0, 0x400
    bg.jal 0x204b65
    bg.lwz r7, 0x5f38(r10)
    bn.lbz r3, 0x5a(r7)
    bg.ori r4, r0, 0x400
    bg.ori r5, r0, 0x400
    bg.ori r6, r0, 0x400
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x20494e
