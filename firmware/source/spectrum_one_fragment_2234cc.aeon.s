# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2234cc,0x2237bf); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x40
    bn.sw 0x3c(r1), r9
    bn.sw 0x38(r1), r10
    bn.sw 0x34(r1), r11
    bn.sw 0x30(r1), r12
    bn.sw 0x2c(r1), r13
    bn.sw 0x28(r1), r14
    bn.sw 0x24(r1), r15
    bn.sw 0x20(r1), r16
    bn.sw 0x1c(r1), r17
    bn.sw 0x18(r1), r18
    bn.sw 0x14(r1), r19
    bn.sw 0x10(r1), r20
    bn.sw 0xc(r1), r21
    bn.sw 0x8(r1), r22
    bt.mov r13, r3
    bt.mov r21, r4
    bt.mov r18, r5
    bt.mov r19, r6
    bt.mov r20, r7
    bn.ori r11, r0, 0xa8
    bn.muls r11, r3, r11
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r11, r5
    bg.lbz r14, 0x98(r11)
    bg.jal 0x2227da
    bt.mov r12, r3
    bn.ori r10, r0, 0xb0
    bn.muls r10, r3, r10
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r10, r6
    bg.lbz r22, 0x89(r10)
    bt.mov r3, r13
    bt.mov r4, r12
    bg.jal 0x222ea6
    bt.addi r3, 0x1
    bn.muls r3, r22, r3
    bg.lbz r7, 0x88(r10)
    bt.addi r7, 0x1
    bn.muls r3, r3, r7
    bn.addi r7, r3, 0x3
    bn.sflesi r3, -0x1
    bn.cmov_0 r7, r7, r3
    bn.srai r7, r7, 0x2
    bn.extbz r7, r7
    bn.sw 0x4(r1), r7
    bt.movi r16, 0x0
    bt.movi r15, 0x0
    bg.lbz r11, 0x97(r11)
    bg.bnei r11, 0x0, loc_223674
    bg.beqi r14, 0x0, loc_223743
    bt.mov r3, r14
    bg.jal 0x2402c4
    bt.mov r16, r3
    bt.movi r7, 0x1
    bn.sll r10, r7, r3
    bn.sub r7, r14, r10
    bn.extbz r14, r7
    bn.ori r7, r0, 0xb0
    bn.muls r7, r12, r7
    bg.movhi r23, 0x3b
    bg.addi r23, r23, 0x4950
    bt.add r7, r23
    bn.lbz r5, 0x7d(r7)
    bg.beq r12, r5, loc_223765
loc_223593:
    bn.lbz r4, 0x7c(r7)
    bn.ori r7, r0, 0x18
    bn.muls r7, r16, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x5c4
    bt.add r7, r6
    bn.sbz 0x15(r7), r0
loc_2235a9:
    bn.ori r6, r0, 0x18
    bn.muls r6, r16, r6
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x5c4
    bt.add r6, r7
    bt.movi r7, 0x1
    bn.sbz 0x0(r6), r7
    bn.ori r7, r0, 0xb0
    bn.muls r7, r12, r7
    bg.movhi r23, 0x3b
    bg.addi r23, r23, 0x4950
    bt.add r7, r23
    bg.lbz r7, 0x88(r7)
    bn.sbz 0x1(r6), r7
    bn.sbz 0x11(r6), r5
    bn.sbz 0x10(r6), r4
    bn.sh_2 0xe(r6), r18
    bn.sh_1 0xc(r6), r21
    bg.beqi r14, 0x0, loc_223781
    bt.mov r3, r14
    bg.jal 0x2402c4
    bt.mov r15, r3
    bt.movi r7, 0x1
    bn.sll r4, r7, r3
    bn.sub r7, r14, r4
    bn.extbz r14, r7
    bn.ori r7, r0, 0xb0
    bn.muls r7, r12, r7
    bg.movhi r24, 0x3b
    bg.addi r24, r24, 0x4950
    bt.add r7, r24
    bn.lbz r5, 0x7f(r7)
    bg.beq r12, r5, loc_2237a3
loc_22360f:
    bn.lbz r23, 0x7e(r7)
    bn.ori r7, r0, 0x18
    bn.muls r7, r15, r7
    bg.movhi r24, 0x48
    bg.addi r24, r24, -0x5c4
    bt.add r7, r24
    bn.sbz 0x15(r7), r0
loc_223625:
    bn.ori r6, r0, 0x18
    bn.muls r6, r15, r6
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x5c4
    bt.add r6, r7
    bt.movi r7, 0x1
    bn.sbz 0x0(r6), r7
    bn.ori r7, r0, 0xb0
    bn.muls r7, r12, r7
    bg.movhi r24, 0x3b
    bg.addi r24, r24, 0x4950
    bt.add r7, r24
    bg.lbz r7, 0x88(r7)
    bn.sbz 0x1(r6), r7
    bn.sbz 0x11(r6), r5
    bn.sbz 0x10(r6), r23
    bn.sh_2 0xe(r6), r20
    bn.sh_1 0xc(r6), r19
    bn.ori r7, r0, 0xa8
    bn.muls r7, r13, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.or r6, r10, r4
    bg.sbz 0x98(r7), r6
loc_223674:
    bn.ori r10, r0, 0xa8
    bn.muls r10, r13, r10
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r10, r6
    bg.sh 0x98(r10), r21
    bg.sw_1 0x9c(r10), r18
    bg.sh 0x9c(r10), r19
    bg.sw_1 0xa0(r10), r20
    bn.ori r17, r0, 0x18
    bn.muls r11, r16, r17
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x5c4
    bt.add r11, r7
    bn.lbz r7, 0x11(r11)
    bn.sfeqi r7, 0x6
    bn.cmovsi_2 r5, r0, 0x1
    bt.mov r3, r12
    bt.mov r4, r22
    bn.andi r5, r5, 0x1
    bg.jal 0x222f55
    bt.mov r13, r3
    bn.lh r7, 0xe(r11)
    bn.sfeqi r7, 0x0
    bn.cmovsi_2 r5, r0, 0x1
    bt.mov r3, r12
    bn.lwz r4, 0x4(r1)
    bn.andi r5, r5, 0x1
    bg.jal 0x222f8e
    bt.mov r6, r3
    bg.lbz r3, 0x98(r10)
    bn.sra r7, r3, r16
    bn.andi r7, r7, 0x1
    bn.beqi r7, 0x0, loc_2236e4
    bn.sw 0x4(r11), r6
    bn.sw 0x8(r11), r13
loc_2236e4:
    bn.sra r7, r3, r15
    bn.andi r7, r7, 0x1
    bn.beqi r7, 0x0, loc_223700
    bn.muls r7, r15, r17
    bg.movhi r23, 0x48
    bg.addi r23, r23, -0x5c4
    bt.add r7, r23
    bn.sw 0x4(r7), r6
    bn.sw 0x8(r7), r13
loc_223700:
    bt.mov r3, r14
    bg.jal 0x222fca
    bn.or r3, r21, r18
    bn.or r3, r19, r3
    bn.or r3, r20, r3
    bn.lwz r4, 0x4(r1)
    bn.lwz r22, 0x8(r1)
    bn.lwz r21, 0xc(r1)
    bn.lwz r20, 0x10(r1)
    bn.lwz r19, 0x14(r1)
    bn.lwz r18, 0x18(r1)
    bn.lwz r17, 0x1c(r1)
    bn.lwz r16, 0x20(r1)
    bn.lwz r15, 0x24(r1)
    bn.lwz r14, 0x28(r1)
    bn.lwz r13, 0x2c(r1)
    bn.lwz r12, 0x30(r1)
    bn.lwz r11, 0x34(r1)
    bn.lwz r10, 0x38(r1)
    bn.lwz r9, 0x3c(r1)
    bn.addi r1, r1, 0x40
    bg.j 0x222efa
loc_223743:
    bg.jal 0x222f30
    bt.mov r16, r3
    bt.movi r7, 0x1
    bn.sll r10, r7, r3
    bn.ori r7, r0, 0xb0
    bn.muls r7, r12, r7
    bg.movhi r23, 0x3b
    bg.addi r23, r23, 0x4950
    bt.add r7, r23
    bn.lbz r5, 0x7d(r7)
    bg.bne r12, r5, loc_223593
loc_223765:
    bn.lbz r5, 0x7c(r7)
    bn.ori r7, r0, 0x18
    bn.muls r7, r16, r7
    bg.movhi r24, 0x48
    bg.addi r24, r24, -0x5c4
    bt.add r7, r24
    bt.movi r6, 0x1
    bn.sbz 0x15(r7), r6
    bt.mov r4, r12
    bt.j loc_2235a9
loc_223781:
    bg.jal 0x222f30
    bt.mov r15, r3
    bt.movi r7, 0x1
    bn.sll r4, r7, r3
    bn.ori r7, r0, 0xb0
    bn.muls r7, r12, r7
    bg.movhi r24, 0x3b
    bg.addi r24, r24, 0x4950
    bt.add r7, r24
    bn.lbz r5, 0x7f(r7)
    bg.bne r12, r5, loc_22360f
loc_2237a3:
    bn.lbz r5, 0x7e(r7)
    bn.ori r7, r0, 0x18
    bn.muls r7, r15, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x5c4
    bt.add r7, r6
    bt.movi r6, 0x1
    bn.sbz 0x15(r7), r6
    bt.mov r23, r12
    bt.j loc_223625
