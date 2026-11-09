# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x22cae2,0x22d986); byte-exact only; hardware untested.
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
    bt.mov r16, r3
    bn.ori r7, r0, 0x7c
    bn.muls r10, r3, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r10, r5
    bn.lwz r17, 0x4(r10)
    bg.jal 0x2227ef
    bt.mov r18, r3
    bn.ori r7, r0, 0xa8
    bn.muls r23, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r23, r6
    bn.lbz r22, 0x2f(r23)
    bn.lh r5, 0x14(r23)
    bg.bleui r5, 0x1, loc_22cd06
    bn.lh r7, 0x16(r23)
    bg.bleui r7, 0x1, loc_22cd06
    bn.lh r6, 0x40(r10)
    bg.bleui r6, 0x1, loc_22cd06
    bn.lh r3, 0x42(r10)
    bg.bleui r3, 0x1, loc_22cd06
    bn.lh r8, 0x1c(r23)
    bg.bleui r8, 0x1, loc_22cd06
    bn.lh r7, 0x1e(r23)
    bg.bleui r7, 0x1, loc_22cd06
    bn.srli r7, r5, 0x1
    bn.lbz r23, 0x38(r23)
    bn.sfnei r23, 0x0
    bn.cmov_0 r23, r7, r5
    bn.ori r7, r0, 0xa8
    bn.muls r7, r18, r7
    bg.movhi r8, 0x48
    bg.addi r8, r8, 0x21ec
    bt.add r7, r8
    bn.lbz r7, 0x29(r7)
    bt.addi r7, -0x1
    bn.extbz r7, r7
    bn.sfgtui r7, 0x1
    bn.cmov_0 r7, r6, r3
    bt.movi r13, 0x0
    bn.sw 0xc(r1), r0
    bg.ble r23, r7, loc_22cbc0
    bt.mov r3, r7
    bt.movi r4, 0x0
    bn.srli r7, r7, 0xc
    bn.slli r4, r4, 0x14
    bn.or r4, r7, r4
    bn.slli r3, r3, 0x14
    bt.mov r5, r23
    bt.movi r6, 0x0
    bg.jal 0x2ab331
    bt.addi r3, 0x1
    bg.movhi r5, 0x8000
    bn.or r13, r3, r5
    bt.movi r6, 0x1
    bn.sw 0xc(r1), r6
loc_22cbc0:
    bn.andi r21, r16, 0x1
    bg.beqi r21, 0x0, loc_22cd35
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.bnei r7, 0x0, loc_22d058
    bn.movhi_2 r5, 0x280
    bn.ori r5, r5, 0x8
    bn.add r3, r17, r5
    bt.mov r4, r13
    bg.jal 0x23e2b8
    bt.j loc_22cd50
loc_22cbe4:
    bn.lh r5, 0x14(r14)
    bn.srli r5, r5, 0x1
    bn.ori r6, r0, 0x7c
    bn.muls r6, r16, r6
    bg.movhi r8, 0x48
    bg.addi r8, r8, -0x564
    bt.add r6, r8
    bn.lh r7, 0x1c(r14)
    bn.srli r7, r7, 0x1
    bn.slli r7, r7, 0x5
    bn.divu r7, r7, r5
    bn.sbz 0x58(r6), r7
    bn.lh r7, 0x40(r6)
    bn.slli r7, r7, 0x5
    bn.divu r7, r7, r5
    bn.sbz 0x59(r6), r7
    bn.sw 0x8(r1), r0
loc_22cc18:
    bg.beqi r21, 0x0, loc_22d5a3
loc_22cc1c:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_22d6bf
    bn.movhi_2 r8, 0x280
    bn.ori r8, r8, 0x4
    bn.add r3, r17, r8
    bn.lwz r4, 0x8(r1)
    bg.jal 0x23e50c
loc_22cc38:
    bn.ori r7, r0, 0xa8
    bn.muls r3, r18, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r3, r5
    bg.lbz r6, 0x84(r3)
    bg.beqi r6, 0x0, loc_22d554
    bn.lwz r8, 0xc(r1)
    bn.andi r7, r8, 0x2
    bg.beqi r7, 0x0, loc_22d6b8
    bn.lwz r5, 0x4(r1)
    bg.movhi r6, 0x7fff
    bg.ori r6, r6, 0xffff
    bn.and r7, r5, r6
    bg.lhz r3, 0x92(r3)
    bn.muls r7, r7, r3
    bn.srli r10, r7, 0x14
loc_22cc72:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r18, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lh r11, 0x1e(r7)
    bt.movi r7, 0x0
    bg.beq r10, r11, loc_22ccd0
    bn.lwz r7, 0xc(r1)
    bn.ori r6, r7, 0x20
    bn.ori r7, r7, 0x10
    bn.sfleu r10, r11
    bn.cmov_0 r7, r7, r6
    bn.sw 0xc(r1), r7
    bg.movhi r8, 0x2080
    bn.ori r8, r8, 0x47
    bn.add r3, r17, r8
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x8
    bg.beqi r3, 0x0, loc_22d5c2
    bt.movi r4, 0x0
    bn.srli r7, r10, 0xc
    bn.slli r4, r4, 0x14
    bn.or r4, r7, r4
    bn.slli r3, r10, 0x14
    bt.mov r5, r11
    bt.movi r6, 0x0
    bg.jal 0x2ab331
    bt.addi r3, 0x1
    bn.movhi_2 r5, 0x100
    bn.or r7, r3, r5
loc_22ccd0:
    bg.beqi r21, 0x0, loc_22d56a
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_22d6d2
    bg.movhi r8, 0x2380
    bn.ori r8, r8, 0x12
    bn.add r3, r17, r8
    bt.mov r4, r7
    bg.jal 0x23e50c
loc_22ccf0:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r16, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lwz r8, 0xc(r1)
    bn.sw 0x5c(r7), r8
loc_22cd06:
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
loc_22cd35:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_22d046
    bn.movhi_2 r7, 0x480
    bn.ori r7, r7, 0x8
    bn.add r3, r17, r7
    bt.mov r4, r13
    bg.jal 0x23e50c
loc_22cd50:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r18, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lh r11, 0x16(r7)
    bn.lbz r7, 0x29(r7)
    bt.addi r7, -0x1
    bn.extbz r7, r7
    bg.bleui r7, 0x1, loc_22d75a
    bn.ori r7, r0, 0x7c
    bn.muls r7, r16, r7
    bg.movhi r8, 0x48
    bg.addi r8, r8, -0x564
    bt.add r7, r8
    bn.lh r10, 0x42(r7)
loc_22cd82:
    bn.sw 0x4(r1), r0
    bt.movi r12, 0x0
    bg.ble r11, r10, loc_22cdbd
    bt.movi r4, 0x0
    bn.srli r7, r10, 0xc
    bn.slli r4, r4, 0x14
    bn.or r4, r7, r4
    bn.slli r3, r10, 0x14
    bt.mov r5, r11
    bt.movi r6, 0x0
    bg.jal 0x2ab331
    bt.addi r3, 0x1
    bg.movhi r5, 0x8000
    bn.or r5, r3, r5
    bn.sw 0x4(r1), r5
    bn.lwz r6, 0xc(r1)
    bn.ori r6, r6, 0x2
    bn.sw 0xc(r1), r6
    bg.movhi r7, 0x4000
    bn.and r12, r5, r7
loc_22cdbd:
    bt.movhi r3, -0x10
    bg.ori r3, r3, 0x1f12
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x1f
    bg.jal 0x23dfe1
    bt.mov r3, r16
    bt.movi r4, 0x0
    bt.movi r5, 0x0
    bg.jal 0x225aa2
    bt.mov r3, r16
    bt.movi r4, 0x0
    bt.movi r5, 0x0
    bg.jal 0x225b47
    bg.beqi r21, 0x0, loc_22d3b9
    bg.movhi r8, 0x45
    bg.lbz r8, 0x5210(r8)
    bg.beqi r8, 0x0, loc_22d667
    bn.movhi_2 r5, 0x280
    bn.ori r5, r5, 0x10
    bn.add r3, r17, r5
    bn.lwz r4, 0x4(r1)
    bg.jal 0x23e50c
loc_22ce00:
    bg.bnei r12, 0x0, loc_22d3d9
loc_22ce04:
    bn.ori r7, r0, 0xa8
    bn.muls r3, r18, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r3, r6
    bg.lbz r7, 0x84(r3)
    bg.beqi r7, 0x0, loc_22d405
loc_22ce1c:
    bn.lwz r8, 0xc(r1)
    bn.andi r7, r8, 0x1
    bg.beqi r7, 0x0, loc_22d67a
    bg.movhi r5, 0x7fff
    bg.ori r5, r5, 0xffff
    bn.and r7, r13, r5
    bg.lhz r3, 0x90(r3)
    bn.muls r7, r7, r3
    bn.srli r10, r7, 0x14
loc_22ce3b:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r18, r7
    bg.movhi r8, 0x48
    bg.addi r8, r8, 0x21ec
    bt.add r7, r8
    bn.lbz r6, 0x38(r7)
    bn.slli r5, r10, 0x1
    bn.sfnei r6, 0x0
    bn.cmov_0 r10, r5, r10
    bn.lh r13, 0x1c(r7)
    bn.movhi_2 r4, 0x110
    bg.beq r10, r13, loc_22ceb3
    bn.lwz r5, 0xc(r1)
    bn.ori r6, r5, 0x8
    bn.ori r7, r5, 0x4
    bn.sfleu r10, r13
    bn.cmov_0 r7, r7, r6
    bn.sw 0xc(r1), r7
    bn.divu r6, r13, r10
    bn.muls r7, r6, r10
    bg.bne r13, r7, loc_22d392
    bg.bgtui r6, 0x3, loc_22d392
    bt.movi r4, 0x0
    bn.srli r7, r10, 0xc
    bn.slli r4, r4, 0x14
    bn.or r4, r7, r4
    bn.slli r3, r10, 0x14
    bt.mov r5, r13
    bt.movi r6, 0x0
    bg.jal 0x2ab331
loc_22ce97:
    bn.movhi_2 r8, 0xff
    bg.ori r8, r8, 0xffff
    bn.and r6, r3, r8
    bn.movhi_2 r5, 0x100
    bn.or r6, r6, r5
    bn.movhi_2 r8, 0xf00
    bn.and r7, r3, r8
    bn.slli r7, r7, 0x4
    bn.or r4, r7, r6
loc_22ceb3:
    bg.beqi r21, 0x0, loc_22d41b
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_22d720
    bg.movhi r6, 0x2380
    bn.ori r6, r6, 0xe
    bn.add r3, r17, r6
    bg.jal 0x23e50c
loc_22ced1:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_22d654
    bg.movhi r8, 0x2380
    bn.ori r8, r8, 0x2
    bn.add r3, r17, r8
    bt.movi r4, 0x0
    bg.jal 0x23e50c
loc_22ceed:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r18, r7
    bg.movhi r8, 0x48
    bg.addi r8, r8, 0x21ec
    bt.add r7, r8
    bn.lbz r12, 0x29(r7)
    bt.movi r14, 0x0
    bg.beqi r12, 0x1, loc_22d46a
loc_22cf06:
    bn.ori r7, r0, 0x7c
    bn.muls r5, r16, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r5, r7
    bn.lbz r8, 0x60(r5)
    bg.beqi r8, 0x0, loc_22d49d
    bn.slli r7, r10, 0x4
    bn.divu r7, r7, r13
    bn.exthz r6, r7
    bn.lh r7, 0x44(r5)
    bg.ble r7, r6, loc_22d731
    bn.sub r7, r7, r6
    bn.exthz r11, r7
    bn.ori r7, r0, 0x10
    bn.sbz 0x58(r5), r7
    bt.movi r20, 0x0
    bn.sfgtui r11, 0x3f
    bn.bnf loc_22cf4b
    bn.addi r7, r11, -0x40
    bg.ori r5, r0, 0xffc0
    bn.and r20, r7, r5
loc_22cf4b:
    bg.beq r10, r13, loc_22d06a
    bg.beqi r11, 0x0, loc_22d06a
    bn.ori r7, r0, 0xa8
    bn.muls r7, r18, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lh r19, 0x1c(r7)
    bn.ori r7, r0, 0x7c
    bn.muls r7, r16, r7
    bg.movhi r8, 0x48
    bg.addi r8, r8, -0x564
    bt.add r7, r8
    bn.lh r11, 0x50(r7)
    bn.lh r15, 0x62(r7)
    bn.divu r6, r13, r10
    bn.muls r7, r6, r10
    bg.bne r13, r7, loc_22d923
    bg.bgtui r6, 0x3, loc_22d923
    bt.movi r4, 0x0
    bn.srli r7, r10, 0xc
    bn.slli r4, r4, 0x14
    bn.or r4, r7, r4
    bn.slli r3, r10, 0x14
    bt.mov r5, r13
    bt.movi r6, 0x0
    bg.jal 0x2ab331
loc_22cfa0:
    bn.sub r5, r19, r11
    bt.addi r5, -0x10
    bn.sub r5, r5, r15
    bt.movi r6, 0x0
    bg.jal 0x2aacb9
    bn.srli r6, r3, 0x14
    bt.movhi r8, 0xf
    bg.ori r8, r8, 0xffff
    bn.and r19, r3, r8
    bn.ori r7, r0, 0x7c
    bn.muls r7, r16, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lh r7, 0x64(r7)
    bt.add r6, r7
    bn.exthz r11, r6
    bn.sub r7, r11, r20
    bn.extbz r5, r7
    bt.mov r15, r7
loc_22cfda:
    bg.beqi r21, 0x0, loc_22d078
loc_22cfde:
    bn.addi r7, r12, -0x1
    bn.extbz r7, r7
    bg.bleui r7, 0x1, loc_22d96f
loc_22cfe8:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_22d7b5
    bn.add r4, r5, r14
    bg.movhi r7, 0x2080
    bn.ori r7, r7, 0x3a
    bn.add r3, r17, r7
    bn.andi r4, r4, 0xfc
    bg.jal 0x23e5d1
loc_22d008:
    bn.add r7, r15, r14
    bn.srai r6, r7, 0x1f
    bn.srli r6, r6, 0x1e
    bt.add r7, r6
    bn.andi r7, r7, 0x3
    bn.sub r7, r7, r6
    bn.slli r7, r7, 0x14
    bn.or r12, r19, r7
    bg.sflesi r15, 0xef
    bn.bf loc_22d78b
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.bnei r5, 0x0, loc_22d861
    bg.movhi r7, 0x2080
    bn.ori r7, r7, 0x28
    bn.add r3, r17, r7
    bg.ori r4, r0, 0x30ff
    bg.jal 0x23dfb6
    bt.j loc_22d0af
loc_22d046:
    bn.movhi_2 r8, 0x480
    bn.ori r8, r8, 0x8
    bn.add r3, r17, r8
    bt.mov r4, r13
    bg.jal 0x23e2b8
    bn.j loc_22cd50
loc_22d058:
    bn.movhi_2 r8, 0x280
    bn.ori r8, r8, 0x8
    bn.add r3, r17, r8
    bt.mov r4, r13
    bg.jal 0x23e50c
    bn.j loc_22cd50
loc_22d06a:
    bn.sub r7, r11, r20
    bn.extbz r5, r7
    bt.mov r15, r7
    bt.movi r19, 0x0
    bg.bnei r21, 0x0, loc_22cfde
loc_22d078:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_22d82a
    bn.add r4, r5, r14
    bg.movhi r8, 0x2080
    bn.ori r8, r8, 0x3b
    bn.add r3, r17, r8
    bn.andi r4, r4, 0xfc
    bg.jal 0x23e5d1
loc_22d098:
    bn.add r7, r15, r14
    bn.srai r6, r7, 0x1f
    bn.srli r6, r6, 0x1e
    bt.add r7, r6
    bn.andi r7, r7, 0x3
    bn.sub r7, r7, r6
    bn.slli r7, r7, 0x14
    bn.or r12, r19, r7
loc_22d0af:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r16, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lh r7, 0x44(r7)
    bn.sub r7, r7, r20
    bn.exthz r6, r7
    bn.ori r7, r0, 0x7c
    bn.muls r23, r16, r7
    bg.movhi r8, 0x48
    bg.addi r8, r8, -0x564
    bt.add r23, r8
    bn.lbz r5, 0x60(r23)
    bg.bnei r5, 0x0, loc_22d4fb
loc_22d0df:
    bn.lh r5, 0x40(r23)
    bn.lh r6, 0x48(r23)
    bg.beq r5, r6, loc_22d77f
    bn.slli r7, r10, 0x4
    bn.divu r7, r7, r13
    bt.addi r7, 0x1
    bn.exthz r4, r7
    bn.sub r7, r5, r6
    bn.exthz r5, r7
    bg.ble r4, r5, loc_22d770
    bn.add r7, r5, r14
    bn.sbz 0x55(r23), r7
    bn.muls r7, r13, r5
    bn.divu r7, r7, r10
    bn.sbz 0x58(r23), r7
loc_22d10d:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r16, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.sbz 0x54(r7), r0
    bn.ori r7, r0, 0xa8
    bn.muls r7, r18, r7
    bg.movhi r8, 0x48
    bg.addi r8, r8, 0x21ec
    bt.add r7, r8
    bn.lbz r7, 0x38(r7)
    bg.bnei r7, 0x0, loc_22d518
loc_22d137:
    bg.beqi r21, 0x0, loc_22d535
loc_22d13b:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_22d61b
    bg.movhi r7, 0x2380
    bn.ori r7, r7, 0x2
    bn.add r3, r17, r7
    bt.mov r4, r12
    bg.jal 0x23e50c
loc_22d157:
    bn.ori r7, r0, 0xa8
    bn.muls r14, r18, r7
    bg.movhi r8, 0x48
    bg.addi r8, r8, 0x21ec
    bt.add r14, r8
    bn.sw 0x8(r1), r0
    bn.lbz r5, 0x38(r14)
    bg.beqi r5, 0x0, loc_22cc18
    bn.andi r7, r16, 0x2
    bg.beqi r7, 0x0, loc_22cbe4
    bn.lh r5, 0x14(r14)
    bn.srli r5, r5, 0x1
    bn.ori r7, r0, 0x7c
    bn.muls r7, r16, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lh r20, 0x40(r7)
    bt.mov r12, r20
    bt.movi r13, 0x0
    bn.addi r10, r5, -0x20
    bt.movi r11, 0x0
    bn.srli r7, r20, 0xc
    bn.slli r4, r13, 0x14
    bn.or r4, r7, r4
    bn.slli r3, r20, 0x14
    bt.movi r6, 0x0
    bg.jal 0x2ab331
    bt.mov r5, r3
    bt.mov r6, r4
    bt.addi r5, 0x1
    bn.addc r6, r6, r0
    bt.mov r3, r10
    bt.mov r4, r11
    bg.jal 0x2aacb9
    bn.sw 0x14(r1), r3
    bt.movhi r7, 0xf
    bg.ori r7, r7, 0xffff
    bn.and r7, r3, r7
    bn.sw 0x8(r1), r7
    bn.lh r7, 0x1c(r14)
    bn.srli r19, r7, 0x1
    bn.slli r22, r19, 0x1
    bt.mov r14, r22
    bt.movi r15, 0x0
    bn.srli r7, r20, 0x1f
    bn.slli r11, r13, 0x1
    bn.or r11, r7, r11
    bn.slli r10, r20, 0x1
    bt.mov r3, r22
    bt.mov r4, r15
    bt.mov r5, r10
    bt.mov r6, r11
    bg.jal 0x2ab6d2
    bn.or r4, r3, r4
    bn.bnei r4, 0x0, loc_22d207
    bt.mov r3, r22
    bt.mov r4, r15
    bt.mov r5, r10
    bt.mov r6, r11
    bg.jal 0x2ab331
    bg.bleui r4, 0x0, loc_22d841
loc_22d207:
    bn.srli r7, r12, 0xb
    bn.slli r4, r13, 0x15
    bn.or r4, r7, r4
    bn.slli r3, r12, 0x15
    bn.addi r5, r22, -0x1
    bt.movi r6, 0x0
    bg.movhi r7, 0xfff0
    bt.movi r8, -0x1
    bt.add r3, r7
    bn.addc r4, r4, r8
    bg.jal 0x2ab331
    bn.addi r5, r3, 0x1
loc_22d22a:
    bn.lwz r8, 0x14(r1)
    bn.srli r7, r8, 0x14
    bn.sub r7, r20, r7
    bn.exthz r7, r7
    bn.sub r3, r20, r7
    bn.muls r7, r19, r3
    bn.divu r7, r7, r20
    bn.sub r7, r19, r7
    bn.exthz r6, r7
    bn.sub r7, r19, r6
    bn.muls r4, r5, r7
    bn.srli r7, r4, 0x14
    bg.ble r3, r7, loc_22d261
loc_22d252:
    bt.add r4, r5
    bn.addi r7, r6, -0x1
    bn.exthz r6, r7
    bn.srli r7, r4, 0x14
    bg.bgt r3, r7, loc_22d252
loc_22d261:
    bt.movhi r5, 0xf
    bg.ori r5, r5, 0xffff
    bn.and r5, r4, r5
    bn.sw 0x10(r1), r5
    bn.sfleui r6, 0x10
    bn.bf loc_22d28a
    bn.ori r7, r0, 0x7c
    bn.muls r5, r16, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r5, r7
    bn.lbz r8, 0xc(r5)
    bg.bnei r8, 0x0, loc_22d876
loc_22d28a:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r16, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.sbz 0x58(r7), r6
    bt.movi r22, 0x0
loc_22d29f:
    bg.beqi r21, 0x0, loc_22d7cc
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.bnei r6, 0x0, loc_22d885
    bg.movhi r8, 0x2380
    bn.ori r8, r8, 0x2
    bn.add r3, r17, r8
    bn.lwz r4, 0x10(r1)
    bg.jal 0x23e2b8
loc_22d2c0:
    bn.ori r6, r0, 0x7c
    bn.muls r6, r16, r6
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r6, r5
    bn.lh r23, 0x40(r6)
    bn.slli r5, r23, 0x5
    bn.ori r7, r0, 0xa8
    bn.muls r4, r18, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r4, r7
    bn.lh r7, 0x14(r4)
    bn.srli r7, r7, 0x1
    bn.divu r5, r5, r7
    bn.sbz 0x59(r6), r5
    bg.beqi r22, 0x0, loc_22cc18
    bn.lh r7, 0x1c(r4)
    bn.srli r19, r7, 0x1
    bn.slli r20, r19, 0x1
    bt.mov r14, r20
    bt.movi r15, 0x0
    bt.mov r12, r23
    bt.movi r13, 0x0
    bn.srli r7, r23, 0x1f
    bn.slli r11, r13, 0x1
    bn.or r11, r7, r11
    bn.slli r10, r23, 0x1
    bt.mov r3, r20
    bt.mov r4, r15
    bt.mov r5, r10
    bt.mov r6, r11
    bg.jal 0x2ab6d2
    bn.or r4, r3, r4
    bg.bnei r4, 0x0, loc_22d8cb
    bt.mov r3, r20
    bt.mov r4, r15
    bt.mov r5, r10
    bt.mov r6, r11
    bg.jal 0x2ab331
    bg.bgtui r4, 0x0, loc_22d8cb
    bn.bnei r4, 0x0, loc_22d33d
    bg.bgtui r3, 0x3, loc_22d8cb
loc_22d33d:
    bn.srli r7, r12, 0xb
    bn.slli r4, r13, 0x15
    bn.or r4, r7, r4
    bn.slli r3, r12, 0x15
    bt.mov r5, r14
    bt.mov r6, r15
    bg.jal 0x2ab331
loc_22d351:
    bn.addi r6, r19, -0x10
    bn.muls r6, r3, r6
    bn.srli r6, r6, 0x14
    bn.sub r7, r19, r22
    bt.addi r7, -0x10
    bn.muls r7, r3, r7
    bn.srli r7, r7, 0x14
    bn.sub r6, r6, r7
    bn.slli r6, r6, 0x14
    bn.lwz r8, 0x10(r1)
    bn.or r4, r6, r8
    bg.beqi r21, 0x0, loc_22d589
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_22d94d
    bg.movhi r6, 0x2380
    bn.ori r6, r6, 0x2
    bn.add r3, r17, r6
    bg.jal 0x23e50c
    bn.j loc_22cc1c
loc_22d392:
    bt.movi r4, 0x0
    bn.srli r7, r10, 0xc
    bn.slli r4, r4, 0x14
    bn.or r4, r7, r4
    bn.slli r3, r10, 0x14
    bn.addi r5, r13, -0x1
    bt.movi r6, 0x0
    bg.movhi r7, 0xfff0
    bt.movi r8, -0x1
    bt.add r3, r7
    bn.addc r4, r4, r8
    bg.jal 0x2ab331
    bt.addi r3, 0x1
    bn.j loc_22ce97
loc_22d3b9:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_22d681
    bn.movhi_2 r8, 0x480
    bn.ori r8, r8, 0x10
    bn.add r3, r17, r8
    bn.lwz r4, 0x4(r1)
    bg.jal 0x23e50c
    bg.beqi r12, 0x0, loc_22ce04
loc_22d3d9:
    bt.mov r3, r16
    bt.mov r4, r11
    bt.movi r5, 0x1
    bg.jal 0x225aa2
    bt.mov r3, r16
    bt.mov r4, r10
    bt.movi r5, 0x1
    bg.jal 0x225b47
    bn.ori r7, r0, 0xa8
    bn.muls r3, r18, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r3, r6
    bg.lbz r7, 0x84(r3)
    bg.bnei r7, 0x0, loc_22ce1c
loc_22d405:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r16, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lh r10, 0x40(r7)
    bn.j loc_22ce3b
loc_22d41b:
    bg.movhi r8, 0x45
    bg.lbz r8, 0x5210(r8)
    bg.beqi r8, 0x0, loc_22d6a7
    bg.movhi r5, 0x2380
    bn.ori r5, r5, 0x4e
    bn.add r3, r17, r5
    bg.jal 0x23e50c
loc_22d435:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_22d694
    bg.movhi r6, 0x2380
    bn.ori r6, r6, 0x42
    bn.add r3, r17, r6
    bt.movi r4, 0x0
    bg.jal 0x23e50c
    bn.ori r7, r0, 0xa8
    bn.muls r7, r18, r7
    bg.movhi r8, 0x48
    bg.addi r8, r8, 0x21ec
    bt.add r7, r8
    bn.lbz r12, 0x29(r7)
    bt.movi r14, 0x0
    bg.bnei r12, 0x1, loc_22cf06
loc_22d46a:
    bg.beqi r22, 0x4, loc_22d8f0
    bn.ori r7, r0, 0x7c
    bn.muls r7, r16, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lh r6, 0x40(r7)
    bn.andi r6, r6, 0x7
    bt.movi r7, 0x8
    bn.sub r7, r7, r6
    bn.srai r6, r7, 0x1f
    bn.srli r6, r6, 0x1d
    bt.add r7, r6
    bn.andi r7, r7, 0x7
    bn.sub r7, r7, r6
    bn.exthz r14, r7
    bn.j loc_22cf06
loc_22d49d:
    bg.beqi r21, 0x0, loc_22d6f8
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bg.beqi r7, 0x0, loc_22d7ec
    bg.movhi r8, 0x2080
    bn.ori r8, r8, 0x3a
    bn.add r3, r17, r8
    bn.andi r4, r14, 0xfc
    bg.jal 0x23e5d1
loc_22d4be:
    bn.andi r7, r14, 0x3
    bn.slli r12, r7, 0x14
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_22d813
    bg.movhi r7, 0x2080
    bn.ori r7, r7, 0x28
    bn.add r3, r17, r7
    bg.ori r4, r0, 0x3030
    bg.jal 0x23e58a
    bt.movi r6, 0x0
loc_22d4e4:
    bn.ori r7, r0, 0x7c
    bn.muls r23, r16, r7
    bg.movhi r8, 0x48
    bg.addi r8, r8, -0x564
    bt.add r23, r8
    bn.lbz r5, 0x60(r23)
    bg.beqi r5, 0x0, loc_22d0df
loc_22d4fb:
    bn.sbz 0x54(r23), r6
    bn.sbz 0x55(r23), r0
loc_22d501:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r18, r7
    bg.movhi r8, 0x48
    bg.addi r8, r8, 0x21ec
    bt.add r7, r8
    bn.lbz r7, 0x38(r7)
    bg.beqi r7, 0x0, loc_22d137
loc_22d518:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r16, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.sbz 0x54(r7), r0
    bn.sbz 0x55(r7), r0
    bn.sbz 0x58(r7), r0
    bg.bnei r21, 0x0, loc_22d13b
loc_22d535:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_22d62e
    bg.movhi r6, 0x2380
    bn.ori r6, r6, 0x42
    bn.add r3, r17, r6
    bt.mov r4, r12
    bg.jal 0x23e50c
    bn.j loc_22d157
loc_22d554:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r16, r7
    bg.movhi r8, 0x48
    bg.addi r8, r8, -0x564
    bt.add r7, r8
    bn.lh r10, 0x42(r7)
    bn.j loc_22cc72
loc_22d56a:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_22d6e5
    bg.movhi r8, 0x2380
    bn.ori r8, r8, 0x52
    bn.add r3, r17, r8
    bt.mov r4, r7
    bg.jal 0x23e50c
    bn.j loc_22ccf0
loc_22d589:
    bg.movhi r8, 0x45
    bg.lbz r8, 0x5210(r8)
    bg.beqi r8, 0x0, loc_22d95e
    bg.movhi r5, 0x2380
    bn.ori r5, r5, 0x42
    bn.add r3, r17, r5
    bg.jal 0x23e50c
loc_22d5a3:
    bg.movhi r6, 0x45
    bg.lbz r6, 0x5210(r6)
    bg.beqi r6, 0x0, loc_22d641
    bn.movhi_2 r7, 0x480
    bn.ori r7, r7, 0x4
    bn.add r3, r17, r7
    bn.lwz r4, 0x8(r1)
    bg.jal 0x23e50c
    bn.j loc_22cc38
loc_22d5c2:
    bn.divu r6, r11, r10
    bn.muls r7, r6, r10
    bg.bne r11, r7, loc_22d5ee
    bn.bgtui r6, 0x3, loc_22d5ee
    bt.movi r4, 0x0
    bn.srli r7, r10, 0xc
    bn.slli r4, r4, 0x14
    bn.or r4, r7, r4
    bn.slli r3, r10, 0x14
    bt.mov r5, r11
    bt.movi r6, 0x0
    bg.jal 0x2ab331
    bn.movhi_2 r5, 0x100
    bn.or r7, r3, r5
    bn.j loc_22ccd0
loc_22d5ee:
    bt.movi r4, 0x0
    bn.srli r7, r10, 0xc
    bn.slli r4, r4, 0x14
    bn.or r4, r7, r4
    bn.slli r3, r10, 0x14
    bn.addi r5, r11, -0x1
    bt.movi r6, 0x0
    bg.movhi r7, 0xfff0
    bt.movi r8, -0x1
    bt.add r3, r7
    bn.addc r4, r4, r8
    bg.jal 0x2ab331
    bt.addi r3, 0x1
    bn.movhi_2 r8, 0x100
    bn.or r7, r3, r8
    bn.j loc_22ccd0
loc_22d61b:
    bg.movhi r8, 0x2380
    bn.ori r8, r8, 0x2
    bn.add r3, r17, r8
    bt.mov r4, r12
    bg.jal 0x23e2b8
    bn.j loc_22d157
loc_22d62e:
    bg.movhi r7, 0x2380
    bn.ori r7, r7, 0x42
    bn.add r3, r17, r7
    bt.mov r4, r12
    bg.jal 0x23e2b8
    bn.j loc_22d157
loc_22d641:
    bn.movhi_2 r8, 0x480
    bn.ori r8, r8, 0x4
    bn.add r3, r17, r8
    bn.lwz r4, 0x8(r1)
    bg.jal 0x23e2b8
    bn.j loc_22cc38
loc_22d654:
    bg.movhi r5, 0x2380
    bn.ori r5, r5, 0x2
    bn.add r3, r17, r5
    bt.movi r4, 0x0
    bg.jal 0x23e2b8
    bn.j loc_22ceed
loc_22d667:
    bn.movhi_2 r6, 0x280
    bn.ori r6, r6, 0x10
    bn.add r3, r17, r6
    bn.lwz r4, 0x4(r1)
    bg.jal 0x23e2b8
    bn.j loc_22ce00
loc_22d67a:
    bg.lhz r10, 0x90(r3)
    bn.j loc_22ce3b
loc_22d681:
    bn.movhi_2 r5, 0x480
    bn.ori r5, r5, 0x10
    bn.add r3, r17, r5
    bn.lwz r4, 0x4(r1)
    bg.jal 0x23e2b8
    bn.j loc_22ce00
loc_22d694:
    bg.movhi r7, 0x2380
    bn.ori r7, r7, 0x42
    bn.add r3, r17, r7
    bt.movi r4, 0x0
    bg.jal 0x23e2b8
    bn.j loc_22ceed
loc_22d6a7:
    bg.movhi r6, 0x2380
    bn.ori r6, r6, 0x4e
    bn.add r3, r17, r6
    bg.jal 0x23e2b8
    bn.j loc_22d435
loc_22d6b8:
    bg.lhz r10, 0x92(r3)
    bn.j loc_22cc72
loc_22d6bf:
    bn.movhi_2 r5, 0x280
    bn.ori r5, r5, 0x4
    bn.add r3, r17, r5
    bn.lwz r4, 0x8(r1)
    bg.jal 0x23e2b8
    bn.j loc_22cc38
loc_22d6d2:
    bg.movhi r5, 0x2380
    bn.ori r5, r5, 0x12
    bn.add r3, r17, r5
    bt.mov r4, r7
    bg.jal 0x23e2b8
    bn.j loc_22ccf0
loc_22d6e5:
    bg.movhi r5, 0x2380
    bn.ori r5, r5, 0x52
    bn.add r3, r17, r5
    bt.mov r4, r7
    bg.jal 0x23e2b8
    bn.j loc_22ccf0
loc_22d6f8:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.beqi r5, 0x0, loc_22d800
    bg.movhi r6, 0x2080
    bn.ori r6, r6, 0x3b
    bn.add r3, r17, r6
    bn.andi r4, r14, 0xfc
    bg.jal 0x23e5d1
loc_22d715:
    bn.andi r7, r14, 0x3
    bn.slli r12, r7, 0x14
    bt.movi r6, 0x0
    bn.j loc_22d4e4
loc_22d720:
    bg.movhi r7, 0x2380
    bn.ori r7, r7, 0xe
    bn.add r3, r17, r7
    bg.jal 0x23e2b8
    bn.j loc_22ced1
loc_22d731:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r18, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lbz r7, 0x1c(r7)
    bn.lbz r8, 0x50(r5)
    bn.sub r7, r7, r8
    bn.sbz 0x58(r5), r7
    bt.movi r19, 0x0
    bt.movi r11, 0x0
    bt.movi r20, 0x0
    bt.movi r5, 0x0
    bt.movi r15, 0x0
    bn.j loc_22cfda
loc_22d75a:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r16, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lh r10, 0x40(r7)
    bn.j loc_22cd82
loc_22d770:
    bn.add r7, r4, r14
    bn.sbz 0x55(r23), r7
    bn.ori r7, r0, 0x10
    bn.sbz 0x58(r23), r7
    bn.j loc_22d10d
loc_22d77f:
    bn.sbz 0x54(r23), r0
    bn.sbz 0x55(r23), r0
    bn.sbz 0x58(r23), r0
    bn.j loc_22d501
loc_22d78b:
    bg.movhi r8, 0x45
    bg.lbz r8, 0x5210(r8)
    bg.bnei r8, 0x0, loc_22d8ad
    bn.sub r4, r11, r20
    bn.addi r4, r4, 0x10
    bg.ori r4, r4, 0x3000
    bg.movhi r6, 0x2080
    bn.ori r6, r6, 0x28
    bn.add r3, r17, r6
    bn.exthz r4, r4
    bg.jal 0x23dfb6
    bn.j loc_22d0af
loc_22d7b5:
    bn.add r4, r5, r14
    bg.movhi r8, 0x2080
    bn.ori r8, r8, 0x3a
    bn.add r3, r17, r8
    bn.andi r4, r4, 0xfc
    bg.jal 0x23ddb9
    bn.j loc_22d008
loc_22d7cc:
    bg.movhi r5, 0x45
    bg.lbz r5, 0x5210(r5)
    bg.bnei r5, 0x0, loc_22d899
    bg.movhi r7, 0x2380
    bn.ori r7, r7, 0x42
    bn.add r3, r17, r7
    bn.lwz r4, 0x10(r1)
    bg.jal 0x23e2b8
    bn.j loc_22d2c0
loc_22d7ec:
    bg.movhi r5, 0x2080
    bn.ori r5, r5, 0x3a
    bn.add r3, r17, r5
    bn.andi r4, r14, 0xfc
    bg.jal 0x23ddb9
    bn.j loc_22d4be
loc_22d800:
    bg.movhi r7, 0x2080
    bn.ori r7, r7, 0x3b
    bn.add r3, r17, r7
    bn.andi r4, r14, 0xfc
    bg.jal 0x23ddb9
    bt.j loc_22d715
loc_22d813:
    bg.movhi r8, 0x2080
    bn.ori r8, r8, 0x28
    bn.add r3, r17, r8
    bg.ori r4, r0, 0x3030
    bg.jal 0x23dfb6
    bt.movi r6, 0x0
    bn.j loc_22d4e4
loc_22d82a:
    bn.add r4, r5, r14
    bg.movhi r5, 0x2080
    bn.ori r5, r5, 0x3b
    bn.add r3, r17, r5
    bn.andi r4, r4, 0xfc
    bg.jal 0x23ddb9
    bn.j loc_22d098
loc_22d841:
    bn.bnei r4, 0x0, loc_22d848
    bg.bgtui r3, 0x3, loc_22d207
loc_22d848:
    bn.srli r7, r12, 0xb
    bn.slli r4, r13, 0x15
    bn.or r4, r7, r4
    bn.slli r3, r12, 0x15
    bt.mov r5, r14
    bt.mov r6, r15
    bg.jal 0x2ab331
    bt.mov r5, r3
    bn.j loc_22d22a
loc_22d861:
    bg.movhi r6, 0x2080
    bn.ori r6, r6, 0x28
    bn.add r3, r17, r6
    bg.ori r4, r0, 0x30ff
    bg.jal 0x23e58a
    bn.j loc_22d0af
loc_22d876:
    bn.ori r7, r0, 0x10
    bn.sbz 0x58(r5), r7
    bn.addi r7, r6, -0x10
    bn.exthz r22, r7
    bn.j loc_22d29f
loc_22d885:
    bg.movhi r7, 0x2380
    bn.ori r7, r7, 0x2
    bn.add r3, r17, r7
    bn.lwz r4, 0x10(r1)
    bg.jal 0x23e50c
    bn.j loc_22d2c0
loc_22d899:
    bg.movhi r6, 0x2380
    bn.ori r6, r6, 0x42
    bn.add r3, r17, r6
    bn.lwz r4, 0x10(r1)
    bg.jal 0x23e50c
    bn.j loc_22d2c0
loc_22d8ad:
    bn.sub r4, r11, r20
    bn.addi r4, r4, 0x10
    bg.ori r4, r4, 0x3000
    bg.movhi r5, 0x2080
    bn.ori r5, r5, 0x28
    bn.add r3, r17, r5
    bn.exthz r4, r4
    bg.jal 0x23e58a
    bn.j loc_22d0af
loc_22d8cb:
    bn.srli r7, r12, 0xb
    bn.slli r4, r13, 0x15
    bn.or r4, r7, r4
    bn.slli r3, r12, 0x15
    bn.addi r5, r20, -0x1
    bt.movi r6, 0x0
    bg.movhi r7, 0xfff0
    bt.movi r8, -0x1
    bt.add r3, r7
    bn.addc r4, r4, r8
    bg.jal 0x2ab331
    bt.addi r3, 0x1
    bn.j loc_22d351
loc_22d8f0:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r16, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lh r6, 0x40(r7)
    bt.movi r5, 0x7
    bn.divu r7, r6, r5
    bn.muls r7, r7, r5
    bn.sub r6, r6, r7
    bn.exthz r6, r6
    bn.sub r6, r5, r6
    bn.divs r7, r6, r5
    bn.muls r7, r7, r5
    bn.sub r6, r6, r7
    bn.exthz r14, r6
    bn.j loc_22cf06
loc_22d923:
    bt.movi r4, 0x0
    bn.srli r7, r10, 0xc
    bn.slli r4, r4, 0x14
    bn.or r4, r7, r4
    bn.slli r3, r10, 0x14
    bn.addi r5, r13, -0x1
    bt.movi r6, 0x0
    bg.movhi r7, 0xfff0
    bt.movi r8, -0x1
    bt.add r3, r7
    bn.addc r4, r4, r8
    bg.jal 0x2ab331
    bt.addi r3, 0x1
    bn.addc r4, r4, r0
    bn.j loc_22cfa0
loc_22d94d:
    bg.movhi r7, 0x2380
    bn.ori r7, r7, 0x2
    bn.add r3, r17, r7
    bg.jal 0x23e2b8
    bn.j loc_22cc1c
loc_22d95e:
    bg.movhi r6, 0x2380
    bn.ori r6, r6, 0x42
    bn.add r3, r17, r6
    bg.jal 0x23e2b8
    bn.j loc_22d5a3
loc_22d96f:
    bg.bnei r22, 0x4, loc_22cfe8
    bt.movi r6, 0x7
    bn.divu r7, r20, r6
    bn.muls r7, r7, r6
    bn.sub r7, r20, r7
    bt.add r7, r14
    bn.exthz r14, r7
    bn.j loc_22cfe8
