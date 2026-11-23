# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x254212,0x25430b); byte-exact only; hardware untested.
    bg.addi r1, r1, -0x9c
    bg.sw_0 0x98(r1), r9
    bg.sw_0 0x94(r1), r10
    bg.sw_0 0x90(r1), r11
    bg.sw_0 0x8c(r1), r12
    bg.sw_0 0x88(r1), r13
    bg.sw_0 0x84(r1), r14
    bg.sw_0 0x80(r1), r15
    bt.mov r12, r3
    bg.movhi r6, 0x3b
    bg.lwz r7, 0x7468(r6)
    bg.beq r3, r7, loc_2542e9
    bg.sw_0 0x7468(r6), r3
    bt.movi r6, 0x1
    bg.movhi r7, 0x45
    bg.sbz 0x3ca8(r7), r6
    bg.movhi r7, 0x45
    bg.sbz 0x3cb1(r7), r0
    bg.addi r7, r7, 0x3cb1
    bn.sbz 0x1(r7), r0
    bn.sbz 0x2(r7), r0
    bn.sbz 0x3(r7), r0
    bn.sbz 0x0(r1), r0
    bg.ori r7, r0, 0x74a
    bn.sw 0xc(r1), r7
    bn.ori r7, r0, 0x10
    bn.sbz 0x10(r1), r7
    bg.addi r6, r0, 0xf00
    bn.sh_2 0x12(r1), r6
    bg.addi r7, r0, 0x870
    bn.sh_1 0x14(r1), r7
    bn.sh_1 0x18(r1), r6
    bg.addi r7, r0, 0x8ef
    bn.sh_2 0x16(r1), r7
    bn.sbz 0x1a(r1), r0
    bn.sbz 0x1b(r1), r0
    bn.sbz 0x1c(r1), r0
    bg.movhi r7, 0x45
    bg.sbz 0x7490(r7), r0
    bt.movi r11, 0x5
    bt.movi r10, 0x1
    bg.movhi r15, 0x3b
    bn.ori r14, r0, 0x7c
    bt.j loc_2542b5
loc_2542a9:
    bn.srli r11, r11, 0x1
    bn.beqi r10, 0x3, loc_2542e9
loc_2542af:
    bn.addi r7, r10, 0x1
    bn.extbz r10, r7
loc_2542b5:
    bn.andi r7, r11, 0x1
    bn.beqi r7, 0x0, loc_2542a9
    bn.muls r7, r10, r14
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lwz r7, 0x4(r7)
    bg.sw_0 0x7430(r15), r7
    bt.movi r3, 0x1
    bt.mov r4, r12
    bt.mov r5, r1
    bg.jal 0x253c6f
    bt.movi r3, 0x0
    bt.mov r4, r12
    bt.mov r5, r1
    bg.jal 0x253c6f
    bn.srli r11, r11, 0x1
    bn.bnei r10, 0x3, loc_2542af
loc_2542e9:
    bg.lwz r15, 0x80(r1)
    bg.lwz r14, 0x84(r1)
    bg.lwz r13, 0x88(r1)
    bg.lwz r12, 0x8c(r1)
    bg.lwz r11, 0x90(r1)
    bg.lwz r10, 0x94(r1)
    bg.lwz r9, 0x98(r1)
    bg.addi r1, r1, 0x9c
    bt.jr r9
