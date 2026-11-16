# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x238d07,0x238de2); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x18
    bn.sw 0x14(r1), r9
    bn.sw 0x10(r1), r10
    bn.sw 0xc(r1), r11
    bn.sw 0x8(r1), r12
    bn.lbz r6, 0x2(r3)
    bn.lbz r7, 0x1(r3)
    bn.lbz r3, 0x0(r3)
    bg.beqi r3, 0x0, loc_238dc7
    bn.slli r6, r6, 0x8
    bn.or r6, r6, r7
    bn.srli r5, r6, 0xc
    bn.andi r7, r6, 0xf
    bn.sbz 0x4(r1), r7
    bn.andi r7, r6, 0xf0
    bn.srai r7, r7, 0x4
    bn.sbz 0x5(r1), r7
    bg.ori r7, r0, 0xf00
    bn.and r6, r6, r7
    bn.srai r6, r6, 0x8
    bn.sbz 0x6(r1), r6
    bn.sbz 0x7(r1), r5
    bn.beqi r5, 0x0, loc_238da3
    bn.sw 0x0(r1), r0
    bt.movi r10, 0x0
    bn.addi r12, r1, 0x4
    bt.mov r11, r1
loc_238d58:
    bn.add r7, r12, r10
    bn.lbz r3, 0x0(r7)
    bg.jal 0x23890a
    bn.add r7, r11, r10
    bn.sbz 0x0(r7), r3
    bt.addi r10, 0x1
    bg.bnei r10, 0x4, loc_238d58
    bt.movi r3, 0x0
    bt.movi r4, 0x1
    bg.jal 0x23e71e
    bt.movi r3, 0x3
    bn.lbz r4, 0x0(r1)
    bn.lbz r5, 0x1(r1)
    bn.lbz r6, 0x2(r1)
    bn.lbz r7, 0x3(r1)
loc_238d84:
    bg.jal 0x23eb92
    bt.movi r3, 0x0
    bg.jal 0x22e68a
    bt.movi r3, 0x0
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bg.j 0x2271a9
loc_238da3:
    bt.movi r3, 0x0
    bt.movi r4, 0x1
    bg.jal 0x23e71e
    bn.lbz r3, 0x4(r1)
    bg.jal 0x23890a
    bt.mov r10, r3
    bn.lbz r3, 0x5(r1)
    bg.jal 0x23890a
    bt.mov r5, r3
    bt.movi r3, 0x1
    bt.mov r4, r10
    bt.movi r6, 0x6
    bt.movi r7, 0x6
    bt.j loc_238d84
loc_238dc7:
    bt.movi r4, 0x0
    bg.jal 0x23e71e
    bt.movi r3, 0x0
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bg.j 0x22e68a
