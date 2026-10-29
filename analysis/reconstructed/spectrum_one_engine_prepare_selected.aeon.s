# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21ffb3,0x22089f); Prepare selected engine state and issue register requests; external services remain unresolved.
# Fixed original addresses; not hardware-validated.
    bn.addi r1, r1, -0x58
    bn.sw 0x54(r1), r9
    bn.sw 0x50(r1), r10
    bn.sw 0x4c(r1), r11
    bn.sw 0x48(r1), r12
    bn.sw 0x44(r1), r13
    bn.sw 0x40(r1), r14
    bn.sw 0x3c(r1), r15
    bn.sw 0x38(r1), r16
    bn.sw 0x34(r1), r17
    bn.sw 0x30(r1), r18
    bn.sw 0x2c(r1), r19
    bn.sw 0x28(r1), r20
    bn.sw 0x24(r1), r21
    bn.sw 0x20(r1), r22
    bt.mov r13, r3
    bn.ori r7, r0, 0x7c
    bn.muls r10, r3, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r10, r5
    bn.lwz r12, 0x4(r10)
    bg.jal 0x2227ef
    bt.mov r14, r3
    bg.jal 0x21bd8d
    bn.sfnei r3, 0x0
    bn.ori r6, r0, 0x70
    bn.ori r7, r0, 0xe0
    bn.cmov_0 r21, r6, r7
    bn.lh r20, 0x4c(r10)
    bn.lh r16, 0x68(r10)
    bn.lh r17, 0x50(r10)
    bn.lh r18, 0x6a(r10)
    bg.bgtui r13, 0x3, loc_220333
    bn.lbz r15, 0xc(r10)
    bg.beqi r15, 0x0, loc_2201e6
    bn.ori r6, r0, 0x7c
    bn.sw 0xc(r1), r6
    bn.sw 0x10(r1), r6
    bt.movi r11, 0x0
    bt.movi r7, 0x5
    bn.sw 0x14(r1), r7
    bg.ori r5, r0, 0x8eb
    bn.sw 0x18(r1), r5
loc_220039:
    bn.ori r7, r0, 0x7c
    bn.muls r10, r13, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r10, r7
    bn.lh r5, 0x4e(r10)
    bn.sw 0x0(r1), r5
    bn.lh r22, 0x6c(r10)
    bn.lh r6, 0x52(r10)
    bn.sw 0x4(r1), r6
    bn.lh r7, 0x6e(r10)
    bn.sw 0x8(r1), r7
    bg.jal 0x21bd1e
    bn.divu r7, r11, r3
    bn.muls r7, r7, r3
    bn.sub r7, r11, r7
    bn.exthz r7, r7
    bg.ori r5, r0, 0x7ff
    bn.and r6, r7, r5
    bn.slli r7, r7, 0x1
    bg.ori r5, r0, 0x3000
    bn.and r7, r7, r5
    bn.or r7, r6, r7
    bn.sw 0x1c(r1), r7
    bn.lbz r6, 0x54(r10)
    bn.beqi r6, 0x0, loc_22008f
    bg.beqi r16, 0x0, loc_22049f
loc_22008f:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lbz r6, 0x55(r7)
    bn.beqi r6, 0x0, loc_2200a9
    bg.beqi r18, 0x0, loc_2204a7
loc_2200a9:
    bt.movi r11, 0x0
    bt.movi r19, 0x0
loc_2200ad:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r14, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lbz r7, 0x38(r7)
    bn.beqi r7, 0x0, loc_2200e5
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lbz r6, 0x58(r7)
    bn.sfleui r6, 0x10
    bn.bnf loc_22048d
    bn.andi r7, r13, 0x2
    bg.bnei r7, 0x0, loc_220488
loc_2200e3:
    bt.mov r19, r6
loc_2200e5:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r13, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lwz r7, 0x8(r7)
    bg.beqi r7, 0x0, loc_22020d
    bg.beqi r17, 0x0, loc_22020d
    bg.beqi r13, 0x1, loc_2206c8
loc_220104:
    bn.add r7, r20, r16
    bt.add r7, r21
    bn.exthz r10, r7
    bn.add r7, r10, r17
    bn.sub r7, r7, r16
    bn.sub r7, r7, r18
    bt.addi r7, -0x1
    bn.exthz r16, r7
    bn.lwz r7, 0x0(r1)
    bt.add r7, r22
    bn.lwz r6, 0x10(r1)
    bt.add r7, r6
    bn.exthz r15, r7
    bn.lwz r5, 0x4(r1)
    bn.add r7, r15, r5
    bn.sub r7, r7, r22
    bn.lwz r6, 0x8(r1)
    bn.sub r7, r7, r6
    bt.addi r7, -0x1
    bn.exthz r17, r7
    bn.andi r14, r13, 0x1
    bg.beqi r14, 0x0, loc_2205d5
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.bnei r7, 0x0, loc_2206b3
    bn.movhi_2 r6, 0x1080
    bn.ori r6, r6, 0x3
    bn.add r3, r12, r6
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x20
    bg.jal 0x23dfe1
loc_220160:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_220826
    bn.sub r4, r10, r11
    bn.movhi_2 r5, 0x1080
    bn.ori r5, r5, 0x10
    bn.add r3, r12, r5
    bn.exthz r4, r4
    bg.ori r5, r0, 0x3fff
    bg.jal 0x23e4a6
loc_220183:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_22080c
    bn.add r4, r16, r19
    bn.movhi_2 r5, 0x1080
    bn.ori r5, r5, 0x12
    bn.add r3, r12, r5
    bn.exthz r4, r4
    bg.ori r5, r0, 0x3fff
    bg.jal 0x23e4a6
loc_2201a6:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_2207f6
    bn.movhi_2 r5, 0x1080
    bn.ori r5, r5, 0x14
    bn.add r3, r12, r5
    bt.mov r4, r15
    bg.ori r5, r0, 0x1fff
    bg.jal 0x23e4a6
loc_2201c5:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_2207e0
    bn.movhi_2 r5, 0x1080
    bn.ori r5, r5, 0x16
    bn.add r3, r12, r5
    bt.mov r4, r17
    bg.ori r5, r0, 0x1fff
    bg.jal 0x23e4a6
    bt.j loc_220271
loc_2201e6:
    bg.jal 0x21bd1e
    bt.mov r11, r3
    bn.addi r6, r3, 0x5
    bn.divs r7, r6, r3
    bn.muls r7, r7, r3
    bn.sub r6, r6, r7
    bn.exthz r6, r6
    bn.sw 0x14(r1), r6
    bn.sw 0xc(r1), r0
    bn.sw 0x10(r1), r0
    bg.ori r6, r0, 0x86f
    bn.sw 0x18(r1), r6
    bt.j loc_220039
loc_22020d:
    bn.andi r14, r13, 0x1
    bg.beqi r14, 0x0, loc_220362
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_220520
    bn.movhi_2 r5, 0x1080
    bn.ori r5, r5, 0x3
    bn.add r3, r12, r5
    bn.ori r4, r0, 0x20
    bn.ori r5, r0, 0x20
    bg.jal 0x23e4f4
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_22053f
loc_22023f:
    bn.movhi_2 r5, 0x1080
    bn.ori r5, r5, 0x10
    bn.add r3, r12, r5
    bt.movi r4, 0x0
    bg.ori r5, r0, 0x3fff
    bg.jal 0x23e4a6
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_22055e
loc_22025e:
    bn.movhi_2 r5, 0x1080
    bn.ori r5, r5, 0x12
    bn.add r3, r12, r5
    bt.movi r4, 0x0
    bg.ori r5, r0, 0x3fff
    bg.jal 0x23e4a6
loc_220271:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_22057d
loc_22027d:
    bg.movhi r5, 0x2080
    bn.ori r5, r5, 0x20
    bn.add r3, r12, r5
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23e4f4
    bn.ori r7, r0, 0x7c
    bn.muls r3, r13, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r3, r7
    bn.lwz r7, 0x8(r3)
    bg.bnei r7, 0x0, loc_2203f4
loc_2202a6:
    bg.beqi r14, 0x0, loc_2205b1
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.movhi r6, 0x5780
    bg.movhi r7, 0x5780
    bg.bnei r5, 0x0, loc_2205c5
loc_2202be:
    bn.ori r7, r7, 0x20
    bn.add r3, r12, r7
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.bnei r5, 0x0, loc_22042d
loc_2202d8:
    bn.movhi_2 r7, 0x1080
    bn.ori r7, r7, 0x8c
    bn.add r3, r12, r7
    bg.ori r4, r0, 0x4000
    bg.jal 0x23dfb6
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.bnei r5, 0x0, loc_22044a
loc_2202f5:
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0xac
    bn.add r3, r12, r7
    bt.movi r4, 0x1
    bt.movi r5, 0x2
    bn.lwz r22, 0x20(r1)
    bn.lwz r21, 0x24(r1)
    bn.lwz r20, 0x28(r1)
    bn.lwz r19, 0x2c(r1)
    bn.lwz r18, 0x30(r1)
    bn.lwz r17, 0x34(r1)
    bn.lwz r16, 0x38(r1)
    bn.lwz r15, 0x3c(r1)
    bn.lwz r14, 0x40(r1)
    bn.lwz r13, 0x44(r1)
    bn.lwz r12, 0x48(r1)
    bn.lwz r11, 0x4c(r1)
    bn.lwz r10, 0x50(r1)
    bn.lwz r9, 0x54(r1)
    bn.addi r1, r1, 0x58
    bg.j 0x23dead
loc_220333:
    bn.lwz r22, 0x20(r1)
    bn.lwz r21, 0x24(r1)
    bn.lwz r20, 0x28(r1)
    bn.lwz r19, 0x2c(r1)
    bn.lwz r18, 0x30(r1)
    bn.lwz r17, 0x34(r1)
    bn.lwz r16, 0x38(r1)
    bn.lwz r15, 0x3c(r1)
    bn.lwz r14, 0x40(r1)
    bn.lwz r13, 0x44(r1)
    bn.lwz r12, 0x48(r1)
    bn.lwz r11, 0x4c(r1)
    bn.lwz r10, 0x50(r1)
    bn.lwz r9, 0x54(r1)
    bn.addi r1, r1, 0x58
    bt.jr r9
loc_220362:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_2204af
    bn.movhi_2 r5, 0x1080
    bn.ori r5, r5, 0x3
    bn.add r3, r12, r5
    bn.ori r4, r0, 0x10
    bn.ori r5, r0, 0x10
    bg.jal 0x23e4f4
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_2204ce
loc_22038d:
    bn.movhi_2 r5, 0xf80
    bn.ori r5, r5, 0xe
    bn.add r3, r12, r5
    bt.movi r4, 0x0
    bg.ori r5, r0, 0x3fff
    bg.jal 0x23e4a6
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_2204ed
loc_2203ac:
    bn.movhi_2 r5, 0xf80
    bn.ori r5, r5, 0x10
    bn.add r3, r12, r5
    bt.movi r4, 0x0
    bg.ori r5, r0, 0x3fff
    bg.jal 0x23e4a6
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_22050c
loc_2203cb:
    bg.movhi r5, 0x2080
    bn.ori r5, r5, 0x20
    bn.add r3, r12, r5
    bt.movi r4, 0x0
    bt.movi r5, 0x2
    bg.jal 0x23e4f4
loc_2203dd:
    bn.ori r7, r0, 0x7c
    bn.muls r3, r13, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r3, r7
    bn.lwz r7, 0x8(r3)
    bg.beqi r7, 0x0, loc_2202a6
loc_2203f4:
    bn.lh r3, 0x38(r3)
    bg.beqi r3, 0x0, loc_2202a6
    bg.beqi r14, 0x0, loc_220591
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.movhi r6, 0x5780
    bg.movhi r7, 0x5780
    bg.beqi r5, 0x0, loc_2205a1
loc_220413:
    bn.ori r6, r6, 0x20
    bn.add r3, r12, r6
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23e4f4
loc_220421:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_2202d8
loc_22042d:
    bn.movhi_2 r6, 0x1080
    bn.ori r6, r6, 0x8c
    bn.add r3, r12, r6
    bg.ori r4, r0, 0x4000
    bg.jal 0x23e58a
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_2202f5
loc_22044a:
    bn.movhi_2 r6, 0xf80
    bn.ori r6, r6, 0xac
    bn.add r3, r12, r6
    bt.movi r4, 0x1
    bt.movi r5, 0x2
    bn.lwz r22, 0x20(r1)
    bn.lwz r21, 0x24(r1)
    bn.lwz r20, 0x28(r1)
    bn.lwz r19, 0x2c(r1)
    bn.lwz r18, 0x30(r1)
    bn.lwz r17, 0x34(r1)
    bn.lwz r16, 0x38(r1)
    bn.lwz r15, 0x3c(r1)
    bn.lwz r14, 0x40(r1)
    bn.lwz r13, 0x44(r1)
    bn.lwz r12, 0x48(r1)
    bn.lwz r11, 0x4c(r1)
    bn.lwz r10, 0x50(r1)
    bn.lwz r9, 0x54(r1)
    bn.addi r1, r1, 0x58
    bg.j 0x23e5ed
loc_220488:
    bt.mov r11, r6
    bn.j loc_2200e5
loc_22048d:
    bn.sfeqi r15, 0x0
    bn.ori r7, r0, 0x10
    bn.cmov_0 r6, r6, r7
    bn.andi r7, r13, 0x2
    bg.beqi r7, 0x0, loc_2200e3
    bt.j loc_220488
loc_22049f:
    bn.lbz r11, 0x58(r10)
    bt.movi r19, 0x0
    bn.j loc_2200ad
loc_2204a7:
    bn.lbz r19, 0x58(r7)
    bt.movi r11, 0x0
    bn.j loc_2200ad
loc_2204af:
    bn.movhi_2 r6, 0x1080
    bn.ori r6, r6, 0x3
    bn.add r3, r12, r6
    bn.ori r4, r0, 0x10
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.bnei r7, 0x0, loc_22038d
loc_2204ce:
    bn.movhi_2 r6, 0xf80
    bn.ori r6, r6, 0xe
    bn.add r3, r12, r6
    bt.movi r4, 0x0
    bg.ori r5, r0, 0x3fff
    bg.jal 0x23e152
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.bnei r7, 0x0, loc_2203ac
loc_2204ed:
    bn.movhi_2 r6, 0xf80
    bn.ori r6, r6, 0x10
    bn.add r3, r12, r6
    bt.movi r4, 0x0
    bg.ori r5, r0, 0x3fff
    bg.jal 0x23e152
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.bnei r7, 0x0, loc_2203cb
loc_22050c:
    bg.movhi r6, 0x2080
    bn.ori r6, r6, 0x20
    bn.add r3, r12, r6
    bt.movi r4, 0x0
    bt.movi r5, 0x2
    bg.jal 0x23dfe1
    bt.j loc_2203dd
loc_220520:
    bn.movhi_2 r6, 0x1080
    bn.ori r6, r6, 0x3
    bn.add r3, r12, r6
    bn.ori r4, r0, 0x20
    bn.ori r5, r0, 0x20
    bg.jal 0x23dfe1
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.bnei r7, 0x0, loc_22023f
loc_22053f:
    bn.movhi_2 r6, 0x1080
    bn.ori r6, r6, 0x10
    bn.add r3, r12, r6
    bt.movi r4, 0x0
    bg.ori r5, r0, 0x3fff
    bg.jal 0x23e152
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.bnei r7, 0x0, loc_22025e
loc_22055e:
    bn.movhi_2 r6, 0x1080
    bn.ori r6, r6, 0x12
    bn.add r3, r12, r6
    bt.movi r4, 0x0
    bg.ori r5, r0, 0x3fff
    bg.jal 0x23e152
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.bnei r7, 0x0, loc_22027d
loc_22057d:
    bg.movhi r6, 0x2080
    bn.ori r6, r6, 0x20
    bn.add r3, r12, r6
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bt.j loc_2203dd
loc_220591:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.movhi r7, 0x5880
    bg.bnei r5, 0x0, loc_220698
loc_2205a1:
    bn.ori r7, r7, 0x20
    bn.add r3, r12, r7
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bt.j loc_220421
loc_2205b1:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.movhi r7, 0x5880
    bg.beqi r5, 0x0, loc_2202be
    bg.movhi r6, 0x5880
loc_2205c5:
    bn.ori r6, r6, 0x20
    bn.add r3, r12, r6
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23e4f4
    bt.j loc_220421
loc_2205d5:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_22069f
    bn.movhi_2 r5, 0x1080
    bn.ori r5, r5, 0x3
    bn.add r3, r12, r5
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23e4f4
loc_2205f3:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_220885
    bn.sub r4, r10, r11
    bn.movhi_2 r5, 0xf80
    bn.ori r5, r5, 0xe
    bn.add r3, r12, r5
    bn.exthz r4, r4
    bg.ori r5, r0, 0x3fff
    bg.jal 0x23e4a6
loc_220616:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_22086b
    bn.add r4, r16, r19
    bn.movhi_2 r5, 0xf80
    bn.ori r5, r5, 0x10
    bn.add r3, r12, r5
    bn.exthz r4, r4
    bg.ori r5, r0, 0x3fff
    bg.jal 0x23e4a6
loc_220639:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_220855
    bn.movhi_2 r5, 0xf80
    bn.ori r5, r5, 0x12
    bn.add r3, r12, r5
    bt.mov r4, r15
    bg.ori r5, r0, 0x1fff
    bg.jal 0x23e4a6
loc_220658:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_220840
    bn.movhi_2 r5, 0xf80
    bn.ori r5, r5, 0x14
    bn.add r3, r12, r5
    bt.mov r4, r17
    bg.ori r5, r0, 0x1fff
    bg.jal 0x23e4a6
loc_220677:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_2207cb
    bg.movhi r5, 0x2080
    bn.ori r5, r5, 0x20
    bn.add r3, r12, r5
    bt.movi r4, 0x2
    bt.movi r5, 0x2
    bg.jal 0x23e4f4
    bn.j loc_2203dd
loc_220698:
    bg.movhi r6, 0x5880
    bn.j loc_220413
loc_22069f:
    bn.movhi_2 r6, 0x1080
    bn.ori r6, r6, 0x3
    bn.add r3, r12, r6
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bt.j loc_2205f3
loc_2206b3:
    bn.movhi_2 r5, 0x1080
    bn.ori r5, r5, 0x3
    bn.add r3, r12, r5
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x20
    bg.jal 0x23e4f4
    bn.j loc_220160
loc_2206c8:
    bt.movi r15, 0x1
    bg.movhi r7, 0x48
    bg.addi r14, r7, -0x4e4
    bt.mov r10, r14
loc_2206d4:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_22076b
    bn.lwz r3, 0x0(r14)
    bn.movhi_2 r7, 0x1080
    bn.ori r7, r7, 0xc
    bt.add r3, r7
    bn.lwz r4, 0xc(r1)
    bg.ori r5, r0, 0x1fff
    bg.jal 0x23e4a6
loc_2206f6:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_2207b3
    bn.lwz r3, 0x0(r10)
    bn.movhi_2 r7, 0x1080
    bn.ori r7, r7, 0xe
    bt.add r3, r7
    bn.lwz r4, 0x18(r1)
    bg.ori r5, r0, 0x1fff
    bg.jal 0x23e4a6
loc_220718:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bn.beqi r6, 0x0, loc_22079b
    bn.lwz r3, 0x0(r10)
    bn.movhi_2 r7, 0x1080
    bn.ori r7, r7, 0x4
    bt.add r3, r7
    bn.lwz r4, 0x1c(r1)
    bg.ori r5, r0, 0x37ff
    bg.jal 0x23e4a6
loc_220739:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bn.beqi r6, 0x0, loc_220783
    bn.lwz r3, 0x0(r10)
    bn.movhi_2 r7, 0x1080
    bn.ori r7, r7, 0x6
    bt.add r3, r7
    bn.lwz r4, 0x14(r1)
    bg.ori r5, r0, 0x1fff
    bg.jal 0x23e4a6
loc_22075a:
    bt.addi r15, 0x2
    bg.addi r10, r10, 0xf8
    bg.addi r14, r14, 0xf8
    bg.bnei r15, 0x5, loc_2206d4
    bn.j loc_220104
loc_22076b:
    bn.lwz r3, 0x0(r14)
    bn.movhi_2 r5, 0x1080
    bn.ori r5, r5, 0xc
    bt.add r3, r5
    bn.lwz r4, 0xc(r1)
    bg.ori r5, r0, 0x1fff
    bg.jal 0x23e152
    bt.j loc_2206f6
loc_220783:
    bn.lwz r3, 0x0(r10)
    bn.movhi_2 r5, 0x1080
    bn.ori r5, r5, 0x6
    bt.add r3, r5
    bn.lwz r4, 0x14(r1)
    bg.ori r5, r0, 0x1fff
    bg.jal 0x23e152
    bt.j loc_22075a
loc_22079b:
    bn.lwz r3, 0x0(r10)
    bn.movhi_2 r5, 0x1080
    bn.ori r5, r5, 0x4
    bt.add r3, r5
    bn.lwz r4, 0x1c(r1)
    bg.ori r5, r0, 0x37ff
    bg.jal 0x23e152
    bt.j loc_220739
loc_2207b3:
    bn.lwz r3, 0x0(r10)
    bn.movhi_2 r5, 0x1080
    bn.ori r5, r5, 0xe
    bt.add r3, r5
    bn.lwz r4, 0x18(r1)
    bg.ori r5, r0, 0x1fff
    bg.jal 0x23e152
    bt.j loc_220718
loc_2207cb:
    bg.movhi r6, 0x2080
    bn.ori r6, r6, 0x20
    bn.add r3, r12, r6
    bt.movi r4, 0x2
    bt.movi r5, 0x2
    bg.jal 0x23dfe1
    bn.j loc_2203dd
loc_2207e0:
    bn.movhi_2 r6, 0x1080
    bn.ori r6, r6, 0x16
    bn.add r3, r12, r6
    bt.mov r4, r17
    bg.ori r5, r0, 0x1fff
    bg.jal 0x23e152
    bn.j loc_220271
loc_2207f6:
    bn.movhi_2 r6, 0x1080
    bn.ori r6, r6, 0x14
    bn.add r3, r12, r6
    bt.mov r4, r15
    bg.ori r5, r0, 0x1fff
    bg.jal 0x23e152
    bn.j loc_2201c5
loc_22080c:
    bn.add r4, r16, r19
    bn.movhi_2 r6, 0x1080
    bn.ori r6, r6, 0x12
    bn.add r3, r12, r6
    bn.exthz r4, r4
    bg.ori r5, r0, 0x3fff
    bg.jal 0x23e152
    bn.j loc_2201a6
loc_220826:
    bn.sub r4, r10, r11
    bn.movhi_2 r6, 0x1080
    bn.ori r6, r6, 0x10
    bn.add r3, r12, r6
    bn.exthz r4, r4
    bg.ori r5, r0, 0x3fff
    bg.jal 0x23e152
    bn.j loc_220183
loc_220840:
    bn.movhi_2 r6, 0xf80
    bn.ori r6, r6, 0x14
    bn.add r3, r12, r6
    bt.mov r4, r17
    bg.ori r5, r0, 0x1fff
    bg.jal 0x23e152
    bt.j loc_220677
loc_220855:
    bn.movhi_2 r6, 0xf80
    bn.ori r6, r6, 0x12
    bn.add r3, r12, r6
    bt.mov r4, r15
    bg.ori r5, r0, 0x1fff
    bg.jal 0x23e152
    bn.j loc_220658
loc_22086b:
    bn.add r4, r16, r19
    bn.movhi_2 r6, 0xf80
    bn.ori r6, r6, 0x10
    bn.add r3, r12, r6
    bn.exthz r4, r4
    bg.ori r5, r0, 0x3fff
    bg.jal 0x23e152
    bn.j loc_220639
loc_220885:
    bn.sub r4, r10, r11
    bn.movhi_2 r6, 0xf80
    bn.ori r6, r6, 0xe
    bn.add r3, r12, r6
    bn.exthz r4, r4
    bg.ori r5, r0, 0x3fff
    bg.jal 0x23e152
    bn.j loc_220616
