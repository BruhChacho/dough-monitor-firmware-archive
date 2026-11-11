# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x22ae8c,0x22b6b2); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x50
    bn.sw 0x4c(r1), r9
    bn.sw 0x48(r1), r10
    bn.sw 0x44(r1), r11
    bn.sw 0x40(r1), r12
    bn.sw 0x3c(r1), r13
    bn.sw 0x38(r1), r14
    bn.sw 0x34(r1), r15
    bn.sw 0x30(r1), r16
    bn.sw 0x2c(r1), r17
    bn.sw 0x28(r1), r18
    bn.sw 0x24(r1), r19
    bn.sw 0x20(r1), r20
    bn.sw 0x1c(r1), r21
    bn.sw 0x18(r1), r22
    bt.mov r18, r3
    bt.mov r17, r4
    bn.sw 0x10(r1), r5
    bn.sw 0x14(r1), r6
    bn.lh r15, 0x10(r1)
    bg.jal 0x2227ef
    bt.mov r16, r3
    bn.lh r7, 0x14(r1)
    bn.srli r7, r7, 0x1
    bn.add r13, r15, r7
    bn.ori r7, r0, 0xa8
    bn.muls r7, r3, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r7, r4
    bn.lh r5, 0x10(r7)
    bn.lh r6, 0x14(r7)
    bn.add r19, r5, r6
    bn.lbz r5, 0x28(r7)
    bn.sw 0xc(r1), r5
    bg.lbz r7, 0x97(r7)
    bg.bnei r7, 0x0, loc_22b349
loc_22aefc:
    bn.ori r14, r0, 0x20
loc_22aeff:
    bt.movi r12, 0x1
    bn.sll r6, r12, r18
    bn.sw 0x4(r1), r6
    bn.sll r7, r12, r17
    bn.sw 0x8(r1), r7
    bn.ori r7, r0, 0xa8
    bn.muls r7, r16, r7
    bg.movhi r23, 0x48
    bg.addi r23, r23, 0x21ec
    bt.add r7, r23
    bn.lh r24, 0x2c(r7)
    bn.or r6, r6, r24
    bn.lwz r4, 0x8(r1)
    bn.or r6, r6, r4
    bn.sh_1 0x2c(r7), r6
    bg.lbz r4, 0xa5(r7)
    bn.ori r6, r0, 0x7c
    bn.muls r7, r18, r6
    bg.movhi r23, 0x48
    bg.addi r5, r23, -0x564
    bt.add r7, r5
    bn.sbz 0x70(r7), r4
    bn.muls r6, r17, r6
    bn.add r11, r6, r5
    bn.sbz 0x70(r11), r4
    bn.ori r7, r0, 0xb0
    bn.lwz r24, 0xc(r1)
    bn.muls r7, r24, r7
    bg.movhi r4, 0x3b
    bg.addi r4, r4, 0x4950
    bt.add r7, r4
    bn.lwz r7, 0x4(r7)
    bg.ori r5, r0, 0x800
    bn.and r7, r7, r5
    bg.bnei r7, 0x0, loc_22b39e
    bn.lbz r11, 0x29(r11)
    bg.beqi r11, 0x1, loc_22b366
loc_22af74:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r17, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bt.movi r6, 0x1
    bn.sbz 0x29(r7), r6
    bn.lwz r3, 0xc(r1)
    bt.mov r4, r17
    bg.jal 0x22701c
    bt.mov r20, r14
loc_22af94:
    bt.mov r3, r18
    bg.jal 0x222b9f
    bt.mov r3, r17
    bg.jal 0x222b9f
    bn.ori r7, r0, 0xa8
    bn.muls r6, r16, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r6, r7
    bn.lbz r23, 0x38(r6)
    bn.bnei r23, 0x0, loc_22afe4
    bn.lh r4, 0x14(r6)
    bn.lbz r5, 0x29(r6)
    bn.addi r7, r5, -0x1
    bn.extbz r7, r7
    bg.bleui r7, 0x1, loc_22b558
    bn.lh r7, 0x1c(r6)
loc_22afc9:
    bg.bgts r4, r7, loc_22afe4
    bn.ori r7, r0, 0xa8
    bn.muls r7, r16, r7
    bg.movhi r24, 0x48
    bg.addi r24, r24, 0x21ec
    bt.add r7, r24
    bn.lh r10, 0x10(r7)
    bg.bgt r13, r10, loc_22b414
loc_22afe4:
    bt.movi r4, 0x0
    bt.movi r25, 0x0
loc_22afe8:
    bn.ori r7, r0, 0xa8
    bn.muls r6, r16, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r6, r5
    bn.lh r5, 0x10(r6)
    bn.ori r7, r0, 0x7c
    bn.muls r7, r18, r7
    bg.movhi r23, 0x48
    bg.addi r23, r23, -0x564
    bt.add r7, r23
    bn.sh_1 0x20(r7), r5
    bn.lh r23, 0x12(r6)
    bn.sh_2 0x22(r7), r23
    bg.ble r13, r5, loc_22b06a
    bg.ble r13, r19, loc_22b358
    bn.lh r6, 0x14(r6)
    bn.exthz r4, r4
loc_22b022:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r18, r7
    bg.movhi r24, 0x48
    bg.addi r24, r24, -0x564
    bt.add r7, r24
    bn.sh_1 0x24(r7), r6
    bt.movi r5, 0x0
    bn.beqi r6, 0x0, loc_22b04d
    bn.ori r7, r0, 0xa8
    bn.muls r7, r16, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lh r5, 0x16(r7)
loc_22b04d:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r18, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.sh_2 0x26(r7), r5
    bn.add r7, r4, r15
    bt.add r7, r20
    bn.exthz r6, r7
    bt.j loc_22b07b
loc_22b06a:
    bn.sh_1 0x24(r7), r0
    bn.sh_2 0x26(r7), r0
    bn.add r7, r5, r15
    bn.sub r7, r7, r13
    bt.add r7, r20
    bn.exthz r6, r7
loc_22b07b:
    bn.ori r5, r0, 0x7c
    bn.muls r7, r17, r5
    bg.movhi r24, 0x48
    bg.addi r4, r24, -0x564
    bn.add r24, r7, r4
    bn.sh_1 0x20(r24), r6
    bn.sh_2 0x22(r24), r23
    bn.ori r6, r0, 0xa8
    bn.muls r6, r16, r6
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r6, r7
    bn.lh r14, 0x14(r6)
    bn.muls r5, r18, r5
    bn.add r23, r5, r4
    bn.lh r4, 0x24(r23)
    bn.sub r7, r14, r4
    bn.sh_1 0x24(r24), r7
    bn.lh r19, 0x16(r6)
    bn.sh_2 0x26(r24), r19
    bn.lh r5, 0x18(r6)
    bn.sh_1 0x4c(r23), r5
    bn.lh r4, 0x1a(r6)
    bn.sh_2 0x4e(r23), r4
    bg.ori r7, r0, 0x780
    bn.sub r7, r7, r5
    bn.sh_1 0x50(r23), r7
    bn.lh r15, 0x1e(r6)
    bn.sh_2 0x52(r23), r15
    bn.sh_1 0x4c(r24), r0
    bn.sh_2 0x4e(r24), r4
    bn.lh r21, 0x1c(r6)
    bn.sub r7, r21, r7
    bn.sh_1 0x50(r24), r7
    bn.sh_2 0x52(r24), r15
    bn.lh r5, 0x24(r23)
    bg.beqi r5, 0x0, loc_22b1b2
    bn.sbz 0x32(r23), r18
    bn.sbz 0x32(r24), r18
    bg.bnei r25, 0x0, loc_22b1bc
loc_22b0f9:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r16, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lbz r22, 0x29(r7)
    bn.addi r7, r22, -0x1
    bn.extbz r7, r7
    bg.bleui r7, 0x1, loc_22b55e
    bg.ori r23, r0, 0xff80
    bn.and r12, r14, r23
    bn.and r13, r21, r23
    bg.ble r12, r13, loc_22b1db
    bt.mov r3, r13
    bg.jal 0x2ac120
    bt.mov r20, r3
    bn.ori r24, r0, 0x7c
    bn.muls r11, r18, r24
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r11, r4
    bn.lh_0 r10, 0x24(r11)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bg.blesi r10, -0x1, loc_22b667
loc_22b149:
    bt.mov r4, r20
    bg.jal 0x2abe2e
    bt.mov r10, r3
    bt.mov r3, r14
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r10
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bt.mov r12, r3
    bn.sh_1 0x38(r11), r3
    bn.sh_1 0x40(r11), r13
    bn.lh_0 r10, 0x50(r11)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r4, r3
    bg.blesi r10, -0x1, loc_22b65a
loc_22b17a:
    bt.mov r3, r20
    bg.jal 0x2abe2e
    bt.mov r10, r3
    bt.mov r3, r21
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r10
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.sh_1 0x48(r11), r3
    bn.ori r5, r0, 0x7c
    bn.muls r7, r17, r5
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.sub r6, r13, r12
    bn.sh_1 0x38(r7), r6
    bn.sh_1 0x40(r7), r13
    bt.j loc_22b267
loc_22b1b2:
    bn.sbz 0x32(r23), r17
    bn.sbz 0x32(r24), r17
    bg.beqi r25, 0x0, loc_22b0f9
loc_22b1bc:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r16, r7
    bg.movhi r24, 0x48
    bg.addi r24, r24, 0x21ec
    bt.add r7, r24
    bn.lbz r22, 0x29(r7)
    bn.addi r7, r22, -0x1
    bn.extbz r7, r7
    bt.mov r12, r14
    bg.bleui r7, 0x1, loc_22b480
loc_22b1db:
    bt.mov r3, r12
    bg.jal 0x2ac120
    bt.mov r20, r3
    bn.ori r24, r0, 0x7c
    bn.muls r11, r18, r24
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r11, r4
    bn.lh_0 r10, 0x24(r11)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bg.blesi r10, -0x1, loc_22b45b
loc_22b200:
    bt.mov r4, r20
    bg.jal 0x2abe2e
    bt.mov r10, r3
    bt.mov r3, r14
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r10
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bt.mov r13, r3
    bn.sh_1 0x38(r11), r3
    bn.sh_1 0x40(r11), r12
    bn.lh_0 r10, 0x50(r11)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r4, r3
    bg.blesi r10, -0x1, loc_22b44e
loc_22b231:
    bt.mov r3, r20
    bg.jal 0x2abe2e
    bt.mov r10, r3
    bt.mov r3, r21
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r10
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.sh_1 0x48(r11), r3
    bn.ori r5, r0, 0x7c
    bn.muls r7, r17, r5
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.sub r6, r12, r13
    bn.sh_1 0x38(r7), r6
    bn.sh_1 0x40(r7), r12
loc_22b267:
    bn.lh r23, 0x40(r11)
    bn.sub r3, r23, r3
    bn.sh_1 0x48(r7), r3
    bn.sh_1 0x34(r11), r0
    bn.sh_1 0x44(r11), r0
    bn.lh r6, 0x38(r11)
    bn.sh_1 0x34(r7), r6
    bn.lh r6, 0x48(r11)
    bn.sh_1 0x44(r7), r6
    bg.bgt r19, r15, loc_22b3cc
loc_22b286:
    bn.ori r7, r0, 0x7c
    bn.muls r6, r18, r7
    bg.movhi r24, 0x48
    bg.addi r5, r24, -0x564
    bt.add r6, r5
    bn.sh_2 0x3a(r6), r19
    bn.sh_2 0x42(r6), r19
    bn.sh_2 0x4a(r6), r19
    bn.muls r7, r17, r7
    bt.add r7, r5
    bn.sh_2 0x3a(r7), r19
    bn.sh_2 0x42(r7), r19
    bn.sh_2 0x4a(r7), r19
loc_22b2ad:
    bg.beqi r22, 0x3, loc_22b37d
    bg.beqi r22, 0x5, loc_22b37d
loc_22b2b5:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r16, r7
    bg.movhi r23, 0x48
    bg.addi r23, r23, 0x21ec
    bt.add r7, r23
    bg.lbz r7, 0x97(r7)
    bn.bnei r7, 0x0, loc_22b30b
loc_22b2cc:
    bt.mov r3, r16
    bn.lwz r24, 0x4(r1)
    bn.exthz r4, r24
    bn.lwz r6, 0x8(r1)
loc_22b2d7:
    bn.exthz r5, r6
loc_22b2da:
    bn.lwz r22, 0x18(r1)
    bn.lwz r21, 0x1c(r1)
    bn.lwz r20, 0x20(r1)
    bn.lwz r19, 0x24(r1)
    bn.lwz r18, 0x28(r1)
    bn.lwz r17, 0x2c(r1)
    bn.lwz r16, 0x30(r1)
    bn.lwz r15, 0x34(r1)
    bn.lwz r14, 0x38(r1)
    bn.lwz r13, 0x3c(r1)
    bn.lwz r12, 0x40(r1)
    bn.lwz r11, 0x44(r1)
    bn.lwz r10, 0x48(r1)
    bn.lwz r9, 0x4c(r1)
    bn.addi r1, r1, 0x50
    bg.j 0x2263a5
loc_22b30b:
    bt.mov r3, r16
    bn.lwz r4, 0xc(r1)
    bg.jal 0x222ea6
    bn.bnei r3, 0x1, loc_22b2cc
    bn.ori r7, r0, 0xb0
    bn.lwz r24, 0xc(r1)
    bn.muls r7, r24, r7
    bg.movhi r4, 0x3b
    bg.addi r4, r4, 0x4950
    bt.add r7, r4
    bn.lbz r7, 0x7c(r7)
    bg.beq r24, r7, loc_22b672
    bt.mov r3, r18
    bt.mov r4, r17
    bg.jal 0x222bde
    bt.mov r3, r16
    bn.lwz r7, 0x8(r1)
    bn.exthz r4, r7
    bn.lwz r23, 0x4(r1)
    bn.exthz r5, r23
    bt.j loc_22b2da
loc_22b349:
    bt.mov r4, r5
    bg.jal 0x222ea6
    bt.movi r14, 0x0
    bg.bnei r3, 0x0, loc_22aeff
    bn.j loc_22aefc
loc_22b358:
    bn.exthz r4, r4
    bn.sub r7, r13, r5
    bt.add r7, r4
    bn.exthz r6, r7
    bn.j loc_22b022
loc_22b366:
    bt.mov r3, r17
    bg.jal 0x222804
    bt.mov r10, r3
    bt.mov r3, r16
    bg.jal 0x2227da
    bt.mov r20, r14
    bg.bne r10, r3, loc_22af74
    bn.j loc_22af94
loc_22b37d:
    bt.mov r3, r16
    bt.movi r4, 0x0
    bg.jal 0x2262ce
    bg.beqi r3, 0x0, loc_22b2b5
    bt.mov r3, r18
    bt.mov r4, r17
    bg.jal 0x222bde
    bt.mov r3, r16
    bn.lwz r5, 0x8(r1)
    bn.exthz r4, r5
    bn.lwz r6, 0x4(r1)
    bt.j loc_22b2d7
loc_22b39e:
    bt.mov r3, r17
    bg.jal 0x222804
    bt.mov r10, r3
    bg.jal 0x222d32
    bt.movi r20, 0x0
    bg.beq r10, r3, loc_22af94
    bt.mov r3, r17
    bg.jal 0x222804
    bt.mov r4, r17
    bg.jal 0x22acf2
    bn.sbz 0x29(r11), r12
    bg.jal 0x222d32
    bt.mov r4, r17
    bg.jal 0x22701c
    bn.j loc_22af94
loc_22b3cc:
    bt.mov r3, r16
    bg.jal 0x2227da
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r24, 0x3b
    bg.addi r24, r24, 0x4950
    bt.add r3, r24
    bn.lbz r7, 0x20(r3)
    bn.andi r7, r7, 0x10
    bn.bnei r7, 0x0, loc_22b466
loc_22b3eb:
    bn.ori r7, r0, 0x7c
    bn.muls r6, r18, r7
    bg.movhi r23, 0x48
    bg.addi r5, r23, -0x564
    bt.add r6, r5
    bn.sh_2 0x3a(r6), r15
    bn.sh_2 0x42(r6), r15
    bn.sh_2 0x4a(r6), r15
    bn.muls r7, r17, r7
    bt.add r7, r5
    bn.sh_2 0x3a(r7), r15
    bn.sh_2 0x42(r7), r15
    bn.sh_2 0x4a(r7), r15
    bt.j loc_22b2ad
loc_22b414:
    bg.ble r19, r13, loc_22afe4
    bg.beqi r5, 0x3, loc_22afe4
    bg.beqi r5, 0x5, loc_22afe4
    bg.lbz r7, 0x97(r7)
    bg.bnei r7, 0x0, loc_22b6a2
loc_22b428:
    bn.sub r7, r13, r10
    bn.andi r6, r7, 0x3f
    bn.sub r4, r0, r6
    bt.movi r25, 0x1
    bn.sfleui r6, 0x20
    bn.bf loc_22afe8
    bn.ori r7, r0, 0x40
    bn.sub r4, r7, r6
    bn.add r7, r13, r4
    bt.movi r25, 0x1
    bg.ble r7, r19, loc_22afe8
    bn.sub r4, r19, r13
    bn.j loc_22afe8
loc_22b44e:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r4, r3
    bn.j loc_22b231
loc_22b45b:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bn.j loc_22b200
loc_22b466:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r16, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r7, r4
    bg.lbz r7, 0xa4(r7)
    bg.beqi r7, 0x0, loc_22b286
    bt.j loc_22b3eb
loc_22b480:
    bt.mov r13, r14
loc_22b482:
    bn.ori r15, r0, 0x7c
    bn.muls r11, r18, r15
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r11, r6
    bn.lh_0 r10, 0x24(r11)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r12, r3
    bg.blesi r10, -0x1, loc_22b680
loc_22b4a1:
    bt.mov r3, r13
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r12
    bg.jal 0x2abe2e
    bt.mov r10, r3
    bt.mov r3, r14
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r10
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.sh_1 0x38(r11), r3
    bn.sh_2 0x42(r11), r13
    bn.sh_2 0x4a(r11), r13
    bn.muls r6, r17, r15
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r6, r7
    bn.sub r3, r13, r3
    bn.sh_1 0x38(r6), r3
    bn.sh_2 0x42(r6), r13
    bn.sh_2 0x4a(r6), r13
    bn.sh_1 0x34(r11), r0
    bn.lh r7, 0x38(r11)
    bn.sh_1 0x34(r6), r7
    bg.ble r19, r21, loc_22b5dc
loc_22b4f2:
    bn.ori r13, r0, 0x7c
    bn.muls r11, r18, r13
    bg.movhi r23, 0x48
    bg.addi r23, r23, -0x564
    bt.add r11, r23
    bn.sh_2 0x3a(r11), r21
    bn.sh_1 0x40(r11), r21
    bt.mov r3, r21
    bg.jal 0x2ac120
    bt.mov r12, r3
    bn.lh_0 r10, 0x50(r11)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bg.blesi r10, -0x1, loc_22b698
loc_22b51d:
    bt.mov r4, r12
    bg.jal 0x2abe2e
    bt.mov r4, r12
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.sh_1 0x48(r11), r3
    bn.muls r6, r17, r13
    bg.movhi r24, 0x48
    bg.addi r24, r24, -0x564
    bt.add r6, r24
    bn.sh_2 0x3a(r6), r21
    bn.sh_1 0x40(r6), r21
    bn.lh r4, 0x40(r11)
    bn.sub r3, r4, r3
    bn.sh_1 0x48(r6), r3
    bn.sh_1 0x44(r11), r0
    bn.lh r7, 0x48(r11)
    bn.sh_1 0x44(r6), r7
    bn.j loc_22b2ad
loc_22b558:
    bn.lh r7, 0x1e(r6)
    bn.j loc_22afc9
loc_22b55e:
    bg.ori r7, r0, 0xff80
    bn.and r13, r14, r7
    bn.and r11, r15, r7
    bg.ble r13, r11, loc_22b482
    bn.ori r15, r0, 0x7c
    bn.muls r12, r18, r15
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r12, r4
    bn.lh_0 r10, 0x24(r12)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r13, r3
    bg.blesi r10, -0x1, loc_22b64e
loc_22b58b:
    bt.mov r3, r11
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r13
    bg.jal 0x2abe2e
    bt.mov r10, r3
    bt.mov r3, r14
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r10
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.sh_1 0x38(r12), r3
    bn.sh_2 0x42(r12), r11
    bn.sh_2 0x4a(r12), r11
    bn.muls r6, r17, r15
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r6, r5
    bn.sub r3, r11, r3
    bn.sh_1 0x38(r6), r3
    bn.sh_2 0x42(r6), r11
    bn.sh_2 0x4a(r6), r11
    bn.sh_1 0x34(r12), r0
    bn.lh r7, 0x38(r12)
    bn.sh_1 0x34(r6), r7
    bg.bgt r19, r21, loc_22b4f2
loc_22b5dc:
    bn.ori r13, r0, 0x7c
    bn.muls r11, r18, r13
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r11, r5
    bn.sh_2 0x3a(r11), r19
    bn.sh_1 0x40(r11), r19
    bn.lh_0 r10, 0x50(r11)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r12, r3
    bg.blesi r10, -0x1, loc_22b68c
loc_22b601:
    bt.mov r3, r19
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r12
    bg.jal 0x2abe2e
    bt.mov r10, r3
    bt.mov r3, r21
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r10
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.sh_1 0x48(r11), r3
    bn.muls r6, r17, r13
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r6, r7
    bn.sh_2 0x3a(r6), r19
    bn.sh_1 0x40(r6), r19
    bn.lh r23, 0x40(r11)
    bn.sub r3, r23, r3
    bn.sh_1 0x48(r6), r3
    bn.sh_1 0x44(r11), r0
    bn.lh r7, 0x48(r11)
    bn.sh_1 0x44(r6), r7
    bn.j loc_22b2ad
loc_22b64e:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r13, r3
    bt.j loc_22b58b
loc_22b65a:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r4, r3
    bn.j loc_22b17a
loc_22b667:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bn.j loc_22b149
loc_22b672:
    bt.mov r3, r16
    bn.lwz r5, 0x4(r1)
    bn.exthz r4, r5
    bn.lwz r6, 0x8(r1)
    bn.j loc_22b2d7
loc_22b680:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r12, r3
    bt.j loc_22b4a1
loc_22b68c:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r12, r3
    bt.j loc_22b601
loc_22b698:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.j loc_22b51d
loc_22b6a2:
    bt.mov r3, r16
    bn.lwz r4, 0xc(r1)
    bg.jal 0x222ea6
    bg.beqi r3, 0x0, loc_22b428
    bn.j loc_22afe4
