# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2272cf,0x227fc6); byte-exact only; hardware untested.
    bg.addi r1, r1, -0x80
    bn.sw 0x7c(r1), r9
    bn.sw 0x78(r1), r10
    bn.sw 0x74(r1), r11
    bn.sw 0x70(r1), r12
    bn.sw 0x6c(r1), r13
    bn.sw 0x68(r1), r14
    bn.sw 0x64(r1), r15
    bn.sw 0x60(r1), r16
    bn.sw 0x5c(r1), r17
    bn.sw 0x58(r1), r18
    bn.sw 0x54(r1), r19
    bn.sw 0x50(r1), r20
    bn.sw 0x4c(r1), r21
    bn.sw 0x48(r1), r22
    bn.sw 0x8(r1), r3
    bn.sw 0x4(r1), r4
    bn.sw 0x40(r1), r5
    bn.sw 0x44(r1), r6
    bn.lh r4, 0x42(r1)
    bn.sw 0x28(r1), r4
    bn.lh r5, 0x40(r1)
    bn.sw 0x2c(r1), r5
    bg.jal 0x2227ef
    bt.mov r17, r3
    bn.lh r7, 0x44(r1)
    bn.srli r7, r7, 0x1
    bn.lwz r6, 0x2c(r1)
    bt.add r7, r6
    bn.exthz r13, r7
    bn.lh r7, 0x46(r1)
    bn.srli r7, r7, 0x1
    bn.lwz r23, 0x28(r1)
    bt.add r7, r23
    bn.exthz r20, r7
    bn.ori r6, r0, 0xa8
    bn.muls r6, r3, r6
    bg.movhi r24, 0x48
    bg.addi r24, r24, 0x21ec
    bt.add r6, r24
    bn.lh r15, 0x10(r6)
    bn.lh r25, 0x14(r6)
    bn.add r7, r15, r25
    bn.exthz r7, r7
    bn.sw 0x18(r1), r7
    bn.lh r14, 0x12(r6)
    bn.lh r26, 0x16(r6)
    bn.add r7, r14, r26
    bn.exthz r7, r7
    bn.sw 0x1c(r1), r7
    bn.lbz r4, 0x28(r6)
    bn.sw 0x20(r1), r4
    bt.movi r7, 0x4
    bn.lwz r5, 0x4(r1)
    bn.xor r7, r5, r7
    bn.ff1 r7, r7
    bt.addi r7, -0x1
    bn.srli r7, r7, 0x1f
    bn.sw 0x24(r1), r7
    bg.lbz r7, 0x97(r6)
    bn.sfeqi r7, 0x0
    bn.ori r7, r0, 0x20
    bn.cmov_0 r7, r7, r0
    bn.sw 0x30(r1), r7
    bn.lh r7, 0x2a(r6)
    bn.sw 0xc(r1), r7
    bn.lh r21, 0x2c(r6)
    bn.xor r6, r7, r21
    bn.andi r7, r21, 0xf
    bn.and r11, r6, r7
    bn.lwz r23, 0x24(r1)
    bg.bnei r23, 0x0, loc_227b02
    bn.lwz r19, 0x8(r1)
    bt.movi r7, 0x1
    bn.sll r6, r7, r19
    bn.exths r12, r6
    bt.mov r18, r5
    bn.sll r7, r7, r5
    bn.exths r22, r7
    bn.exthz r6, r6
    bn.sw 0x34(r1), r6
    bn.exthz r7, r7
    bn.sw 0x38(r1), r7
loc_2273c6:
    bt.movi r23, 0x4
    bn.sw 0x14(r1), r23
    bg.bnei r11, 0x0, loc_227b42
loc_2273cf:
    bn.lwz r3, 0x8(r1)
    bg.jal 0x222aa2
    bt.mov r16, r3
    bt.movi r7, 0x1
    bn.sll r10, r7, r3
    bn.exthz r26, r10
    bn.sw 0x3c(r1), r26
    bn.lwz r4, 0x14(r1)
    bg.beqi r4, 0x4, loc_227b6f
loc_2273ea:
    bn.ori r7, r0, 0xa8
    bn.muls r11, r17, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r11, r5
    bn.lh r6, 0x2c(r11)
    bn.or r5, r12, r6
    bn.ori r6, r0, 0x7c
    bn.muls r7, r19, r6
    bg.movhi r23, 0x48
    bg.addi r25, r23, -0x564
    bt.add r7, r25
    bn.sbz 0x10(r7), r17
    bt.movi r24, 0x3
    bn.sw 0x8(r7), r24
    bn.lbz r23, 0x29(r11)
    bn.sbz 0xe(r7), r23
    bg.lbz r4, 0xa5(r11)
    bn.sbz 0x70(r7), r4
    bn.or r5, r22, r5
    bn.muls r7, r18, r6
    bt.add r7, r25
    bn.sbz 0x10(r7), r17
    bn.sw 0x8(r7), r24
    bn.sbz 0xe(r7), r23
    bn.sbz 0x70(r7), r4
    bn.or r5, r10, r5
    bn.muls r7, r16, r6
    bt.add r7, r25
    bn.sbz 0x10(r7), r17
    bn.sw 0x8(r7), r24
    bn.sbz 0xe(r7), r23
    bn.sbz 0x70(r7), r4
    bt.movi r7, 0x1
    bn.lwz r26, 0x14(r1)
    bn.sll r22, r7, r26
    bn.or r5, r5, r22
    bn.sh_1 0x2c(r11), r5
    bn.muls r6, r26, r6
    bt.add r6, r25
    bn.sbz 0x10(r6), r17
    bn.sw 0x8(r6), r24
    bn.sbz 0xe(r6), r23
    bn.sbz 0x70(r6), r4
    bn.lwz r4, 0xc(r1)
    bn.or r10, r4, r21
    bn.sra r7, r10, r19
    bn.andi r7, r7, 0x1
    bg.beqi r7, 0x0, loc_227e0b
loc_22747c:
    bn.sra r7, r10, r18
    bn.andi r7, r7, 0x1
    bg.beqi r7, 0x0, loc_227dfe
loc_227486:
    bn.sra r7, r10, r16
    bn.andi r7, r7, 0x1
    bg.beqi r7, 0x0, loc_227ddc
    bn.lwz r5, 0x14(r1)
    bn.sra r7, r10, r5
    bn.andi r7, r7, 0x1
    bg.beqi r7, 0x0, loc_227df2
loc_22749d:
    bn.lwz r3, 0x8(r1)
    bg.jal 0x222b9f
    bn.lwz r3, 0x4(r1)
    bg.jal 0x222b9f
    bt.mov r3, r16
    bg.jal 0x222b9f
    bn.lwz r3, 0x14(r1)
    bg.jal 0x222b9f
    bn.lbz r6, 0x38(r11)
    bn.sw 0x10(r1), r6
    bn.bnei r6, 0x0, loc_2274dc
    bn.lh r5, 0x14(r11)
    bn.lbz r6, 0x29(r11)
    bn.addi r7, r6, -0x1
    bn.extbz r7, r7
    bg.bleui r7, 0x1, loc_227eb8
    bn.lh r7, 0x1c(r11)
loc_2274d4:
    bg.bgts r5, r7, loc_2274dc
    bg.bgt r13, r15, loc_227e5a
loc_2274dc:
    bt.movi r24, 0x0
    bt.movi r29, 0x0
loc_2274e0:
    bn.ori r5, r0, 0x7c
    bn.muls r7, r19, r5
    bg.movhi r26, 0x48
    bg.addi r6, r26, -0x564
    bn.add r4, r7, r6
    bn.sh_1 0x20(r4), r15
    bn.muls r7, r16, r5
    bt.add r7, r6
    bn.sh_1 0x20(r7), r15
    bg.bgt r13, r15, loc_227aaa
    bn.lwz r7, 0x2c(r1)
    bn.add r6, r15, r7
    bn.sub r6, r6, r13
    bn.lwz r23, 0x30(r1)
    bt.add r6, r23
    bn.exthz r6, r6
    bn.muls r7, r18, r5
    bg.addi r25, r26, -0x564
    bt.add r7, r25
    bn.sh_1 0x20(r7), r6
    bn.lwz r26, 0x14(r1)
    bn.muls r7, r26, r5
    bt.add r7, r25
    bn.sh_1 0x20(r7), r6
    bn.sfleu r20, r14
    bn.cmovsi_2 r7, r0, 0x1
    bn.extbz r6, r7
    bn.sh_1 0x24(r4), r0
    bn.lwz r7, 0x1c(r1)
    bn.sfgtu r20, r7
    bn.cmovsi_2 r7, r0, 0x1
    bn.extbz r4, r7
    bt.movi r5, 0x0
    bt.movi r28, 0x0
    bt.movi r27, 0x0
loc_227546:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r16, r7
    bg.movhi r26, 0x48
    bg.addi r26, r26, -0x564
    bt.add r7, r26
    bn.sh_1 0x24(r7), r5
    bn.lwz r5, 0x18(r1)
    bn.sfgtu r13, r5
    bn.cmovsi_2 r7, r0, 0x1
    bn.extbz r5, r7
    bn.and r25, r5, r6
    bt.movi r6, 0x0
    bn.beqi r25, 0x0, loc_22757d
    bg.ble r13, r15, loc_227d08
    bn.lwz r23, 0x18(r1)
    bn.sub r7, r23, r13
    bn.sub r7, r7, r24
    bn.exthz r6, r7
loc_22757d:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r18, r7
    bg.movhi r26, 0x48
    bg.addi r26, r26, -0x564
    bt.add r7, r26
    bn.sh_1 0x24(r7), r6
    bn.and r26, r5, r4
    bt.movi r23, 0x0
    bn.beqi r26, 0x0, loc_2275a8
    bg.ble r13, r15, loc_227cf2
    bn.lwz r5, 0x18(r1)
    bn.sub r7, r5, r13
    bn.sub r7, r7, r24
    bn.exthz r23, r7
loc_2275a8:
    bn.ori r5, r0, 0x7c
    bn.lwz r6, 0x14(r1)
    bn.muls r7, r6, r5
    bg.movhi r24, 0x48
    bg.addi r6, r24, -0x564
    bn.add r4, r7, r6
    bn.sh_1 0x24(r4), r23
    bn.muls r7, r19, r5
    bt.add r7, r6
    bn.sh_2 0x22(r7), r14
    bn.muls r7, r18, r5
    bt.add r7, r6
    bn.sh_2 0x22(r7), r14
    bg.bgt r20, r14, loc_2275e2
    bn.lwz r6, 0x28(r1)
    bn.add r7, r14, r6
    bn.sub r7, r7, r20
    bn.exthz r7, r7
    bn.sw 0x28(r1), r7
loc_2275e2:
    bn.muls r7, r16, r5
    bg.movhi r23, 0x48
    bg.addi r23, r23, -0x564
    bt.add r7, r23
    bn.lwz r24, 0x28(r1)
    bn.sh_2 0x22(r7), r24
    bn.sh_2 0x22(r4), r24
    bt.movi r6, 0x0
    bn.beqi r27, 0x0, loc_22760a
    bn.sub r7, r20, r14
    bn.exthz r6, r7
    bn.lwz r4, 0x1c(r1)
    bg.bgt r20, r4, loc_227cdc
loc_22760a:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r19, r7
    bg.movhi r23, 0x48
    bg.addi r23, r23, -0x564
    bt.add r7, r23
    bn.sh_2 0x26(r7), r6
    bt.movi r6, 0x0
    bn.beqi r25, 0x0, loc_22762f
    bn.sub r7, r20, r14
    bn.exthz r6, r7
    bn.lwz r24, 0x1c(r1)
    bg.bgt r20, r24, loc_227cc6
loc_22762f:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r18, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bn.sh_2 0x26(r7), r6
    bt.movi r6, 0x0
    bn.beqi r28, 0x0, loc_227654
    bn.lwz r5, 0x1c(r1)
    bn.sub r7, r5, r20
    bn.exthz r6, r7
    bg.bgt r14, r20, loc_227cb0
loc_227654:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r16, r7
    bg.movhi r23, 0x48
    bg.addi r23, r23, -0x564
    bt.add r7, r23
    bn.sh_2 0x26(r7), r6
    bt.movi r6, 0x0
    bn.beqi r26, 0x0, loc_227679
    bn.lwz r24, 0x1c(r1)
    bn.sub r7, r24, r20
    bn.exthz r6, r7
    bg.bgt r14, r20, loc_227d6a
loc_227679:
    bn.ori r24, r0, 0x7c
    bn.lwz r26, 0x14(r1)
    bn.muls r7, r26, r24
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bn.sh_2 0x26(r7), r6
    bn.lwz r5, 0x24(r1)
    bg.beqi r5, 0x0, loc_227b7c
    bn.ori r7, r0, 0xa8
    bn.muls r5, r17, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r5, r6
    bn.lh r7, 0x18(r5)
    bg.sfleui r7, 0x77f
    bn.bnf loc_227d4d
    bn.muls r7, r19, r24
    bg.movhi r25, 0x48
    bg.addi r25, r25, -0x564
    bt.add r7, r25
    bn.lwz r6, 0x18(r5)
    bn.sw 0x4c(r7), r6
    bn.lwz r6, 0x1c(r5)
    bn.sw 0x50(r7), r6
    bn.ori r6, r0, 0x7c
    bn.muls r7, r19, r6
    bg.movhi r25, 0x48
    bg.addi r25, r25, -0x564
    bt.add r7, r25
    bn.lwz r4, 0x8(r1)
    bn.lh r7, 0x24(r7)
    bg.beqi r7, 0x0, loc_227bee
loc_2276e3:
    bn.ori r6, r0, 0x7c
    bn.muls r7, r19, r6
    bg.movhi r23, 0x48
    bg.addi r5, r23, -0x564
    bt.add r7, r5
    bn.sbz 0x32(r7), r4
    bn.muls r7, r18, r6
    bt.add r7, r5
    bn.sbz 0x32(r7), r4
    bn.muls r7, r16, r6
    bt.add r7, r5
    bn.sbz 0x32(r7), r4
    bn.lwz r24, 0x14(r1)
    bn.muls r6, r24, r6
    bt.add r6, r5
    bn.sbz 0x32(r6), r4
    bg.beqi r29, 0x0, loc_227c11
    bn.ori r7, r0, 0xa8
    bn.muls r7, r17, r7
    bg.movhi r25, 0x48
    bg.addi r25, r25, 0x21ec
    bt.add r7, r25
    bn.lh r6, 0x14(r7)
    bn.lbz r21, 0x29(r7)
    bn.addi r7, r21, -0x1
    bn.extbz r7, r7
    bt.mov r13, r6
    bg.bleui r7, 0x1, loc_2279a8
loc_227737:
    bt.mov r3, r13
    bg.jal 0x2ac120
    bt.mov r20, r3
    bn.ori r7, r0, 0xa8
    bn.muls r7, r17, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lh r3, 0x14(r7)
    bg.jal 0x2ac120
    bt.mov r14, r3
    bn.ori r12, r0, 0x7c
    bn.muls r11, r19, r12
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r11, r6
    bn.lh_0 r10, 0x24(r11)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bg.blesi r10, -0x1, loc_227efe
loc_227775:
    bt.mov r4, r20
    bg.jal 0x2abe2e
    bt.mov r4, r14
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.exthz r3, r3
    bn.sh_1 0x38(r11), r3
    bn.muls r7, r18, r12
    bg.movhi r23, 0x48
    bg.addi r23, r23, -0x564
    bt.add r7, r23
    bt.movi r5, 0x0
    bn.lh r7, 0x24(r7)
    bg.bnei r7, 0x0, loc_227ca7
loc_2277a1:
    bn.ori r12, r0, 0x7c
    bn.muls r7, r18, r12
    bg.movhi r24, 0x48
    bg.addi r6, r24, -0x564
    bt.add r7, r6
    bn.sh_1 0x38(r7), r5
    bn.muls r7, r16, r12
    bn.add r11, r7, r6
    bn.lh_0 r10, 0x24(r11)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r4, r3
    bg.blesi r10, -0x1, loc_227ed7
loc_2277c9:
    bt.mov r3, r20
    bg.jal 0x2abe2e
    bt.mov r4, r14
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.exthz r3, r3
    bn.sh_1 0x38(r11), r3
    bn.lwz r25, 0x14(r1)
    bn.muls r7, r25, r12
    bg.movhi r26, 0x48
    bg.addi r26, r26, -0x564
    bt.add r7, r26
    bt.movi r4, 0x0
    bn.lh r7, 0x24(r7)
    bg.bnei r7, 0x0, loc_227c9e
loc_2277f8:
    bn.ori r6, r0, 0x7c
    bn.lwz r5, 0x14(r1)
    bn.muls r7, r5, r6
    bg.movhi r23, 0x48
    bg.addi r5, r23, -0x564
    bn.add r14, r7, r5
    bn.sh_1 0x38(r14), r4
    bn.muls r7, r19, r6
    bn.add r11, r7, r5
    bn.sh_1 0x40(r11), r13
    bn.muls r7, r18, r6
    bn.add r15, r7, r5
    bn.sh_1 0x40(r15), r13
    bn.muls r6, r16, r6
    bn.add r12, r6, r5
    bn.sh_1 0x40(r12), r13
    bn.sh_1 0x40(r14), r13
    bn.lh_0 r10, 0x50(r11)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r4, r3
    bg.blesi r10, -0x1, loc_227ef1
loc_22783c:
    bt.mov r3, r20
    bg.jal 0x2abe2e
    bt.mov r10, r3
    bn.ori r7, r0, 0xa8
    bn.muls r13, r17, r7
    bg.movhi r24, 0x48
    bg.addi r24, r24, 0x21ec
    bt.add r13, r24
    bn.lh r3, 0x1c(r13)
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r10
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.exthz r3, r3
    bn.sh_1 0x48(r11), r3
    bn.lh r25, 0x40(r11)
    bn.sub r3, r25, r3
    bn.sh_1 0x48(r15), r3
    bn.sh_1 0x48(r12), r0
    bn.sh_1 0x48(r14), r0
    bn.sh_1 0x34(r11), r0
    bn.lh r7, 0x38(r11)
    bn.sh_1 0x34(r15), r7
    bn.sh_1 0x34(r12), r0
    bn.lh r7, 0x38(r12)
    bn.sh_1 0x34(r14), r7
    bn.sh_1 0x44(r11), r0
    bn.lh r7, 0x48(r11)
    bn.sh_1 0x44(r15), r7
    bn.sh_1 0x44(r12), r0
    bn.sh_1 0x44(r14), r0
    bn.lh r10, 0x16(r13)
    bn.lh r12, 0x1e(r13)
    bg.bgt r10, r12, loc_227d80
loc_2278a7:
    bt.mov r12, r10
loc_2278a9:
    bt.mov r3, r12
    bg.jal 0x2ac120
    bt.mov r15, r3
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r14, r3
    bn.ori r13, r0, 0x7c
    bn.muls r11, r19, r13
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r11, r4
    bn.lh_0 r10, 0x26(r11)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bg.blesi r10, -0x1, loc_227ecc
loc_2278d6:
    bt.mov r4, r15
    bg.jal 0x2abe2e
    bt.mov r4, r14
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.exthz r3, r3
    bn.sh_2 0x3a(r11), r3
    bn.muls r7, r16, r13
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bt.movi r5, 0x0
    bn.lh r7, 0x26(r7)
    bg.bnei r7, 0x0, loc_227c95
loc_227902:
    bn.ori r13, r0, 0x7c
    bn.muls r7, r16, r13
    bg.movhi r23, 0x48
    bg.addi r6, r23, -0x564
    bt.add r7, r6
    bn.sh_2 0x3a(r7), r5
    bn.muls r7, r18, r13
    bn.add r11, r7, r6
    bn.lh_0 r10, 0x26(r11)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r4, r3
    bg.blesi r10, -0x1, loc_227ee4
loc_22792a:
    bt.mov r3, r15
    bg.jal 0x2abe2e
    bt.mov r4, r14
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.exthz r3, r3
    bn.sh_2 0x3a(r11), r3
    bn.lwz r24, 0x14(r1)
    bn.muls r7, r24, r13
    bg.movhi r25, 0x48
    bg.addi r25, r25, -0x564
    bt.add r7, r25
    bt.movi r5, 0x0
    bn.lh r7, 0x26(r7)
    bg.bnei r7, 0x0, loc_227c8c
loc_227959:
    bn.ori r6, r0, 0x7c
    bn.lwz r26, 0x14(r1)
    bn.muls r23, r26, r6
    bg.movhi r4, 0x48
    bg.addi r7, r4, -0x564
    bt.add r23, r7
    bn.sh_2 0x3a(r23), r5
    bn.muls r5, r19, r6
    bt.add r5, r7
    bn.sh_2 0x42(r5), r12
    bn.muls r4, r16, r6
    bt.add r4, r7
    bn.sh_2 0x42(r4), r12
    bn.muls r6, r18, r6
    bt.add r6, r7
    bn.sh_2 0x42(r6), r12
    bn.sh_2 0x42(r23), r12
    bn.sh_2 0x4a(r5), r12
    bn.sh_2 0x4a(r4), r0
    bn.sh_2 0x4a(r6), r12
    bn.sh_2 0x4a(r23), r0
    bn.sh_2 0x36(r5), r0
    bn.lh r7, 0x3a(r5)
    bn.sh_2 0x36(r4), r7
    bn.sh_2 0x36(r6), r0
    bn.lh r7, 0x3a(r6)
    bn.sh_2 0x36(r23), r7
loc_2279a8:
    bn.lwz r5, 0x10(r1)
    bn.beqi r5, 0x0, loc_227a12
    bn.ori r5, r0, 0x7c
    bn.muls r23, r18, r5
    bg.movhi r6, 0x48
    bg.addi r24, r6, -0x564
    bt.add r23, r24
    bn.lh r25, 0x20(r23)
    bn.lwz r26, 0x30(r1)
    bn.sub r7, r25, r26
    bn.sh_1 0x20(r23), r7
    bn.lwz r6, 0x14(r1)
    bn.muls r4, r6, r5
    bt.add r4, r24
    bn.lh r25, 0x20(r4)
    bn.sub r7, r25, r26
    bn.sh_1 0x20(r4), r7
    bn.sh_1 0x34(r23), r0
    bn.sh_1 0x34(r4), r0
    bn.muls r6, r19, r5
    bt.add r6, r24
    bn.lh r7, 0x40(r6)
    bn.srli r7, r7, 0x1
    bn.sh_1 0x40(r6), r7
    bn.muls r5, r16, r5
    bt.add r5, r24
    bn.lh r7, 0x40(r5)
    bn.srli r7, r7, 0x1
    bn.sh_1 0x40(r5), r7
    bn.lh r7, 0x40(r23)
    bn.srli r7, r7, 0x1
    bn.sh_1 0x40(r23), r7
    bn.lh r7, 0x40(r4)
    bn.srli r7, r7, 0x1
    bn.sh_1 0x40(r4), r7
    bn.sh_1 0x44(r23), r0
loc_227a12:
    bg.beqi r21, 0x3, loc_227dbc
    bg.beqi r21, 0x5, loc_227dbc
loc_227a1a:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r17, r7
    bg.movhi r26, 0x48
    bg.addi r26, r26, 0x21ec
    bt.add r7, r26
    bg.lbz r7, 0x97(r7)
    bg.beqi r7, 0x0, loc_227c47
    bn.ori r7, r0, 0xb0
    bn.lwz r4, 0x20(r1)
    bn.muls r7, r4, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r7, r5
    bn.lbz r6, 0x7c(r7)
    bg.beq r4, r6, loc_227dab
    bn.lwz r23, 0x20(r1)
    bn.lbz r24, 0x7d(r7)
    bg.beq r23, r24, loc_227f23
    bn.lwz r25, 0x20(r1)
    bn.lbz r7, 0x7e(r7)
    bg.beq r25, r7, loc_227f09
    bn.lwz r3, 0x8(r1)
    bn.lwz r4, 0x14(r1)
    bg.jal 0x222bde
    bt.mov r3, r17
    bn.exthz r4, r22
    bn.lwz r5, 0x38(r1)
    bn.lwz r6, 0x3c(r1)
    bn.lwz r7, 0x34(r1)
loc_227a78:
    bn.lwz r22, 0x48(r1)
    bn.lwz r21, 0x4c(r1)
    bn.lwz r20, 0x50(r1)
    bn.lwz r19, 0x54(r1)
    bn.lwz r18, 0x58(r1)
    bn.lwz r17, 0x5c(r1)
    bn.lwz r16, 0x60(r1)
    bn.lwz r15, 0x64(r1)
    bn.lwz r14, 0x68(r1)
    bn.lwz r13, 0x6c(r1)
    bn.lwz r12, 0x70(r1)
    bn.lwz r11, 0x74(r1)
    bn.lwz r10, 0x78(r1)
    bn.lwz r9, 0x7c(r1)
    bg.addi r1, r1, 0x80
    bg.j 0x2231d9
loc_227aaa:
    bn.exthz r23, r24
    bn.lwz r7, 0x2c(r1)
    bt.add r7, r23
    bn.lwz r25, 0x30(r1)
    bt.add r7, r25
    bn.exthz r7, r7
    bn.muls r6, r18, r5
    bg.movhi r26, 0x48
    bg.addi r26, r26, -0x564
    bt.add r6, r26
    bn.sh_1 0x20(r6), r7
    bn.lwz r4, 0x14(r1)
    bn.muls r6, r4, r5
    bt.add r6, r26
    bn.sh_1 0x20(r6), r7
    bg.bgt r20, r14, loc_227f8b
    bt.movi r27, 0x0
    bt.movi r6, 0x0
    bt.movi r5, 0x0
loc_227adf:
    bn.ori r4, r0, 0x7c
    bn.muls r7, r19, r4
    bg.movhi r26, 0x48
    bg.addi r26, r26, -0x564
    bt.add r7, r26
    bn.sh_1 0x24(r7), r5
    bn.lwz r5, 0x1c(r1)
    bg.ble r20, r5, loc_227f4e
    bt.movi r28, 0x0
    bt.movi r4, 0x0
    bt.movi r5, 0x0
    bn.j loc_227546
loc_227b02:
    bn.lwz r18, 0x8(r1)
    bn.andi r7, r18, 0x2
    bg.beqi r7, 0x0, loc_227d1e
    bn.andi r7, r11, 0x2
    bg.beqi r7, 0x0, loc_227e18
    bn.addi r7, r11, -0x2
    bn.exthz r11, r7
    bt.movi r7, 0x1
    bn.lwz r6, 0x8(r1)
    bn.sll r7, r7, r6
    bn.exths r22, r7
    bn.exthz r7, r7
    bn.sw 0x38(r1), r7
    bn.sw 0x4(r1), r6
    bt.movi r7, 0x1
    bn.sw 0x8(r1), r7
    bt.movi r19, 0x1
    bt.movi r12, 0x2
    bn.sw 0x34(r1), r12
    bt.movi r23, 0x4
    bn.sw 0x14(r1), r23
    bg.beqi r11, 0x0, loc_2273cf
loc_227b42:
    bt.mov r3, r11
    bg.jal 0x2402c4
    bt.mov r16, r3
    bt.movi r7, 0x1
    bn.sll r10, r7, r3
    bn.exthz r24, r10
    bn.sw 0x3c(r1), r24
    bn.sub r7, r11, r24
    bn.exthz r3, r7
    bt.movi r25, 0x4
    bn.sw 0x14(r1), r25
    bg.bnei r3, 0x0, loc_227ebe
    bg.beqi r16, 0x4, loc_2273cf
loc_227b68:
    bn.lwz r4, 0x14(r1)
    bg.bnei r4, 0x4, loc_2273ea
loc_227b6f:
    bn.lwz r3, 0x4(r1)
    bg.jal 0x222aa2
    bn.sw 0x14(r1), r3
    bn.j loc_2273ea
loc_227b7c:
    bn.ori r6, r0, 0xa8
    bn.muls r6, r17, r6
    bg.movhi r26, 0x48
    bg.addi r26, r26, 0x21ec
    bt.add r6, r26
    bn.lh r4, 0x18(r6)
    bn.muls r7, r19, r24
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.sh_1 0x4c(r7), r4
    bn.lh r23, 0x1a(r6)
    bn.sh_2 0x4e(r7), r23
    bg.ori r5, r0, 0x780
    bn.sub r5, r5, r4
    bn.sh_1 0x50(r7), r5
    bn.lh r4, 0x1e(r6)
    bn.sh_2 0x52(r7), r4
    bn.muls r7, r18, r24
    bg.movhi r24, 0x48
    bg.addi r24, r24, -0x564
    bt.add r7, r24
    bn.sh_1 0x4c(r7), r0
    bn.sh_2 0x4e(r7), r23
    bn.lh r6, 0x1c(r6)
    bn.sub r5, r6, r5
    bn.sh_1 0x50(r7), r5
    bn.sh_2 0x52(r7), r4
loc_227bd4:
    bn.ori r6, r0, 0x7c
    bn.muls r7, r19, r6
    bg.movhi r25, 0x48
    bg.addi r25, r25, -0x564
    bt.add r7, r25
    bn.lwz r4, 0x8(r1)
    bn.lh r7, 0x24(r7)
    bg.bnei r7, 0x0, loc_2276e3
loc_227bee:
    bn.muls r7, r18, r6
    bt.add r7, r25
    bn.lwz r4, 0x4(r1)
    bn.lh r7, 0x24(r7)
    bg.bnei r7, 0x0, loc_2276e3
    bn.muls r7, r16, r6
    bt.add r7, r25
    bn.lh r7, 0x24(r7)
    bn.sfeqi r7, 0x0
    bn.lwz r5, 0x14(r1)
    bn.cmov_0 r4, r5, r16
    bn.j loc_2276e3
loc_227c11:
    bn.ori r7, r0, 0xa8
    bn.muls r5, r17, r7
    bg.movhi r26, 0x48
    bg.addi r26, r26, 0x21ec
    bt.add r5, r26
    bn.lbz r21, 0x29(r5)
    bn.addi r7, r21, -0x1
    bn.extbz r7, r7
    bg.bleui r7, 0x1, loc_2279a8
    bn.lh r6, 0x14(r5)
    bg.ori r4, r0, 0xff80
    bn.and r6, r6, r4
    bn.lh r7, 0x1c(r5)
    bn.and r7, r7, r4
    bn.sfleu r6, r7
    bn.cmov_0 r13, r6, r7
    bn.j loc_227737
loc_227c47:
    bn.ori r7, r0, 0xb0
    bn.lwz r26, 0x20(r1)
    bn.muls r7, r26, r7
    bg.movhi r4, 0x3b
    bg.addi r4, r4, 0x4950
    bt.add r7, r4
    bn.lbz r5, 0x7c(r7)
    bg.beq r26, r5, loc_227dab
    bn.lbz r7, 0x7d(r7)
    bg.beq r26, r7, loc_227dab
    bn.lwz r3, 0x8(r1)
    bt.mov r4, r16
    bg.jal 0x222bde
    bn.lwz r3, 0x4(r1)
    bn.lwz r4, 0x14(r1)
    bg.jal 0x222bde
    bt.mov r3, r17
    bn.lwz r4, 0x3c(r1)
    bn.exthz r5, r22
    bn.lwz r6, 0x34(r1)
    bn.lwz r7, 0x38(r1)
    bn.j loc_227a78
loc_227c8c:
    bn.sub r7, r12, r3
    bn.exthz r5, r7
    bn.j loc_227959
loc_227c95:
    bn.sub r7, r12, r3
    bn.exthz r5, r7
    bn.j loc_227902
loc_227c9e:
    bn.sub r7, r13, r3
    bn.exthz r4, r7
    bn.j loc_2277f8
loc_227ca7:
    bn.sub r7, r13, r3
    bn.exthz r5, r7
    bn.j loc_2277a1
loc_227cb0:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r17, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lh r6, 0x16(r7)
    bn.j loc_227654
loc_227cc6:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r17, r7
    bg.movhi r25, 0x48
    bg.addi r25, r25, 0x21ec
    bt.add r7, r25
    bn.lh r6, 0x16(r7)
    bn.j loc_22762f
loc_227cdc:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r17, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lh r6, 0x16(r7)
    bn.j loc_22760a
loc_227cf2:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r17, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r7, r4
    bn.lh r23, 0x14(r7)
    bn.j loc_2275a8
loc_227d08:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r17, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lh r6, 0x14(r7)
    bn.j loc_22757d
loc_227d1e:
    bn.andi r7, r11, 0x8
    bg.beqi r7, 0x0, loc_227e3b
    bn.addi r7, r11, -0x8
    bn.exthz r11, r7
    bt.movi r7, 0x1
    bn.lwz r25, 0x8(r1)
    bn.sll r7, r7, r25
    bn.exths r12, r7
    bn.exthz r7, r7
    bn.sw 0x34(r1), r7
    bt.mov r19, r25
    bt.movi r26, 0x3
    bn.sw 0x4(r1), r26
    bt.movi r18, 0x3
    bt.movi r22, 0x8
    bn.sw 0x38(r1), r22
    bn.j loc_2273c6
loc_227d4d:
    bn.muls r7, r18, r24
    bt.add r7, r4
    bn.lwz r6, 0x18(r5)
    bn.sw 0x4c(r7), r6
    bn.lwz r6, 0x1c(r5)
    bn.sw 0x50(r7), r6
    bn.lh r24, 0x4c(r7)
    bg.addi r6, r24, -0x780
    bn.sh_1 0x4c(r7), r6
    bt.j loc_227bd4
loc_227d6a:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r17, r7
    bg.movhi r25, 0x48
    bg.addi r25, r25, 0x21ec
    bt.add r7, r25
    bn.lh r6, 0x16(r7)
    bn.j loc_227679
loc_227d80:
    bt.mov r3, r17
    bg.jal 0x2227da
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r26, 0x3b
    bg.addi r26, r26, 0x4950
    bt.add r3, r26
    bn.lbz r7, 0x20(r3)
    bn.andi r7, r7, 0x10
    bg.beqi r7, 0x0, loc_2278a9
    bg.lbz r13, 0xa4(r13)
    bg.bnei r13, 0x0, loc_2278a9
    bn.j loc_2278a7
loc_227dab:
    bt.mov r3, r17
    bn.lwz r4, 0x34(r1)
    bn.lwz r5, 0x38(r1)
loc_227db3:
    bn.lwz r6, 0x3c(r1)
    bn.exthz r7, r22
    bn.j loc_227a78
loc_227dbc:
    bt.mov r3, r17
    bt.movi r4, 0x0
    bg.jal 0x2262ce
    bg.beqi r3, 0x0, loc_227a1a
    bn.lwz r3, 0x8(r1)
    bn.lwz r4, 0x4(r1)
    bg.jal 0x222bde
    bt.mov r3, r17
    bn.lwz r4, 0x38(r1)
    bn.lwz r5, 0x34(r1)
    bt.j loc_227db3
loc_227ddc:
    bn.lwz r3, 0x20(r1)
    bt.mov r4, r16
    bg.jal 0x22701c
    bn.lwz r5, 0x14(r1)
    bn.sra r7, r10, r5
    bn.andi r7, r7, 0x1
    bg.bnei r7, 0x0, loc_22749d
loc_227df2:
    bn.lwz r3, 0x20(r1)
    bt.mov r4, r5
    bg.jal 0x22701c
    bn.j loc_22749d
loc_227dfe:
    bn.lwz r3, 0x20(r1)
    bn.lwz r4, 0x4(r1)
    bg.jal 0x22701c
    bn.j loc_227486
loc_227e0b:
    bn.lwz r3, 0x20(r1)
    bn.lwz r4, 0x8(r1)
    bg.jal 0x22701c
    bn.j loc_22747c
loc_227e18:
    bt.movi r7, 0x1
    bn.lwz r4, 0x8(r1)
    bn.sll r7, r7, r4
    bn.exths r22, r7
    bn.exthz r7, r7
    bn.sw 0x38(r1), r7
    bn.sw 0x4(r1), r4
    bt.movi r5, 0x1
    bn.sw 0x8(r1), r5
    bt.movi r19, 0x1
    bt.movi r12, 0x2
    bn.sw 0x34(r1), r12
    bn.j loc_2273c6
loc_227e3b:
    bt.movi r7, 0x1
    bn.sll r7, r7, r18
    bn.exths r12, r7
    bn.exthz r7, r7
    bn.sw 0x34(r1), r7
    bt.mov r19, r18
    bt.movi r24, 0x3
    bn.sw 0x4(r1), r24
    bt.movi r18, 0x3
    bt.movi r22, 0x8
    bn.sw 0x38(r1), r22
    bn.j loc_2273c6
loc_227e5a:
    bn.lwz r7, 0x18(r1)
    bg.bgt r13, r7, loc_2274dc
    bg.beqi r6, 0x3, loc_2274dc
    bg.beqi r6, 0x5, loc_2274dc
    bn.ori r7, r0, 0xa8
    bn.muls r7, r17, r7
    bg.movhi r23, 0x48
    bg.addi r23, r23, 0x21ec
    bt.add r7, r23
    bg.lbz r7, 0x97(r7)
    bg.bnei r7, 0x0, loc_227f3e
loc_227e81:
    bn.sub r7, r13, r15
    bn.srai r6, r7, 0x1f
    bn.srli r6, r6, 0x1a
    bt.add r7, r6
    bn.andi r7, r7, 0x3f
    bn.sub r7, r7, r6
    bn.exthz r6, r7
    bn.sub r24, r0, r6
    bt.movi r29, 0x1
    bn.sfleui r6, 0x20
    bn.bf loc_2274e0
    bn.ori r7, r0, 0x40
    bn.sub r24, r7, r6
    bn.add r7, r13, r24
    bt.movi r29, 0x1
    bn.lwz r25, 0x18(r1)
    bg.bles r7, r25, loc_2274e0
    bn.sub r24, r25, r13
    bn.j loc_2274e0
loc_227eb8:
    bn.lh r7, 0x1e(r11)
    bn.j loc_2274d4
loc_227ebe:
    bg.jal 0x2402c4
    bn.sw 0x14(r1), r3
    bg.bnei r16, 0x4, loc_227b68
    bn.j loc_2273cf
loc_227ecc:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bn.j loc_2278d6
loc_227ed7:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r4, r3
    bn.j loc_2277c9
loc_227ee4:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r4, r3
    bn.j loc_22792a
loc_227ef1:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r4, r3
    bn.j loc_22783c
loc_227efe:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bn.j loc_227775
loc_227f09:
    bn.lwz r3, 0x8(r1)
    bt.mov r4, r16
    bg.jal 0x222bde
    bt.mov r3, r17
    bn.lwz r4, 0x3c(r1)
    bn.lwz r5, 0x38(r1)
    bn.lwz r6, 0x34(r1)
    bn.exthz r7, r22
    bn.j loc_227a78
loc_227f23:
    bn.lwz r3, 0x8(r1)
    bn.lwz r4, 0x4(r1)
    bg.jal 0x222bde
    bt.mov r3, r17
    bn.lwz r4, 0x38(r1)
    bn.lwz r5, 0x34(r1)
    bn.lwz r6, 0x3c(r1)
    bn.exthz r7, r22
    bn.j loc_227a78
loc_227f3e:
    bt.mov r3, r17
    bn.lwz r4, 0x20(r1)
    bg.jal 0x222ea6
    bg.beqi r3, 0x0, loc_227e81
    bn.j loc_2274dc
loc_227f4e:
    bt.movi r28, 0x1
    bn.lwz r7, 0x18(r1)
    bg.ble r13, r7, loc_227fac
    bn.muls r6, r16, r4
    bg.movhi r23, 0x48
    bg.addi r23, r23, -0x564
    bt.add r6, r23
    bn.ori r7, r0, 0xa8
    bn.muls r7, r17, r7
    bg.movhi r24, 0x48
    bg.addi r24, r24, 0x21ec
    bt.add r7, r24
    bn.lh r7, 0x14(r7)
    bn.sh_1 0x24(r6), r7
    bn.muls r7, r18, r4
    bt.add r7, r23
    bn.sh_1 0x24(r7), r0
    bt.movi r23, 0x0
    bt.movi r26, 0x0
    bt.movi r25, 0x0
    bn.j loc_2275a8
loc_227f8b:
    bt.movi r27, 0x1
    bn.lwz r6, 0x18(r1)
    bg.ble r13, r6, loc_227fb9
    bn.ori r7, r0, 0xa8
    bn.muls r7, r17, r7
    bg.movhi r25, 0x48
    bg.addi r25, r25, 0x21ec
    bt.add r7, r25
    bn.lh r5, 0x14(r7)
    bt.movi r6, 0x1
    bn.j loc_227adf
loc_227fac:
    bn.sub r7, r13, r15
    bt.add r7, r23
    bn.exthz r5, r7
    bt.movi r4, 0x1
    bn.j loc_227546
loc_227fb9:
    bn.sub r7, r13, r15
    bt.add r7, r23
    bn.exthz r5, r7
    bt.movi r6, 0x1
    bn.j loc_227adf
