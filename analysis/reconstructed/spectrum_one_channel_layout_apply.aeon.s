# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23fad0,0x23fc0a); Apply orchestration: external setup, four engine calls, then three record flags and mask-selected rectangle copies; hardware dependencies unexecuted.
# Fixed original addresses; not a hardware-validated implementation.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bn.sw 0x14(r1), r10
    bn.sw 0x10(r1), r11
    bn.sw 0xc(r1), r12
    bn.sw 0x8(r1), r13
    bn.sw 0x4(r1), r14
    bn.sw 0x0(r1), r15
    bg.jal 0x22aca0
    bg.ori r3, r0, 0x1fff
    bt.movi r4, 0x1
    bg.jal 0x22dc46
    bt.movi r3, 0xf
    bg.jal 0x222fca
    bt.movi r3, 0x4
    bt.movi r4, 0x0
    bg.jal 0x22ac17
    bt.mov r15, r3
    bg.jal 0x2421d3
    bt.movi r3, 0xf
    bt.movi r4, 0x1
    bg.jal 0x22607c
    bt.movi r11, 0x0
loc_23fb14:
    bn.extbz r10, r11
    bt.movi r3, 0x1
    bt.mov r4, r10
    bg.jal 0x220a8b
    bt.mov r3, r10
    bg.jal 0x204000
    bt.mov r3, r10
    bt.movi r4, 0x1
    bg.jal 0x22d986
    bt.addi r11, 0x1
    bg.bnei r11, 0x4, loc_23fb14
    bg.jal 0x23d349
    bg.jal 0x2250e8
    bg.jal 0x226100
    bt.movi r13, 0x0
    bg.movhi r7, 0x48
    bg.addi r12, r7, 0x226d
    bg.movhi r7, 0x48
    bg.addi r14, r7, 0x21ec
loc_23fb51:
    bn.extbz r11, r13
    bn.lbz r6, 0x0(r12)
    bn.bnei r6, 0x0, loc_23fb83
loc_23fb5a:
    bt.addi r13, 0x1
    bg.addi r14, r14, 0xa8
    bg.addi r12, r12, 0xa8
    bn.bnei r13, 0x3, loc_23fb51
    bt.mov r3, r15
    bn.lwz r15, 0x0(r1)
    bn.lwz r14, 0x4(r1)
    bn.lwz r13, 0x8(r1)
    bn.lwz r12, 0xc(r1)
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
loc_23fb83:
    bn.addi r7, r12, -0x57
    bn.lh r10, 0x0(r7)
    bt.mov r3, r11
    bn.lwz r4, 0x8(r14)
    bn.lwz r5, 0xc(r14)
    bg.jal 0x22eb07
    bt.mov r3, r11
    bn.lbz r4, 0x3(r12)
    bg.jal 0x2247fb
    bt.mov r3, r11
    bg.jal 0x22683c
    bt.mov r3, r10
    bt.movi r4, 0x6
    bg.jal 0x222cbd
    bn.beqi r10, 0x0, loc_23fb5a
    bt.movi r11, 0x0
    bt.j loc_23fbbb
loc_23fbb3:
    bn.srli r10, r10, 0x1
    bt.addi r11, 0x1
    bn.beqi r10, 0x0, loc_23fb5a
loc_23fbbb:
    bn.extbz r3, r11
    bn.andi r7, r10, 0x1
    bn.beqi r7, 0x0, loc_23fbb3
    bn.ori r7, r0, 0x7c
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lbz r6, -0x69(r12)
    bn.sbz 0x20(r7), r6
    bn.lbz r6, -0x68(r12)
    bn.sbz 0x21(r7), r6
    bn.lbz r6, -0x67(r12)
    bn.sbz 0x22(r7), r6
    bn.lbz r6, -0x66(r12)
    bn.sbz 0x23(r7), r6
    bn.lbz r6, -0x65(r12)
    bn.sbz 0x24(r7), r6
    bn.lbz r6, -0x64(r12)
    bn.sbz 0x25(r7), r6
    bn.lbz r6, -0x63(r12)
    bn.sbz 0x26(r7), r6
    bn.lbz r6, -0x62(r12)
    bn.sbz 0x27(r7), r6
    bg.jal 0x23d4fc
    bt.j loc_23fbb3
