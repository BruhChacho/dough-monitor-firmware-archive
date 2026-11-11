# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x227fc6,0x228a16); byte-exact only; hardware untested.
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
    bt.mov r22, r3
    bn.sw 0x4(r1), r4
    bn.sw 0x40(r1), r5
    bn.sw 0x44(r1), r6
    bn.lh r14, 0x40(r1)
    bg.jal 0x2227ef
    bt.mov r20, r3
    bn.lh r5, 0x44(r1)
    bn.srli r5, r5, 0x2
    bn.ori r6, r0, 0xa8
    bn.muls r6, r3, r6
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r6, r4
    bn.lh r13, 0x10(r6)
    bn.lh r23, 0x14(r6)
    bn.add r7, r13, r23
    bn.exthz r7, r7
    bn.sw 0x18(r1), r7
    bn.lbz r26, 0x28(r6)
    bn.sw 0x1c(r1), r26
    bt.movi r7, 0x4
    bn.lwz r4, 0x4(r1)
    bn.xor r7, r4, r7
    bn.ff1 r7, r7
    bt.addi r7, -0x1
    bn.srli r7, r7, 0x1f
    bn.sw 0x20(r1), r7
    bg.lbz r7, 0x97(r6)
    bn.sfeqi r7, 0x0
    bn.ori r7, r0, 0x20
    bn.cmov_0 r7, r7, r0
    bn.sw 0x28(r1), r7
    bn.add r7, r5, r14
    bn.exthz r15, r7
    bn.slli r7, r5, 0x1
    bt.add r7, r14
    bn.exthz r19, r7
    bt.movi r7, 0x3
    bn.muls r5, r5, r7
    bt.add r5, r14
    bn.exthz r5, r5
    bn.sw 0x24(r1), r5
    bn.lh r5, 0x2a(r6)
    bn.sw 0x8(r1), r5
    bn.lh r16, 0x2c(r6)
    bn.xor r6, r5, r16
    bn.andi r7, r16, 0xf
    bn.and r11, r6, r7
    bn.lwz r6, 0x20(r1)
    bg.bnei r6, 0x0, loc_2286ee
    bt.mov r21, r22
    bt.movi r7, 0x1
    bn.sll r6, r7, r22
    bn.exths r12, r6
    bn.sw 0x38(r1), r4
    bn.sll r7, r7, r4
    bn.exths r17, r7
    bn.exthz r6, r6
    bn.sw 0x2c(r1), r6
    bn.exthz r7, r7
    bn.sw 0x30(r1), r7
loc_2280a9:
    bt.movi r26, 0x4
    bn.sw 0x14(r1), r26
    bg.bnei r11, 0x0, loc_228727
loc_2280b2:
    bt.mov r3, r22
    bg.jal 0x222aa2
    bt.mov r18, r3
    bt.movi r7, 0x1
    bn.sll r10, r7, r3
    bn.exthz r6, r10
    bn.sw 0x34(r1), r6
    bn.lwz r7, 0x14(r1)
    bg.beqi r7, 0x4, loc_228754
loc_2280cc:
    bn.ori r7, r0, 0xa8
    bn.muls r11, r20, r7
    bg.movhi r23, 0x48
    bg.addi r23, r23, 0x21ec
    bt.add r11, r23
    bn.lh r26, 0x2c(r11)
    bn.or r5, r12, r26
    bn.ori r6, r0, 0x7c
    bn.muls r7, r21, r6
    bg.movhi r4, 0x48
    bg.addi r25, r4, -0x564
    bn.add r12, r7, r25
    bn.sbz 0x10(r12), r20
    bt.movi r24, 0x3
    bn.sw 0x8(r12), r24
    bn.lbz r23, 0x29(r11)
    bn.sbz 0xe(r12), r23
    bg.lbz r4, 0xa5(r11)
    bn.sbz 0x70(r12), r4
    bn.or r5, r17, r5
    bn.lwz r26, 0x38(r1)
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
    bn.lwz r26, 0x14(r1)
    bn.sll r7, r7, r26
    bn.sw 0xc(r1), r7
    bn.or r5, r5, r7
    bn.sh_1 0x2c(r11), r5
    bn.muls r6, r26, r6
    bt.add r6, r25
    bn.sbz 0x10(r6), r20
    bn.sw 0x8(r6), r24
    bn.sbz 0xe(r6), r23
    bn.sbz 0x70(r6), r4
    bn.lwz r4, 0x8(r1)
    bn.or r10, r4, r16
    bn.sra r7, r10, r21
    bn.andi r7, r7, 0x1
    bg.beqi r7, 0x0, loc_228942
loc_228165:
    bn.lwz r5, 0x38(r1)
    bn.sra r7, r10, r5
    bn.andi r7, r7, 0x1
    bg.beqi r7, 0x0, loc_228935
loc_228172:
    bn.sra r7, r10, r18
    bn.andi r7, r7, 0x1
    bg.beqi r7, 0x0, loc_228929
loc_22817c:
    bn.lwz r6, 0x14(r1)
    bn.sra r7, r10, r6
    bn.andi r7, r7, 0x1
    bg.beqi r7, 0x0, loc_22891d
loc_228189:
    bt.mov r3, r22
    bg.jal 0x222b9f
    bt.mov r3, r18
    bg.jal 0x222b9f
    bn.lwz r3, 0x14(r1)
    bg.jal 0x222b9f
    bn.lwz r3, 0x4(r1)
    bg.jal 0x222b9f
    bn.sh_1 0x20(r12), r13
    bg.ble r15, r13, loc_2286b7
    bn.sub r7, r15, r13
    bn.exthz r6, r7
    bn.lwz r7, 0x18(r1)
    bg.bgt r15, r7, loc_228892
loc_2281b7:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r21, r7
    bg.movhi r23, 0x48
    bg.addi r23, r23, -0x564
    bt.add r7, r23
    bn.sh_1 0x24(r7), r6
    bn.lwz r26, 0x28(r1)
    bn.add r7, r14, r26
    bn.exthz r6, r7
    bn.ori r7, r0, 0x7c
    bn.muls r7, r18, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bn.sh_1 0x20(r7), r6
    bg.ble r19, r13, loc_2286df
loc_2281ea:
    bt.movi r6, 0x0
    bn.lwz r5, 0x18(r1)
    bg.ble r15, r5, loc_228875
loc_2281f3:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r18, r7
    bg.movhi r26, 0x48
    bg.addi r26, r26, -0x564
    bt.add r7, r26
    bn.sh_1 0x24(r7), r6
    bt.mov r6, r14
loc_228208:
    bn.ori r7, r0, 0x7c
    bn.lwz r4, 0x14(r1)
    bn.muls r7, r4, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.sh_1 0x20(r7), r6
    bn.lwz r6, 0x24(r1)
    bg.ble r6, r13, loc_2286a0
    bt.movi r5, 0x0
    bn.lwz r7, 0x18(r1)
    bg.ble r19, r7, loc_228898
loc_22822e:
    bn.ori r7, r0, 0x7c
    bn.lwz r6, 0x14(r1)
    bn.muls r7, r6, r7
    bg.movhi r23, 0x48
    bg.addi r23, r23, -0x564
    bt.add r7, r23
    bn.sh_1 0x24(r7), r5
    bn.lwz r26, 0x28(r1)
    bn.add r7, r14, r26
    bn.exthz r5, r7
loc_22824d:
    bn.ori r6, r0, 0x7c
    bn.lwz r4, 0x38(r1)
    bn.muls r24, r4, r6
    bg.movhi r7, 0x48
    bg.addi r23, r7, -0x564
    bt.add r24, r23
    bn.sh_1 0x20(r24), r5
    bn.ori r7, r0, 0xa8
    bn.muls r25, r20, r7
    bg.movhi r26, 0x48
    bg.addi r26, r26, 0x21ec
    bt.add r25, r26
    bn.lh r10, 0x14(r25)
    bn.muls r4, r21, r6
    bt.add r4, r23
    bn.lh r5, 0x24(r4)
    bn.sub r7, r10, r5
    bn.muls r5, r18, r6
    bt.add r5, r23
    bn.lh r26, 0x24(r5)
    bn.sub r7, r7, r26
    bn.lwz r26, 0x14(r1)
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
    bn.beqi r4, 0x0, loc_2282b7
    bn.lh r23, 0x16(r25)
loc_2282b7:
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
    bn.beqi r7, 0x0, loc_2282ea
    bn.ori r7, r0, 0xa8
    bn.muls r7, r20, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r7, r4
    bn.lh r4, 0x16(r7)
loc_2282ea:
    bn.ori r7, r0, 0x7c
    bn.muls r6, r18, r7
    bg.movhi r23, 0x48
    bg.addi r5, r23, -0x564
    bt.add r6, r5
    bn.sh_2 0x26(r6), r4
    bn.lwz r26, 0x14(r1)
    bn.muls r7, r26, r7
    bt.add r7, r5
    bt.movi r4, 0x0
    bn.lh r7, 0x24(r7)
    bn.beqi r7, 0x0, loc_228320
    bn.ori r7, r0, 0xa8
    bn.muls r7, r20, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r7, r4
    bn.lh r4, 0x16(r7)
loc_228320:
    bn.ori r7, r0, 0x7c
    bn.lwz r5, 0x14(r1)
    bn.muls r6, r5, r7
    bg.movhi r23, 0x48
    bg.addi r5, r23, -0x564
    bt.add r6, r5
    bn.sh_2 0x26(r6), r4
    bn.lwz r26, 0x38(r1)
    bn.muls r7, r26, r7
    bt.add r7, r5
    bt.movi r6, 0x0
    bn.lh r7, 0x24(r7)
    bn.beqi r7, 0x0, loc_228359
    bn.ori r7, r0, 0xa8
    bn.muls r7, r20, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r7, r4
    bn.lh r6, 0x16(r7)
loc_228359:
    bn.ori r23, r0, 0x7c
    bn.lwz r5, 0x38(r1)
    bn.muls r24, r5, r23
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r24, r7
    bn.sh_2 0x26(r24), r6
    bn.lwz r26, 0x20(r1)
    bg.beqi r26, 0x0, loc_228761
    bn.ori r7, r0, 0xa8
    bn.muls r5, r20, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r5, r4
    bn.lh r7, 0x18(r5)
    bg.sfleui r7, 0x77f
    bn.bnf loc_22885d
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
    bg.beqi r7, 0x0, loc_2287c5
loc_2283c2:
    bn.ori r6, r0, 0x7c
    bn.muls r7, r21, r6
    bg.movhi r23, 0x48
    bg.addi r5, r23, -0x564
    bn.add r11, r7, r5
    bn.sbz 0x32(r11), r4
    bn.muls r7, r18, r6
    bn.add r12, r7, r5
    bn.sbz 0x32(r12), r4
    bn.lwz r26, 0x14(r1)
    bn.muls r7, r26, r6
    bn.add r13, r7, r5
    bn.sbz 0x32(r13), r4
    bn.lwz r7, 0x38(r1)
    bn.muls r6, r7, r6
    bn.add r19, r6, r5
    bn.sbz 0x32(r19), r4
    bn.ori r7, r0, 0xa8
    bn.muls r15, r20, r7
    bg.movhi r23, 0x48
    bg.addi r23, r23, 0x21ec
    bt.add r15, r23
    bn.lbz r26, 0x29(r15)
    bn.sw 0x3c(r1), r26
    bt.mov r7, r26
    bt.addi r7, -0x1
    bn.extbz r7, r7
    bg.bleui r7, 0x1, loc_22858c
    bn.lh r4, 0x1c(r15)
    bn.sw 0x10(r1), r4
    bg.addi r6, r0, -0x100
    bn.and r5, r10, r6
    bg.ori r23, r0, 0xff00
    bn.and r7, r4, r23
    bn.exthz r6, r7
    bn.sfgtu r5, r6
    bn.cmov_0 r7, r7, r5
    bn.exthz r14, r7
    bt.mov r3, r14
    bg.jal 0x2ac120
    bt.mov r17, r3
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r16, r3
    bn.lh_0 r10, 0x24(r11)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bg.blesi r10, -0x1, loc_2289c5
loc_228455:
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
    bg.blesi r10, -0x1, loc_2289d0
loc_228477:
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
    bg.blesi r10, -0x1, loc_2289ab
loc_228499:
    bt.mov r3, r17
    bg.jal 0x2abe2e
    bt.mov r4, r16
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.exthz r3, r3
    bn.sh_1 0x38(r13), r3
    bn.lh r26, 0x38(r11)
    bn.sub r7, r14, r26
    bn.lh r4, 0x38(r12)
    bn.sub r7, r7, r4
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
    bg.blesi r10, -0x1, loc_2289b8
loc_2284dc:
    bt.mov r3, r17
    bg.jal 0x2abe2e
    bt.mov r10, r3
    bn.lwz r3, 0x10(r1)
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r10
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.sh_1 0x48(r11), r3
    bn.sh_1 0x48(r12), r0
    bn.sh_1 0x48(r13), r0
    bn.lh r5, 0x40(r11)
    bn.lh r6, 0x48(r11)
    bn.sub r7, r5, r6
    bn.sh_1 0x48(r19), r7
    bn.sh_1 0x34(r11), r0
    bn.lh r7, 0x38(r11)
    bn.sh_1 0x34(r12), r7
    bn.lh r23, 0x38(r12)
    bt.add r7, r23
    bn.exthz r7, r7
    bn.sh_1 0x34(r13), r7
    bn.lh r26, 0x38(r13)
    bt.add r7, r26
    bn.sh_1 0x34(r19), r7
    bn.sh_1 0x44(r11), r0
    bn.sh_1 0x44(r12), r0
    bn.sh_1 0x44(r13), r0
    bn.lh r7, 0x48(r11)
    bn.sh_1 0x44(r19), r7
    bn.lh r11, 0x16(r15)
    bn.lh r10, 0x1e(r15)
    bg.bgt r11, r10, loc_2288b5
loc_228541:
    bt.mov r10, r11
loc_228543:
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
    bn.lwz r26, 0x14(r1)
    bn.muls r7, r26, r6
    bt.add r7, r5
    bn.sh_2 0x3a(r7), r10
    bn.sh_2 0x42(r7), r10
    bn.sh_2 0x4a(r7), r10
    bn.lwz r4, 0x38(r1)
    bn.muls r6, r4, r6
    bt.add r6, r5
    bn.sh_2 0x3a(r6), r10
    bn.sh_2 0x42(r6), r10
    bn.sh_2 0x4a(r6), r10
loc_22858c:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r20, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lbz r7, 0x38(r7)
    bn.beqi r7, 0x0, loc_228603
    bn.ori r5, r0, 0x7c
    bn.lwz r6, 0x14(r1)
    bn.muls r4, r6, r5
    bg.movhi r7, 0x48
    bg.addi r24, r7, -0x564
    bt.add r4, r24
    bn.lh r23, 0x20(r4)
    bn.lwz r26, 0x28(r1)
    bn.sub r7, r23, r26
    bn.sh_1 0x20(r4), r7
    bn.sh_1 0x34(r4), r0
    bn.lwz r6, 0x38(r1)
    bn.muls r23, r6, r5
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
loc_228603:
    bn.lwz r7, 0x3c(r1)
    bg.beqi r7, 0x3, loc_2288f4
    bg.beqi r7, 0x5, loc_2288f4
loc_22860e:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r20, r7
    bg.movhi r26, 0x48
    bg.addi r26, r26, 0x21ec
    bt.add r7, r26
    bg.lbz r7, 0x97(r7)
    bg.beqi r7, 0x0, loc_2287ea
    bn.ori r7, r0, 0xb0
    bn.lwz r4, 0x1c(r1)
    bn.muls r7, r4, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r7, r5
    bn.lbz r6, 0x7c(r7)
    bg.beq r4, r6, loc_2288e0
    bn.lwz r23, 0x1c(r1)
    bn.lbz r26, 0x7d(r7)
    bg.beq r23, r26, loc_2289fa
    bn.lwz r23, 0x1c(r1)
    bn.lbz r7, 0x7e(r7)
    bg.beq r23, r7, loc_2289dd
    bt.mov r3, r22
    bn.lwz r4, 0x4(r1)
    bg.jal 0x222bde
    bt.mov r3, r20
    bn.lwz r4, 0x30(r1)
    bn.lwz r5, 0x34(r1)
    bn.lwz r7, 0xc(r1)
    bn.exthz r6, r7
    bn.lwz r7, 0x2c(r1)
loc_22866e:
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
    bg.j 0x2234cc
loc_2286a0:
    bn.sh_1 0x24(r7), r0
    bn.add r7, r13, r14
    bn.lwz r26, 0x24(r1)
    bn.sub r7, r7, r26
    bn.lwz r4, 0x28(r1)
    bt.add r7, r4
    bn.exthz r5, r7
    bn.j loc_22824d
loc_2286b7:
    bn.sh_1 0x24(r12), r0
    bn.add r7, r13, r14
    bn.sub r7, r7, r15
    bn.lwz r23, 0x28(r1)
    bt.add r7, r23
    bn.exthz r6, r7
    bn.ori r7, r0, 0x7c
    bn.muls r7, r18, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bn.sh_1 0x20(r7), r6
    bg.bgt r19, r13, loc_2281ea
loc_2286df:
    bn.sh_1 0x24(r7), r0
    bn.add r7, r13, r14
    bn.sub r7, r7, r19
    bn.exthz r6, r7
    bn.j loc_228208
loc_2286ee:
    bn.sw 0x38(r1), r22
    bn.andi r7, r22, 0x2
    bg.beqi r7, 0x0, loc_228830
    bn.andi r7, r11, 0x2
    bn.beqi r7, 0x0, loc_228704
    bn.addi r7, r11, -0x2
    bn.exthz r11, r7
loc_228704:
    bt.movi r7, 0x1
    bn.sll r7, r7, r22
    bn.exths r17, r7
    bn.exthz r7, r7
    bn.sw 0x30(r1), r7
    bn.sw 0x4(r1), r22
    bt.movi r22, 0x1
    bt.movi r21, 0x1
    bt.movi r12, 0x2
    bn.sw 0x2c(r1), r12
    bt.movi r26, 0x4
    bn.sw 0x14(r1), r26
    bg.beqi r11, 0x0, loc_2280b2
loc_228727:
    bt.mov r3, r11
    bg.jal 0x2402c4
    bt.mov r18, r3
    bt.movi r7, 0x1
    bn.sll r10, r7, r3
    bn.exthz r4, r10
    bn.sw 0x34(r1), r4
    bn.sub r7, r11, r4
    bn.exthz r3, r7
    bt.movi r5, 0x4
    bn.sw 0x14(r1), r5
    bg.bnei r3, 0x0, loc_22899d
    bg.beqi r18, 0x4, loc_2280b2
loc_22874d:
    bn.lwz r7, 0x14(r1)
    bg.bnei r7, 0x4, loc_2280cc
loc_228754:
    bn.lwz r3, 0x4(r1)
    bg.jal 0x222aa2
    bn.sw 0x14(r1), r3
    bn.j loc_2280cc
loc_228761:
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
loc_2287ac:
    bn.ori r6, r0, 0x7c
    bn.muls r7, r21, r6
    bg.movhi r26, 0x48
    bg.addi r26, r26, -0x564
    bt.add r7, r26
    bt.mov r4, r22
    bn.lh r7, 0x24(r7)
    bg.bnei r7, 0x0, loc_2283c2
loc_2287c5:
    bn.muls r7, r18, r6
    bt.add r7, r26
    bt.mov r4, r18
    bn.lh r7, 0x24(r7)
    bg.bnei r7, 0x0, loc_2283c2
    bn.lwz r5, 0x14(r1)
    bn.muls r7, r5, r6
    bt.add r7, r26
    bn.lh r7, 0x24(r7)
    bn.sfeqi r7, 0x0
    bn.lwz r7, 0x4(r1)
    bn.cmov_0 r4, r7, r5
    bn.j loc_2283c2
loc_2287ea:
    bn.ori r7, r0, 0xb0
    bn.lwz r23, 0x1c(r1)
    bn.muls r7, r23, r7
    bg.movhi r26, 0x3b
    bg.addi r26, r26, 0x4950
    bt.add r7, r26
    bn.lbz r4, 0x7c(r7)
    bg.beq r23, r4, loc_2288e0
    bn.lbz r7, 0x7d(r7)
    bg.beq r23, r7, loc_2288e0
    bt.mov r3, r22
    bn.lwz r4, 0x14(r1)
    bg.jal 0x222bde
    bt.mov r3, r18
    bn.lwz r4, 0x4(r1)
    bg.jal 0x222bde
    bt.mov r3, r20
    bn.lwz r5, 0xc(r1)
    bn.exthz r4, r5
    bn.lwz r5, 0x30(r1)
    bn.lwz r6, 0x2c(r1)
    bn.lwz r7, 0x34(r1)
    bt.j loc_22866e
loc_228830:
    bn.andi r7, r11, 0x8
    bg.beqi r7, 0x0, loc_22897d
    bn.addi r7, r11, -0x8
    bn.exthz r11, r7
    bt.movi r7, 0x1
    bn.sll r7, r7, r22
    bn.exths r12, r7
    bn.exthz r7, r7
    bn.sw 0x2c(r1), r7
    bt.mov r21, r22
    bt.movi r23, 0x3
    bn.sw 0x4(r1), r23
    bn.sw 0x38(r1), r23
    bt.movi r17, 0x8
    bn.sw 0x30(r1), r17
    bn.j loc_2280a9
loc_22885d:
    bn.lwz r7, 0x18(r5)
    bn.sw 0x4c(r24), r7
    bn.lwz r7, 0x1c(r5)
    bn.sw 0x50(r24), r7
    bn.lh r5, 0x4c(r24)
    bg.addi r7, r5, -0x780
    bn.sh_1 0x4c(r24), r7
    bt.j loc_2287ac
loc_228875:
    bg.ble r13, r15, loc_228967
    bn.lwz r6, 0x18(r1)
    bn.sub r7, r6, r13
    bn.exthz r6, r7
    bn.lwz r7, 0x18(r1)
    bg.bgt r19, r7, loc_2281f3
    bn.sub r7, r19, r13
    bn.exthz r6, r7
    bn.j loc_2281f3
loc_228892:
    bn.lh r6, 0x14(r11)
    bn.j loc_2281b7
loc_228898:
    bg.ble r13, r19, loc_22894e
    bn.lwz r26, 0x18(r1)
    bn.sub r7, r26, r13
    bn.exthz r5, r7
    bn.lwz r4, 0x24(r1)
    bg.bgt r4, r26, loc_22822e
    bn.sub r7, r4, r13
    bn.exthz r5, r7
    bn.j loc_22822e
loc_2288b5:
    bt.mov r3, r20
    bg.jal 0x2227da
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r4, 0x3b
    bg.addi r4, r4, 0x4950
    bt.add r3, r4
    bn.lbz r7, 0x20(r3)
    bn.andi r7, r7, 0x10
    bg.beqi r7, 0x0, loc_228543
    bg.lbz r15, 0xa4(r15)
    bg.bnei r15, 0x0, loc_228543
    bn.j loc_228541
loc_2288e0:
    bt.mov r3, r20
    bn.lwz r4, 0x2c(r1)
    bn.lwz r5, 0x34(r1)
    bn.lwz r7, 0xc(r1)
    bn.exthz r6, r7
    bn.lwz r7, 0x30(r1)
    bn.j loc_22866e
loc_2288f4:
    bt.mov r3, r20
    bt.movi r4, 0x0
    bg.jal 0x2262ce
    bg.beqi r3, 0x0, loc_22860e
    bt.mov r3, r22
    bn.lwz r4, 0x4(r1)
    bg.jal 0x222bde
    bt.mov r3, r20
    bn.lwz r4, 0x30(r1)
    bn.lwz r5, 0x34(r1)
    bn.lwz r23, 0xc(r1)
    bn.exthz r6, r23
    bn.lwz r7, 0x2c(r1)
    bn.j loc_22866e
loc_22891d:
    bn.lwz r3, 0x1c(r1)
    bt.mov r4, r6
    bg.jal 0x22701c
    bn.j loc_228189
loc_228929:
    bn.lwz r3, 0x1c(r1)
    bt.mov r4, r18
    bg.jal 0x22701c
    bn.j loc_22817c
loc_228935:
    bn.lwz r3, 0x1c(r1)
    bn.lwz r4, 0x4(r1)
    bg.jal 0x22701c
    bn.j loc_228172
loc_228942:
    bn.lwz r3, 0x1c(r1)
    bt.mov r4, r22
    bg.jal 0x22701c
    bn.j loc_228165
loc_22894e:
    bn.sub r7, r6, r19
    bn.exthz r5, r7
    bn.lwz r23, 0x18(r1)
    bg.ble r6, r23, loc_22822e
    bn.lwz r5, 0x18(r1)
    bn.sub r7, r5, r19
    bn.exthz r5, r7
    bn.j loc_22822e
loc_228967:
    bn.sub r7, r19, r15
    bn.exthz r6, r7
    bg.ble r19, r5, loc_2281f3
    bn.lwz r23, 0x18(r1)
    bn.sub r7, r23, r15
    bn.exthz r6, r7
    bn.j loc_2281f3
loc_22897d:
    bt.movi r7, 0x1
    bn.sll r7, r7, r22
    bn.exths r12, r7
    bn.exthz r7, r7
    bn.sw 0x2c(r1), r7
    bt.mov r21, r22
    bt.movi r7, 0x3
    bn.sw 0x4(r1), r7
    bn.sw 0x38(r1), r7
    bt.movi r17, 0x8
    bn.sw 0x30(r1), r17
    bn.j loc_2280a9
loc_22899d:
    bg.jal 0x2402c4
    bn.sw 0x14(r1), r3
    bg.bnei r18, 0x4, loc_22874d
    bn.j loc_2280b2
loc_2289ab:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r4, r3
    bn.j loc_228499
loc_2289b8:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r4, r3
    bn.j loc_2284dc
loc_2289c5:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bn.j loc_228455
loc_2289d0:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r4, r3
    bn.j loc_228477
loc_2289dd:
    bt.mov r3, r22
    bn.lwz r4, 0x14(r1)
    bg.jal 0x222bde
    bt.mov r3, r20
    bn.lwz r26, 0xc(r1)
    bn.exthz r4, r26
    bn.lwz r5, 0x34(r1)
    bn.lwz r6, 0x2c(r1)
    bn.lwz r7, 0x30(r1)
    bn.j loc_22866e
loc_2289fa:
    bt.mov r3, r22
    bt.mov r4, r18
    bg.jal 0x222bde
    bt.mov r3, r20
    bn.lwz r4, 0x34(r1)
    bn.lwz r5, 0x2c(r1)
    bn.lwz r7, 0xc(r1)
    bn.exthz r6, r7
    bn.lwz r7, 0x30(r1)
    bn.j loc_22866e
