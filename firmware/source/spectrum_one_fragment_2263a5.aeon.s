# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2263a5,0x226701); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x38
    bn.sw 0x34(r1), r9
    bn.sw 0x30(r1), r10
    bn.sw 0x2c(r1), r11
    bn.sw 0x28(r1), r12
    bn.sw 0x24(r1), r13
    bn.sw 0x20(r1), r14
    bn.sw 0x1c(r1), r15
    bn.sw 0x18(r1), r16
    bn.sw 0x14(r1), r17
    bn.sw 0x10(r1), r18
    bn.sw 0xc(r1), r19
    bn.sw 0x8(r1), r20
    bn.sw 0x4(r1), r21
    bn.sw 0x0(r1), r22
    bt.mov r15, r3
    bt.mov r19, r4
    bt.mov r18, r5
    bn.ori r7, r0, 0xa8
    bn.muls r11, r3, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r11, r5
    bg.lbz r16, 0x98(r11)
    bg.jal 0x2227da
    bt.mov r14, r3
    bt.mov r3, r15
    bt.mov r4, r14
    bg.jal 0x222ea6
    bn.ori r7, r0, 0xb0
    bn.muls r10, r14, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r10, r6
    bg.lbz r20, 0x89(r10)
    bg.lbz r5, 0x88(r10)
    bn.addi r6, r3, 0x1
    bn.muls r6, r20, r6
    bn.addi r7, r5, 0x1
    bn.muls r6, r6, r7
    bn.srli r7, r6, 0x1f
    bt.add r7, r6
    bn.srai r7, r7, 0x1
    bn.extbz r21, r7
    bn.ff1 r5, r5
    bn.sub r5, r0, r5
    bn.srli r5, r5, 0x1f
    bt.movi r12, 0x1
    bn.xor r7, r3, r12
    bn.ff1 r7, r7
    bt.addi r7, -0x1
    bn.srli r13, r7, 0x1f
    bg.beqi r5, 0x0, loc_2264e4
    bg.bnei r13, 0x0, loc_2265b7
loc_226447:
    bg.beqi r5, 0x0, loc_2264e4
loc_22644b:
    bg.beqi r16, 0x0, loc_226673
    bt.mov r3, r16
    bg.jal 0x2402c4
    bt.mov r12, r3
    bt.movi r7, 0x1
    bn.sll r7, r7, r3
    bn.extbz r4, r7
    bn.sub r7, r16, r4
    bn.extbz r16, r7
loc_226465:
    bn.ori r7, r0, 0x18
    bn.muls r6, r12, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x5c4
    bt.add r6, r7
    bn.sbz 0x15(r6), r0
    bt.movi r5, 0x6
    bn.beqi r13, 0x0, loc_226494
    bn.ori r7, r0, 0xb0
    bn.muls r7, r14, r7
    bg.movhi r23, 0x3b
    bg.addi r23, r23, 0x4950
    bt.add r7, r23
    bn.lbz r5, 0x7d(r7)
    bg.beq r14, r5, loc_22669e
loc_226494:
    bn.ori r6, r0, 0x18
    bn.muls r6, r12, r6
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x5c4
    bt.add r6, r7
    bt.movi r7, 0x1
    bn.sbz 0x0(r6), r7
    bn.ori r7, r0, 0xb0
    bn.muls r7, r14, r7
    bg.movhi r23, 0x3b
    bg.addi r23, r23, 0x4950
    bt.add r7, r23
    bg.lbz r7, 0x88(r7)
    bn.sbz 0x1(r6), r7
    bn.sbz 0x11(r6), r5
    bn.sh_2 0xe(r6), r18
    bn.sbz 0x10(r6), r14
    bn.sh_1 0xc(r6), r19
    bn.ori r7, r0, 0xa8
    bn.muls r7, r15, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bg.sbz 0x98(r7), r4
    bt.movi r13, 0x0
    bt.j loc_2264f0
loc_2264e4:
    bg.beqi r3, 0x1, loc_226684
    bg.beqi r3, 0x0, loc_2266a9
loc_2264ec:
    bt.movi r12, 0x0
    bt.movi r13, 0x0
loc_2264f0:
    bn.ori r10, r0, 0xa8
    bn.muls r10, r15, r10
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r10, r6
    bg.sh 0x98(r10), r19
    bg.sw_1 0x9c(r10), r18
    bg.sh 0x9c(r10), r0
    bg.sw_1 0xa0(r10), r0
    bn.ori r17, r0, 0x18
    bn.muls r11, r12, r17
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x5c4
    bt.add r11, r7
    bn.lbz r7, 0x11(r11)
    bn.sfeqi r7, 0x6
    bn.cmovsi_2 r5, r0, 0x1
    bt.mov r3, r14
    bt.mov r4, r20
    bn.andi r5, r5, 0x1
    bg.jal 0x222f55
    bt.mov r15, r3
    bn.lh r7, 0xe(r11)
    bn.sfeqi r7, 0x0
    bn.cmovsi_2 r5, r0, 0x1
    bt.mov r3, r14
    bt.mov r4, r21
    bn.andi r5, r5, 0x1
    bg.jal 0x222f8e
    bt.mov r6, r3
    bg.lbz r3, 0x98(r10)
    bn.sra r7, r3, r12
    bn.andi r7, r7, 0x1
    bn.beqi r7, 0x0, loc_22655f
    bn.sw 0x4(r11), r6
    bn.sw 0x8(r11), r15
loc_22655f:
    bn.sra r7, r3, r13
    bn.andi r7, r7, 0x1
    bn.beqi r7, 0x0, loc_22657b
    bn.muls r7, r13, r17
    bg.movhi r23, 0x48
    bg.addi r23, r23, -0x5c4
    bt.add r7, r23
    bn.sw 0x4(r7), r6
    bn.sw 0x8(r7), r15
loc_22657b:
    bt.mov r3, r16
    bg.jal 0x222fca
    bn.or r3, r19, r18
    bt.mov r4, r21
    bn.lwz r22, 0x0(r1)
    bn.lwz r21, 0x4(r1)
    bn.lwz r20, 0x8(r1)
    bn.lwz r19, 0xc(r1)
    bn.lwz r18, 0x10(r1)
    bn.lwz r17, 0x14(r1)
    bn.lwz r16, 0x18(r1)
    bn.lwz r15, 0x1c(r1)
    bn.lwz r14, 0x20(r1)
    bn.lwz r13, 0x24(r1)
    bn.lwz r12, 0x28(r1)
    bn.lwz r11, 0x2c(r1)
    bn.lwz r10, 0x30(r1)
    bn.lwz r9, 0x34(r1)
    bn.addi r1, r1, 0x38
    bg.j 0x222efa
loc_2265b7:
    bg.lbz r11, 0x97(r11)
    bg.beqi r11, 0x0, loc_226447
    bg.beqi r16, 0x0, loc_2266b8
    bt.mov r3, r16
    bg.jal 0x2402c4
    bt.mov r17, r3
    bt.movi r22, 0x1
    bn.sll r12, r22, r3
    bn.sub r7, r16, r12
    bn.extbz r11, r7
    bn.lbz r5, 0x7c(r10)
    bn.ori r7, r0, 0x18
    bn.muls r7, r3, r7
    bg.movhi r23, 0x48
    bg.addi r23, r23, -0x5c4
    bt.add r7, r23
    bn.sbz 0x15(r7), r0
    bn.sbz 0x0(r7), r22
    bg.lbz r6, 0x88(r10)
    bn.sbz 0x1(r7), r6
    bt.movi r6, 0x6
    bn.sbz 0x11(r7), r6
    bn.sh_2 0xe(r7), r0
    bn.sbz 0x10(r7), r5
    bn.sh_1 0xc(r7), r19
    bg.bnei r11, 0x0, loc_2266ee
loc_226608:
    bg.jal 0x222f30
    bt.mov r13, r3
    bt.movi r7, 0x1
    bn.sll r12, r7, r17
    bn.sll r23, r7, r3
    bt.movi r16, 0x0
loc_226618:
    bn.ori r5, r0, 0xb0
    bn.muls r5, r14, r5
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r5, r7
    bn.lbz r4, 0x7d(r5)
    bn.ori r7, r0, 0x18
    bn.muls r7, r13, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x5c4
    bt.add r7, r6
    bn.sbz 0x15(r7), r0
    bt.movi r6, 0x1
    bn.sbz 0x0(r7), r6
    bg.lbz r6, 0x88(r5)
    bn.sbz 0x1(r7), r6
    bt.movi r6, 0x6
    bn.sbz 0x11(r7), r6
    bn.sh_2 0xe(r7), r0
    bn.sbz 0x10(r7), r4
    bn.sh_1 0xc(r7), r18
    bn.ori r7, r0, 0xa8
    bn.muls r7, r15, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.or r6, r12, r23
    bg.sbz 0x98(r7), r6
    bt.mov r12, r17
    bt.j loc_2264f0
loc_226673:
    bg.jal 0x222f30
    bt.mov r12, r3
    bt.movi r7, 0x1
    bn.sll r7, r7, r3
    bn.extbz r4, r7
    bn.j loc_226465
loc_226684:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r15, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bg.lbz r7, 0x97(r7)
    bg.beqi r7, 0x0, loc_22644b
    bt.j loc_2264ec
loc_22669e:
    bn.lbz r5, 0x7c(r7)
    bt.movi r7, 0x1
    bn.sbz 0x15(r6), r7
    bn.j loc_226494
loc_2266a9:
    bt.mov r3, r15
    bt.movi r4, 0x1
    bg.jal 0x2262ce
    bg.beqi r3, 0x0, loc_2264ec
    bn.j loc_22644b
loc_2266b8:
    bg.jal 0x222f30
    bt.mov r17, r3
    bn.lbz r5, 0x7c(r10)
    bn.ori r7, r0, 0x18
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x5c4
    bt.add r7, r6
    bn.sbz 0x15(r7), r0
    bn.sbz 0x0(r7), r12
    bg.lbz r6, 0x88(r10)
    bn.sbz 0x1(r7), r6
    bt.movi r6, 0x6
    bn.sbz 0x11(r7), r6
    bn.sh_2 0xe(r7), r0
    bn.sbz 0x10(r7), r5
    bn.sh_1 0xc(r7), r19
    bt.j loc_226608
loc_2266ee:
    bt.mov r3, r11
    bg.jal 0x2402c4
    bt.mov r13, r3
    bn.sll r23, r22, r3
    bn.sub r7, r11, r23
    bn.extbz r16, r7
    bt.j loc_226618
