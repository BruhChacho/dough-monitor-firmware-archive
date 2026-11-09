# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2247fb,0x224dac); byte-exact only; hardware untested.
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
    bt.mov r14, r3
    bt.mov r15, r4
    bn.ori r7, r0, 0xa8
    bn.muls r7, r3, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r7, r4
    bg.lhz r19, 0x92(r7)
    bg.lwz r13, 0x8c(r7)
    bg.lhz r18, 0x90(r7)
    bg.lwz r12, 0x88(r7)
    bn.lh r21, 0x10(r7)
    bn.lh r20, 0x14(r7)
    bn.lh r5, 0x12(r7)
    bn.sw 0x4(r1), r5
    bn.lh r22, 0x16(r7)
    bn.lh r6, 0x18(r7)
    bn.sw 0x8(r1), r6
    bn.lh r25, 0x1c(r7)
    bn.sw 0xc(r1), r25
    bn.lh r10, 0x2a(r7)
    bg.beqi r10, 0x0, loc_224aae
    bt.mov r3, r10
    bg.jal 0x2402c4
    bt.mov r11, r3
    bt.mov r16, r3
    bt.movi r7, 0x1
    bn.sll r7, r7, r3
    bn.sub r7, r10, r7
    bn.exthz r7, r7
    bg.bnei r7, 0x0, loc_224af1
    bg.jal 0x222c8d
    bt.movi r10, 0x4
loc_22488d:
    bg.beqi r15, 0x0, loc_224abc
loc_224891:
    bn.ori r7, r0, 0xa8
    bn.muls r6, r14, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r6, r7
    bn.lbz r25, 0x38(r6)
    bg.bnei r25, 0x0, loc_224aeb
    bn.lbz r7, 0x29(r6)
    bt.addi r7, -0x1
    bn.extbz r7, r7
    bg.bleui r7, 0x1, loc_224aeb
    bn.add r26, r18, r12
    bn.lh r5, 0x10(r6)
    bn.sub r29, r12, r5
    bt.mov r23, r26
    bg.bgts r5, r12, loc_224b69
loc_2248c3:
    bn.add r27, r19, r13
    bn.ori r7, r0, 0xa8
    bn.muls r7, r14, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r7, r4
    bn.lh r4, 0x12(r7)
    bn.sub r28, r13, r4
    bt.mov r6, r27
    bg.bgts r4, r13, loc_224b50
    bn.add r24, r21, r20
    bg.bgts r23, r24, loc_224b3f
loc_2248e9:
    bn.lwz r25, 0x4(r1)
    bt.add r25, r22
    bg.bgts r6, r25, loc_224b33
loc_2248f2:
    bg.beqi r10, 0x4, loc_224b7c
loc_2248f6:
    bn.ori r7, r0, 0xa8
    bn.muls r6, r14, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r6, r7
    bg.lwz r7, 0x88(r6)
    bt.movi r23, 0x0
    bg.bles r5, r7, loc_224923
    bn.sub r7, r5, r7
    bn.lh r5, 0x1c(r6)
    bn.muls r7, r7, r5
    bg.lhz r6, 0x90(r6)
    bn.divs r7, r7, r6
    bn.exthz r23, r7
loc_224923:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r11, r7
    bg.movhi r30, 0x48
    bg.addi r6, r30, -0x564
    bt.add r7, r6
    bn.sh_1 0x68(r7), r23
    bn.ori r7, r0, 0xa8
    bn.muls r6, r14, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r6, r7
    bg.lwz r7, 0x8c(r6)
    bt.movi r5, 0x0
    bg.bles r4, r7, loc_224963
    bn.sub r7, r4, r7
    bn.lh r4, 0x1e(r6)
    bn.muls r7, r7, r4
    bg.lhz r6, 0x92(r6)
    bn.divs r7, r7, r6
    bn.exthz r5, r7
loc_224963:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r11, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.sh_1 0x6c(r7), r5
    bt.movi r6, 0x0
    bg.bles r27, r25, loc_2249a4
    bn.ori r6, r0, 0xa8
    bn.muls r6, r14, r6
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r6, r7
    bg.lhz r5, 0x92(r6)
    bn.sub r7, r27, r25
    bn.lh r6, 0x1e(r6)
    bn.muls r7, r7, r6
    bn.srli r6, r5, 0x1
    bt.add r7, r6
    bn.divs r7, r7, r5
    bn.exthz r6, r7
loc_2249a4:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r11, r7
    bg.movhi r25, 0x48
    bg.addi r25, r25, -0x564
    bt.add r7, r25
    bn.sh_2 0x6e(r7), r6
    bt.movi r23, 0x0
    bg.bles r26, r24, loc_2249e5
    bn.ori r6, r0, 0xa8
    bn.muls r6, r14, r6
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r6, r4
    bg.lhz r5, 0x90(r6)
    bn.sub r7, r26, r24
    bn.lh r6, 0x1c(r6)
    bn.muls r7, r7, r6
    bn.srli r6, r5, 0x1
    bt.add r7, r6
    bn.divs r7, r7, r5
    bn.exthz r23, r7
loc_2249e5:
    bn.ori r7, r0, 0x7c
    bn.muls r6, r10, r7
    bg.addi r5, r30, -0x564
    bn.add r4, r6, r5
    bn.sh_2 0x6a(r4), r23
    bn.muls r7, r11, r7
    bn.add r23, r7, r5
    bn.lh r7, 0x6c(r23)
    bn.sh_1 0x6c(r4), r7
    bn.lh r7, 0x6e(r23)
    bn.sh_2 0x6e(r4), r7
    bn.lh r7, 0x68(r23)
    bn.sh_2 0x62(r4), r7
    bt.mov r24, r7
    bn.ori r7, r0, 0xa8
    bn.muls r7, r14, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lh r6, 0x18(r7)
    bg.ori r7, r0, 0x780
    bn.sub r5, r7, r6
    bg.bles r24, r5, loc_224cae
    bn.add r7, r24, r6
    bg.addi r7, r7, -0x780
    bn.sh_1 0x68(r4), r7
    bn.sh_1 0x68(r23), r5
    bt.movi r25, 0x1
    bt.movi r27, 0x0
loc_224a3e:
    bn.ori r7, r0, 0xa8
    bn.muls r3, r14, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r3, r4
    bn.lh r24, 0x14(r3)
    bn.ori r26, r0, 0x7c
    bn.muls r6, r11, r26
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r6, r5
    bn.lh r5, 0x40(r6)
    bn.muls r7, r5, r29
    bn.divs r7, r7, r24
    bn.sh_1 0x44(r6), r7
    bn.lh r23, 0x16(r3)
    bn.lh r4, 0x42(r6)
    bn.muls r7, r28, r4
    bn.divs r7, r7, r23
    bn.sh_2 0x46(r6), r7
    bg.bnei r25, 0x0, loc_224c4a
    bg.beqi r27, 0x0, loc_224cef
    bn.muls r7, r5, r18
    bn.divs r7, r7, r24
    bn.exthz r3, r7
loc_224a8d:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r11, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bn.sh_1 0x48(r7), r3
    bn.lh r7, 0x4a(r7)
    bn.muls r7, r19, r7
    bn.divs r7, r7, r23
    bn.exthz r4, r7
    bt.j loc_224c4f
loc_224aae:
    bt.movi r3, 0x4
    bg.jal 0x222c8d
    bt.movi r11, 0x4
loc_224ab6:
    bt.movi r10, 0x4
    bg.bnei r15, 0x0, loc_224891
loc_224abc:
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
    bt.jr r9
loc_224aeb:
    bg.sbz 0x84(r6), r0
    bt.j loc_224abc
loc_224af1:
    bt.mov r3, r7
    bg.jal 0x2402c4
    bt.mov r10, r3
    bt.mov r17, r3
    bt.mov r3, r11
    bg.jal 0x222c8d
    bg.beqi r10, 0x4, loc_224ab6
    bt.mov r3, r10
    bg.jal 0x222c8d
    bn.andi r7, r11, 0x2
    bg.bnei r7, 0x0, loc_224ce5
    bt.mov r16, r10
loc_224b14:
    bn.ori r7, r0, 0x7c
    bn.muls r6, r16, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r6, r4
    bn.lh r5, 0x44(r6)
    bg.beqi r5, 0x0, loc_22488d
    bt.movi r7, 0x1
    bn.sbz 0x60(r6), r7
    bn.j loc_22488d
loc_224b33:
    bn.sub r7, r25, r13
    bn.exthz r19, r7
    bg.bnei r10, 0x4, loc_2248f6
    bt.j loc_224b7c
loc_224b3f:
    bn.sub r7, r24, r12
    bn.exthz r18, r7
    bn.lwz r25, 0x4(r1)
    bt.add r25, r22
    bg.bles r6, r25, loc_2248f2
    bt.j loc_224b33
loc_224b50:
    bn.sub r7, r4, r13
    bn.sub r7, r19, r7
    bn.exthz r19, r7
    bn.add r6, r4, r19
    bt.mov r13, r4
    bt.movi r28, 0x0
    bn.add r24, r21, r20
    bg.bles r23, r24, loc_2248e9
    bt.j loc_224b3f
loc_224b69:
    bn.sub r7, r5, r12
    bn.sub r7, r18, r7
    bn.exthz r18, r7
    bn.add r23, r5, r18
    bt.mov r12, r5
    bt.movi r29, 0x0
    bn.j loc_2248c3
loc_224b7c:
    bn.ori r7, r0, 0xa8
    bn.muls r6, r14, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r6, r7
    bg.lwz r7, 0x88(r6)
    bt.movi r23, 0x0
    bg.bgts r5, r7, loc_224d8f
loc_224b96:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r11, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.sh_1 0x68(r7), r23
    bt.movi r6, 0x0
    bg.bgts r26, r24, loc_224d65
loc_224baf:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r11, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.sh_2 0x6a(r7), r6
    bn.ori r7, r0, 0xa8
    bn.muls r6, r14, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r6, r7
    bg.lwz r7, 0x8c(r6)
    bt.movi r5, 0x0
    bg.bgts r4, r7, loc_224d50
loc_224bdc:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r11, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.sh_1 0x6c(r7), r5
    bt.movi r7, 0x0
    bg.bgts r27, r25, loc_224d26
loc_224bf5:
    bn.ori r5, r0, 0x7c
    bn.muls r5, r11, r5
    bg.movhi r25, 0x48
    bg.addi r25, r25, -0x564
    bt.add r5, r25
    bn.sh_2 0x6e(r5), r7
    bn.ori r6, r0, 0xa8
    bn.muls r6, r14, r6
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r6, r4
    bn.lh r24, 0x14(r6)
    bn.lh r4, 0x40(r5)
    bn.muls r7, r4, r29
    bn.divs r7, r7, r24
    bn.sh_1 0x44(r5), r7
    bn.lh r23, 0x16(r6)
    bn.lh r6, 0x42(r5)
    bn.muls r7, r28, r6
    bn.divs r7, r7, r23
    bn.sh_2 0x46(r5), r7
    bn.muls r4, r4, r18
    bn.divs r4, r4, r24
    bn.sh_1 0x48(r5), r4
    bn.muls r6, r6, r19
    bn.divs r6, r6, r23
    bn.sh_2 0x4a(r5), r6
    bt.j loc_224abc
loc_224c4a:
    bn.sh_1 0x48(r6), r0
    bt.movi r4, 0x0
loc_224c4f:
    bn.ori r7, r0, 0x7c
    bn.muls r6, r11, r7
    bg.addi r5, r30, -0x564
    bt.add r6, r5
    bn.sh_2 0x4a(r6), r4
    bn.muls r7, r10, r7
    bt.add r5, r7
    bn.lh r4, 0x48(r6)
    bn.lh r7, 0x44(r6)
    bt.add r7, r4
    bn.sh_1 0x44(r5), r7
    bn.lh r7, 0x46(r6)
    bn.sh_2 0x46(r5), r7
    bn.bnei r27, 0x0, loc_224cde
    bn.lh r6, 0x40(r5)
    bn.muls r7, r18, r6
    bn.divs r7, r7, r24
    bn.sub r7, r7, r4
    bn.sh_1 0x48(r5), r7
    bn.lh r5, 0x4a(r5)
    bn.muls r7, r19, r5
    bn.divs r7, r7, r23
    bn.exthz r4, r7
loc_224c92:
    bn.ori r7, r0, 0x7c
    bn.muls r6, r10, r7
    bg.addi r5, r30, -0x564
    bt.add r6, r5
    bn.sh_2 0x4a(r6), r4
    bn.muls r7, r11, r7
    bt.add r7, r5
    bn.lh r7, 0x44(r7)
    bn.sh_1 0x64(r6), r7
    bt.j loc_224abc
loc_224cae:
    bn.lwz r6, 0x8(r1)
    bn.lwz r7, 0xc(r1)
    bt.add r6, r7
    bn.lh r5, 0x6a(r4)
    bg.addi r7, r6, -0x780
    bt.movi r25, 0x0
    bt.movi r27, 0x0
    bg.bles r5, r7, loc_224a3e
    bn.exthz r6, r6
    bn.sub r7, r5, r6
    bg.addi r7, r7, 0x780
    bn.sh_2 0x6a(r23), r7
    bg.addi r6, r6, -0x780
    bn.sh_2 0x6a(r4), r6
    bt.movi r27, 0x1
    bn.j loc_224a3e
loc_224cde:
    bn.sh_1 0x48(r5), r0
    bt.movi r4, 0x0
    bt.j loc_224c92
loc_224ce5:
    bg.beqi r11, 0x4, loc_224da5
    bt.mov r10, r11
    bt.mov r11, r17
    bt.j loc_224b14
loc_224cef:
    bn.lh r4, 0x68(r6)
    bn.lh r6, 0x50(r6)
    bn.sub r6, r6, r4
    bn.muls r5, r10, r26
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r5, r7
    bn.lh r25, 0x40(r5)
    bn.muls r7, r18, r25
    bn.divs r7, r7, r24
    bn.muls r6, r6, r7
    bn.lh r7, 0x1c(r3)
    bn.sub r7, r7, r4
    bn.lh r5, 0x6a(r5)
    bn.sub r7, r7, r5
    bn.divs r6, r6, r7
    bn.exthz r3, r6
    bn.j loc_224a8d
loc_224d26:
    bn.ori r6, r0, 0xa8
    bn.muls r6, r14, r6
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r6, r7
    bg.lhz r5, 0x92(r6)
    bn.sub r7, r27, r25
    bn.lh r6, 0x1e(r6)
    bn.muls r7, r7, r6
    bn.srli r6, r5, 0x1
    bt.add r7, r6
    bn.divs r7, r7, r5
    bn.exthz r7, r7
    bt.j loc_224bf5
loc_224d50:
    bn.sub r7, r4, r7
    bn.lh r4, 0x1e(r6)
    bn.muls r7, r7, r4
    bg.lhz r6, 0x92(r6)
    bn.divs r7, r7, r6
    bn.exthz r5, r7
    bt.j loc_224bdc
loc_224d65:
    bn.ori r6, r0, 0xa8
    bn.muls r6, r14, r6
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r6, r7
    bg.lhz r5, 0x90(r6)
    bn.sub r7, r26, r24
    bn.lh r6, 0x1c(r6)
    bn.muls r7, r7, r6
    bn.srli r6, r5, 0x1
    bt.add r7, r6
    bn.divs r7, r7, r5
    bn.exthz r6, r7
    bt.j loc_224baf
loc_224d8f:
    bn.sub r7, r5, r7
    bn.lh r5, 0x1c(r6)
    bn.muls r7, r7, r5
    bg.lhz r6, 0x90(r6)
    bn.divs r7, r7, r6
    bn.exthz r23, r7
    bn.j loc_224b96
loc_224da5:
    bt.movi r10, 0x4
    bt.mov r11, r17
    bn.j loc_22488d
