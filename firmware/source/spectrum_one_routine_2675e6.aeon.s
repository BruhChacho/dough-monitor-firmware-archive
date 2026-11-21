# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2675e6,0x267856); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x18
    bn.sw 0x14(r1), r9
    bn.sw 0x10(r1), r10
    bn.sw 0xc(r1), r11
    bn.sw 0x8(r1), r12
    bn.sw 0x4(r1), r13
    bn.sw 0x0(r1), r14
    bt.mov r14, r3
    bg.beqi r4, 0x0, loc_26774d
    bg.jal 0x242247
    bg.movhi r12, 0x3b
    bg.lwz r5, 0x5f38(r12)
    bn.lbz r7, 0x5a(r5)
    bn.add r6, r5, r7
    bn.ori r11, r0, 0x29
    bn.muls r7, r7, r11
    bn.ori r10, r0, 0xa4
    bn.lbz r6, 0x5b(r6)
    bn.muls r6, r10, r6
    bt.add r7, r6
    bt.add r7, r5
    bg.lbz r13, 0xda(r7)
    bt.movi r6, 0x5
    bg.sbz 0xda(r7), r6
    bg.lwz r5, 0x5f38(r12)
    bn.lbz r7, 0x5a(r5)
    bn.add r6, r5, r7
    bn.muls r7, r7, r11
    bn.lbz r6, 0x5b(r6)
    bn.muls r6, r10, r6
    bt.add r7, r6
    bt.add r7, r5
    bt.mov r3, r14
    bg.lbz r4, 0xda(r7)
    bt.movi r5, 0x0
    bg.jal 0x23a5aa
    bg.lwz r5, 0x5f38(r12)
    bn.lbz r7, 0x5a(r5)
    bn.add r6, r5, r7
    bn.muls r7, r7, r11
    bn.lbz r6, 0x5b(r6)
    bn.muls r6, r10, r6
    bt.add r7, r6
    bt.add r7, r5
    bg.sbz 0xda(r7), r13
    bt.mov r3, r14
    bt.movi r4, 0x0
    bg.jal 0x253ffc
    bg.lwz r5, 0x5f38(r12)
    bn.lbz r3, 0x5a(r5)
    bn.add r6, r5, r3
    bn.muls r7, r3, r11
    bn.lbz r6, 0x5b(r6)
    bn.muls r6, r10, r6
    bt.add r7, r6
    bt.add r7, r5
    bg.lbz r13, 0xf5(r7)
    bt.movi r4, 0x0
    bt.movi r5, 0x0
    bg.jal 0x239f8e
    bg.lwz r5, 0x5f38(r12)
    bn.lbz r7, 0x5a(r5)
    bn.add r6, r5, r7
    bn.muls r7, r7, r11
    bn.lbz r6, 0x5b(r6)
    bn.muls r6, r10, r6
    bt.add r7, r6
    bt.add r7, r5
    bg.sbz 0xf5(r7), r13
    bg.lwz r5, 0x5f38(r12)
    bn.lbz r7, 0x5a(r5)
    bn.add r6, r5, r7
    bn.muls r7, r7, r11
    bn.lbz r6, 0x5b(r6)
    bn.muls r6, r10, r6
    bt.add r7, r6
    bt.add r7, r5
    bg.lbz r13, 0xf6(r7)
    bg.sbz 0xf6(r7), r0
    bg.jal 0x2670d3
    bg.lwz r5, 0x5f38(r12)
    bn.lbz r7, 0x5a(r5)
    bn.add r6, r5, r7
    bn.muls r7, r7, r11
    bn.lbz r6, 0x5b(r6)
    bn.muls r6, r10, r6
    bt.add r7, r6
    bt.add r7, r5
    bg.sbz 0xf6(r7), r13
    bg.lwz r5, 0x5f38(r12)
    bn.lbz r7, 0x5a(r5)
    bn.add r6, r5, r7
    bn.muls r7, r7, r11
    bn.lbz r6, 0x5b(r6)
    bn.muls r6, r10, r6
    bt.add r7, r6
    bt.add r7, r5
    bg.lbz r13, 0xf7(r7)
    bg.sbz 0xf7(r7), r0
    bg.jal 0x267475
    bg.lwz r6, 0x5f38(r12)
    bn.lbz r7, 0x5a(r6)
    bn.add r5, r6, r7
    bn.muls r7, r7, r11
    bn.lbz r5, 0x5b(r5)
    bn.muls r10, r10, r5
    bt.add r7, r10
    bt.add r7, r6
    bg.sbz 0xf7(r7), r13
    bt.mov r3, r14
    bt.movi r4, 0x0
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bg.j 0x25437d
loc_26774d:
    bg.jal 0x242247
    bg.movhi r13, 0x3b
    bg.lwz r4, 0x5f38(r13)
    bg.movhi r7, 0x48
    bg.lbz r7, -0x4cb(r7)
    bt.add r7, r4
    bn.lbz r7, 0x50(r7)
    bg.beqi r7, 0x1, loc_267828
    bn.lbz r6, 0x5a(r4)
    bn.add r5, r4, r6
    bn.ori r7, r0, 0x29
    bn.muls r6, r6, r7
    bn.ori r7, r0, 0xa4
    bn.lbz r5, 0x5b(r5)
    bn.muls r7, r7, r5
    bt.add r6, r7
    bt.add r6, r4
    bg.lbz r4, 0xda(r6)
    bn.sfleui r4, 0x5
    bn.cmovsi_2 r5, r0, 0x1
    bt.mov r3, r14
    bn.andi r5, r5, 0x1
    bg.jal 0x23a5aa
loc_267796:
    bg.jal 0x26695b
    bg.lwz r5, 0x5f38(r13)
    bn.lbz r3, 0x5a(r5)
    bn.add r6, r5, r3
    bn.ori r11, r0, 0x29
    bn.muls r7, r3, r11
    bn.ori r10, r0, 0xa4
    bn.lbz r6, 0x5b(r6)
    bn.muls r6, r10, r6
    bt.add r7, r6
    bt.add r7, r5
    bg.lbz r12, 0xf5(r7)
    bn.ori r5, r0, 0x3f
    bn.muls r5, r12, r5
    bt.movi r7, 0xa
    bn.divs r5, r5, r7
    bt.movi r4, 0x1
    bn.extbz r5, r5
    bg.jal 0x239f8e
    bg.lwz r5, 0x5f38(r13)
    bn.lbz r7, 0x5a(r5)
    bn.add r6, r5, r7
    bn.muls r7, r7, r11
    bn.lbz r6, 0x5b(r6)
    bn.muls r6, r10, r6
    bt.add r7, r6
    bt.add r7, r5
    bg.sbz 0xf5(r7), r12
    bg.jal 0x2670d3
    bg.jal 0x267475
    bg.lwz r6, 0x5f38(r13)
    bn.lbz r7, 0x5a(r6)
    bn.add r5, r6, r7
    bn.muls r7, r7, r11
    bn.lbz r5, 0x5b(r5)
    bn.muls r10, r10, r5
    bt.add r7, r10
    bt.add r7, r6
    bt.mov r3, r14
    bg.lbz r4, 0xf8(r7)
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bg.j 0x25437d
loc_267828:
    bn.lbz r3, 0x5a(r4)
    bn.add r5, r4, r3
    bn.ori r7, r0, 0x29
    bn.muls r7, r3, r7
    bn.ori r6, r0, 0xa4
    bn.lbz r5, 0x5b(r5)
    bn.muls r6, r6, r5
    bt.add r7, r6
    bt.add r7, r4
    bg.lbz r7, 0xda(r7)
    bn.sfleui r7, 0x4
    bn.cmovsi_2 r5, r0, 0x1
    bt.movi r4, 0x5
    bn.andi r5, r5, 0x1
    bg.jal 0x23a5aa
    bt.j loc_267796
