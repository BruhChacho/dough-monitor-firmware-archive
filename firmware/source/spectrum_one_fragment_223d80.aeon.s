# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x223d80,0x223fb3); byte-exact only; hardware untested.
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
    bt.mov r15, r3
    bt.mov r19, r4
    bt.mov r18, r5
    bt.mov r22, r6
    bn.sw 0x4(r1), r7
    bn.ori r7, r0, 0xa8
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bg.lbz r11, 0x98(r7)
    bg.jal 0x2227da
    bt.mov r16, r3
    bn.ori r7, r0, 0xb0
    bn.muls r10, r3, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r10, r7
    bg.lbz r20, 0x89(r10)
    bt.mov r3, r15
    bt.mov r4, r16
    bg.jal 0x222ea6
    bt.addi r3, 0x1
    bn.muls r3, r20, r3
    bg.lbz r7, 0x88(r10)
    bt.addi r7, 0x1
    bn.muls r3, r3, r7
    bn.addi r7, r3, 0x3
    bn.sflesi r3, -0x1
    bn.cmov_0 r7, r7, r3
    bn.srai r7, r7, 0x2
    bn.extbz r21, r7
    bg.beqi r11, 0x0, loc_223f68
    bt.mov r3, r11
    bg.jal 0x2402c4
    bt.mov r13, r3
    bt.movi r17, 0x1
    bn.sll r12, r17, r3
    bn.sub r7, r11, r12
    bn.extbz r11, r7
    bn.lbz r5, 0x7c(r10)
    bn.ori r7, r0, 0x18
    bn.muls r7, r3, r7
    bg.movhi r25, 0x48
    bg.addi r25, r25, -0x5c4
    bt.add r7, r25
    bn.sbz 0x15(r7), r0
    bn.sbz 0x0(r7), r17
    bg.lbz r6, 0x88(r10)
    bn.sbz 0x1(r7), r6
    bt.movi r6, 0x6
    bn.sbz 0x11(r7), r6
    bn.sbz 0x10(r7), r5
    bn.sh_2 0xe(r7), r18
    bn.sh_1 0xc(r7), r19
    bg.bnei r11, 0x0, loc_223fa0
loc_223e54:
    bg.jal 0x222f30
    bt.mov r14, r3
    bt.movi r7, 0x1
    bn.sll r12, r7, r13
    bn.sll r24, r7, r3
    bt.movi r17, 0x0
loc_223e64:
    bn.ori r6, r0, 0xb0
    bn.muls r6, r16, r6
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r6, r7
    bn.lbz r4, 0x7d(r6)
    bn.ori r5, r0, 0x18
    bn.muls r7, r14, r5
    bg.movhi r25, 0x48
    bg.addi r23, r25, -0x5c4
    bn.add r11, r7, r23
    bn.sbz 0x15(r11), r0
    bt.movi r7, 0x1
    bn.sbz 0x0(r11), r7
    bg.lbz r7, 0x88(r6)
    bn.sbz 0x1(r11), r7
    bt.movi r7, 0x6
    bn.sbz 0x11(r11), r7
    bn.sbz 0x10(r11), r4
    bn.lwz r6, 0x4(r1)
    bn.sh_2 0xe(r11), r6
    bn.sh_1 0xc(r11), r22
    bn.ori r10, r0, 0xa8
    bn.muls r10, r15, r10
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r10, r7
    bn.or r7, r12, r24
    bg.sbz 0x98(r10), r7
    bg.sh 0x98(r10), r0
    bg.sw_1 0x9c(r10), r0
    bg.sh 0x9c(r10), r0
    bg.sw_1 0xa0(r10), r0
    bn.muls r5, r13, r5
    bn.add r12, r5, r23
    bn.lbz r7, 0x11(r12)
    bn.sfeqi r7, 0x6
    bn.cmovsi_2 r5, r0, 0x1
    bt.mov r3, r16
    bt.mov r4, r20
    bn.andi r5, r5, 0x1
    bg.jal 0x222f55
    bt.mov r15, r3
    bn.lh r7, 0xe(r12)
    bn.sfeqi r7, 0x0
    bn.cmovsi_2 r5, r0, 0x1
    bt.mov r3, r16
    bt.mov r4, r21
    bn.andi r5, r5, 0x1
    bg.jal 0x222f8e
    bt.mov r6, r3
    bg.lbz r3, 0x98(r10)
    bn.sra r7, r3, r13
    bn.andi r7, r7, 0x1
    bn.beqi r7, 0x0, loc_223f14
    bn.sw 0x4(r12), r6
    bn.sw 0x8(r12), r15
loc_223f14:
    bn.sra r7, r3, r14
    bn.andi r7, r7, 0x1
    bn.beqi r7, 0x0, loc_223f23
    bn.sw 0x4(r11), r6
    bn.sw 0x8(r11), r15
loc_223f23:
    bt.mov r3, r17
    bg.jal 0x222fca
    bn.or r3, r19, r18
    bn.or r3, r22, r3
    bn.lwz r25, 0x4(r1)
    bn.or r3, r25, r3
    bt.mov r4, r21
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
loc_223f68:
    bg.jal 0x222f30
    bn.lbz r5, 0x7c(r10)
    bt.mov r13, r3
    bn.ori r7, r0, 0x18
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x5c4
    bt.add r7, r6
    bn.sbz 0x15(r7), r0
    bt.movi r6, 0x1
    bn.sbz 0x0(r7), r6
    bg.lbz r6, 0x88(r10)
    bn.sbz 0x1(r7), r6
    bt.movi r6, 0x6
    bn.sbz 0x11(r7), r6
    bn.sbz 0x10(r7), r5
    bn.sh_2 0xe(r7), r18
    bn.sh_1 0xc(r7), r19
    bt.j loc_223e54
loc_223fa0:
    bt.mov r3, r11
    bg.jal 0x2402c4
    bt.mov r14, r3
    bn.sll r24, r17, r3
    bn.sub r7, r11, r24
    bn.extbz r17, r7
    bt.j loc_223e64
