# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x25469c,0x254a70); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x64
    bn.sw 0x60(r1), r9
    bn.sw 0x5c(r1), r10
    bn.sw 0x58(r1), r11
    bn.sw 0x54(r1), r12
    bn.sw 0x50(r1), r13
    bn.sw 0x4c(r1), r14
    bn.sw 0x48(r1), r15
    bn.sw 0x44(r1), r16
    bn.sw 0x40(r1), r17
    bn.sw 0x3c(r1), r18
    bn.sw 0x38(r1), r19
    bt.mov r12, r3
    bn.sw 0x0(r1), r4
    bn.sw 0x4(r1), r5
    bt.mov r14, r6
    bn.lh r15, 0x6(r1)
    bn.lh r16, 0x4(r1)
    bn.beqi r6, 0x0, loc_2546dd
    bt.movi r6, 0x1
    bg.movhi r7, 0x45
    bg.sbz 0x3ca8(r7), r6
loc_2546dd:
    bn.ori r7, r0, 0xa8
    bn.muls r10, r12, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, 0x21ec
    bt.add r10, r4
    bn.lh r5, 0x2a(r10)
    bn.lh r6, 0x2c(r10)
    bn.or r7, r5, r6
    bn.andi r19, r7, 0xff
    bg.jal 0x2227da
    bt.mov r13, r3
    bn.sw 0x34(r1), r0
    bg.movhi r18, 0x3b
    bg.movhi r17, 0x48
    bg.addi r7, r17, -0x564
    bn.lwz r7, 0x4(r7)
    bg.sw_0 0x7430(r18), r7
    bt.mov r3, r12
    bn.addi r4, r1, 0x34
    bg.jal 0x23e697
    bn.lh r7, 0x1c(r10)
    bn.sh_1 0x14(r1), r7
    bn.lh r7, 0x1e(r10)
    bn.sh_2 0x16(r1), r7
    bt.mov r3, r12
    bg.jal 0x2227da
    bn.ori r11, r0, 0xb0
    bn.muls r3, r3, r11
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lbz r7, 0x20(r3)
    bn.andi r7, r7, 0x10
    bn.beqi r7, 0x0, loc_25477e
    bn.lbz r7, 0x29(r10)
    bt.addi r7, -0x1
    bn.extbz r7, r7
    bn.bleui r7, 0x1, loc_25477e
    bt.mov r3, r12
    bg.jal 0x2227da
    bn.muls r3, r3, r11
    bg.movhi r4, 0x3b
    bg.addi r4, r4, 0x4950
    bt.add r3, r4
    bn.lbz r7, 0x20(r3)
    bn.andi r7, r7, 0x10
    bn.bnei r7, 0x0, loc_254777
loc_254770:
    bt.movi r7, 0x1
    bn.sbz 0x9(r1), r7
    bt.j loc_254781
loc_254777:
    bg.lbz r10, 0xa4(r10)
    bn.beqi r10, 0x0, loc_254770
loc_25477e:
    bn.sbz 0x9(r1), r0
loc_254781:
    bn.ori r7, r0, 0xb0
    bn.muls r7, r13, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r7, r5
    bn.addi r3, r1, 0x18
    bn.lwz r4, 0x0(r7)
    bg.jal 0x20f12a
    bn.lwz r6, 0x18(r1)
    bn.sw 0x2c(r1), r6
    bg.movhi r4, 0x45
    bg.addi r4, r4, 0x786c
    bn.add r7, r12, r4
    bn.lbz r7, 0x0(r7)
    bg.beqi r7, 0x0, loc_254a24
    bt.movi r7, 0x1
    bn.sbz 0x28(r1), r7
    bn.sbz 0x30(r1), r0
loc_2547bb:
    bn.beqi r14, 0x0, loc_2547d1
    bg.beqi r6, 0x0, loc_254a2f
    bn.lwz r7, 0x34(r1)
    bn.sfnei r7, 0x0
    bn.lwz r7, 0x2c(r1)
    bn.cmov_0 r7, r7, r0
    bn.sw 0x2c(r1), r7
loc_2547d1:
    bg.movhi r5, 0x45
    bg.addi r5, r5, 0x3ca9
    bn.add r7, r12, r5
    bn.lbz r7, 0x0(r7)
    bn.beqi r7, 0x0, loc_2547e7
    bt.movi r7, 0x1
    bn.sw 0x2c(r1), r7
loc_2547e7:
    bg.movhi r7, 0x45
    bg.lhz r7, 0x51ec(r7)
    bn.andi r7, r7, 0x40
    bn.beqi r7, 0x0, loc_254800
    bn.lwz r7, 0x2c(r1)
    bg.beqi r7, 0x2, loc_254a56
    bg.beqi r7, 0x0, loc_254a56
loc_254800:
    bg.addi r7, r17, -0x564
    bn.lbz r23, 0xc(r7)
    bn.ori r7, r0, 0xb0
    bn.muls r7, r13, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bn.lh r5, 0x26(r7)
    bt.movi r6, 0x0
    bn.beqi r5, 0x0, loc_254839
    bn.lh r6, 0x22(r7)
    bg.ori r4, r0, 0x3e8
    bg.bnei r6, 0x0, loc_254a3e
loc_25482a:
    bn.srli r7, r5, 0x1
    bt.add r7, r4
    bn.divu r7, r7, r5
    bt.addi r7, 0x5
    bt.movi r6, 0xa
    bn.divu r6, r7, r6
loc_254839:
    bn.ori r7, r0, 0xb0
    bn.muls r7, r13, r7
    bg.movhi r4, 0x3b
    bg.addi r4, r4, 0x4950
    bt.add r7, r4
    bn.lbz r7, 0x20(r7)
    bn.andi r7, r7, 0x10
    bn.sfeqi r7, 0x0
    bn.ori r7, r0, 0x14
    bn.cmov_1 r7, r10, r7
    bn.muls r7, r6, r7
    bn.sh_1 0x10(r1), r7
    bn.sh_2 0xe(r1), r5
    bn.sbz 0x8(r1), r0
    bn.bnei r23, 0x0, loc_25486c
    bt.movi r7, 0x1
    bn.sbz 0x8(r1), r7
loc_25486c:
    bg.sfleui r15, 0x870
    bg.addi r7, r0, 0x870
    bn.cmov_0 r7, r15, r7
    bn.sh_1 0xc(r1), r7
    bg.sfleui r16, 0xf00
    bg.addi r7, r0, 0xf00
    bn.cmov_0 r7, r16, r7
    bn.sh_2 0xa(r1), r7
    bg.jal 0x21fb2b
    bn.bnei r14, 0x0, loc_254899
    bn.lh r7, 0xa(r1)
    bg.sfnei r7, 0xf00
    bn.bnf loc_254a5e
loc_254899:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r12, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lbz r7, 0x29(r7)
    bt.addi r7, -0x1
    bn.extbz r7, r7
    bn.sfgtui r7, 0x1
    bn.cmovsi_2 r15, r0, 0x1
    bt.movi r7, 0xa
    bn.muls r7, r3, r7
    bn.sh_2 0x12(r1), r7
    bt.mov r3, r12
    bg.jal 0x21bca6
    bg.movhi r7, 0x45
    bg.sbz 0x7491(r7), r3
    bt.mov r10, r19
    bt.movi r11, 0x0
    bn.slli r7, r12, 0x1
    bg.movhi r6, 0x45
    bg.addi r6, r6, 0x7870
    bn.add r16, r7, r6
    bg.movhi r4, 0x49
    bg.addi r4, r4, -0x58bc
    bn.add r13, r7, r4
    bg.movhi r5, 0x49
    bg.addi r5, r5, -0x58ac
    bn.add r12, r7, r5
    bt.j loc_254920
loc_2548f7:
    bt.movi r3, 0x0
    bn.addi r4, r1, 0x28
    bg.jal 0x2528dd
    bt.movi r3, 0x0
    bt.movi r4, 0x6
    bn.addi r5, r1, 0x8
    bg.jal 0x252917
    bt.movi r3, 0x0
    bt.movi r4, 0x6
    bg.jal 0x252dcb
    bg.bnei r14, 0x0, loc_2549d0
loc_254917:
    bn.srli r10, r10, 0x1
    bt.addi r11, 0x1
    bg.beqi r10, 0x0, loc_25499f
loc_254920:
    bn.extbz r6, r11
    bn.andi r7, r10, 0x1
    bn.beqi r7, 0x0, loc_254917
    bn.ori r7, r0, 0x7c
    bn.muls r7, r6, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x564
    bt.add r7, r4
    bn.lwz r7, 0x4(r7)
    bg.sw_0 0x7430(r18), r7
    bn.andi r7, r6, 0x1
    bn.bnei r7, 0x0, loc_2548f7
    bt.movi r3, 0x0
    bg.jal 0x25430b
    bt.movi r3, 0x1
    bn.addi r4, r1, 0x28
    bg.jal 0x2528dd
    bt.movi r3, 0x1
    bt.movi r4, 0x6
    bn.addi r5, r1, 0x8
    bg.jal 0x252917
    bt.movi r3, 0x1
    bt.movi r4, 0x6
    bg.jal 0x252dcb
    bn.beqi r14, 0x0, loc_254991
    bn.andi r7, r19, 0xa
    bg.beqi r7, 0x0, loc_2549fa
    bt.movi r3, 0x1
    bt.mov r4, r15
    bg.jal 0x25347a
    bt.movi r3, 0x1
    bn.lh r4, 0x0(r13)
    bn.ori r5, r0, 0x17
    bg.jal 0x252e20
    bt.movi r3, 0x1
    bn.lh r4, 0x0(r12)
    bt.movi r5, 0xe
    bg.jal 0x252e20
loc_254991:
    bt.movi r3, 0x1
    bg.jal 0x25430b
    bn.srli r10, r10, 0x1
    bt.addi r11, 0x1
    bn.bnei r10, 0x0, loc_254920
loc_25499f:
    bn.beqi r14, 0x0, loc_2549aa
    bg.movhi r7, 0x45
    bg.sbz 0x3ca8(r7), r0
loc_2549aa:
    bn.lwz r19, 0x38(r1)
    bn.lwz r18, 0x3c(r1)
    bn.lwz r17, 0x40(r1)
    bn.lwz r16, 0x44(r1)
    bn.lwz r15, 0x48(r1)
    bn.lwz r14, 0x4c(r1)
    bn.lwz r13, 0x50(r1)
    bn.lwz r12, 0x54(r1)
    bn.lwz r11, 0x58(r1)
    bn.lwz r10, 0x5c(r1)
    bn.lwz r9, 0x60(r1)
    bn.addi r1, r1, 0x64
    bt.jr r9
loc_2549d0:
    bt.movi r3, 0x0
    bg.jal 0x24f810
    bn.sh_1 0x0(r16), r3
    bt.movi r3, 0x0
    bt.mov r4, r15
    bg.jal 0x25347a
    bt.movi r3, 0x0
    bn.lh r4, 0x0(r13)
    bn.ori r5, r0, 0x17
    bg.jal 0x252e20
    bt.movi r3, 0x0
    bn.lh r4, 0x0(r12)
    bt.movi r5, 0xe
    bg.jal 0x252e20
    bt.j loc_254917
loc_2549fa:
    bt.movi r3, 0x1
    bg.jal 0x24f810
    bn.sh_1 0x0(r16), r3
    bt.movi r3, 0x1
    bt.mov r4, r15
    bg.jal 0x25347a
    bt.movi r3, 0x1
    bn.lh r4, 0x8(r13)
    bn.ori r5, r0, 0x17
    bg.jal 0x252e20
    bt.movi r3, 0x1
    bn.lh r4, 0x8(r12)
    bt.movi r5, 0xe
    bg.jal 0x252e20
    bt.j loc_254991
loc_254a24:
    bn.sbz 0x28(r1), r0
    bt.movi r7, 0x1
    bn.sbz 0x30(r1), r7
    bn.j loc_2547bb
loc_254a2f:
    bn.lwz r7, 0x34(r1)
    bg.beqi r7, 0x0, loc_2547d1
    bt.movi r7, 0x2
    bn.sw 0x2c(r1), r7
    bn.j loc_2547d1
loc_254a3e:
    bn.srli r7, r6, 0x1
    bt.movhi r4, 0x1
    bg.ori r4, r4, 0xd4c0
    bt.add r7, r4
    bn.divu r7, r7, r6
    bg.ori r6, r0, 0x3e8
    bn.muls r4, r7, r6
    bn.j loc_25482a
loc_254a56:
    bt.movi r7, 0x1
    bn.sw 0x2c(r1), r7
    bn.j loc_254800
loc_254a5e:
    bn.lh r6, 0xc(r1)
    bg.sfnei r6, 0x870
    bn.bf loc_254899
    bn.sh_1 0x14(r1), r7
    bn.sh_2 0x16(r1), r6
    bt.j loc_254899
