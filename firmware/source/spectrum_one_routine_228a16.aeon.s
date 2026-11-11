# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x228a16,0x229450); byte-exact only; hardware untested.
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
    bn.lh r4, 0x38(r1)
    bn.sw 0x1c(r1), r4
    bn.lh r5, 0x3c(r1)
    bn.sw 0x20(r1), r5
    bg.jal 0x2227ef
    bt.mov r17, r3
    bn.lwz r6, 0x20(r1)
    bn.srli r7, r6, 0x1
    bn.lwz r23, 0x1c(r1)
    bt.add r7, r23
    bn.exthz r20, r7
    bn.ori r6, r0, 0xa8
    bn.muls r6, r3, r6
    bg.movhi r24, 0x48
    bg.addi r24, r24, 0x21ec
    bt.add r6, r24
    bn.lh r14, 0x10(r6)
    bn.lh r25, 0x14(r6)
    bn.add r7, r14, r25
    bn.exthz r7, r7
    bn.sw 0x10(r1), r7
    bn.lbz r4, 0x28(r6)
    bn.sw 0x14(r1), r4
    bt.movi r7, 0x4
    bn.lwz r5, 0x0(r1)
    bn.xor r7, r5, r7
    bn.ff1 r7, r7
    bt.addi r7, -0x1
    bn.srli r7, r7, 0x1f
    bn.sw 0x18(r1), r7
    bn.lh r7, 0x2a(r6)
    bn.sw 0x4(r1), r7
    bn.lh r15, 0x2c(r6)
    bn.xor r6, r7, r15
    bn.andi r7, r15, 0xf
    bn.and r10, r6, r7
    bn.lwz r23, 0x18(r1)
    bg.bnei r23, 0x0, loc_228e7e
    bt.mov r18, r22
    bt.movi r7, 0x1
    bn.sll r6, r7, r22
    bn.exths r11, r6
    bt.mov r19, r5
    bn.sll r7, r7, r5
    bn.exths r21, r7
    bn.exthz r6, r6
    bn.sw 0x24(r1), r6
    bn.exthz r7, r7
    bn.sw 0x28(r1), r7
loc_228add:
    bg.bnei r10, 0x0, loc_228eb3
loc_228ae1:
    bt.mov r3, r22
    bg.jal 0x222aa2
    bt.mov r16, r3
    bt.movi r7, 0x1
    bn.sll r7, r7, r3
    bn.sw 0x2c(r1), r7
loc_228af1:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r17, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r7, r4
    bt.movi r5, 0x4
    bn.sw 0xc(r1), r5
    bn.lbz r7, 0x38(r7)
    bn.beqi r7, 0x0, loc_228b1a
    bg.bnei r10, 0x0, loc_2293d5
loc_228b10:
    bn.lwz r3, 0x0(r1)
    bg.jal 0x222aa2
    bn.sw 0xc(r1), r3
loc_228b1a:
    bn.ori r7, r0, 0xa8
    bn.muls r10, r17, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r10, r6
    bn.lh r7, 0x2c(r10)
    bn.or r6, r11, r7
    bn.ori r13, r0, 0x7c
    bn.muls r7, r18, r13
    bg.movhi r24, 0x48
    bg.addi r23, r24, -0x564
    bt.add r7, r23
    bn.sbz 0x10(r7), r17
    bt.movi r12, 0x3
    bn.sw 0x8(r7), r12
    bn.lbz r4, 0x29(r10)
    bn.sbz 0xe(r7), r4
    bg.lbz r5, 0xa5(r10)
    bn.sbz 0x70(r7), r5
    bn.or r6, r21, r6
    bn.muls r7, r19, r13
    bt.add r7, r23
    bn.sbz 0x10(r7), r17
    bn.sw 0x8(r7), r12
    bn.sbz 0xe(r7), r4
    bn.sbz 0x70(r7), r5
    bn.lwz r25, 0x2c(r1)
    bn.exths r25, r25
    bn.sw 0x8(r1), r25
    bn.or r6, r6, r25
    bn.sh_1 0x2c(r10), r6
    bn.muls r7, r16, r13
    bt.add r7, r23
    bn.sbz 0x10(r7), r17
    bn.sw 0x8(r7), r12
    bn.sbz 0xe(r7), r4
    bn.sbz 0x70(r7), r5
    bn.lwz r4, 0x4(r1)
    bn.or r11, r4, r15
    bn.sra r7, r11, r18
    bn.andi r7, r7, 0x1
    bg.beqi r7, 0x0, loc_22939c
    bn.sra r7, r11, r19
    bn.andi r7, r7, 0x1
    bg.beqi r7, 0x0, loc_2293af
loc_228ba3:
    bn.sra r7, r11, r16
    bn.andi r7, r7, 0x1
    bg.beqi r7, 0x0, loc_2293c3
loc_228bad:
    bt.mov r3, r22
    bg.jal 0x222b9f
    bn.lwz r3, 0x0(r1)
    bg.jal 0x222b9f
    bt.mov r3, r16
    bg.jal 0x222b9f
    bn.lbz r5, 0x38(r10)
    bn.beqi r5, 0x0, loc_228c04
    bt.movi r7, 0x1
    bn.lwz r6, 0xc(r1)
    bn.sll r7, r7, r6
    bn.lh r23, 0x2c(r10)
    bn.or r7, r7, r23
    bn.sh_1 0x2c(r10), r7
    bn.muls r7, r6, r13
    bg.movhi r24, 0x48
    bg.addi r24, r24, -0x564
    bt.add r7, r24
    bn.sbz 0x10(r7), r17
    bn.sw 0x8(r7), r12
    bn.lbz r6, 0x29(r10)
    bn.sbz 0xe(r7), r6
    bn.lwz r25, 0xc(r1)
    bn.sra r7, r11, r25
    bn.andi r7, r7, 0x1
    bg.beqi r7, 0x0, loc_2293e5
loc_228bfd:
    bn.lwz r3, 0xc(r1)
    bg.jal 0x222b9f
loc_228c04:
    bn.ori r7, r0, 0xa8
    bn.muls r6, r17, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r6, r4
    bn.lh r10, 0x14(r6)
    bn.lbz r5, 0x29(r6)
    bn.sw 0x30(r1), r5
    bt.mov r7, r5
    bt.addi r7, -0x1
    bn.extbz r11, r7
    bg.bleui r11, 0x1, loc_2293cf
    bn.lh r7, 0x1c(r6)
loc_228c2b:
    bg.bgts r10, r7, loc_228c33
    bg.bgt r20, r14, loc_2292e3
loc_228c33:
    bt.movi r23, 0x0
    bt.movi r28, 0x0
    bt.movi r26, 0x0
loc_228c39:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r18, r7
    bg.movhi r24, 0x48
    bg.addi r24, r24, -0x564
    bt.add r7, r24
    bn.sh_1 0x20(r7), r14
    bt.movi r4, 0x0
    bg.ble r20, r14, loc_228c5b
    bt.mov r4, r10
    bn.lwz r25, 0x10(r1)
    bg.ble r20, r25, loc_2292d7
loc_228c5b:
    bn.ori r6, r0, 0x7c
    bn.muls r7, r18, r6
    bg.movhi r24, 0x48
    bg.addi r5, r24, -0x564
    bt.add r7, r5
    bn.sh_1 0x24(r7), r4
    bn.lwz r25, 0x20(r1)
    bn.srli r7, r25, 0x2
    bn.lwz r4, 0x1c(r1)
    bt.add r7, r4
    bn.exthz r27, r7
    bn.sub r7, r27, r26
    bn.exthz r24, r7
    bn.muls r6, r16, r6
    bt.add r6, r5
    bn.sh_1 0x20(r6), r24
    bn.ori r5, r0, 0x40
    bn.sfnei r23, 0x0
    bn.cmov_0 r7, r5, r0
    bn.sh_1 0x24(r6), r7
    bg.bgt r20, r14, loc_228e63
    bn.add r7, r14, r4
    bn.sub r7, r7, r20
    bn.exthz r7, r7
loc_228ca3:
    bn.ori r6, r0, 0x7c
    bn.muls r23, r19, r6
    bg.movhi r25, 0x48
    bg.addi r5, r25, -0x564
    bt.add r23, r5
    bn.sh_1 0x20(r23), r7
    bn.muls r4, r18, r6
    bt.add r4, r5
    bn.lh r25, 0x24(r4)
    bn.sub r7, r10, r25
    bn.muls r6, r16, r6
    bt.add r6, r5
    bn.lh r5, 0x24(r6)
    bn.sub r7, r7, r5
    bn.sh_1 0x24(r23), r7
    bn.ori r7, r0, 0xa8
    bn.muls r7, r17, r7
    bg.movhi r25, 0x48
    bg.addi r25, r25, 0x21ec
    bt.add r7, r25
    bn.lh r25, 0x12(r7)
    bn.sh_2 0x22(r4), r25
    bn.sh_2 0x22(r6), r25
    bn.sh_2 0x22(r23), r25
    bt.movi r23, 0x0
    bn.lh r4, 0x24(r4)
    bn.beqi r4, 0x0, loc_228cf6
    bn.lh r23, 0x16(r7)
loc_228cf6:
    bn.ori r7, r0, 0x7c
    bn.muls r6, r18, r7
    bg.movhi r4, 0x48
    bg.addi r5, r4, -0x564
    bt.add r6, r5
    bn.sh_2 0x26(r6), r23
    bn.muls r7, r16, r7
    bt.add r7, r5
    bt.movi r4, 0x0
    bn.lh r7, 0x24(r7)
    bn.beqi r7, 0x0, loc_228d29
    bn.ori r7, r0, 0xa8
    bn.muls r7, r17, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lh r4, 0x16(r7)
loc_228d29:
    bn.ori r7, r0, 0x7c
    bn.muls r6, r16, r7
    bg.movhi r23, 0x48
    bg.addi r5, r23, -0x564
    bt.add r6, r5
    bn.sh_2 0x26(r6), r4
    bn.muls r7, r19, r7
    bt.add r7, r5
    bt.movi r6, 0x0
    bn.lh r7, 0x24(r7)
    bn.beqi r7, 0x0, loc_228d5c
    bn.ori r7, r0, 0xa8
    bn.muls r7, r17, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r7, r4
    bn.lh r6, 0x16(r7)
loc_228d5c:
    bn.ori r4, r0, 0x7c
    bn.muls r7, r19, r4
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.sh_2 0x26(r7), r6
    bn.ori r7, r0, 0xa8
    bn.muls r5, r17, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r5, r6
    bn.lbz r7, 0x38(r5)
    bn.sw 0x34(r1), r7
    bg.beqi r7, 0x0, loc_228e24
    bn.muls r7, r18, r4
    bg.movhi r23, 0x48
    bg.addi r23, r23, -0x564
    bt.add r7, r23
    bn.lh r6, 0x24(r7)
    bn.addi r6, r6, -0x40
    bn.sh_1 0x24(r7), r6
    bn.muls r6, r16, r4
    bt.add r6, r23
    bn.addi r7, r24, -0x40
    bn.sh_1 0x20(r6), r7
    bn.addi r7, r26, 0x40
    bn.exthz r7, r7
    bn.sh_1 0x24(r6), r7
    bt.movi r4, 0x0
    bg.bnei r7, 0x0, loc_2292d1
loc_228db9:
    bn.ori r6, r0, 0x7c
    bn.muls r24, r16, r6
    bg.movhi r5, 0x48
    bg.addi r23, r5, -0x564
    bt.add r24, r23
    bn.sh_2 0x26(r24), r4
    bn.lwz r7, 0xc(r1)
    bn.muls r4, r7, r6
    bt.add r4, r23
    bn.sh_1 0x20(r4), r27
    bn.ori r7, r0, 0x20
    bn.sh_1 0x24(r4), r7
    bn.muls r5, r19, r6
    bt.add r5, r23
    bn.lwz r7, 0x1c(r1)
    bn.addi r7, r7, 0x20
    bn.sh_1 0x20(r5), r7
    bn.muls r6, r18, r6
    bt.add r6, r23
    bn.lh r6, 0x24(r6)
    bn.sub r7, r10, r6
    bn.lh r24, 0x24(r24)
    bn.sub r7, r7, r24
    bn.addi r7, r7, -0x20
    bn.sh_1 0x24(r5), r7
    bn.sh_2 0x22(r4), r25
    bt.movi r6, 0x0
    bn.lh r4, 0x24(r4)
    bg.bnei r4, 0x0, loc_2292bb
loc_228e0e:
    bn.ori r7, r0, 0x7c
    bn.lwz r24, 0xc(r1)
    bn.muls r7, r24, r7
    bg.movhi r25, 0x48
    bg.addi r25, r25, -0x564
    bt.add r7, r25
    bn.sh_2 0x26(r7), r6
loc_228e24:
    bn.lwz r4, 0x18(r1)
    bg.beqi r4, 0x0, loc_228ed0
    bn.ori r7, r0, 0xa8
    bn.muls r5, r17, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r5, r6
    bn.lh r7, 0x18(r5)
    bg.sfleui r7, 0x77f
    bn.bnf loc_229292
    bn.ori r7, r0, 0x7c
    bn.muls r7, r18, r7
    bg.movhi r25, 0x48
    bg.addi r25, r25, -0x564
    bt.add r7, r25
    bn.lwz r6, 0x18(r5)
    bn.sw 0x4c(r7), r6
    bn.lwz r6, 0x1c(r5)
    bn.sw 0x50(r7), r6
    bt.j loc_228f23
loc_228e63:
    bn.sub r7, r5, r23
    bn.srai r6, r7, 0x1f
    bn.srli r6, r6, 0x1a
    bt.add r7, r6
    bn.andi r7, r7, 0x3f
    bn.sub r7, r7, r6
    bn.lwz r5, 0x1c(r1)
    bt.add r7, r5
    bn.exthz r7, r7
    bt.j loc_228ca3
loc_228e7e:
    bt.mov r18, r22
    bn.andi r7, r22, 0x2
    bg.beqi r7, 0x0, loc_229268
    bn.andi r7, r10, 0x2
    bn.beqi r7, 0x0, loc_228e93
    bn.addi r7, r10, -0x2
    bn.exthz r10, r7
loc_228e93:
    bt.movi r7, 0x1
    bn.sll r7, r7, r22
    bn.exths r21, r7
    bn.exthz r7, r7
    bn.sw 0x28(r1), r7
    bn.sw 0x0(r1), r22
    bt.mov r19, r22
    bt.movi r22, 0x1
    bt.movi r18, 0x1
    bt.movi r11, 0x2
    bn.sw 0x24(r1), r11
    bg.beqi r10, 0x0, loc_228ae1
loc_228eb3:
    bt.mov r3, r10
    bg.jal 0x2402c4
    bt.mov r16, r3
    bt.movi r7, 0x1
    bn.sll r7, r7, r3
    bn.sw 0x2c(r1), r7
    bn.sub r7, r10, r7
    bn.exthz r10, r7
    bg.bnei r3, 0x4, loc_228af1
    bn.j loc_228ae1
loc_228ed0:
    bn.ori r4, r0, 0xa8
    bn.muls r4, r17, r4
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r4, r5
    bn.lh r23, 0x18(r4)
    bn.ori r7, r0, 0x7c
    bn.muls r6, r18, r7
    bg.movhi r24, 0x48
    bg.addi r25, r24, -0x564
    bt.add r6, r25
    bn.sh_1 0x4c(r6), r23
    bn.lh r24, 0x1a(r4)
    bn.sh_2 0x4e(r6), r24
    bg.ori r5, r0, 0x780
    bn.sub r5, r5, r23
    bn.sh_1 0x50(r6), r5
    bn.lh r23, 0x1e(r4)
    bn.sh_2 0x52(r6), r23
    bn.muls r7, r19, r7
    bt.add r7, r25
    bn.sh_1 0x4c(r7), r0
    bn.sh_2 0x4e(r7), r24
    bn.lh r4, 0x1c(r4)
    bn.sub r5, r4, r5
    bn.sh_1 0x50(r7), r5
    bn.sh_2 0x52(r7), r23
loc_228f23:
    bn.ori r6, r0, 0x7c
    bn.muls r7, r18, r6
    bg.movhi r25, 0x48
    bg.addi r25, r25, -0x564
    bt.add r7, r25
    bt.mov r5, r22
    bn.lh r7, 0x24(r7)
    bn.bnei r7, 0x0, loc_228f4c
    bn.muls r7, r16, r6
    bt.add r7, r25
    bn.lh r7, 0x24(r7)
    bn.sfeqi r7, 0x0
    bn.lwz r6, 0x0(r1)
    bn.cmov_0 r5, r6, r16
loc_228f4c:
    bn.ori r4, r0, 0x7c
    bn.muls r7, r18, r4
    bg.movhi r23, 0x48
    bg.addi r6, r23, -0x564
    bt.add r7, r6
    bn.sbz 0x32(r7), r5
    bn.muls r7, r16, r4
    bt.add r7, r6
    bn.sbz 0x32(r7), r5
    bn.muls r7, r19, r4
    bt.add r7, r6
    bn.sbz 0x32(r7), r5
    bn.lwz r24, 0x34(r1)
    bn.beqi r24, 0x0, loc_228f80
    bn.lwz r25, 0xc(r1)
    bn.muls r7, r25, r4
    bt.add r7, r6
    bn.sbz 0x32(r7), r5
loc_228f80:
    bn.bnei r28, 0x0, loc_228fb7
    bg.bleui r11, 0x1, loc_229351
    bn.addi r4, r0, -0x80
    bn.and r5, r10, r4
    bn.ori r7, r0, 0xa8
    bn.muls r7, r17, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lh r23, 0x1c(r7)
    bg.ori r24, r0, 0xff80
    bn.and r7, r23, r24
    bn.exthz r6, r7
    bn.sfgtu r5, r6
    bn.cmov_0 r7, r7, r5
    bn.exthz r15, r7
    bt.mov r3, r15
    bt.j loc_228fbf
loc_228fb7:
    bg.bleui r11, 0x1, loc_229351
    bt.mov r15, r10
    bt.mov r3, r10
loc_228fbf:
    bg.jal 0x2ac120
    bt.mov r20, r3
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r21, r3
    bn.ori r12, r0, 0x7c
    bn.muls r11, r18, r12
    bg.movhi r25, 0x48
    bg.addi r25, r25, -0x564
    bt.add r11, r25
    bn.lh_0 r10, 0x24(r11)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bg.blesi r10, -0x1, loc_229428
loc_228fea:
    bt.mov r4, r20
    bg.jal 0x2abe2e
    bt.mov r4, r21
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.sh_1 0x38(r11), r3
    bn.muls r13, r16, r12
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r13, r4
    bn.lh_0 r10, 0x24(r13)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r4, r3
    bg.blesi r10, -0x1, loc_22941b
loc_229019:
    bt.mov r3, r20
    bg.jal 0x2abe2e
    bt.mov r4, r21
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.exthz r3, r3
    bn.sh_1 0x38(r13), r3
    bn.muls r14, r19, r12
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r14, r5
    bn.lh r6, 0x38(r11)
    bn.sub r7, r15, r6
    bn.sub r7, r7, r3
    bn.sh_1 0x38(r14), r7
    bn.sh_1 0x40(r11), r15
    bn.sh_1 0x40(r13), r15
    bn.sh_1 0x40(r14), r15
    bn.lh_0 r10, 0x50(r11)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r4, r3
    bg.blesi r10, -0x1, loc_22940e
loc_229060:
    bt.mov r3, r20
    bg.jal 0x2abe2e
    bt.mov r10, r3
    bn.ori r7, r0, 0xa8
    bn.muls r7, r17, r7
    bg.movhi r23, 0x48
    bg.addi r23, r23, 0x21ec
    bt.add r7, r23
    bn.lh r3, 0x1c(r7)
    bg.jal 0x2ac120
    bt.mov r4, r3
    bt.mov r3, r10
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.sh_1 0x48(r11), r3
    bn.sh_1 0x48(r13), r0
    bn.lh r24, 0x40(r11)
    bn.lh r25, 0x48(r11)
    bn.sub r7, r24, r25
    bn.sh_1 0x48(r14), r7
    bn.sh_1 0x34(r11), r0
    bn.lh r7, 0x38(r11)
    bn.sh_1 0x34(r13), r7
    bn.lh r4, 0x38(r13)
    bt.add r7, r4
    bn.sh_1 0x34(r14), r7
    bn.sh_1 0x44(r11), r0
    bn.sh_1 0x44(r13), r0
    bn.lh r7, 0x48(r11)
    bn.sh_1 0x44(r14), r7
    bn.lwz r5, 0x34(r1)
    bn.beqi r5, 0x0, loc_229126
    bn.lwz r6, 0xc(r1)
    bn.muls r12, r6, r12
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r12, r7
    bn.lh_0 r10, 0x24(r12)
    bt.mov r3, r10
    bg.jal 0x2ac120
    bt.mov r4, r3
    bg.blesi r10, -0x1, loc_229433
loc_2290df:
    bt.mov r3, r20
    bg.jal 0x2abe2e
    bt.mov r4, r21
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bn.exthz r3, r3
    bn.sh_1 0x38(r12), r3
    bn.lh r11, 0x38(r11)
    bn.sub r7, r15, r11
    bn.lh r23, 0x38(r13)
    bn.sub r7, r7, r23
    bn.sub r7, r7, r3
    bn.sh_1 0x38(r14), r7
    bn.sh_1 0x40(r12), r15
    bn.sh_1 0x48(r12), r0
    bn.lh r7, 0x34(r13)
    bn.lh r24, 0x38(r13)
    bt.add r7, r24
    bn.exthz r7, r7
    bn.sh_1 0x34(r12), r7
    bn.lh r25, 0x38(r12)
    bt.add r7, r25
    bn.sh_1 0x34(r14), r7
    bn.sh_1 0x44(r12), r0
loc_229126:
    bn.ori r7, r0, 0xa8
    bn.muls r11, r17, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r11, r4
    bn.lh r12, 0x16(r11)
    bn.lh r10, 0x1e(r11)
    bg.bgt r12, r10, loc_229326
loc_229140:
    bt.mov r10, r12
loc_229142:
    bn.ori r5, r0, 0x7c
    bn.muls r7, r18, r5
    bg.movhi r23, 0x48
    bg.addi r6, r23, -0x564
    bt.add r7, r6
    bn.sh_2 0x3a(r7), r10
    bn.sh_2 0x42(r7), r10
    bn.sh_2 0x4a(r7), r10
    bn.muls r7, r16, r5
    bt.add r7, r6
    bn.sh_2 0x3a(r7), r10
    bn.sh_2 0x42(r7), r10
    bn.sh_2 0x4a(r7), r10
    bn.muls r7, r19, r5
    bt.add r7, r6
    bn.sh_2 0x3a(r7), r10
    bn.sh_2 0x42(r7), r10
    bn.sh_2 0x4a(r7), r10
    bn.lwz r24, 0x34(r1)
    bn.beqi r24, 0x0, loc_2291e9
    bn.lwz r25, 0xc(r1)
    bn.muls r7, r25, r5
    bt.add r7, r6
    bn.sh_2 0x3a(r7), r10
    bn.sh_2 0x42(r7), r10
    bn.sh_2 0x4a(r7), r10
loc_22918e:
    bn.ori r5, r0, 0x7c
    bn.lwz r6, 0xc(r1)
    bn.muls r4, r6, r5
    bg.movhi r7, 0x48
    bg.addi r24, r7, -0x564
    bt.add r4, r24
    bn.lh r7, 0x20(r4)
    bn.addi r7, r7, -0x20
    bn.sh_1 0x20(r4), r7
    bn.sh_1 0x34(r4), r0
    bn.muls r23, r19, r5
    bt.add r23, r24
    bn.lh r7, 0x38(r4)
    bn.sh_1 0x34(r23), r7
    bn.muls r6, r18, r5
    bt.add r6, r24
    bn.lh r7, 0x40(r6)
    bn.srli r7, r7, 0x1
    bn.sh_1 0x40(r6), r7
    bn.muls r5, r16, r5
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
loc_2291e9:
    bn.lwz r23, 0x30(r1)
    bg.beqi r23, 0x3, loc_22935f
loc_2291f0:
    bg.beqi r23, 0x5, loc_22935f
loc_2291f4:
    bn.ori r7, r0, 0xb0
    bn.lwz r25, 0x14(r1)
    bn.muls r7, r25, r7
    bg.movhi r4, 0x3b
    bg.addi r4, r4, 0x4950
    bt.add r7, r4
    bn.lbz r5, 0x7c(r7)
    bg.beq r25, r5, loc_229381
    bn.lbz r7, 0x7d(r7)
    bg.beq r25, r7, loc_229381
    bt.mov r3, r22
    bn.lwz r4, 0x0(r1)
    bg.jal 0x222bde
    bt.movi r5, 0x1
    bn.lwz r6, 0xc(r1)
    bn.sll r5, r5, r6
    bn.lwz r7, 0x8(r1)
    bn.or r5, r7, r5
    bt.mov r3, r17
    bn.lwz r4, 0x28(r1)
    bn.exthz r5, r5
loc_229234:
    bn.lwz r6, 0x24(r1)
loc_229237:
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
    bg.j 0x2237bf
loc_229268:
    bn.andi r7, r10, 0x8
    bg.beqi r7, 0x0, loc_2293f1
    bn.addi r7, r10, -0x8
    bn.exthz r10, r7
    bt.movi r7, 0x1
    bn.sll r7, r7, r22
    bn.exths r11, r7
    bn.exthz r7, r7
    bn.sw 0x24(r1), r7
    bt.movi r25, 0x3
    bn.sw 0x0(r1), r25
    bt.movi r19, 0x3
    bt.movi r21, 0x8
    bn.sw 0x28(r1), r21
    bn.j loc_228add
loc_229292:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r19, r7
    bg.movhi r23, 0x48
    bg.addi r23, r23, -0x564
    bt.add r7, r23
    bn.lwz r6, 0x18(r5)
    bn.sw 0x4c(r7), r6
    bn.lwz r6, 0x1c(r5)
    bn.sw 0x50(r7), r6
    bn.lh r24, 0x4c(r7)
    bg.addi r6, r24, -0x780
    bn.sh_1 0x4c(r7), r6
    bn.j loc_228f23
loc_2292bb:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r17, r7
    bg.movhi r23, 0x48
    bg.addi r23, r23, 0x21ec
    bt.add r7, r23
    bn.lh r6, 0x16(r7)
    bn.j loc_228e0e
loc_2292d1:
    bn.lh r4, 0x16(r5)
    bn.j loc_228db9
loc_2292d7:
    bn.sub r7, r20, r14
    bn.sub r7, r7, r26
    bn.exthz r4, r7
    bn.j loc_228c5b
loc_2292e3:
    bn.lwz r6, 0x10(r1)
    bg.bgt r20, r6, loc_228c33
    bn.lwz r7, 0x30(r1)
    bg.beqi r7, 0x3, loc_228c33
    bg.beqi r7, 0x5, loc_228c33
    bn.ori r7, r0, 0xa8
    bn.muls r7, r17, r7
    bg.movhi r23, 0x48
    bg.addi r23, r23, 0x21ec
    bt.add r7, r23
    bg.lbz r7, 0x97(r7)
    bg.bnei r7, 0x0, loc_229440
loc_22930d:
    bn.sub r7, r20, r14
    bn.srai r6, r7, 0x1f
    bn.srli r6, r6, 0x1a
    bt.add r7, r6
    bn.andi r7, r7, 0x3f
    bn.sub r23, r7, r6
    bn.exthz r26, r23
    bt.movi r28, 0x1
    bn.j loc_228c39
loc_229326:
    bt.mov r3, r17
    bg.jal 0x2227da
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r3, r5
    bn.lbz r7, 0x20(r3)
    bn.andi r7, r7, 0x10
    bg.beqi r7, 0x0, loc_229142
    bg.lbz r11, 0xa4(r11)
    bg.bnei r11, 0x0, loc_229142
    bn.j loc_229140
loc_229351:
    bn.lwz r4, 0x34(r1)
    bg.bnei r4, 0x0, loc_22918e
    bn.lwz r23, 0x30(r1)
    bg.bnei r23, 0x3, loc_2291f0
loc_22935f:
    bt.mov r3, r17
    bt.movi r4, 0x0
    bg.jal 0x2262ce
    bg.beqi r3, 0x0, loc_2291f4
    bt.mov r3, r22
    bn.lwz r4, 0x0(r1)
    bg.jal 0x222bde
    bt.mov r3, r17
    bn.lwz r4, 0x28(r1)
    bn.lwz r24, 0x2c(r1)
    bn.exthz r5, r24
    bt.j loc_229234
loc_229381:
    bt.movi r5, 0x1
    bn.lwz r23, 0xc(r1)
    bn.sll r5, r5, r23
    bn.lwz r24, 0x8(r1)
    bn.or r5, r24, r5
    bt.mov r3, r17
    bn.lwz r4, 0x24(r1)
    bn.exthz r5, r5
    bn.lwz r6, 0x28(r1)
    bt.j loc_229237
loc_22939c:
    bn.lwz r3, 0x14(r1)
    bt.mov r4, r22
    bg.jal 0x22701c
    bn.sra r7, r11, r19
    bn.andi r7, r7, 0x1
    bg.bnei r7, 0x0, loc_228ba3
loc_2293af:
    bn.lwz r3, 0x14(r1)
    bn.lwz r4, 0x0(r1)
    bg.jal 0x22701c
    bn.sra r7, r11, r16
    bn.andi r7, r7, 0x1
    bg.bnei r7, 0x0, loc_228bad
loc_2293c3:
    bn.lwz r3, 0x14(r1)
    bt.mov r4, r16
    bg.jal 0x22701c
    bn.j loc_228bad
loc_2293cf:
    bn.lh r7, 0x1e(r6)
    bn.j loc_228c2b
loc_2293d5:
    bt.mov r3, r10
    bg.jal 0x2402c4
    bn.sw 0xc(r1), r3
    bg.bnei r3, 0x4, loc_228b1a
    bn.j loc_228b10
loc_2293e5:
    bn.lwz r3, 0x14(r1)
    bt.mov r4, r25
    bg.jal 0x22701c
    bn.j loc_228bfd
loc_2293f1:
    bt.movi r7, 0x1
    bn.sll r7, r7, r22
    bn.exths r11, r7
    bn.exthz r7, r7
    bn.sw 0x24(r1), r7
    bt.movi r24, 0x3
    bn.sw 0x0(r1), r24
    bt.movi r19, 0x3
    bt.movi r21, 0x8
    bn.sw 0x28(r1), r21
    bn.j loc_228add
loc_22940e:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r4, r3
    bn.j loc_229060
loc_22941b:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r4, r3
    bn.j loc_229019
loc_229428:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bn.j loc_228fea
loc_229433:
    bg.movhi r4, 0x4780
    bg.jal 0x2abd99
    bt.mov r4, r3
    bn.j loc_2290df
loc_229440:
    bt.mov r3, r17
    bn.lwz r4, 0x14(r1)
    bg.jal 0x222ea6
    bg.beqi r3, 0x0, loc_22930d
    bn.j loc_228c33
