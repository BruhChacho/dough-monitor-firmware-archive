# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x225416,0x225aa2); byte-exact only; hardware untested.
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
    bt.mov r13, r3
    bt.mov r19, r4
    bn.ori r10, r0, 0x18
    bn.muls r10, r3, r10
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x5c4
    bt.add r10, r5
    bn.lbz r6, 0x1(r10)
    bn.sw 0x4(r1), r6
    bn.lbz r7, 0x15(r10)
    bn.sw 0x8(r1), r7
    bn.lbz r11, 0x10(r10)
    bn.lbz r5, 0x11(r10)
    bn.sw 0xc(r1), r5
    bn.lh r20, 0xc(r10)
    bn.lh r18, 0xe(r10)
    bt.mov r3, r20
    bg.jal 0x2402c4
    bn.lwz r21, 0x8(r10)
    bn.lwz r22, 0x4(r10)
    bn.ori r10, r0, 0xb0
    bn.muls r11, r11, r10
    bg.movhi r12, 0x3b
    bg.addi r12, r12, 0x4950
    bt.add r11, r12
    bn.lbz r14, 0x0(r11)
    bn.lwz r6, 0xc(r1)
    bn.muls r7, r6, r10
    bt.add r7, r12
    bn.lbz r11, 0x0(r7)
    bg.jal 0x2227ef
    bn.sw 0x0(r1), r3
    bn.ori r7, r0, 0x16
    bn.muls r7, r19, r7
    bt.add r7, r3
    bn.slli r7, r7, 0x3
    bt.add r7, r12
    bn.lh r7, 0x52(r7)
    bn.sw 0x10(r1), r7
    bn.muls r10, r19, r10
    bt.add r10, r12
    bg.lbz r10, 0x89(r10)
    bn.sw 0x14(r1), r10
    bn.slli r12, r13, 0x8
    bt.movhi r7, -0xd
    bg.ori r7, r7, 0x1406
    bn.add r15, r12, r7
    bt.mov r3, r15
    bn.ori r4, r0, 0x40
    bn.ori r5, r0, 0x40
    bg.jal 0x23dfe1
    bt.movhi r5, -0xd
    bg.ori r5, r5, 0x1408
    bn.add r16, r12, r5
    bt.mov r3, r16
    bt.movi r4, 0x8
    bt.movi r5, 0x8
    bg.jal 0x23dfe1
    bn.slli r17, r13, 0x1
    bt.mov r4, r14
    bg.bgtui r14, 0x7, loc_225500
    bn.addi r7, r14, 0x3
    bn.extbz r4, r7
    bg.bgtui r14, 0x4, loc_22587f
loc_225500:
    bt.movhi r6, -0x10
    bg.ori r6, r6, 0x2e06
    bn.add r3, r17, r6
    bg.jal 0x23ddb9
    bt.mov r4, r11
    bg.bgtui r11, 0x7, loc_22551d
    bn.addi r7, r11, 0x3
    bn.extbz r4, r7
    bg.bgtui r11, 0x4, loc_225876
loc_22551d:
    bt.movhi r7, -0x10
    bg.ori r7, r7, 0x2e07
    bn.add r3, r17, r7
    bg.jal 0x23ddb9
    bn.slli r7, r14, 0x2
    bn.extbz r4, r7
    bg.bgtui r14, 0x7, loc_225541
    bg.bleui r14, 0x4, loc_22586a
    bn.addi r7, r14, -0x5
    bn.slli r7, r7, 0x2
    bn.extbz r4, r7
loc_225541:
    bt.movhi r5, -0x10
    bg.ori r5, r5, 0x1f85
    bn.add r3, r17, r5
    bn.ori r5, r0, 0x3c
    bg.jal 0x23dfe1
    bn.slli r7, r11, 0x2
    bn.extbz r4, r7
    bg.bgtui r11, 0x7, loc_225568
    bg.bleui r11, 0x4, loc_22585e
    bn.addi r7, r11, -0x5
    bn.slli r7, r7, 0x2
    bn.extbz r4, r7
loc_225568:
    bt.movhi r6, -0x10
    bg.ori r6, r6, 0x1f86
    bn.add r3, r17, r6
    bn.ori r5, r0, 0x3c
    bg.jal 0x23dfe1
    bg.bgtui r14, 0x7, loc_22558f
    bg.bleui r14, 0x4, loc_22558c
loc_225580:
    bt.mov r3, r16
    bt.movi r4, 0x0
    bt.movi r5, 0x4
    bg.jal 0x23dfe1
    bt.j loc_225599
loc_22558c:
    bn.blesi r14, 0x0, loc_225580
loc_22558f:
    bt.mov r3, r16
    bt.movi r4, 0x4
    bt.movi r5, 0x4
    bg.jal 0x23dfe1
loc_225599:
    bt.mov r3, r15
    bn.extbz r4, r21
    bt.movi r5, 0x7
    bg.jal 0x23dfe1
    bn.lwz r7, 0x4(r1)
    bn.slli r4, r7, 0x3
    bt.mov r3, r15
    bn.andi r4, r4, 0xf8
    bt.movi r5, 0x8
    bg.jal 0x23dfe1
    bt.movhi r5, -0xd
    bg.ori r5, r5, 0x1407
    bn.add r10, r12, r5
    bt.mov r3, r10
    bn.lwz r4, 0x8(r1)
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bn.lwz r6, 0xc(r1)
    bg.beqi r6, 0x6, loc_225888
loc_2255d0:
    bt.mov r3, r15
    bn.ori r4, r0, 0x80
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bt.mov r3, r10
    bt.movi r4, 0x2
    bt.movi r5, 0x2
    bg.jal 0x23dfe1
loc_2255e6:
    bn.slli r4, r22, 0x7
    bt.mov r3, r16
    bg.ori r7, r0, 0xff80
    bn.and r4, r4, r7
    bg.ori r5, r0, 0x180
    bg.jal 0x23e152
    bn.ori r7, r0, 0xb0
    bn.muls r7, r19, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r7, r5
    bn.lbz r7, 0x20(r7)
    bn.andi r7, r7, 0x10
    bg.beqi r7, 0x0, loc_22572c
    bt.movhi r6, -0xd
    bg.ori r6, r6, 0x141e
    bn.add r3, r12, r6
    bn.lwz r7, 0x10(r1)
    bn.srli r4, r7, 0x1
    bg.jal 0x23dfb6
    bn.lwz r6, 0x14(r1)
    bg.beqi r6, 0x4, loc_225743
loc_22562e:
    bn.ori r7, r0, 0x16
    bn.muls r7, r19, r7
    bn.lwz r5, 0x0(r1)
    bt.add r7, r5
    bn.slli r7, r7, 0x3
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bn.lh r7, 0x50(r7)
    bn.lwz r5, 0x14(r1)
    bn.divs r10, r7, r5
loc_22564f:
    bt.movhi r6, -0xd
    bg.ori r6, r6, 0x1410
    bn.add r15, r12, r6
    bt.mov r3, r15
    bt.mov r4, r10
    bg.jal 0x23dfb6
    bg.beqi r18, 0x0, loc_225708
    bt.movhi r7, -0xd
    bg.ori r7, r7, 0x1414
    bn.add r11, r12, r7
    bn.srli r4, r22, 0x1
    bn.slli r4, r4, 0x3
    bt.addi r4, 0x8
    bt.add r4, r10
    bt.mov r3, r11
    bn.exthz r4, r4
    bg.jal 0x23dfb6
    bt.movhi r5, -0xd
    bg.ori r5, r5, 0x1416
    bn.add r13, r12, r5
    bt.mov r3, r13
    bt.movi r4, 0x8
    bg.jal 0x23dfb6
loc_225691:
    bg.bgtui r14, 0x7, loc_22569d
    bg.bleui r14, 0x4, loc_2257da
loc_225699:
    bg.beqi r21, 0x1, loc_22590b
loc_22569d:
    bn.andi r7, r20, 0x1
    bg.bnei r7, 0x0, loc_2257e5
loc_2256a4:
    bn.andi r7, r20, 0x2
    bg.bnei r7, 0x0, loc_22580f
loc_2256ab:
    bn.andi r7, r20, 0x4
    bg.bnei r7, 0x0, loc_225839
loc_2256b2:
    bn.andi r7, r20, 0x8
    bg.bnei r7, 0x0, loc_2257b5
loc_2256b9:
    bg.beq r20, r18, loc_2256d9
    bn.andi r7, r18, 0x1
    bg.bnei r7, 0x0, loc_2258e5
loc_2256c4:
    bn.andi r7, r18, 0x2
    bg.bnei r7, 0x0, loc_2258bf
loc_2256cb:
    bn.andi r7, r18, 0x4
    bg.bnei r7, 0x0, loc_22589a
loc_2256d2:
    bn.andi r7, r18, 0x8
    bg.bnei r7, 0x0, loc_225765
loc_2256d9:
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
    bt.jr r9
loc_225708:
    bt.movhi r6, -0xd
    bg.ori r6, r6, 0x1414
    bn.add r11, r12, r6
    bt.mov r3, r11
    bt.mov r4, r10
    bg.jal 0x23dfb6
    bt.movhi r7, -0xd
    bg.ori r7, r7, 0x1416
    bn.add r13, r12, r7
    bt.mov r3, r13
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bt.j loc_225691
loc_22572c:
    bt.movhi r5, -0xd
    bg.ori r5, r5, 0x141e
    bn.add r3, r12, r5
    bn.lwz r4, 0x10(r1)
    bg.jal 0x23dfb6
    bn.lwz r6, 0x14(r1)
    bg.bnei r6, 0x4, loc_22562e
loc_225743:
    bn.ori r7, r0, 0x16
    bn.muls r7, r19, r7
    bn.lwz r5, 0x0(r1)
    bt.add r7, r5
    bn.slli r7, r7, 0x3
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bn.lh r7, 0x50(r7)
    bt.addi r7, 0x3
    bn.srli r10, r7, 0x2
    bt.j loc_22564f
loc_225765:
    bn.addi r10, r17, 0xa
    bn.extbz r10, r10
    bt.movhi r11, -0x10
    bg.ori r3, r11, 0x2e04
    bt.mov r4, r10
    bg.jal 0x23ddb9
    bn.slli r10, r10, 0x2
    bg.ori r3, r11, 0x1f8f
    bn.andi r4, r10, 0xf8
    bn.ori r5, r0, 0x7c
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
    bg.j 0x23dfe1
loc_2257b5:
    bn.addi r10, r17, 0x9
    bn.extbz r10, r10
    bt.movhi r11, -0x10
    bg.ori r3, r11, 0x2e04
    bt.mov r4, r10
    bg.jal 0x23ddb9
    bn.slli r10, r10, 0x2
    bg.ori r3, r11, 0x1f8f
    bn.andi r4, r10, 0xfc
    bn.ori r5, r0, 0x7c
    bg.jal 0x23dfe1
    bt.j loc_2256b9
loc_2257da:
    bg.blesi r14, 0x0, loc_225699
    bn.andi r7, r20, 0x1
    bg.beqi r7, 0x0, loc_2256a4
loc_2257e5:
    bn.addi r10, r17, 0x9
    bn.extbz r10, r10
    bt.movhi r11, -0x10
    bg.ori r3, r11, 0x2e03
    bt.mov r4, r10
    bg.jal 0x23ddb9
    bn.slli r10, r10, 0x2
    bg.ori r3, r11, 0x1f8e
    bn.andi r4, r10, 0xfc
    bn.ori r5, r0, 0x7c
    bg.jal 0x23dfe1
    bn.andi r7, r20, 0x2
    bg.beqi r7, 0x0, loc_2256ab
loc_22580f:
    bn.addi r10, r17, 0x9
    bn.extbz r10, r10
    bt.movhi r11, -0x10
    bg.ori r3, r11, 0x2e02
    bt.mov r4, r10
    bg.jal 0x23ddb9
    bn.slli r10, r10, 0x2
    bg.ori r3, r11, 0x1f8d
    bn.andi r4, r10, 0xfc
    bn.ori r5, r0, 0x7c
    bg.jal 0x23dfe1
    bn.andi r7, r20, 0x4
    bg.beqi r7, 0x0, loc_2256b2
loc_225839:
    bn.addi r10, r17, 0x9
    bn.extbz r10, r10
    bt.movhi r11, -0x10
    bg.ori r3, r11, 0x2e05
    bt.mov r4, r10
    bg.jal 0x23ddb9
    bn.slli r10, r10, 0x2
    bg.ori r3, r11, 0x1f90
    bn.andi r4, r10, 0xfc
    bn.ori r5, r0, 0x7c
    bg.jal 0x23dfe1
    bt.j loc_2256b2
loc_22585e:
    bn.addi r7, r11, 0x3
    bn.slli r7, r7, 0x2
    bn.extbz r4, r7
    bn.j loc_225568
loc_22586a:
    bn.addi r7, r14, 0x3
    bn.slli r7, r7, 0x2
    bn.extbz r4, r7
    bn.j loc_225541
loc_225876:
    bn.addi r7, r11, -0x5
    bn.extbz r4, r7
    bn.j loc_22551d
loc_22587f:
    bn.addi r7, r14, -0x5
    bn.extbz r4, r7
    bn.j loc_225500
loc_225888:
    bg.bnei r21, 0x5, loc_2255d0
    bt.mov r3, r15
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bn.j loc_2255e6
loc_22589a:
    bn.addi r10, r17, 0xa
    bn.extbz r10, r10
    bt.movhi r11, -0x10
    bg.ori r3, r11, 0x2e05
    bt.mov r4, r10
    bg.jal 0x23ddb9
    bn.slli r10, r10, 0x2
    bg.ori r3, r11, 0x1f90
    bn.andi r4, r10, 0xf8
    bn.ori r5, r0, 0x7c
    bg.jal 0x23dfe1
    bt.j loc_2256d2
loc_2258bf:
    bn.addi r10, r17, 0xa
    bn.extbz r10, r10
    bt.movhi r11, -0x10
    bg.ori r3, r11, 0x2e02
    bt.mov r4, r10
    bg.jal 0x23ddb9
    bn.slli r10, r10, 0x2
    bg.ori r3, r11, 0x1f8d
    bn.andi r4, r10, 0xf8
    bn.ori r5, r0, 0x7c
    bg.jal 0x23dfe1
    bn.j loc_2256cb
loc_2258e5:
    bn.addi r10, r17, 0xa
    bn.extbz r10, r10
    bt.movhi r11, -0x10
    bg.ori r3, r11, 0x2e03
    bt.mov r4, r10
    bg.jal 0x23ddb9
    bn.slli r10, r10, 0x2
    bg.ori r3, r11, 0x1f8e
    bn.andi r4, r10, 0xf8
    bn.ori r5, r0, 0x7c
    bg.jal 0x23dfe1
    bn.j loc_2256c4
loc_22590b:
    bg.bnei r22, 0x2, loc_22569d
    bn.addi r4, r10, 0x20
    bt.mov r3, r11
    bn.exthz r4, r4
    bg.jal 0x23dfb6
    bt.mov r3, r13
    bn.ori r4, r0, 0x10
    bg.jal 0x23dfb6
    bn.andi r12, r18, 0x1
    bn.beqi r12, 0x0, loc_225943
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bn.lwz r5, 0x14(r1)
    bn.slli r7, r5, 0x4
    bn.lh r5, 0x20(r6)
    bt.add r7, r5
    bn.addi r7, r7, -0x20
    bn.sh_1 0x20(r6), r7
loc_225943:
    bn.andi r13, r18, 0x2
    bn.beqi r13, 0x0, loc_225964
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bn.lwz r5, 0x14(r1)
    bn.slli r7, r5, 0x4
    bg.lhz r5, 0x9c(r6)
    bt.add r7, r5
    bn.addi r7, r7, -0x20
    bg.sw_1 0x9c(r6), r7
loc_225964:
    bn.andi r14, r18, 0x4
    bn.beqi r14, 0x0, loc_225985
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bn.lwz r5, 0x14(r1)
    bn.slli r7, r5, 0x4
    bg.lhz r5, 0x118(r6)
    bt.add r7, r5
    bn.addi r7, r7, -0x20
    bg.sw_1 0x118(r6), r7
loc_225985:
    bn.andi r16, r18, 0x8
    bn.beqi r16, 0x0, loc_2259a6
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bn.lwz r5, 0x14(r1)
    bn.slli r7, r5, 0x4
    bg.lhz r5, 0x194(r6)
    bt.add r7, r5
    bn.addi r7, r7, -0x20
    bg.sw_1 0x194(r6), r7
loc_2259a6:
    bn.ori r7, r0, 0x16
    bn.muls r7, r19, r7
    bn.lwz r6, 0x0(r1)
    bt.add r7, r6
    bn.slli r10, r7, 0x3
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r10, r7
    bn.lh r4, 0x50(r10)
    bn.andi r7, r4, 0x1f
    bg.beqi r7, 0x0, loc_22569d
    bn.addi r4, r4, 0x1f
    bt.movhi r5, 0x1
    bg.ori r5, r5, 0xffe0
    bn.and r4, r4, r5
    bt.mov r3, r15
    bn.srli r4, r4, 0x2
    bg.jal 0x23dfb6
    bn.lh r4, 0x50(r10)
    bn.addi r4, r4, 0x1f
    bt.movhi r6, 0x1
    bg.ori r6, r6, 0xffe0
    bn.and r4, r4, r6
    bn.srai r4, r4, 0x2
    bt.mov r3, r11
    bn.addi r4, r4, 0x20
    bg.jal 0x23dfb6
    bn.beqi r12, 0x0, loc_225a20
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bn.lh r7, 0x50(r10)
    bn.andi r7, r7, 0x1f
    bn.ori r6, r0, 0x20
    bn.sub r6, r6, r7
    bn.srli r7, r6, 0x1f
    bt.add r7, r6
    bn.srai r7, r7, 0x1
    bn.lh r6, 0x20(r5)
    bn.sub r7, r6, r7
    bn.sh_1 0x20(r5), r7
loc_225a20:
    bn.beqi r13, 0x0, loc_225a4a
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bn.lh r7, 0x50(r10)
    bn.andi r7, r7, 0x1f
    bn.ori r6, r0, 0x20
    bn.sub r6, r6, r7
    bn.srli r7, r6, 0x1f
    bt.add r7, r6
    bn.srai r7, r7, 0x1
    bg.lhz r6, 0x9c(r5)
    bn.sub r7, r6, r7
    bg.sw_1 0x9c(r5), r7
loc_225a4a:
    bn.beqi r14, 0x0, loc_225a74
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bn.lh r7, 0x50(r10)
    bn.andi r7, r7, 0x1f
    bn.ori r6, r0, 0x20
    bn.sub r6, r6, r7
    bn.srli r7, r6, 0x1f
    bt.add r7, r6
    bn.srai r7, r7, 0x1
    bg.lhz r6, 0x118(r5)
    bn.sub r7, r6, r7
    bg.sw_1 0x118(r5), r7
loc_225a74:
    bg.beqi r16, 0x0, loc_22569d
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bn.lh r7, 0x50(r10)
    bn.andi r7, r7, 0x1f
    bn.ori r6, r0, 0x20
    bn.sub r6, r6, r7
    bn.srli r7, r6, 0x1f
    bt.add r7, r6
    bn.srai r7, r7, 0x1
    bg.lhz r6, 0x194(r5)
    bn.sub r7, r6, r7
    bg.sw_1 0x194(r5), r7
    bn.j loc_22569d
