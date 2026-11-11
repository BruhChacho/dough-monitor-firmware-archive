# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x22df19,0x22e68a); byte-exact only; hardware untested.
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
    bt.mov r18, r3
    bn.sw 0x8(r1), r4
    bn.sw 0xc(r1), r5
    bn.lh r15, 0x8(r1)
    bg.jal 0x2227ef
    bt.mov r14, r3
    bn.lh r7, 0xc(r1)
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
    bn.lbz r21, 0x28(r7)
    bg.lbz r7, 0x97(r7)
    bg.bnei r7, 0x0, loc_22e3aa
loc_22df84:
    bn.ori r16, r0, 0x20
loc_22df87:
    bn.ori r7, r0, 0xa8
    bn.muls r5, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r5, r6
    bn.lh r6, 0x2c(r5)
    bn.lh r7, 0x2a(r5)
    bn.xor r7, r6, r7
    bn.andi r6, r6, 0xf
    bn.and r3, r7, r6
    bn.bnei r3, 0x0, loc_22dfb5
    bn.lbz r7, 0x29(r5)
    bt.addi r7, -0x1
    bn.extbz r7, r7
    bg.bleui r7, 0x1, loc_22e609
loc_22dfb5:
    bg.bnei r3, 0x0, loc_22e42d
loc_22dfb9:
    bt.mov r3, r18
    bg.jal 0x222aa2
    bt.mov r17, r3
loc_22dfc1:
    bt.movi r12, 0x1
    bn.sll r7, r12, r18
    bn.sw 0x4(r1), r7
    bn.ori r6, r0, 0xa8
    bn.muls r6, r14, r6
    bg.movhi r23, 0x48
    bg.addi r23, r23, 0x21ec
    bt.add r6, r23
    bn.lh r24, 0x2c(r6)
    bn.or r4, r7, r24
    bn.ori r5, r0, 0x7c
    bn.muls r7, r18, r5
    bg.movhi r24, 0x48
    bg.addi r23, r24, -0x564
    bt.add r7, r23
    bg.lbz r24, 0xa5(r6)
    bn.sbz 0x70(r7), r24
    bn.sll r22, r12, r17
    bn.or r4, r4, r22
    bn.sh_1 0x2c(r6), r4
    bn.muls r5, r17, r5
    bn.add r11, r5, r23
    bn.sbz 0x10(r11), r14
    bt.movi r7, 0x3
    bn.sw 0x8(r11), r7
    bn.lbz r7, 0x29(r6)
    bn.sbz 0xe(r11), r7
    bn.sbz 0x70(r11), r24
    bn.ori r7, r0, 0xb0
    bn.muls r7, r21, r7
    bg.movhi r4, 0x3b
    bg.addi r4, r4, 0x4950
    bt.add r7, r4
    bn.lwz r7, 0x4(r7)
    bg.ori r5, r0, 0x800
    bn.and r7, r7, r5
    bg.bnei r7, 0x0, loc_22e3ff
    bn.lbz r11, 0x29(r11)
    bg.beqi r11, 0x1, loc_22e3c7
loc_22e03b:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r17, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bt.movi r6, 0x1
    bn.sbz 0x29(r7), r6
    bt.mov r3, r21
    bt.mov r4, r17
    bg.jal 0x22701c
    bt.mov r20, r16
loc_22e05a:
    bt.mov r3, r18
    bg.jal 0x222b9f
    bt.mov r3, r17
    bg.jal 0x222b9f
    bn.ori r7, r0, 0xa8
    bn.muls r6, r14, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r6, r7
    bn.lbz r23, 0x38(r6)
    bn.bnei r23, 0x0, loc_22e0aa
    bn.lh r4, 0x14(r6)
    bn.lbz r5, 0x29(r6)
    bn.addi r7, r5, -0x1
    bn.extbz r7, r7
    bg.bleui r7, 0x1, loc_22e584
    bn.lh r7, 0x1c(r6)
loc_22e08f:
    bg.bgts r4, r7, loc_22e0aa
    bn.ori r7, r0, 0xa8
    bn.muls r7, r14, r7
    bg.movhi r24, 0x48
    bg.addi r24, r24, 0x21ec
    bt.add r7, r24
    bn.lh r10, 0x10(r7)
    bg.bgt r13, r10, loc_22e47e
loc_22e0aa:
    bt.movi r4, 0x0
    bt.movi r25, 0x0
loc_22e0ae:
    bn.ori r7, r0, 0x7c
    bn.muls r5, r18, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r5, r6
    bn.ori r7, r0, 0xa8
    bn.muls r6, r14, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r6, r7
    bn.lwz r7, 0x18(r6)
    bn.sw 0x4c(r5), r7
    bn.lwz r7, 0x1c(r6)
    bn.sw 0x50(r5), r7
    bn.lh r7, 0x18(r6)
    bg.sfleui r7, 0x77f
    bn.bf loc_22e0ee
    bn.lh r23, 0x4c(r5)
    bg.addi r7, r23, -0x780
    bn.sh_1 0x4c(r5), r7
loc_22e0ee:
    bn.lh r7, 0x10(r6)
    bn.sh_1 0x20(r5), r7
    bn.lh r24, 0x12(r6)
    bn.sh_2 0x22(r5), r24
    bg.ble r13, r7, loc_22e150
    bg.ble r13, r19, loc_22e3b9
    bn.lh r6, 0x14(r6)
    bn.exthz r5, r4
loc_22e108:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r18, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bn.sh_1 0x24(r7), r6
    bt.movi r4, 0x0
    bn.beqi r6, 0x0, loc_22e133
    bn.ori r7, r0, 0xa8
    bn.muls r7, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lh r4, 0x16(r7)
loc_22e133:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r18, r7
    bg.movhi r23, 0x48
    bg.addi r23, r23, -0x564
    bt.add r7, r23
    bn.sh_2 0x26(r7), r4
    bn.add r7, r15, r5
    bt.add r7, r20
    bn.exthz r6, r7
    bt.j loc_22e160
loc_22e150:
    bn.sh_1 0x24(r5), r0
    bn.sh_2 0x26(r5), r0
    bt.add r7, r15
    bn.sub r7, r7, r13
    bt.add r7, r20
    bn.exthz r6, r7
loc_22e160:
    bn.ori r5, r0, 0x7c
    bn.muls r7, r17, r5
    bg.movhi r23, 0x48
    bg.addi r4, r23, -0x564
    bn.add r23, r7, r4
    bn.sh_1 0x20(r23), r6
    bn.sh_2 0x22(r23), r24
    bn.ori r6, r0, 0xa8
    bn.muls r6, r14, r6
    bg.movhi r24, 0x48
    bg.addi r24, r24, 0x21ec
    bt.add r6, r24
    bn.lh r15, 0x14(r6)
    bn.muls r5, r18, r5
    bt.add r5, r4
    bn.lh r4, 0x24(r5)
    bn.sub r7, r15, r4
    bn.sh_1 0x24(r23), r7
    bn.lh r19, 0x16(r6)
    bn.sh_2 0x26(r23), r19
    bn.lh r6, 0x24(r5)
    bg.beqi r6, 0x0, loc_22e23f
    bn.sbz 0x32(r5), r18
    bn.sbz 0x32(r23), r18
    bg.bnei r25, 0x0, loc_22e249
loc_22e1af:
    bn.ori r7, r0, 0xa8
    bn.muls r6, r14, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r6, r7
    bn.lbz r20, 0x29(r6)
    bn.addi r7, r20, -0x1
    bn.extbz r7, r7
    bg.bleui r7, 0x1, loc_22e58a
    bg.ori r24, r0, 0xff80
    bn.and r13, r15, r24
    bn.lh r7, 0x1c(r6)
    bn.and r16, r7, r24
    bg.ble r13, r16, loc_22e268
    bn.ori r13, r0, 0x7c
    bn.muls r11, r18, r13
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r11, r4
    bn.lh_0 r10, 0x24(r11)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r12, r3
    bg.blesi r10, -0x1, loc_22e662
loc_22e1fc:
    bt.mov r3, r16
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r12
    bg.jal 0x2abe2e
    bt.mov r10, r3
    bt.mov r3, r15
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r10
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.sh_1 0x38(r11), r3
    bn.sh_1 0x40(r11), r16
    bn.sh_1 0x48(r11), r16
    bn.muls r7, r17, r13
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.sub r3, r16, r3
    bn.sh_1 0x38(r7), r3
    bn.sh_1 0x40(r7), r16
    bt.j loc_22e2c8
loc_22e23f:
    bn.sbz 0x32(r5), r17
    bn.sbz 0x32(r23), r17
    bg.beqi r25, 0x0, loc_22e1af
loc_22e249:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r14, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r7, r4
    bn.lbz r20, 0x29(r7)
    bn.addi r7, r20, -0x1
    bn.extbz r7, r7
    bt.mov r13, r15
    bg.bleui r7, 0x1, loc_22e4cf
loc_22e268:
    bn.ori r16, r0, 0x7c
    bn.muls r11, r18, r16
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r11, r6
    bn.lh_0 r10, 0x24(r11)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r12, r3
    bg.blesi r10, -0x1, loc_22e4b8
loc_22e287:
    bt.mov r3, r13
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r12
    bg.jal 0x2abe2e
    bt.mov r10, r3
    bt.mov r3, r15
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r10
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.sh_1 0x38(r11), r3
    bn.sh_1 0x40(r11), r13
    bn.sh_1 0x48(r11), r13
    bn.muls r7, r17, r16
    bg.movhi r23, 0x48
    bg.addi r23, r23, -0x564
    bt.add r7, r23
    bn.sub r3, r13, r3
    bn.sh_1 0x38(r7), r3
    bn.sh_1 0x40(r7), r13
loc_22e2c8:
    bn.sh_1 0x48(r7), r0
    bn.sh_1 0x34(r11), r0
    bn.sh_1 0x44(r11), r0
    bn.lh r6, 0x38(r11)
    bn.sh_1 0x34(r7), r6
    bn.sh_1 0x44(r7), r0
    bn.ori r7, r0, 0xa8
    bn.muls r10, r14, r7
    bg.movhi r24, 0x48
    bg.addi r24, r24, 0x21ec
    bt.add r10, r24
    bn.lh r11, 0x1e(r10)
    bg.bgt r19, r11, loc_22e436
loc_22e2f1:
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
    bn.sh_2 0x4a(r7), r0
loc_22e318:
    bg.beqi r20, 0x3, loc_22e3de
    bg.beqi r20, 0x5, loc_22e3de
loc_22e320:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r14, r7
    bg.movhi r23, 0x48
    bg.addi r23, r23, 0x21ec
    bt.add r7, r23
    bg.lbz r7, 0x97(r7)
    bn.bnei r7, 0x0, loc_22e373
loc_22e337:
    bt.mov r3, r14
    bn.lwz r7, 0x4(r1)
    bn.exthz r4, r7
    bn.exthz r5, r22
loc_22e342:
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
    bg.j 0x2263a5
loc_22e373:
    bt.mov r3, r14
    bt.mov r4, r21
    bg.jal 0x222ea6
    bn.bnei r3, 0x1, loc_22e337
    bn.ori r7, r0, 0xb0
    bn.muls r7, r21, r7
    bg.movhi r24, 0x3b
    bg.addi r24, r24, 0x4950
    bt.add r7, r24
    bn.lbz r7, 0x7c(r7)
    bg.beq r21, r7, loc_22e648
    bt.mov r3, r18
    bt.mov r4, r17
    bg.jal 0x222bde
    bt.mov r3, r14
    bn.exthz r4, r22
    bn.lwz r6, 0x4(r1)
    bn.exthz r5, r6
    bt.j loc_22e342
loc_22e3aa:
    bt.mov r4, r21
    bg.jal 0x222ea6
    bt.movi r16, 0x0
    bg.bnei r3, 0x0, loc_22df87
    bn.j loc_22df84
loc_22e3b9:
    bn.exthz r5, r4
    bn.sub r7, r13, r7
    bt.add r7, r5
    bn.exthz r6, r7
    bn.j loc_22e108
loc_22e3c7:
    bt.mov r3, r17
    bg.jal 0x222804
    bt.mov r10, r3
    bt.mov r3, r14
    bg.jal 0x2227da
    bt.mov r20, r16
    bg.bne r10, r3, loc_22e03b
    bn.j loc_22e05a
loc_22e3de:
    bt.mov r3, r14
    bt.movi r4, 0x0
    bg.jal 0x2262ce
    bg.beqi r3, 0x0, loc_22e320
    bt.mov r3, r18
    bt.mov r4, r17
    bg.jal 0x222bde
    bt.mov r3, r14
    bn.exthz r4, r22
    bn.lwz r6, 0x4(r1)
    bn.exthz r5, r6
    bt.j loc_22e342
loc_22e3ff:
    bt.mov r3, r17
    bg.jal 0x222804
    bt.mov r10, r3
    bg.jal 0x222d32
    bt.movi r20, 0x0
    bg.beq r10, r3, loc_22e05a
    bt.mov r3, r17
    bg.jal 0x222804
    bt.mov r4, r17
    bg.jal 0x22acf2
    bn.sbz 0x29(r11), r12
    bg.jal 0x222d32
    bt.mov r4, r17
    bg.jal 0x22701c
    bn.j loc_22e05a
loc_22e42d:
    bg.jal 0x2402c4
    bt.mov r17, r3
    bn.j loc_22dfc1
loc_22e436:
    bt.mov r3, r14
    bg.jal 0x2227da
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r4, 0x3b
    bg.addi r4, r4, 0x4950
    bt.add r3, r4
    bn.lbz r7, 0x20(r3)
    bn.andi r7, r7, 0x10
    bn.bnei r7, 0x0, loc_22e4c5
loc_22e455:
    bn.ori r7, r0, 0x7c
    bn.muls r6, r18, r7
    bg.movhi r23, 0x48
    bg.addi r5, r23, -0x564
    bt.add r6, r5
    bn.sh_2 0x3a(r6), r11
    bn.sh_2 0x42(r6), r11
    bn.sh_2 0x4a(r6), r11
    bn.muls r7, r17, r7
    bt.add r7, r5
    bn.sh_2 0x3a(r7), r11
    bn.sh_2 0x42(r7), r11
    bn.sh_2 0x4a(r7), r0
    bt.j loc_22e318
loc_22e47e:
    bg.ble r19, r13, loc_22e0aa
    bg.beqi r5, 0x3, loc_22e0aa
    bg.beqi r5, 0x5, loc_22e0aa
    bg.lbz r7, 0x97(r7)
    bg.bnei r7, 0x0, loc_22e67b
loc_22e492:
    bn.sub r7, r13, r10
    bn.andi r6, r7, 0x3f
    bn.sub r4, r0, r6
    bt.movi r25, 0x1
    bn.sfleui r6, 0x20
    bn.bf loc_22e0ae
    bn.ori r7, r0, 0x40
    bn.sub r4, r7, r6
    bn.add r7, r13, r4
    bt.movi r25, 0x1
    bg.ble r7, r19, loc_22e0ae
    bn.sub r4, r19, r13
    bn.j loc_22e0ae
loc_22e4b8:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r12, r3
    bn.j loc_22e287
loc_22e4c5:
    bg.lbz r10, 0xa4(r10)
    bg.beqi r10, 0x0, loc_22e2f1
    bt.j loc_22e455
loc_22e4cf:
    bt.mov r13, r15
loc_22e4d1:
    bn.ori r16, r0, 0x7c
    bn.muls r11, r18, r16
    bg.movhi r23, 0x48
    bg.addi r23, r23, -0x564
    bt.add r11, r23
    bn.lh_0 r10, 0x24(r11)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r12, r3
    bg.blesi r10, -0x1, loc_22e66f
loc_22e4f0:
    bt.mov r3, r13
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r12
    bg.jal 0x2abe2e
    bt.mov r10, r3
    bt.mov r3, r15
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r10
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.sh_1 0x38(r11), r3
    bn.sh_2 0x42(r11), r13
    bn.sh_2 0x4a(r11), r13
    bn.muls r6, r17, r16
    bg.movhi r24, 0x48
    bg.addi r24, r24, -0x564
    bt.add r6, r24
    bn.sub r3, r13, r3
    bn.sh_1 0x38(r6), r3
    bn.sh_2 0x42(r6), r13
    bn.sh_2 0x4a(r6), r0
    bn.sh_1 0x34(r11), r0
    bn.lh r7, 0x38(r11)
    bn.sh_1 0x34(r6), r7
loc_22e53d:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r14, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r7, r4
    bn.lh r24, 0x1c(r7)
    bg.ble r19, r24, loc_22e618
    bn.ori r7, r0, 0x7c
    bn.muls r6, r18, r7
    bg.movhi r23, 0x48
    bg.addi r5, r23, -0x564
    bt.add r6, r5
    bn.sh_2 0x3a(r6), r24
    bn.sh_1 0x40(r6), r24
    bn.sh_1 0x48(r6), r24
    bn.muls r7, r17, r7
    bt.add r7, r5
    bn.sh_2 0x3a(r7), r24
    bn.sh_1 0x40(r7), r24
    bn.sh_1 0x48(r7), r0
    bn.sh_1 0x44(r6), r0
    bn.sh_1 0x44(r7), r0
    bn.j loc_22e318
loc_22e584:
    bn.lh r7, 0x1e(r6)
    bn.j loc_22e08f
loc_22e58a:
    bg.ori r23, r0, 0xff80
    bn.and r13, r15, r23
    bn.lh r7, 0x1e(r6)
    bn.and r16, r7, r23
    bg.ble r13, r16, loc_22e4d1
    bn.ori r13, r0, 0x7c
    bn.muls r11, r18, r13
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r11, r5
    bn.lh_0 r10, 0x24(r11)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r12, r3
    bg.blesi r10, -0x1, loc_22e656
loc_22e5ba:
    bt.mov r3, r16
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r12
    bg.jal 0x2abe2e
    bt.mov r10, r3
    bt.mov r3, r15
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r10
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.sh_1 0x38(r11), r3
    bn.sh_2 0x42(r11), r16
    bn.sh_2 0x4a(r11), r16
    bn.muls r6, r17, r13
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r6, r7
    bn.sub r3, r16, r3
    bn.sh_1 0x38(r6), r3
    bn.sh_2 0x42(r6), r16
    bn.sh_2 0x4a(r6), r0
    bn.sh_1 0x34(r11), r0
    bn.lh r7, 0x38(r11)
    bn.sh_1 0x34(r6), r7
    bt.j loc_22e53d
loc_22e609:
    bt.mov r3, r14
    bg.jal 0x2227da
    bt.mov r4, r14
    bg.jal 0x22dd9a
    bn.j loc_22dfb9
loc_22e618:
    bn.ori r7, r0, 0x7c
    bn.muls r6, r18, r7
    bg.movhi r24, 0x48
    bg.addi r5, r24, -0x564
    bt.add r6, r5
    bn.sh_2 0x3a(r6), r19
    bn.sh_1 0x40(r6), r19
    bn.sh_1 0x48(r6), r19
    bn.muls r7, r17, r7
    bt.add r7, r5
    bn.sh_2 0x3a(r7), r19
    bn.sh_1 0x40(r7), r19
    bn.sh_1 0x48(r7), r0
    bn.sh_1 0x44(r6), r0
    bn.sh_1 0x44(r7), r0
    bn.j loc_22e318
loc_22e648:
    bt.mov r3, r14
    bn.lwz r5, 0x4(r1)
    bn.exthz r4, r5
    bn.exthz r5, r22
    bn.j loc_22e342
loc_22e656:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r12, r3
    bt.j loc_22e5ba
loc_22e662:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r12, r3
    bn.j loc_22e1fc
loc_22e66f:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r12, r3
    bt.j loc_22e4f0
loc_22e67b:
    bt.mov r3, r14
    bt.mov r4, r21
    bg.jal 0x222ea6
    bg.beqi r3, 0x0, loc_22e492
    bn.j loc_22e0aa
