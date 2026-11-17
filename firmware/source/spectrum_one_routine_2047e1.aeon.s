# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2047e1,0x20484d); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r11, r3
    bn.lbz r24, 0xc(r1)
    bn.lh r23, 0x10(r1)
    bg.movhi r10, 0x48
    bg.sbz -0x1eac(r10), r4
    bg.addi r10, r10, -0x1eac
    bn.sbz 0x1(r10), r5
    bn.sbz 0x2(r10), r6
    bn.sbz 0x3(r10), r7
    bn.sbz 0x4(r10), r8
    bn.sbz 0x5(r10), r24
    bn.sbz 0x6(r10), r23
    bn.srli r23, r23, 0x8
    bn.sbz 0x7(r10), r23
    bg.movhi r3, 0x48
    bg.addi r3, r3, -0x1ea4
    bg.ori r4, r0, 0x3c0
    bg.jal 0x204080
    bn.exthz r3, r3
    bg.sbz 0x3c8(r10), r3
    bn.srli r3, r3, 0x8
    bg.sbz 0x3c9(r10), r3
    bt.mov r3, r11
    bt.mov r4, r10
    bg.ori r5, r0, 0x3ca
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x246205
