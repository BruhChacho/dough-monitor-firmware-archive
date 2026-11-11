# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x229450,0x22a02c); byte-exact only; hardware untested.
    bg.addi r1, r1, -0x88
    bg.sw_0 0x84(r1), r9
    bg.sw_0 0x80(r1), r10
    bn.sw 0x7c(r1), r11
    bn.sw 0x78(r1), r12
    bn.sw 0x74(r1), r13
    bn.sw 0x70(r1), r14
    bn.sw 0x6c(r1), r15
    bn.sw 0x68(r1), r16
    bn.sw 0x64(r1), r17
    bn.sw 0x60(r1), r18
    bn.sw 0x5c(r1), r19
    bn.sw 0x58(r1), r20
    bn.sw 0x54(r1), r21
    bn.sw 0x50(r1), r22
    bn.sw 0x8(r1), r3
    bn.sw 0x4(r1), r4
    bn.sw 0x30(r1), r5
    bn.sw 0x34(r1), r6
    bn.lh r16, 0x30(r1)
    bn.lh r10, 0x34(r1)
    bg.jal 0x2227ef
    bt.mov r18, r3
    bt.movi r7, 0x3
    bn.divu r21, r10, r7
    bn.ori r6, r0, 0xa8
    bn.muls r6, r3, r6
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r6, r4
    bn.lh r12, 0x10(r6)
    bn.lh r5, 0x14(r6)
    bn.add r7, r12, r5
    bn.exthz r20, r7
    bn.sw 0x3c(r1), r0
    bn.sw 0x40(r1), r0
    bn.sw 0x44(r1), r0
    bn.lbz r7, 0x28(r6)
    bn.sw 0x18(r1), r7
    bt.movi r7, 0x4
    bn.lwz r23, 0x4(r1)
    bn.xor r7, r23, r7
    bn.ff1 r7, r7
    bt.addi r7, -0x1
    bn.srli r7, r7, 0x1f
    bn.sw 0x1c(r1), r7
    bn.add r7, r21, r16
    bn.sh_2 0x4a(r1), r7
    bn.srli r10, r10, 0x1
    bt.add r10, r16
    bn.sh_1 0x4c(r1), r10
    bn.slli r7, r21, 0x1
    bt.add r7, r16
    bn.exthz r7, r7
    bn.sw 0x10(r1), r7
    bn.sh_2 0x4e(r1), r7
    bn.lh r10, 0x2a(r6)
    bn.lh r15, 0x2c(r6)
    bn.xor r6, r10, r15
    bn.andi r7, r15, 0xf
    bn.and r11, r6, r7
    bn.lwz r24, 0x1c(r1)
    bg.bnei r24, 0x0, loc_22980c
    bn.lwz r19, 0x8(r1)
    bt.movi r7, 0x1
    bn.sll r26, r7, r19
    bn.sw 0x20(r1), r26
    bn.exths r13, r26
    bt.mov r22, r23
    bn.sll r7, r7, r23
    bn.sw 0x24(r1), r7
    bn.exths r14, r7
loc_229526:
    bt.movi r23, 0x4
    bn.sw 0x14(r1), r23
    bg.bnei r11, 0x0, loc_22984b
loc_22952f:
    bn.lwz r3, 0x8(r1)
    bg.jal 0x222aa2
    bt.mov r17, r3
    bt.movi r7, 0x1
    bn.sll r7, r7, r3
    bn.sw 0x28(r1), r7
    bn.lwz r26, 0x14(r1)
    bg.beqi r26, 0x4, loc_229875
loc_229547:
    bn.ori r7, r0, 0xa8
    bn.muls r11, r18, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r11, r4
    bn.lh r6, 0x2c(r11)
    bn.or r5, r13, r6
    bn.ori r6, r0, 0x7c
    bn.muls r7, r19, r6
    bg.movhi r23, 0x48
    bg.addi r25, r23, -0x564
    bt.add r7, r25
    bn.sbz 0x10(r7), r18
    bt.movi r24, 0x3
    bn.sw 0x8(r7), r24
    bn.lbz r23, 0x29(r11)
    bn.sbz 0xe(r7), r23
    bg.lbz r4, 0xa5(r11)
    bn.sbz 0x70(r7), r4
    bn.or r5, r14, r5
    bn.muls r7, r22, r6
    bt.add r7, r25
    bn.sbz 0x10(r7), r18
    bn.sw 0x8(r7), r24
    bn.sbz 0xe(r7), r23
    bn.sbz 0x70(r7), r4
    bn.lwz r26, 0x28(r1)
    bn.or r5, r26, r5
    bn.muls r7, r17, r6
    bt.add r7, r25
    bn.sbz 0x10(r7), r18
    bn.sw 0x8(r7), r24
    bn.sbz 0xe(r7), r23
    bn.sbz 0x70(r7), r4
    bt.movi r7, 0x1
    bn.lwz r26, 0x14(r1)
    bn.sll r7, r7, r26
    bn.sw 0xc(r1), r7
    bn.or r5, r5, r7
    bn.sh_1 0x2c(r11), r5
    bn.muls r6, r26, r6
    bt.add r6, r25
    bn.sbz 0x10(r6), r18
    bn.sw 0x8(r6), r24
    bn.sbz 0xe(r6), r23
    bn.sbz 0x70(r6), r4
    bn.or r10, r10, r15
    bn.sra r7, r10, r19
    bn.andi r7, r7, 0x1
    bg.beqi r7, 0x0, loc_229e97
loc_2295dc:
    bn.sra r7, r10, r22
    bn.andi r7, r7, 0x1
    bg.beqi r7, 0x0, loc_229e8a
loc_2295e6:
    bn.sra r7, r10, r17
    bn.andi r7, r7, 0x1
    bg.beqi r7, 0x0, loc_229e7e
loc_2295f0:
    bn.lwz r4, 0x14(r1)
    bn.sra r7, r10, r4
    bn.andi r7, r7, 0x1
    bg.beqi r7, 0x0, loc_229e74
loc_2295fd:
    bn.lwz r3, 0x8(r1)
    bg.jal 0x222b9f
    bt.mov r3, r17
    bg.jal 0x222b9f
    bn.lwz r3, 0x14(r1)
    bg.jal 0x222b9f
    bn.lwz r3, 0x4(r1)
    bg.jal 0x222b9f
    bn.lh r13, 0x14(r11)
    bn.lbz r5, 0x29(r11)
    bn.sw 0x2c(r1), r5
    bt.mov r7, r5
    bt.addi r7, -0x1
    bn.extbz r10, r7
    bg.bleui r10, 0x1, loc_229ebd
    bn.lh r7, 0x1c(r11)
loc_22962f:
    bg.bgts r13, r7, loc_22975b
    bg.ble r13, r21, loc_229e0b
loc_229637:
    bn.lwz r6, 0x2c(r1)
    bg.beqi r6, 0x3, loc_22975b
    bg.beqi r6, 0x5, loc_22975b
    bn.ori r7, r0, 0xa8
    bn.muls r7, r18, r7
    bg.movhi r23, 0x48
    bg.addi r23, r23, 0x21ec
    bt.add r7, r23
    bg.lbz r7, 0x97(r7)
    bg.bnei r7, 0x0, loc_22974e
loc_22965a:
    bt.movi r4, 0x0
    bn.addi r23, r1, 0x4a
    bn.addi r25, r1, 0x3c
loc_229662:
    bn.lh r5, 0x0(r23)
    bg.ble r5, r12, loc_2296c8
    bg.bgt r5, r20, loc_2296c8
    bn.extbz r26, r4
    bg.beqi r26, 0x0, loc_229f76
    bn.addi r24, r4, -0x1
    bn.slli r7, r24, 0x1
    bn.addi r6, r1, 0x50
    bt.add r7, r6
    bn.lh_1 r6, 0xfa(r7)
    bt.mov r7, r12
    bg.bgt r6, r12, loc_22a013
loc_229688:
    bn.sub r7, r5, r7
    bn.srai r6, r7, 0x1f
    bn.srli r6, r6, 0x1a
    bt.add r7, r6
    bn.andi r7, r7, 0x3f
    bn.sub r7, r7, r6
    bn.exthz r6, r7
    bn.ori r7, r0, 0xa8
    bn.muls r7, r18, r7
    bg.movhi r24, 0x48
    bg.addi r24, r24, 0x21ec
    bt.add r7, r24
    bt.movi r24, 0x0
    bn.lbz r7, 0x38(r7)
    bg.bnei r7, 0x0, loc_22a004
loc_2296b5:
    bn.sfgtui r6, 0x20
    bn.bf loc_229fa9
    bn.sub r7, r0, r6
    bn.sw 0x0(r25), r7
loc_2296c1:
    bn.beqi r24, 0x0, loc_2296c8
    bg.beqi r26, 0x1, loc_22a026
loc_2296c8:
    bt.addi r4, 0x1
    bt.addi r23, 0x2
    bt.addi r25, 0x4
    bn.bnei r4, 0x3, loc_229662
    bt.movi r25, 0x1
    bn.ori r7, r0, 0x7c
    bn.muls r7, r19, r7
    bg.movhi r26, 0x48
    bg.addi r26, r26, -0x564
    bt.add r7, r26
    bn.sh_1 0x20(r7), r12
    bn.lh r6, 0x4a(r1)
    bg.bgt r6, r12, loc_229777
loc_2296ed:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r19, r7
    bg.movhi r26, 0x48
    bg.addi r26, r26, -0x564
    bt.add r7, r26
    bn.sh_1 0x24(r7), r0
    bn.add r7, r12, r16
    bn.sub r7, r7, r6
    bn.addi r7, r7, 0x20
    bn.exthz r5, r7
    bn.ori r7, r0, 0x7c
    bn.muls r7, r17, r7
    bg.movhi r24, 0x48
    bg.addi r24, r24, -0x564
    bt.add r7, r24
    bn.sh_1 0x20(r7), r5
    bn.lh r5, 0x4c(r1)
    bg.ble r5, r12, loc_2297b5
loc_229726:
    bg.ble r6, r20, loc_229dbb
    bt.movi r4, 0x0
    bn.lwz r6, 0x40(r1)
loc_22972f:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r17, r7
    bg.movhi r23, 0x48
    bg.addi r23, r23, -0x564
    bt.add r7, r23
    bn.sh_1 0x24(r7), r4
    bn.srli r7, r21, 0x1
    bt.add r6, r16
    bt.add r7, r6
    bn.exthz r6, r7
    bt.j loc_2297c6
loc_22974e:
    bt.mov r3, r18
    bn.lwz r4, 0x18(r1)
    bg.jal 0x222ea6
    bg.beqi r3, 0x0, loc_22965a
loc_22975b:
    bt.movi r25, 0x0
    bn.ori r7, r0, 0x7c
    bn.muls r7, r19, r7
    bg.movhi r26, 0x48
    bg.addi r26, r26, -0x564
    bt.add r7, r26
    bn.sh_1 0x20(r7), r12
    bn.lh r6, 0x4a(r1)
    bg.ble r6, r12, loc_2296ed
loc_229777:
    bg.ble r6, r20, loc_229dfd
    bt.mov r4, r13
    bn.lwz r5, 0x3c(r1)
loc_229780:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r19, r7
    bg.movhi r23, 0x48
    bg.addi r23, r23, -0x564
    bt.add r7, r23
    bn.sh_1 0x24(r7), r4
    bn.addi r7, r16, 0x20
    bt.add r7, r5
    bn.exthz r5, r7
    bn.ori r7, r0, 0x7c
    bn.muls r7, r17, r7
    bg.movhi r24, 0x48
    bg.addi r24, r24, -0x564
    bt.add r7, r24
    bn.sh_1 0x20(r7), r5
    bn.lh r5, 0x4c(r1)
    bg.bgt r5, r12, loc_229726
loc_2297b5:
    bn.sh_1 0x24(r7), r0
    bn.add r7, r12, r16
    bn.sub r7, r7, r5
    bn.srli r6, r21, 0x1
    bt.add r7, r6
    bn.exthz r6, r7
loc_2297c6:
    bn.ori r7, r0, 0x7c
    bn.lwz r24, 0x14(r1)
    bn.muls r7, r24, r7
    bg.movhi r26, 0x48
    bg.addi r26, r26, -0x564
    bt.add r7, r26
    bn.sh_1 0x20(r7), r6
    bn.lwz r4, 0x10(r1)
    bg.ble r4, r12, loc_229882
    bg.ble r5, r20, loc_229da4
    bt.movi r5, 0x0
    bn.lwz r6, 0x44(r1)
loc_2297ec:
    bn.ori r7, r0, 0x7c
    bn.lwz r23, 0x14(r1)
    bn.muls r7, r23, r7
    bg.movhi r24, 0x48
    bg.addi r24, r24, -0x564
    bt.add r7, r24
    bn.sh_1 0x24(r7), r5
    bn.addi r7, r16, 0x20
    bt.add r7, r6
    bn.exthz r7, r7
    bt.j loc_229894
loc_22980c:
    bn.lwz r22, 0x8(r1)
    bn.andi r7, r22, 0x2
    bg.beqi r7, 0x0, loc_229dcf
    bn.andi r7, r11, 0x2
    bg.beqi r7, 0x0, loc_229ec3
    bn.addi r7, r11, -0x2
    bn.exthz r11, r7
    bt.movi r7, 0x1
    bn.lwz r5, 0x8(r1)
    bn.sll r7, r7, r5
    bn.sw 0x24(r1), r7
    bn.exths r14, r7
    bn.sw 0x4(r1), r5
    bt.movi r6, 0x1
    bn.sw 0x8(r1), r6
    bt.movi r19, 0x1
    bt.movi r7, 0x2
    bn.sw 0x20(r1), r7
    bt.movi r13, 0x2
    bt.movi r23, 0x4
    bn.sw 0x14(r1), r23
    bg.beqi r11, 0x0, loc_22952f
loc_22984b:
    bt.mov r3, r11
    bg.jal 0x2402c4
    bt.mov r17, r3
    bt.movi r7, 0x1
    bn.sll r7, r7, r3
    bn.sw 0x28(r1), r7
    bn.sub r7, r11, r7
    bn.exthz r3, r7
    bt.movi r24, 0x4
    bn.sw 0x14(r1), r24
    bg.bnei r3, 0x0, loc_229f36
    bg.beqi r17, 0x4, loc_22952f
loc_22986e:
    bn.lwz r26, 0x14(r1)
    bg.bnei r26, 0x4, loc_229547
loc_229875:
    bn.lwz r3, 0x4(r1)
    bg.jal 0x222aa2
    bn.sw 0x14(r1), r3
    bn.j loc_229547
loc_229882:
    bn.sh_1 0x24(r7), r0
    bn.add r7, r12, r16
    bn.lwz r4, 0x10(r1)
    bn.sub r7, r7, r4
    bn.addi r7, r7, 0x20
    bn.exthz r7, r7
loc_229894:
    bn.ori r6, r0, 0x7c
    bn.muls r24, r22, r6
    bg.movhi r26, 0x48
    bg.addi r5, r26, -0x564
    bt.add r24, r5
    bn.sh_1 0x20(r24), r7
    bn.muls r23, r19, r6
    bt.add r23, r5
    bn.lh r4, 0x24(r23)
    bn.sub r7, r13, r4
    bn.muls r4, r17, r6
    bt.add r4, r5
    bn.lh r26, 0x24(r4)
    bn.sub r7, r7, r26
    bn.lwz r26, 0x14(r1)
    bn.muls r6, r26, r6
    bt.add r6, r5
    bn.lh r5, 0x24(r6)
    bn.sub r7, r7, r5
    bn.sh_1 0x24(r24), r7
    bn.ori r7, r0, 0xa8
    bn.muls r5, r18, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r5, r7
    bn.lh r7, 0x12(r5)
    bn.sh_2 0x22(r23), r7
    bn.sh_2 0x22(r4), r7
    bn.sh_2 0x22(r6), r7
    bn.sh_2 0x22(r24), r7
    bt.movi r4, 0x0
    bn.lh r23, 0x24(r23)
    bn.beqi r23, 0x0, loc_2298f8
    bn.lh r4, 0x16(r5)
loc_2298f8:
    bn.ori r7, r0, 0x7c
    bn.muls r6, r19, r7
    bg.movhi r23, 0x48
    bg.addi r5, r23, -0x564
    bt.add r6, r5
    bn.sh_2 0x26(r6), r4
    bn.muls r7, r17, r7
    bt.add r7, r5
    bt.movi r4, 0x0
    bn.lh r7, 0x24(r7)
    bn.beqi r7, 0x0, loc_22992b
    bn.ori r7, r0, 0xa8
    bn.muls r7, r18, r7
    bg.movhi r24, 0x48
    bg.addi r24, r24, 0x21ec
    bt.add r7, r24
    bn.lh r4, 0x16(r7)
loc_22992b:
    bn.ori r7, r0, 0x7c
    bn.muls r6, r17, r7
    bg.movhi r26, 0x48
    bg.addi r5, r26, -0x564
    bt.add r6, r5
    bn.sh_2 0x26(r6), r4
    bn.lwz r4, 0x14(r1)
    bn.muls r7, r4, r7
    bt.add r7, r5
    bt.movi r4, 0x0
    bn.lh r7, 0x24(r7)
    bn.beqi r7, 0x0, loc_229961
    bn.ori r7, r0, 0xa8
    bn.muls r7, r18, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lh r4, 0x16(r7)
loc_229961:
    bn.ori r7, r0, 0x7c
    bn.lwz r23, 0x14(r1)
    bn.muls r6, r23, r7
    bg.movhi r24, 0x48
    bg.addi r5, r24, -0x564
    bt.add r6, r5
    bn.sh_2 0x26(r6), r4
    bn.muls r7, r22, r7
    bt.add r7, r5
    bt.movi r6, 0x0
    bn.lh r7, 0x24(r7)
    bn.beqi r7, 0x0, loc_229997
    bn.ori r7, r0, 0xa8
    bn.muls r7, r18, r7
    bg.movhi r26, 0x48
    bg.addi r26, r26, 0x21ec
    bt.add r7, r26
    bn.lh r6, 0x16(r7)
loc_229997:
    bn.ori r23, r0, 0x7c
    bn.muls r24, r22, r23
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r24, r4
    bn.sh_2 0x26(r24), r6
    bn.lwz r5, 0x1c(r1)
    bg.beqi r5, 0x0, loc_229a6a
    bn.ori r7, r0, 0xa8
    bn.muls r5, r18, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r5, r6
    bn.lh r7, 0x18(r5)
    bg.sfleui r7, 0x77f
    bn.bnf loc_229d8b
    bn.muls r7, r19, r23
    bg.movhi r24, 0x48
    bg.addi r24, r24, -0x564
    bt.add r7, r24
    bn.lwz r6, 0x18(r5)
    bn.sw 0x4c(r7), r6
    bn.lwz r6, 0x1c(r5)
    bn.sw 0x50(r7), r6
    bn.ori r6, r0, 0x7c
    bn.muls r7, r19, r6
    bg.movhi r23, 0x48
    bg.addi r23, r23, -0x564
    bt.add r7, r23
    bn.lwz r4, 0x8(r1)
    bn.lh r7, 0x24(r7)
    bg.beqi r7, 0x0, loc_229acf
loc_2299fe:
    bn.ori r6, r0, 0x7c
    bn.muls r7, r19, r6
    bg.movhi r23, 0x48
    bg.addi r5, r23, -0x564
    bt.add r7, r5
    bn.sbz 0x32(r7), r4
    bn.muls r7, r17, r6
    bt.add r7, r5
    bn.sbz 0x32(r7), r4
    bn.lwz r24, 0x14(r1)
    bn.muls r7, r24, r6
    bt.add r7, r5
    bn.sbz 0x32(r7), r4
    bn.muls r6, r22, r6
    bt.add r6, r5
    bn.sbz 0x32(r6), r4
    bg.bnei r25, 0x0, loc_229af3
    bg.bleui r10, 0x1, loc_229c94
    bg.ori r6, r0, 0x180
    bn.divu r5, r13, r6
    bn.muls r5, r5, r6
    bn.ori r7, r0, 0xa8
    bn.muls r7, r18, r7
    bg.movhi r26, 0x48
    bg.addi r26, r26, 0x21ec
    bt.add r7, r26
    bn.lh r7, 0x1c(r7)
    bn.divu r7, r7, r6
    bn.muls r7, r7, r6
    bn.exthz r4, r5
    bn.exthz r6, r7
    bn.sfleu r4, r6
    bn.cmov_0 r5, r5, r7
    bn.exthz r15, r5
    bt.mov r3, r15
    bt.j loc_229afb
loc_229a6a:
    bn.ori r6, r0, 0xa8
    bn.muls r6, r18, r6
    bg.movhi r26, 0x48
    bg.addi r26, r26, 0x21ec
    bt.add r6, r26
    bn.lh r4, 0x18(r6)
    bn.muls r5, r19, r23
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r5, r7
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
loc_229ab5:
    bn.ori r6, r0, 0x7c
    bn.muls r7, r19, r6
    bg.movhi r23, 0x48
    bg.addi r23, r23, -0x564
    bt.add r7, r23
    bn.lwz r4, 0x8(r1)
    bn.lh r7, 0x24(r7)
    bg.bnei r7, 0x0, loc_2299fe
loc_229acf:
    bn.muls r7, r17, r6
    bt.add r7, r23
    bt.mov r4, r17
    bn.lh r7, 0x24(r7)
    bg.bnei r7, 0x0, loc_2299fe
    bn.lwz r26, 0x14(r1)
    bn.muls r7, r26, r6
    bt.add r7, r23
    bn.lh r7, 0x24(r7)
    bn.sfeqi r7, 0x0
    bn.lwz r5, 0x4(r1)
    bn.cmov_0 r4, r5, r26
    bt.j loc_2299fe
loc_229af3:
    bg.bleui r10, 0x1, loc_229c94
    bt.mov r15, r13
    bt.mov r3, r13
loc_229afb:
    bg.jal 0x2ac120
    bt.mov r16, r3
    bt.mov r3, r13
    bg.jal 0x2ac120
    bt.mov r11, r3
    bn.ori r20, r0, 0x7c
    bn.muls r13, r19, r20
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r13, r4
    bn.lh_0 r10, 0x24(r13)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bg.blesi r10, -0x1, loc_229f6b
loc_229b26:
    bt.mov r4, r16
    bg.jal 0x2abe2e
    bt.mov r4, r11
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.sh_1 0x38(r13), r3
    bn.muls r14, r17, r20
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r14, r5
    bn.lh_0 r10, 0x24(r14)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r4, r3
    bg.blesi r10, -0x1, loc_229f5e
loc_229b55:
    bt.mov r3, r16
    bg.jal 0x2abe2e
    bt.mov r4, r11
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.sh_1 0x38(r14), r3
    bn.lwz r6, 0x14(r1)
    bn.muls r12, r6, r20
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r12, r7
    bn.lh_0 r10, 0x24(r12)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r4, r3
    bg.blesi r10, -0x1, loc_229f51
loc_229b87:
    bt.mov r3, r16
    bg.jal 0x2abe2e
    bt.mov r4, r11
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.exthz r3, r3
    bn.sh_1 0x38(r12), r3
    bn.muls r11, r22, r20
    bg.movhi r23, 0x48
    bg.addi r23, r23, -0x564
    bt.add r11, r23
    bn.lh r24, 0x38(r13)
    bn.sub r7, r15, r24
    bn.lh r26, 0x38(r14)
    bn.sub r7, r7, r26
    bn.sub r7, r7, r3
    bn.sh_1 0x38(r11), r7
    bn.sh_1 0x40(r13), r15
    bn.sh_1 0x40(r14), r15
    bn.sh_1 0x40(r12), r15
    bn.sh_1 0x40(r11), r15
    bn.lh_0 r10, 0x50(r13)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r4, r3
    bg.blesi r10, -0x1, loc_229f44
loc_229bd7:
    bt.mov r3, r16
    bg.jal 0x2abe2e
    bt.mov r10, r3
    bn.ori r7, r0, 0xa8
    bn.muls r15, r18, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r15, r4
    bn.lh r3, 0x1c(r15)
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r10
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.sh_1 0x48(r13), r3
    bn.sh_1 0x48(r14), r0
    bn.sh_1 0x48(r12), r0
    bn.lh r5, 0x40(r13)
    bn.lh r6, 0x48(r13)
    bn.sub r7, r5, r6
    bn.sh_1 0x48(r11), r7
    bn.sh_1 0x34(r13), r0
    bn.lh r7, 0x38(r13)
    bn.sh_1 0x34(r14), r7
    bn.lh r23, 0x38(r14)
    bt.add r7, r23
    bn.exthz r7, r7
    bn.sh_1 0x34(r12), r7
    bn.lh r24, 0x38(r12)
    bt.add r7, r24
    bn.sh_1 0x34(r11), r7
    bn.sh_1 0x44(r13), r0
    bn.sh_1 0x44(r14), r0
    bn.sh_1 0x44(r12), r0
    bn.lh r7, 0x48(r13)
    bn.sh_1 0x44(r11), r7
    bn.lh r11, 0x16(r15)
    bn.lh r10, 0x1e(r15)
    bg.bgt r11, r10, loc_229e1b
loc_229c4c:
    bt.mov r10, r11
loc_229c4e:
    bn.ori r6, r0, 0x7c
    bn.muls r7, r19, r6
    bg.movhi r4, 0x48
    bg.addi r5, r4, -0x564
    bt.add r7, r5
    bn.sh_2 0x3a(r7), r10
    bn.sh_2 0x42(r7), r10
    bn.sh_2 0x4a(r7), r10
    bn.muls r7, r17, r6
    bt.add r7, r5
    bn.sh_2 0x3a(r7), r10
    bn.sh_2 0x42(r7), r10
    bn.sh_2 0x4a(r7), r10
    bn.lwz r23, 0x14(r1)
    bn.muls r7, r23, r6
    bt.add r7, r5
    bn.sh_2 0x3a(r7), r10
    bn.sh_2 0x42(r7), r10
    bn.sh_2 0x4a(r7), r10
    bn.muls r6, r22, r6
    bt.add r6, r5
    bn.sh_2 0x3a(r6), r10
    bn.sh_2 0x42(r6), r10
    bn.sh_2 0x4a(r6), r10
loc_229c94:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r18, r7
    bg.movhi r24, 0x48
    bg.addi r24, r24, 0x21ec
    bt.add r7, r24
    bn.lbz r7, 0x38(r7)
    bn.beqi r7, 0x0, loc_229d05
    bn.ori r5, r0, 0x7c
    bn.lwz r26, 0x14(r1)
    bn.muls r4, r26, r5
    bg.movhi r6, 0x48
    bg.addi r24, r6, -0x564
    bt.add r4, r24
    bn.lh r7, 0x20(r4)
    bn.addi r7, r7, -0x20
    bn.sh_1 0x20(r4), r7
    bn.sh_1 0x34(r4), r0
    bn.muls r23, r22, r5
    bt.add r23, r24
    bn.lh r7, 0x38(r4)
    bn.sh_1 0x34(r23), r7
    bn.muls r6, r19, r5
    bt.add r6, r24
    bn.lh r7, 0x40(r6)
    bn.srli r7, r7, 0x1
    bn.sh_1 0x40(r6), r7
    bn.muls r5, r17, r5
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
loc_229d05:
    bn.lwz r7, 0x2c(r1)
    bg.beqi r7, 0x3, loc_229e45
    bg.beqi r7, 0x5, loc_229e45
loc_229d10:
    bn.ori r7, r0, 0xb0
    bn.lwz r24, 0x18(r1)
    bn.muls r7, r24, r7
    bg.movhi r26, 0x3b
    bg.addi r26, r26, 0x4950
    bt.add r7, r26
    bn.lbz r7, 0x7c(r7)
    bg.beq r24, r7, loc_229ea4
    bn.lwz r3, 0x8(r1)
    bn.lwz r4, 0x14(r1)
    bg.jal 0x222bde
    bt.mov r3, r17
    bn.lwz r4, 0x4(r1)
    bg.jal 0x222bde
    bt.mov r3, r18
    bn.lwz r5, 0xc(r1)
    bn.exthz r4, r5
    bn.lwz r6, 0x24(r1)
    bn.exthz r5, r6
    bn.lwz r7, 0x20(r1)
    bn.exthz r6, r7
    bn.lwz r23, 0x28(r1)
loc_229d54:
    bn.exthz r7, r23
    bn.lwz r22, 0x50(r1)
    bn.lwz r21, 0x54(r1)
    bn.lwz r20, 0x58(r1)
    bn.lwz r19, 0x5c(r1)
    bn.lwz r18, 0x60(r1)
    bn.lwz r17, 0x64(r1)
    bn.lwz r16, 0x68(r1)
    bn.lwz r15, 0x6c(r1)
    bn.lwz r14, 0x70(r1)
    bn.lwz r13, 0x74(r1)
    bn.lwz r12, 0x78(r1)
    bn.lwz r11, 0x7c(r1)
    bg.lwz r10, 0x80(r1)
    bg.lwz r9, 0x84(r1)
    bg.addi r1, r1, 0x88
    bg.j 0x223b11
loc_229d8b:
    bn.lwz r7, 0x18(r5)
    bn.sw 0x4c(r24), r7
    bn.lwz r7, 0x1c(r5)
    bn.sw 0x50(r24), r7
    bn.lh r23, 0x4c(r24)
    bg.addi r7, r23, -0x780
    bn.sh_1 0x4c(r24), r7
    bn.j loc_229ab5
loc_229da4:
    bg.ble r12, r5, loc_229f1b
    bn.lwz r24, 0x10(r1)
    bg.ble r24, r20, loc_229ff3
    bn.sub r7, r20, r12
    bn.exthz r5, r7
    bn.lwz r6, 0x44(r1)
    bn.j loc_2297ec
loc_229dbb:
    bg.ble r12, r6, loc_229f03
    bg.ble r5, r20, loc_229fd3
    bn.sub r7, r20, r12
    bn.exthz r4, r7
    bn.lwz r6, 0x40(r1)
    bn.j loc_22972f
loc_229dcf:
    bn.andi r7, r11, 0x8
    bg.beqi r7, 0x0, loc_229ee5
    bn.addi r7, r11, -0x8
    bn.exthz r11, r7
    bt.movi r7, 0x1
    bn.lwz r6, 0x8(r1)
    bn.sll r7, r7, r6
    bn.sw 0x20(r1), r7
    bn.exths r13, r7
    bt.mov r19, r6
    bt.movi r7, 0x3
    bn.sw 0x4(r1), r7
    bt.movi r22, 0x3
    bt.movi r23, 0x8
    bn.sw 0x24(r1), r23
    bt.movi r14, 0x8
    bn.j loc_229526
loc_229dfd:
    bn.sub r7, r6, r12
    bn.lwz r5, 0x3c(r1)
    bt.add r7, r5
    bn.exthz r4, r7
    bn.j loc_229780
loc_229e0b:
    bn.sub r7, r12, r16
    bn.divs r7, r7, r21
    bn.divu r6, r20, r21
    bg.bne r7, r6, loc_229637
    bn.j loc_22975b
loc_229e1b:
    bt.mov r3, r18
    bg.jal 0x2227da
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r26, 0x3b
    bg.addi r26, r26, 0x4950
    bt.add r3, r26
    bn.lbz r7, 0x20(r3)
    bn.andi r7, r7, 0x10
    bg.beqi r7, 0x0, loc_229c4e
    bg.lbz r15, 0xa4(r15)
    bg.bnei r15, 0x0, loc_229c4e
    bt.j loc_229c4c
loc_229e45:
    bt.mov r3, r18
    bt.movi r4, 0x0
    bg.jal 0x2262ce
    bg.beqi r3, 0x0, loc_229d10
    bn.lwz r3, 0x8(r1)
    bn.lwz r4, 0x4(r1)
    bg.jal 0x222bde
    bt.mov r3, r18
    bn.lwz r23, 0x24(r1)
    bn.exthz r4, r23
    bn.lwz r24, 0x28(r1)
    bn.exthz r5, r24
    bn.lwz r26, 0xc(r1)
    bn.exthz r6, r26
    bn.lwz r23, 0x20(r1)
    bt.j loc_229d54
loc_229e74:
    bn.lwz r3, 0x18(r1)
    bg.jal 0x22701c
    bn.j loc_2295fd
loc_229e7e:
    bn.lwz r3, 0x18(r1)
    bt.mov r4, r17
    bg.jal 0x22701c
    bn.j loc_2295f0
loc_229e8a:
    bn.lwz r3, 0x18(r1)
    bn.lwz r4, 0x4(r1)
    bg.jal 0x22701c
    bn.j loc_2295e6
loc_229e97:
    bn.lwz r3, 0x18(r1)
    bn.lwz r4, 0x8(r1)
    bg.jal 0x22701c
    bn.j loc_2295dc
loc_229ea4:
    bt.mov r3, r18
    bn.lwz r24, 0x20(r1)
    bn.exthz r4, r24
    bn.lwz r26, 0x28(r1)
    bn.exthz r5, r26
    bn.lwz r7, 0xc(r1)
    bn.exthz r6, r7
    bn.lwz r23, 0x24(r1)
    bt.j loc_229d54
loc_229ebd:
    bn.lh r7, 0x1e(r11)
    bn.j loc_22962f
loc_229ec3:
    bt.movi r7, 0x1
    bn.lwz r24, 0x8(r1)
    bn.sll r7, r7, r24
    bn.sw 0x24(r1), r7
    bn.exths r14, r7
    bn.sw 0x4(r1), r24
    bt.movi r26, 0x1
    bn.sw 0x8(r1), r26
    bt.movi r19, 0x1
    bt.movi r4, 0x2
    bn.sw 0x20(r1), r4
    bt.movi r13, 0x2
    bn.j loc_229526
loc_229ee5:
    bt.movi r7, 0x1
    bn.sll r7, r7, r22
    bn.sw 0x20(r1), r7
    bn.exths r13, r7
    bt.mov r19, r22
    bt.movi r4, 0x3
    bn.sw 0x4(r1), r4
    bt.movi r22, 0x3
    bt.movi r5, 0x8
    bn.sw 0x24(r1), r5
    bt.movi r14, 0x8
    bn.j loc_229526
loc_229f03:
    bg.bgt r5, r20, loc_229fe1
    bn.sub r7, r5, r6
    bn.lwz r6, 0x40(r1)
    bt.add r7, r6
    bn.lh r26, 0x3c(r1)
    bn.sub r7, r7, r26
    bn.exthz r4, r7
    bn.j loc_22972f
loc_229f1b:
    bn.lwz r6, 0x10(r1)
    bg.bgt r6, r20, loc_229fc1
    bn.sub r7, r6, r5
    bn.lwz r6, 0x44(r1)
    bt.add r7, r6
    bn.lh r23, 0x40(r1)
    bn.sub r7, r7, r23
    bn.exthz r5, r7
    bn.j loc_2297ec
loc_229f36:
    bg.jal 0x2402c4
    bn.sw 0x14(r1), r3
    bg.bnei r17, 0x4, loc_22986e
    bn.j loc_22952f
loc_229f44:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r4, r3
    bn.j loc_229bd7
loc_229f51:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r4, r3
    bn.j loc_229b87
loc_229f5e:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r4, r3
    bn.j loc_229b55
loc_229f6b:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bn.j loc_229b26
loc_229f76:
    bn.sub r7, r5, r12
    bn.srai r6, r7, 0x1f
    bn.srli r6, r6, 0x1a
    bt.add r7, r6
    bn.andi r7, r7, 0x3f
    bn.sub r7, r7, r6
    bn.exthz r6, r7
    bn.ori r7, r0, 0xa8
    bn.muls r7, r18, r7
    bg.movhi r24, 0x48
    bg.addi r24, r24, 0x21ec
    bt.add r7, r24
    bn.lbz r7, 0x38(r7)
    bn.sfeqi r7, 0x0
    bn.cmovsi_2 r7, r0, 0x1
    bn.extbz r24, r7
    bn.j loc_2296b5
loc_229fa9:
    bn.ori r7, r0, 0x40
    bn.sub r7, r7, r6
    bn.sw 0x0(r25), r7
    bt.add r7, r5
    bg.bles r7, r20, loc_2296c1
    bn.sub r7, r20, r5
    bn.sw 0x0(r25), r7
    bn.j loc_2296c1
loc_229fc1:
    bn.sub r7, r20, r5
    bn.lh r4, 0x40(r1)
    bn.sub r7, r7, r4
    bn.exthz r5, r7
    bn.lwz r6, 0x44(r1)
    bn.j loc_2297ec
loc_229fd3:
    bn.sub r7, r5, r12
    bn.lwz r6, 0x40(r1)
    bt.add r7, r6
    bn.exthz r4, r7
    bn.j loc_22972f
loc_229fe1:
    bn.sub r7, r20, r6
    bn.lh r4, 0x3c(r1)
    bn.sub r7, r7, r4
    bn.exthz r4, r7
    bn.lwz r6, 0x40(r1)
    bn.j loc_22972f
loc_229ff3:
    bn.lwz r26, 0x10(r1)
    bn.sub r7, r26, r12
    bn.lwz r6, 0x44(r1)
    bt.add r7, r6
    bn.exthz r5, r7
    bn.j loc_2297ec
loc_22a004:
    bt.movi r24, 0x1
    bg.bnei r26, 0x2, loc_2296b5
    bn.addi r7, r6, 0x20
    bn.andi r6, r7, 0x3f
    bn.j loc_2296b5
loc_22a013:
    bn.slli r7, r24, 0x2
    bn.addi r24, r1, 0x50
    bt.add r7, r24
    bn.lh_1 r7, 0xec(r7)
    bt.add r6, r7
    bn.exthz r7, r6
    bn.j loc_229688
loc_22a026:
    bn.sw 0x0(r25), r0
    bn.j loc_2296c8
