# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x22b6b2,0x22bace); byte-exact only; hardware untested.
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
    bt.mov r11, r3
    bg.jal 0x21d3b1
    bt.mov r15, r3
    bt.mov r3, r11
    bg.jal 0x2227ef
    bt.mov r13, r3
    bt.mov r3, r11
    bg.jal 0x222804
    bt.mov r19, r3
    bn.ori r10, r0, 0x7c
    bn.muls r10, r11, r10
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r10, r6
    bn.lh r7, 0x20(r10)
    bn.sw 0x4(r1), r7
    bn.lh r17, 0x22(r10)
    bn.lh r18, 0x24(r10)
    bn.lh r23, 0x26(r10)
    bn.sw 0x8(r1), r23
    bt.mov r4, r11
    bg.jal 0x23d121
    bn.sw 0x10(r1), r3
    bn.sw 0x14(r1), r4
    bn.sw 0x18(r1), r3
    bn.sw 0x1c(r1), r4
    bn.lh r6, 0x1e(r1)
    bn.sw 0xc(r1), r6
    bn.lh r22, 0x18(r1)
    bn.lh r16, 0x1a(r1)
    bn.lh r21, 0x1c(r1)
    bn.lbz r20, 0x70(r10)
    bn.ori r7, r0, 0xa8
    bn.muls r10, r13, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r10, r7
    bg.lbz r12, 0x98(r10)
    bt.mov r3, r11
    bg.jal 0x21d430
    bg.ori r7, r0, 0x1fff
    bn.sfnei r18, 0x0
    bn.cmov_0 r17, r17, r7
    bn.sfnei r21, 0x0
    bn.cmov_0 r16, r16, r7
    bn.ori r14, r0, 0xb0
    bn.muls r7, r19, r14
    bg.movhi r23, 0x3b
    bg.addi r23, r23, 0x4950
    bt.add r7, r23
    bn.lbz r7, 0x20(r7)
    bn.andi r7, r7, 0x10
    bg.bnei r7, 0x0, loc_22ba07
loc_22b781:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r13, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lbz r7, 0x38(r7)
    bn.beqi r7, 0x0, loc_22b7c3
    bn.andi r7, r11, 0x2
    bg.beqi r7, 0x0, loc_22b96f
    bn.ori r7, r0, 0x7c
    bn.muls r7, r11, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lh r7, 0x34(r7)
    bn.sfnei r7, 0x0
    bn.cmovsi_2 r7, r0, 0x1
    bn.extbz r7, r7
loc_22b7ba:
    bn.beqi r7, 0x0, loc_22b7c3
    bn.addi r7, r18, 0x20
    bn.exthz r18, r7
loc_22b7c3:
    bg.beqi r20, 0x0, loc_22b9a8
    bg.movhi r14, 0x45
    bg.lbz r7, 0x5210(r14)
    bg.beqi r7, 0x0, loc_22b935
    bn.addi r3, r15, 0xa
    bt.mov r4, r22
    bg.ori r5, r0, 0x1fff
    bg.jal 0x23e4a6
    bg.lbz r23, 0x5210(r14)
    bg.beqi r23, 0x0, loc_22b94a
loc_22b7e8:
    bn.addi r3, r15, 0x8
    bt.mov r4, r16
    bg.ori r5, r0, 0x1fff
    bg.jal 0x23e4a6
    bg.lbz r6, 0x5210(r14)
    bg.beqi r6, 0x0, loc_22b95f
loc_22b7fd:
    bn.addi r3, r15, 0xc
    bn.lwz r4, 0xc(r1)
    bg.ori r5, r0, 0x1fff
    bg.jal 0x23e4a6
loc_22b80b:
    bn.ori r6, r0, 0xb0
    bn.muls r6, r19, r6
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r6, r7
    bg.lbz r7, 0x88(r6)
    bt.addi r7, 0x1
    bn.divs r13, r21, r7
    bg.lbz r6, 0x89(r6)
    bg.beqi r6, 0x4, loc_22ba57
    bg.lbz r23, 0x5210(r14)
    bg.beqi r23, 0x0, loc_22ba45
    bn.addi r10, r15, 0xe
    bt.mov r3, r10
    bt.mov r4, r13
    bg.ori r5, r0, 0x7fff
    bg.jal 0x23e4a6
loc_22b843:
    bn.beqi r12, 0x0, loc_22b89f
    bt.movi r5, 0x0
    bn.addi r7, r13, 0x1f
    bn.addi r23, r0, -0x20
    bn.and r4, r7, r23
loc_22b851:
    bn.extbz r6, r5
    bn.andi r7, r12, 0x1
    bn.beqi r7, 0x0, loc_22b897
    bn.bgtui r6, 0x3, loc_22b897
    bn.ori r7, r0, 0x18
    bn.muls r6, r6, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x5c4
    bt.add r6, r7
    bn.lbz r23, 0x0(r6)
    bn.beqi r23, 0x0, loc_22b897
    bn.ori r7, r0, 0xb0
    bn.lbz r23, 0x10(r6)
    bn.muls r7, r7, r23
    bg.movhi r23, 0x3b
    bg.addi r23, r23, 0x4950
    bt.add r7, r23
    bn.lwz r7, 0x0(r7)
    bg.bgtui r7, 0x7, loc_22b897
    bg.bgtui r7, 0x4, loc_22ba92
    bt.addi r7, 0x3
    bg.bleui r7, 0x3, loc_22ba92
loc_22b897:
    bn.srli r12, r12, 0x1
    bt.addi r5, 0x1
    bn.bnei r12, 0x0, loc_22b851
loc_22b89f:
    bt.mov r3, r11
    bt.movi r4, 0x1
    bg.jal 0x21bece
    bt.mov r3, r11
    bt.movi r4, 0x1
    bg.jal 0x21be98
    bn.lwz r6, 0x4(r1)
    bn.sub r4, r6, r22
    bt.mov r3, r11
    bn.exthz r4, r4
    bg.jal 0x21ccf4
    bn.addi r4, r18, 0x3
    bt.mov r3, r11
    bg.ori r7, r0, 0xfffc
    bn.and r4, r4, r7
    bg.jal 0x21cc90
    bn.ori r7, r0, 0xb0
    bn.muls r7, r19, r7
    bg.movhi r23, 0x3b
    bg.addi r23, r23, 0x4950
    bt.add r7, r23
    bn.lbz r7, 0x20(r7)
    bn.andi r7, r7, 0x10
    bg.beqi r7, 0x0, loc_22b995
    bn.sub r7, r17, r16
    bn.srli r4, r7, 0x1f
    bt.add r4, r7
    bn.srai r4, r4, 0x1
    bt.mov r3, r11
    bn.exthz r4, r4
    bg.jal 0x21ccc2
    bt.mov r3, r11
    bn.lwz r6, 0x8(r1)
    bn.srli r4, r6, 0x1
loc_22b904:
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
    bg.j 0x21cc5e
loc_22b935:
    bn.addi r3, r15, 0xa
    bt.mov r4, r22
    bg.ori r5, r0, 0x1fff
    bg.jal 0x23e152
    bg.lbz r23, 0x5210(r14)
    bg.bnei r23, 0x0, loc_22b7e8
loc_22b94a:
    bn.addi r3, r15, 0x8
    bt.mov r4, r16
    bg.ori r5, r0, 0x1fff
    bg.jal 0x23e152
    bg.lbz r6, 0x5210(r14)
    bg.bnei r6, 0x0, loc_22b7fd
loc_22b95f:
    bn.addi r3, r15, 0xc
    bn.lwz r4, 0xc(r1)
    bg.ori r5, r0, 0x1fff
    bg.jal 0x23e152
    bt.j loc_22b80b
loc_22b96f:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r11, r7
    bg.movhi r23, 0x48
    bg.addi r23, r23, -0x564
    bt.add r7, r23
    bn.lh r6, 0x34(r7)
    bn.lh r5, 0x38(r7)
    bt.add r6, r5
    bn.lh r7, 0x40(r7)
    bn.sfne r6, r7
    bn.cmovsi_2 r7, r0, 0x1
    bn.extbz r7, r7
    bt.j loc_22b7ba
loc_22b995:
    bn.sub r4, r17, r16
    bt.mov r3, r11
    bn.exthz r4, r4
    bg.jal 0x21ccc2
    bt.mov r3, r11
    bn.lwz r4, 0x8(r1)
    bt.j loc_22b904
loc_22b9a8:
    bn.lwz r3, 0x4(r1)
    bt.mov r4, r11
    bg.jal 0x21e41f
    bt.mov r3, r17
    bt.mov r4, r11
    bg.jal 0x21e36f
    bn.lwz r3, 0x8(r1)
    bt.mov r4, r11
    bg.jal 0x21e4e8
    bt.mov r3, r18
    bt.mov r4, r11
    bg.jal 0x21e536
    bt.mov r3, r11
    bt.movi r4, 0x0
    bg.jal 0x21bece
    bt.mov r3, r11
    bt.movi r4, 0x0
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
    bg.j 0x21be98
loc_22ba07:
    bt.mov r3, r13
    bg.jal 0x2227da
    bn.muls r3, r3, r14
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r3, r6
    bn.lbz r7, 0x20(r3)
    bn.andi r7, r7, 0x10
    bn.beqi r7, 0x0, loc_22ba36
    bn.lbz r7, 0x29(r10)
    bt.addi r7, -0x1
    bn.extbz r7, r7
    bn.bleui r7, 0x1, loc_22ba36
    bg.lbz r10, 0xa4(r10)
    bg.beqi r10, 0x0, loc_22b781
loc_22ba36:
    bn.lwz r23, 0x8(r1)
    bn.slli r7, r23, 0x1
    bn.exthz r7, r7
    bn.sw 0x8(r1), r7
    bn.j loc_22b781
loc_22ba45:
    bn.addi r10, r15, 0xe
    bt.mov r3, r10
    bt.mov r4, r13
    bg.ori r5, r0, 0x7fff
    bg.jal 0x23e152
    bn.j loc_22b843
loc_22ba57:
    bg.lbz r23, 0x5210(r14)
    bn.bnei r23, 0x0, loc_22ba78
    bn.addi r10, r15, 0xe
    bn.addi r4, r13, 0x3
    bt.mov r3, r10
    bg.ori r7, r0, 0xfffc
    bn.and r4, r4, r7
    bg.ori r5, r0, 0x7fff
    bg.jal 0x23e152
    bn.j loc_22b843
loc_22ba78:
    bn.addi r10, r15, 0xe
    bn.addi r4, r13, 0x3
    bt.mov r3, r10
    bg.ori r6, r0, 0xfffc
    bn.and r4, r4, r6
    bg.ori r5, r0, 0x7fff
    bg.jal 0x23e4a6
    bn.j loc_22b843
loc_22ba92:
    bn.lwz r7, 0x8(r6)
    bg.bnei r7, 0x1, loc_22b897
    bn.lwz r7, 0x4(r6)
    bg.bnei r7, 0x2, loc_22b897
    bg.lbz r14, 0x5210(r14)
    bn.bnei r14, 0x0, loc_22bab7
    bt.mov r3, r10
    bn.exthz r4, r4
    bg.ori r5, r0, 0x7fff
    bg.jal 0x23e152
    bn.j loc_22b89f
loc_22bab7:
    bn.addi r4, r13, 0x1f
    bt.mov r3, r10
    bg.ori r6, r0, 0xffe0
    bn.and r4, r4, r6
    bg.ori r5, r0, 0x7fff
    bg.jal 0x23e4a6
    bn.j loc_22b89f
