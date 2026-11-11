# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x22a02c,0x22a9bd); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x78
    bn.sw 0x74(r1), r9
    bn.sw 0x70(r1), r10
    bn.sw 0x6c(r1), r11
    bn.sw 0x68(r1), r12
    bn.sw 0x64(r1), r13
    bn.sw 0x60(r1), r14
    bn.sw 0x5c(r1), r15
    bn.sw 0x58(r1), r16
    bn.sw 0x54(r1), r17
    bn.sw 0x50(r1), r18
    bn.sw 0x4c(r1), r19
    bn.sw 0x48(r1), r20
    bn.sw 0x44(r1), r21
    bn.sw 0x40(r1), r22
    bt.mov r22, r3
    bn.sw 0x0(r1), r4
    bn.sw 0x38(r1), r5
    bn.sw 0x3c(r1), r6
    bn.lh r14, 0x38(r1)
    bg.jal 0x2227ef
    bt.mov r20, r3
    bn.lh r6, 0x3c(r1)
    bn.srli r6, r6, 0x2
    bn.ori r5, r0, 0xa8
    bn.muls r5, r3, r5
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r5, r4
    bn.lh r13, 0x10(r5)
    bn.lh r23, 0x14(r5)
    bn.add r7, r13, r23
    bn.exthz r7, r7
    bn.sw 0x14(r1), r7
    bn.lbz r26, 0x28(r5)
    bn.sw 0x18(r1), r26
    bt.movi r7, 0x4
    bn.lwz r4, 0x0(r1)
    bn.xor r7, r4, r7
    bn.ff1 r7, r7
    bt.addi r7, -0x1
    bn.srli r7, r7, 0x1f
    bn.sw 0x1c(r1), r7
    bn.add r7, r6, r14
    bn.exthz r15, r7
    bn.slli r7, r6, 0x1
    bt.add r7, r14
    bn.exthz r19, r7
    bt.movi r7, 0x3
    bn.muls r6, r6, r7
    bt.add r6, r14
    bn.exthz r6, r6
    bn.sw 0x20(r1), r6
    bn.lh r6, 0x2a(r5)
    bn.sw 0x4(r1), r6
    bn.lh r16, 0x2c(r5)
    bn.xor r6, r6, r16
    bn.andi r7, r16, 0xf
    bn.and r11, r6, r7
    bn.lwz r7, 0x1c(r1)
    bg.bnei r7, 0x0, loc_22a717
    bt.mov r21, r22
    bt.movi r7, 0x1
    bn.sll r6, r7, r22
    bn.exths r12, r6
    bn.sw 0x30(r1), r4
    bn.sll r7, r7, r4
    bn.exths r17, r7
    bn.exthz r7, r7
    bn.sw 0x24(r1), r7
    bn.exthz r6, r6
    bn.sw 0x28(r1), r6
loc_22a0fe:
    bt.movi r4, 0x4
    bn.sw 0x10(r1), r4
    bg.bnei r11, 0x0, loc_22a750
loc_22a107:
    bt.mov r3, r22
    bg.jal 0x222aa2
    bt.mov r18, r3
    bt.movi r7, 0x1
    bn.sll r10, r7, r3
    bn.exthz r7, r10
    bn.sw 0x2c(r1), r7
    bn.lwz r23, 0x10(r1)
    bg.beqi r23, 0x4, loc_22a77d
loc_22a121:
    bn.ori r7, r0, 0xa8
    bn.muls r11, r20, r7
    bg.movhi r26, 0x48
    bg.addi r26, r26, 0x21ec
    bt.add r11, r26
    bn.lh r4, 0x2c(r11)
    bn.or r5, r12, r4
    bn.ori r6, r0, 0x7c
    bn.muls r7, r21, r6
    bg.movhi r23, 0x48
    bg.addi r25, r23, -0x564
    bn.add r12, r7, r25
    bn.sbz 0x10(r12), r20
    bt.movi r24, 0x3
    bn.sw 0x8(r12), r24
    bn.lbz r23, 0x29(r11)
    bn.sbz 0xe(r12), r23
    bg.lbz r4, 0xa5(r11)
    bn.sbz 0x70(r12), r4
    bn.or r5, r17, r5
    bn.lwz r26, 0x30(r1)
    bn.muls r7, r26, r6
    bt.add r7, r25
    bn.sbz 0x10(r7), r20
    bn.sw 0x8(r7), r24
    bn.sbz 0xe(r7), r23
    bn.sbz 0x70(r7), r4
    bn.or r5, r10, r5
    bn.muls r7, r18, r6
    bt.add r7, r25
    bn.sbz 0x10(r7), r20
    bn.sw 0x8(r7), r24
    bn.sbz 0xe(r7), r23
    bn.sbz 0x70(r7), r4
    bt.movi r7, 0x1
    bn.lwz r26, 0x10(r1)
    bn.sll r7, r7, r26
    bn.sw 0x8(r1), r7
    bn.or r5, r5, r7
    bn.sh_1 0x2c(r11), r5
    bn.muls r6, r26, r6
    bt.add r6, r25
    bn.sbz 0x10(r6), r20
    bn.sw 0x8(r6), r24
    bn.sbz 0xe(r6), r23
    bn.sbz 0x70(r6), r4
    bn.lwz r4, 0x4(r1)
    bn.or r10, r4, r16
    bn.sra r7, r10, r21
    bn.andi r7, r7, 0x1
    bg.beqi r7, 0x0, loc_22a90e
loc_22a1ba:
    bn.lwz r5, 0x30(r1)
    bn.sra r7, r10, r5
    bn.andi r7, r7, 0x1
    bg.beqi r7, 0x0, loc_22a901
loc_22a1c7:
    bn.sra r7, r10, r18
    bn.andi r7, r7, 0x1
    bg.beqi r7, 0x0, loc_22a8f5
loc_22a1d1:
    bn.lwz r6, 0x10(r1)
    bn.sra r7, r10, r6
    bn.andi r7, r7, 0x1
    bg.beqi r7, 0x0, loc_22a8e9
loc_22a1de:
    bt.mov r3, r22
    bg.jal 0x222b9f
    bt.mov r3, r18
    bg.jal 0x222b9f
    bn.lwz r3, 0x10(r1)
    bg.jal 0x222b9f
    bn.lwz r3, 0x0(r1)
    bg.jal 0x222b9f
    bn.sh_1 0x20(r12), r13
    bg.ble r15, r13, loc_22a6e2
    bn.sub r7, r15, r13
    bn.exthz r6, r7
    bn.lwz r7, 0x14(r1)
    bg.bgt r15, r7, loc_22a88f
loc_22a20c:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r21, r7
    bg.movhi r23, 0x48
    bg.addi r23, r23, -0x564
    bt.add r7, r23
    bn.sh_1 0x24(r7), r6
    bn.addi r7, r14, 0x20
    bn.exthz r6, r7
    bn.ori r7, r0, 0x7c
    bn.muls r7, r18, r7
    bg.movhi r26, 0x48
    bg.addi r26, r26, -0x564
    bt.add r7, r26
    bn.sh_1 0x20(r7), r6
    bg.ble r19, r13, loc_22a708
loc_22a23c:
    bt.movi r6, 0x0
    bn.lwz r4, 0x14(r1)
    bg.ble r15, r4, loc_22a875
loc_22a245:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r18, r7
    bg.movhi r23, 0x48
    bg.addi r23, r23, -0x564
    bt.add r7, r23
    bn.sh_1 0x24(r7), r6
    bt.mov r6, r14
loc_22a25a:
    bn.ori r7, r0, 0x7c
    bn.lwz r26, 0x10(r1)
    bn.muls r7, r26, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bn.sh_1 0x20(r7), r6
    bn.lwz r5, 0x20(r1)
    bg.ble r5, r13, loc_22a6cd
    bt.movi r6, 0x0
    bn.lwz r7, 0x14(r1)
    bg.ble r19, r7, loc_22a858
loc_22a280:
    bn.ori r7, r0, 0x7c
    bn.lwz r23, 0x10(r1)
    bn.muls r7, r23, r7
    bg.movhi r26, 0x48
    bg.addi r26, r26, -0x564
    bt.add r7, r26
    bn.sh_1 0x24(r7), r6
    bn.addi r7, r14, 0x20
    bn.exthz r7, r7
loc_22a29c:
    bn.ori r6, r0, 0x7c
    bn.lwz r4, 0x30(r1)
    bn.muls r24, r4, r6
    bg.movhi r5, 0x48
    bg.addi r23, r5, -0x564
    bt.add r24, r23
    bn.sh_1 0x20(r24), r7
    bn.ori r7, r0, 0xa8
    bn.muls r25, r20, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r25, r7
    bn.lh r10, 0x14(r25)
    bn.muls r4, r21, r6
    bt.add r4, r23
    bn.lh r26, 0x24(r4)
    bn.sub r7, r10, r26
    bn.muls r5, r18, r6
    bt.add r5, r23
    bn.lh r26, 0x24(r5)
    bn.sub r7, r7, r26
    bn.lwz r26, 0x10(r1)
    bn.muls r6, r26, r6
    bt.add r6, r23
    bn.lh r23, 0x24(r6)
    bn.sub r7, r7, r23
    bn.sh_1 0x24(r24), r7
    bn.lh r7, 0x12(r25)
    bn.sh_2 0x22(r4), r7
    bn.sh_2 0x22(r5), r7
    bn.sh_2 0x22(r6), r7
    bn.sh_2 0x22(r24), r7
    bt.movi r23, 0x0
    bn.lh r4, 0x24(r4)
    bn.beqi r4, 0x0, loc_22a306
    bn.lh r23, 0x16(r25)
loc_22a306:
    bn.ori r7, r0, 0x7c
    bn.muls r6, r21, r7
    bg.movhi r26, 0x48
    bg.addi r5, r26, -0x564
    bt.add r6, r5
    bn.sh_2 0x26(r6), r23
    bn.muls r7, r18, r7
    bt.add r7, r5
    bt.movi r4, 0x0
    bn.lh r7, 0x24(r7)
    bn.beqi r7, 0x0, loc_22a339
    bn.ori r7, r0, 0xa8
    bn.muls r7, r20, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r7, r4
    bn.lh r4, 0x16(r7)
loc_22a339:
    bn.ori r7, r0, 0x7c
    bn.muls r6, r18, r7
    bg.movhi r23, 0x48
    bg.addi r5, r23, -0x564
    bt.add r6, r5
    bn.sh_2 0x26(r6), r4
    bn.lwz r26, 0x10(r1)
    bn.muls r7, r26, r7
    bt.add r7, r5
    bt.movi r4, 0x0
    bn.lh r7, 0x24(r7)
    bn.beqi r7, 0x0, loc_22a36f
    bn.ori r7, r0, 0xa8
    bn.muls r7, r20, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r7, r4
    bn.lh r4, 0x16(r7)
loc_22a36f:
    bn.ori r7, r0, 0x7c
    bn.lwz r5, 0x10(r1)
    bn.muls r6, r5, r7
    bg.movhi r23, 0x48
    bg.addi r5, r23, -0x564
    bt.add r6, r5
    bn.sh_2 0x26(r6), r4
    bn.lwz r26, 0x30(r1)
    bn.muls r7, r26, r7
    bt.add r7, r5
    bt.movi r6, 0x0
    bn.lh r7, 0x24(r7)
    bn.beqi r7, 0x0, loc_22a3a8
    bn.ori r7, r0, 0xa8
    bn.muls r7, r20, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r7, r4
    bn.lh r6, 0x16(r7)
loc_22a3a8:
    bn.ori r23, r0, 0x7c
    bn.lwz r5, 0x30(r1)
    bn.muls r24, r5, r23
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r24, r7
    bn.sh_2 0x26(r24), r6
    bn.lwz r26, 0x1c(r1)
    bg.beqi r26, 0x0, loc_22a78a
    bn.ori r7, r0, 0xa8
    bn.muls r5, r20, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r5, r4
    bn.lh r7, 0x18(r5)
    bg.sfleui r7, 0x77f
    bn.bnf loc_22a840
    bn.muls r7, r21, r23
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lwz r6, 0x18(r5)
    bn.sw 0x4c(r7), r6
    bn.lwz r6, 0x1c(r5)
    bn.sw 0x50(r7), r6
    bn.ori r6, r0, 0x7c
    bn.muls r7, r21, r6
    bg.movhi r26, 0x48
    bg.addi r26, r26, -0x564
    bt.add r7, r26
    bt.mov r4, r22
    bn.lh r7, 0x24(r7)
    bg.beqi r7, 0x0, loc_22a7ee
loc_22a411:
    bn.ori r6, r0, 0x7c
    bn.muls r7, r21, r6
    bg.movhi r23, 0x48
    bg.addi r5, r23, -0x564
    bn.add r11, r7, r5
    bn.sbz 0x32(r11), r4
    bn.muls r7, r18, r6
    bn.add r12, r7, r5
    bn.sbz 0x32(r12), r4
    bn.lwz r26, 0x10(r1)
    bn.muls r7, r26, r6
    bn.add r13, r7, r5
    bn.sbz 0x32(r13), r4
    bn.lwz r7, 0x30(r1)
    bn.muls r6, r7, r6
    bn.add r19, r6, r5
    bn.sbz 0x32(r19), r4
    bn.ori r7, r0, 0xa8
    bn.muls r15, r20, r7
    bg.movhi r23, 0x48
    bg.addi r23, r23, 0x21ec
    bt.add r15, r23
    bn.lbz r26, 0x29(r15)
    bn.sw 0x34(r1), r26
    bt.mov r7, r26
    bt.addi r7, -0x1
    bn.extbz r7, r7
    bg.bleui r7, 0x1, loc_22a5e0
    bn.lh r4, 0x1c(r15)
    bn.sw 0xc(r1), r4
    bg.ori r7, r0, 0x180
    bn.divu r5, r10, r7
    bn.muls r5, r5, r7
    bn.divu r6, r4, r7
    bn.muls r6, r6, r7
    bn.exthz r4, r5
    bn.exthz r7, r6
    bn.sfleu r4, r7
    bn.cmov_0 r5, r5, r6
    bn.exthz r14, r5
    bt.mov r3, r14
    bg.jal 0x2ac120
    bt.mov r17, r3
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r16, r3
    bn.lh_0 r10, 0x24(r11)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bg.blesi r10, -0x1, loc_22a998
loc_22a4a9:
    bt.mov r4, r17
    bg.jal 0x2abe2e
    bt.mov r4, r16
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.sh_1 0x38(r11), r3
    bn.lh_0 r10, 0x24(r12)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r4, r3
    bg.blesi r10, -0x1, loc_22a9a3
loc_22a4cb:
    bt.mov r3, r17
    bg.jal 0x2abe2e
    bt.mov r4, r16
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.sh_1 0x38(r12), r3
    bn.lh_0 r10, 0x24(r13)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r4, r3
    bg.blesi r10, -0x1, loc_22a9b0
loc_22a4ed:
    bt.mov r3, r17
    bg.jal 0x2abe2e
    bt.mov r4, r16
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.exthz r3, r3
    bn.sh_1 0x38(r13), r3
    bn.lh r5, 0x38(r11)
    bn.sub r7, r14, r5
    bn.lh r6, 0x38(r12)
    bn.sub r7, r7, r6
    bn.sub r7, r7, r3
    bn.sh_1 0x38(r19), r7
    bn.sh_1 0x40(r11), r14
    bn.sh_1 0x40(r12), r14
    bn.sh_1 0x40(r13), r14
    bn.sh_1 0x40(r19), r14
    bn.lh_0 r10, 0x50(r11)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r4, r3
    bg.blesi r10, -0x1, loc_22a98b
loc_22a530:
    bt.mov r3, r17
    bg.jal 0x2abe2e
    bt.mov r10, r3
    bn.lwz r3, 0xc(r1)
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r10
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.sh_1 0x48(r11), r3
    bn.sh_1 0x48(r12), r0
    bn.sh_1 0x48(r13), r0
    bn.lh r23, 0x40(r11)
    bn.lh r26, 0x48(r11)
    bn.sub r7, r23, r26
    bn.sh_1 0x48(r19), r7
    bn.sh_1 0x34(r11), r0
    bn.lh r7, 0x38(r11)
    bn.sh_1 0x34(r12), r7
    bn.lh r4, 0x38(r12)
    bt.add r7, r4
    bn.exthz r7, r7
    bn.sh_1 0x34(r13), r7
    bn.lh r5, 0x38(r13)
    bt.add r7, r5
    bn.sh_1 0x34(r19), r7
    bn.sh_1 0x44(r11), r0
    bn.sh_1 0x44(r12), r0
    bn.sh_1 0x44(r13), r0
    bn.lh r7, 0x48(r11)
    bn.sh_1 0x44(r19), r7
    bn.lh r11, 0x16(r15)
    bn.lh r10, 0x1e(r15)
    bg.bgt r11, r10, loc_22a895
loc_22a595:
    bt.mov r10, r11
loc_22a597:
    bn.ori r6, r0, 0x7c
    bn.muls r7, r21, r6
    bg.movhi r23, 0x48
    bg.addi r5, r23, -0x564
    bt.add r7, r5
    bn.sh_2 0x3a(r7), r10
    bn.sh_2 0x42(r7), r10
    bn.sh_2 0x4a(r7), r10
    bn.muls r7, r18, r6
    bt.add r7, r5
    bn.sh_2 0x3a(r7), r10
    bn.sh_2 0x42(r7), r10
    bn.sh_2 0x4a(r7), r10
    bn.lwz r26, 0x10(r1)
    bn.muls r7, r26, r6
    bt.add r7, r5
    bn.sh_2 0x3a(r7), r10
    bn.sh_2 0x42(r7), r10
    bn.sh_2 0x4a(r7), r10
    bn.lwz r4, 0x30(r1)
    bn.muls r6, r4, r6
    bt.add r6, r5
    bn.sh_2 0x3a(r6), r10
    bn.sh_2 0x42(r6), r10
    bn.sh_2 0x4a(r6), r10
loc_22a5e0:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r20, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lbz r7, 0x38(r7)
    bn.beqi r7, 0x0, loc_22a654
    bn.ori r5, r0, 0x7c
    bn.lwz r6, 0x10(r1)
    bn.muls r4, r6, r5
    bg.movhi r7, 0x48
    bg.addi r24, r7, -0x564
    bt.add r4, r24
    bn.lh r7, 0x20(r4)
    bn.addi r7, r7, -0x20
    bn.sh_1 0x20(r4), r7
    bn.sh_1 0x34(r4), r0
    bn.lwz r26, 0x30(r1)
    bn.muls r23, r26, r5
    bt.add r23, r24
    bn.lh r7, 0x38(r4)
    bn.sh_1 0x34(r23), r7
    bn.muls r6, r21, r5
    bt.add r6, r24
    bn.lh r7, 0x40(r6)
    bn.srli r7, r7, 0x1
    bn.sh_1 0x40(r6), r7
    bn.muls r5, r18, r5
    bt.add r5, r24
    bn.lh r7, 0x40(r5)
    bn.srli r7, r7, 0x1
    bn.sh_1 0x40(r5), r7
    bn.lh r7, 0x40(r4)
    bn.srli r7, r7, 0x1
    bn.sh_1 0x40(r4), r7
    bn.lh r7, 0x40(r23)
    bn.srli r7, r7, 0x1
    bn.sh_1 0x40(r23), r7
    bn.sh_1 0x44(r23), r0
loc_22a654:
    bn.lwz r4, 0x34(r1)
    bg.beqi r4, 0x3, loc_22a8c0
    bg.beqi r4, 0x5, loc_22a8c0
loc_22a65f:
    bn.ori r7, r0, 0xb0
    bn.lwz r23, 0x18(r1)
    bn.muls r7, r23, r7
    bg.movhi r26, 0x3b
    bg.addi r26, r26, 0x4950
    bt.add r7, r26
    bn.lbz r7, 0x7c(r7)
    bg.beq r23, r7, loc_22a91a
    bt.mov r3, r22
    bn.lwz r4, 0x10(r1)
    bg.jal 0x222bde
    bt.mov r3, r18
    bn.lwz r4, 0x0(r1)
    bg.jal 0x222bde
    bt.mov r3, r20
    bn.lwz r5, 0x8(r1)
    bn.exthz r4, r5
    bn.lwz r5, 0x24(r1)
    bn.lwz r6, 0x28(r1)
    bn.lwz r7, 0x2c(r1)
loc_22a69c:
    bn.lwz r22, 0x40(r1)
    bn.lwz r21, 0x44(r1)
    bn.lwz r20, 0x48(r1)
    bn.lwz r19, 0x4c(r1)
    bn.lwz r18, 0x50(r1)
    bn.lwz r17, 0x54(r1)
    bn.lwz r16, 0x58(r1)
    bn.lwz r15, 0x5c(r1)
    bn.lwz r14, 0x60(r1)
    bn.lwz r13, 0x64(r1)
    bn.lwz r12, 0x68(r1)
    bn.lwz r11, 0x6c(r1)
    bn.lwz r10, 0x70(r1)
    bn.lwz r9, 0x74(r1)
    bn.addi r1, r1, 0x78
    bg.j 0x223d80
loc_22a6cd:
    bn.sh_1 0x24(r7), r0
    bn.add r7, r13, r14
    bn.lwz r23, 0x20(r1)
    bn.sub r7, r7, r23
    bn.addi r7, r7, 0x20
    bn.exthz r7, r7
    bn.j loc_22a29c
loc_22a6e2:
    bn.sh_1 0x24(r12), r0
    bn.add r7, r13, r14
    bn.sub r7, r7, r15
    bn.addi r7, r7, 0x20
    bn.exthz r6, r7
    bn.ori r7, r0, 0x7c
    bn.muls r7, r18, r7
    bg.movhi r26, 0x48
    bg.addi r26, r26, -0x564
    bt.add r7, r26
    bn.sh_1 0x20(r7), r6
    bg.bgt r19, r13, loc_22a23c
loc_22a708:
    bn.sh_1 0x24(r7), r0
    bn.add r7, r13, r14
    bn.sub r7, r7, r19
    bn.exthz r6, r7
    bn.j loc_22a25a
loc_22a717:
    bn.sw 0x30(r1), r22
    bn.andi r7, r22, 0x2
    bg.beqi r7, 0x0, loc_22a813
    bn.andi r7, r11, 0x2
    bn.beqi r7, 0x0, loc_22a72d
    bn.addi r7, r11, -0x2
    bn.exthz r11, r7
loc_22a72d:
    bt.movi r7, 0x1
    bn.sll r7, r7, r22
    bn.exths r17, r7
    bn.exthz r7, r7
    bn.sw 0x24(r1), r7
    bn.sw 0x0(r1), r22
    bt.movi r22, 0x1
    bt.movi r21, 0x1
    bt.movi r12, 0x2
    bn.sw 0x28(r1), r12
    bt.movi r4, 0x4
    bn.sw 0x10(r1), r4
    bg.beqi r11, 0x0, loc_22a107
loc_22a750:
    bt.mov r3, r11
    bg.jal 0x2402c4
    bt.mov r18, r3
    bt.movi r7, 0x1
    bn.sll r10, r7, r3
    bn.exthz r5, r10
    bn.sw 0x2c(r1), r5
    bn.sub r7, r11, r5
    bn.exthz r3, r7
    bt.movi r6, 0x4
    bn.sw 0x10(r1), r6
    bg.bnei r3, 0x0, loc_22a97d
    bg.beqi r18, 0x4, loc_22a107
loc_22a776:
    bn.lwz r23, 0x10(r1)
    bg.bnei r23, 0x4, loc_22a121
loc_22a77d:
    bn.lwz r3, 0x0(r1)
    bg.jal 0x222aa2
    bn.sw 0x10(r1), r3
    bn.j loc_22a121
loc_22a78a:
    bn.ori r6, r0, 0xa8
    bn.muls r6, r20, r6
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r6, r7
    bn.lh r4, 0x18(r6)
    bn.muls r5, r21, r23
    bg.movhi r23, 0x48
    bg.addi r23, r23, -0x564
    bt.add r5, r23
    bn.sh_1 0x4c(r5), r4
    bn.lh r23, 0x1a(r6)
    bn.sh_2 0x4e(r5), r23
    bg.ori r7, r0, 0x780
    bn.sub r7, r7, r4
    bn.sh_1 0x50(r5), r7
    bn.lh r4, 0x1e(r6)
    bn.sh_2 0x52(r5), r4
    bn.sh_1 0x4c(r24), r0
    bn.sh_2 0x4e(r24), r23
    bn.lh r6, 0x1c(r6)
    bn.sub r7, r6, r7
    bn.sh_1 0x50(r24), r7
    bn.sh_2 0x52(r24), r4
loc_22a7d5:
    bn.ori r6, r0, 0x7c
    bn.muls r7, r21, r6
    bg.movhi r26, 0x48
    bg.addi r26, r26, -0x564
    bt.add r7, r26
    bt.mov r4, r22
    bn.lh r7, 0x24(r7)
    bg.bnei r7, 0x0, loc_22a411
loc_22a7ee:
    bn.muls r7, r18, r6
    bt.add r7, r26
    bt.mov r4, r18
    bn.lh r7, 0x24(r7)
    bg.bnei r7, 0x0, loc_22a411
    bn.lwz r5, 0x10(r1)
    bn.muls r7, r5, r6
    bt.add r7, r26
    bn.lh r7, 0x24(r7)
    bn.sfeqi r7, 0x0
    bn.lwz r7, 0x0(r1)
    bn.cmov_0 r4, r7, r5
    bn.j loc_22a411
loc_22a813:
    bn.andi r7, r11, 0x8
    bg.beqi r7, 0x0, loc_22a95d
    bn.addi r7, r11, -0x8
    bn.exthz r11, r7
    bt.movi r7, 0x1
    bn.sll r7, r7, r22
    bn.exths r12, r7
    bn.exthz r7, r7
    bn.sw 0x28(r1), r7
    bt.mov r21, r22
    bt.movi r26, 0x3
    bn.sw 0x0(r1), r26
    bn.sw 0x30(r1), r26
    bt.movi r17, 0x8
    bn.sw 0x24(r1), r17
    bn.j loc_22a0fe
loc_22a840:
    bn.lwz r7, 0x18(r5)
    bn.sw 0x4c(r24), r7
    bn.lwz r7, 0x1c(r5)
    bn.sw 0x50(r24), r7
    bn.lh r5, 0x4c(r24)
    bg.addi r7, r5, -0x780
    bn.sh_1 0x4c(r24), r7
    bt.j loc_22a7d5
loc_22a858:
    bg.ble r13, r19, loc_22a944
    bn.lwz r26, 0x14(r1)
    bn.sub r7, r26, r13
    bn.exthz r6, r7
    bn.lwz r4, 0x20(r1)
    bg.bgt r4, r26, loc_22a280
    bn.sub r7, r4, r13
    bn.exthz r6, r7
    bn.j loc_22a280
loc_22a875:
    bg.ble r13, r15, loc_22a92e
    bn.lwz r5, 0x14(r1)
    bn.sub r7, r5, r13
    bn.exthz r6, r7
    bg.bgt r19, r5, loc_22a245
    bn.sub r7, r19, r13
    bn.exthz r6, r7
    bn.j loc_22a245
loc_22a88f:
    bn.lh r6, 0x14(r11)
    bn.j loc_22a20c
loc_22a895:
    bt.mov r3, r20
    bg.jal 0x2227da
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r3, r6
    bn.lbz r7, 0x20(r3)
    bn.andi r7, r7, 0x10
    bg.beqi r7, 0x0, loc_22a597
    bg.lbz r15, 0xa4(r15)
    bg.bnei r15, 0x0, loc_22a597
    bn.j loc_22a595
loc_22a8c0:
    bt.mov r3, r20
    bt.movi r4, 0x0
    bg.jal 0x2262ce
    bg.beqi r3, 0x0, loc_22a65f
    bt.mov r3, r22
    bn.lwz r4, 0x0(r1)
    bg.jal 0x222bde
    bt.mov r3, r20
    bn.lwz r4, 0x24(r1)
    bn.lwz r5, 0x2c(r1)
    bn.lwz r7, 0x8(r1)
    bn.exthz r6, r7
    bn.lwz r7, 0x28(r1)
    bn.j loc_22a69c
loc_22a8e9:
    bn.lwz r3, 0x18(r1)
    bt.mov r4, r6
    bg.jal 0x22701c
    bn.j loc_22a1de
loc_22a8f5:
    bn.lwz r3, 0x18(r1)
    bt.mov r4, r18
    bg.jal 0x22701c
    bn.j loc_22a1d1
loc_22a901:
    bn.lwz r3, 0x18(r1)
    bn.lwz r4, 0x0(r1)
    bg.jal 0x22701c
    bn.j loc_22a1c7
loc_22a90e:
    bn.lwz r3, 0x18(r1)
    bt.mov r4, r22
    bg.jal 0x22701c
    bn.j loc_22a1ba
loc_22a91a:
    bt.mov r3, r20
    bn.lwz r4, 0x28(r1)
    bn.lwz r5, 0x2c(r1)
    bn.lwz r7, 0x8(r1)
    bn.exthz r6, r7
    bn.lwz r7, 0x24(r1)
    bn.j loc_22a69c
loc_22a92e:
    bn.sub r7, r19, r15
    bn.exthz r6, r7
    bg.ble r19, r4, loc_22a245
    bn.lwz r6, 0x14(r1)
    bn.sub r7, r6, r15
    bn.exthz r6, r7
    bn.j loc_22a245
loc_22a944:
    bn.sub r7, r5, r19
    bn.exthz r6, r7
    bn.lwz r23, 0x14(r1)
    bg.ble r5, r23, loc_22a280
    bn.lwz r5, 0x14(r1)
    bn.sub r7, r5, r19
    bn.exthz r6, r7
    bn.j loc_22a280
loc_22a95d:
    bt.movi r7, 0x1
    bn.sll r7, r7, r22
    bn.exths r12, r7
    bn.exthz r7, r7
    bn.sw 0x28(r1), r7
    bt.mov r21, r22
    bt.movi r23, 0x3
    bn.sw 0x0(r1), r23
    bn.sw 0x30(r1), r23
    bt.movi r17, 0x8
    bn.sw 0x24(r1), r17
    bn.j loc_22a0fe
loc_22a97d:
    bg.jal 0x2402c4
    bn.sw 0x10(r1), r3
    bg.bnei r18, 0x4, loc_22a776
    bn.j loc_22a107
loc_22a98b:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r4, r3
    bn.j loc_22a530
loc_22a998:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bn.j loc_22a4a9
loc_22a9a3:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r4, r3
    bn.j loc_22a4cb
loc_22a9b0:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r4, r3
    bn.j loc_22a4ed
