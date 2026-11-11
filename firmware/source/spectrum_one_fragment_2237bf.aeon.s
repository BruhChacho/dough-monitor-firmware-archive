# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2237bf,0x223b11); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x48
    bn.sw 0x44(r1), r9
    bn.sw 0x40(r1), r10
    bn.sw 0x3c(r1), r11
    bn.sw 0x38(r1), r12
    bn.sw 0x34(r1), r13
    bn.sw 0x30(r1), r14
    bn.sw 0x2c(r1), r15
    bn.sw 0x28(r1), r16
    bn.sw 0x24(r1), r17
    bn.sw 0x20(r1), r18
    bn.sw 0x1c(r1), r19
    bn.sw 0x18(r1), r20
    bn.sw 0x14(r1), r21
    bn.sw 0x10(r1), r22
    bt.mov r19, r3
    bn.sw 0x4(r1), r4
    bt.mov r21, r5
    bn.sw 0x0(r1), r6
    bn.ori r7, r0, 0xa8
    bn.muls r7, r3, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bg.lbz r11, 0x98(r7)
    bg.jal 0x2227da
    bt.mov r13, r3
    bn.ori r10, r0, 0xb0
    bn.muls r10, r3, r10
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r10, r6
    bg.lbz r7, 0x89(r10)
    bn.sw 0x8(r1), r7
    bt.mov r3, r19
    bt.mov r4, r13
    bg.jal 0x222ea6
    bt.addi r3, 0x1
    bn.lwz r24, 0x8(r1)
    bn.muls r3, r24, r3
    bg.lbz r7, 0x88(r10)
    bt.addi r7, 0x1
    bn.muls r3, r3, r7
    bn.srli r7, r3, 0x1f
    bt.add r7, r3
    bn.srai r7, r7, 0x1
    bn.extbz r7, r7
    bn.sw 0xc(r1), r7
    bg.beqi r11, 0x0, loc_223aa3
    bt.mov r3, r11
    bg.jal 0x2402c4
    bt.mov r17, r3
    bt.movi r7, 0x1
    bn.sll r20, r7, r3
    bn.sub r7, r11, r20
    bn.extbz r11, r7
    bn.ori r7, r0, 0xb0
    bn.muls r7, r13, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r7, r5
    bn.lbz r5, 0x7d(r7)
    bg.beq r13, r5, loc_223ac5
loc_22387c:
    bn.lbz r4, 0x7c(r7)
    bn.ori r7, r0, 0x18
    bn.muls r7, r17, r7
    bg.movhi r24, 0x48
    bg.addi r24, r24, -0x5c4
    bt.add r7, r24
    bn.sbz 0x15(r7), r0
loc_223892:
    bn.ori r12, r0, 0x18
    bn.muls r7, r17, r12
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x5c4
    bt.add r7, r6
    bt.movi r14, 0x1
    bn.sbz 0x0(r7), r14
    bn.ori r6, r0, 0xb0
    bn.muls r10, r13, r6
    bg.movhi r24, 0x3b
    bg.addi r24, r24, 0x4950
    bt.add r10, r24
    bg.lbz r6, 0x88(r10)
    bn.sbz 0x1(r7), r6
    bn.sh_2 0xe(r7), r0
    bn.sbz 0x11(r7), r5
    bn.sbz 0x10(r7), r4
    bn.lwz r5, 0x4(r1)
    bn.sh_1 0xc(r7), r5
    bg.beqi r11, 0x0, loc_223a6f
    bt.mov r3, r11
    bg.jal 0x2402c4
    bt.mov r16, r3
    bt.movi r18, 0x1
    bn.sll r14, r18, r3
    bn.sub r7, r11, r14
    bn.extbz r11, r7
    bn.lbz r4, 0x7d(r10)
    bn.lbz r5, 0x7e(r10)
    bn.muls r7, r3, r12
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x5c4
    bt.add r7, r6
    bn.sbz 0x15(r7), r0
    bn.sbz 0x0(r7), r18
    bg.lbz r6, 0x88(r10)
    bn.sbz 0x1(r7), r6
    bn.sh_2 0xe(r7), r0
    bn.sbz 0x11(r7), r5
    bn.sbz 0x10(r7), r4
    bn.sh_1 0xc(r7), r21
    bg.bnei r11, 0x0, loc_223afe
loc_223914:
    bg.jal 0x222f30
    bt.mov r15, r3
    bt.movi r7, 0x1
    bn.sll r14, r7, r16
    bn.sll r4, r7, r3
    bt.movi r22, 0x0
loc_223924:
    bn.ori r7, r0, 0xb0
    bn.muls r7, r13, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r7, r5
    bn.lbz r5, 0x7f(r7)
    bg.beq r13, r5, loc_223ae2
    bn.lbz r23, 0x7e(r7)
    bn.ori r7, r0, 0x18
    bn.muls r7, r15, r7
    bg.movhi r24, 0x48
    bg.addi r24, r24, -0x5c4
    bt.add r7, r24
    bn.sbz 0x15(r7), r0
loc_223951:
    bn.ori r18, r0, 0x18
    bn.muls r7, r15, r18
    bg.movhi r24, 0x48
    bg.addi r6, r24, -0x5c4
    bn.add r11, r7, r6
    bt.movi r7, 0x1
    bn.sbz 0x0(r11), r7
    bn.ori r7, r0, 0xb0
    bn.muls r7, r13, r7
    bg.movhi r24, 0x3b
    bg.addi r24, r24, 0x4950
    bt.add r7, r24
    bg.lbz r7, 0x88(r7)
    bn.sbz 0x1(r11), r7
    bn.sh_2 0xe(r11), r0
    bn.sbz 0x11(r11), r5
    bn.sbz 0x10(r11), r23
    bn.lwz r5, 0x0(r1)
    bn.sh_1 0xc(r11), r5
    bn.ori r10, r0, 0xa8
    bn.muls r10, r19, r10
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r10, r7
    bn.or r7, r14, r4
    bn.or r7, r20, r7
    bg.sbz 0x98(r10), r7
    bg.sh 0x98(r10), r0
    bg.sw_1 0x9c(r10), r0
    bg.sh 0x9c(r10), r0
    bg.sw_1 0xa0(r10), r0
    bn.muls r7, r17, r18
    bn.add r12, r7, r6
    bn.lbz r7, 0x11(r12)
    bn.sfeqi r7, 0x6
    bn.cmovsi_2 r5, r0, 0x1
    bt.mov r3, r13
    bn.lwz r4, 0x8(r1)
    bn.andi r5, r5, 0x1
    bg.jal 0x222f55
    bt.mov r14, r3
    bn.lh r7, 0xe(r12)
    bn.sfeqi r7, 0x0
    bn.cmovsi_2 r5, r0, 0x1
    bt.mov r3, r13
    bn.lwz r4, 0xc(r1)
    bn.andi r5, r5, 0x1
    bg.jal 0x222f8e
    bt.mov r6, r3
    bg.lbz r3, 0x98(r10)
    bn.sra r7, r3, r17
    bn.andi r7, r7, 0x1
    bn.beqi r7, 0x0, loc_2239fe
    bn.sw 0x4(r12), r6
    bn.sw 0x8(r12), r14
loc_2239fe:
    bn.sra r7, r3, r16
    bn.andi r7, r7, 0x1
    bn.beqi r7, 0x0, loc_223a1a
    bn.muls r7, r16, r18
    bg.movhi r24, 0x48
    bg.addi r24, r24, -0x5c4
    bt.add r7, r24
    bn.sw 0x4(r7), r6
    bn.sw 0x8(r7), r14
loc_223a1a:
    bn.sra r7, r3, r15
    bn.andi r7, r7, 0x1
    bn.beqi r7, 0x0, loc_223a29
    bn.sw 0x4(r11), r6
    bn.sw 0x8(r11), r14
loc_223a29:
    bt.mov r3, r22
    bg.jal 0x222fca
    bn.lwz r5, 0x4(r1)
    bn.or r3, r5, r21
    bn.lwz r6, 0x0(r1)
    bn.or r3, r6, r3
    bn.lwz r4, 0xc(r1)
    bn.lwz r22, 0x10(r1)
    bn.lwz r21, 0x14(r1)
    bn.lwz r20, 0x18(r1)
    bn.lwz r19, 0x1c(r1)
    bn.lwz r18, 0x20(r1)
    bn.lwz r17, 0x24(r1)
    bn.lwz r16, 0x28(r1)
    bn.lwz r15, 0x2c(r1)
    bn.lwz r14, 0x30(r1)
    bn.lwz r13, 0x34(r1)
    bn.lwz r12, 0x38(r1)
    bn.lwz r11, 0x3c(r1)
    bn.lwz r10, 0x40(r1)
    bn.lwz r9, 0x44(r1)
    bn.addi r1, r1, 0x48
    bg.j 0x222efa
loc_223a6f:
    bg.jal 0x222f30
    bn.lbz r4, 0x7d(r10)
    bn.lbz r5, 0x7e(r10)
    bt.mov r16, r3
    bn.muls r7, r3, r12
    bg.movhi r24, 0x48
    bg.addi r24, r24, -0x5c4
    bt.add r7, r24
    bn.sbz 0x15(r7), r0
    bn.sbz 0x0(r7), r14
    bg.lbz r6, 0x88(r10)
    bn.sbz 0x1(r7), r6
    bn.sh_2 0xe(r7), r0
    bn.sbz 0x11(r7), r5
    bn.sbz 0x10(r7), r4
    bn.sh_1 0xc(r7), r21
    bt.j loc_223914
loc_223aa3:
    bg.jal 0x222f30
    bt.mov r17, r3
    bt.movi r7, 0x1
    bn.sll r20, r7, r3
    bn.ori r7, r0, 0xb0
    bn.muls r7, r13, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r7, r5
    bn.lbz r5, 0x7d(r7)
    bg.bne r13, r5, loc_22387c
loc_223ac5:
    bn.lbz r5, 0x7c(r7)
    bn.ori r7, r0, 0x18
    bn.muls r7, r17, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x5c4
    bt.add r7, r6
    bt.movi r6, 0x1
    bn.sbz 0x15(r7), r6
    bt.mov r4, r13
    bn.j loc_223892
loc_223ae2:
    bn.lbz r5, 0x7e(r7)
    bn.ori r7, r0, 0x18
    bn.muls r7, r15, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x5c4
    bt.add r7, r6
    bt.movi r6, 0x1
    bn.sbz 0x15(r7), r6
    bt.mov r23, r13
    bt.j loc_223951
loc_223afe:
    bt.mov r3, r11
    bg.jal 0x2402c4
    bt.mov r15, r3
    bn.sll r4, r18, r3
    bn.sub r7, r11, r4
    bn.extbz r22, r7
    bt.j loc_223924
