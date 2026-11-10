# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23d121,0x23d349); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x2c
    bn.sw 0x28(r1), r9
    bn.sw 0x24(r1), r10
    bn.sw 0x20(r1), r11
    bn.sw 0x1c(r1), r12
    bn.sw 0x18(r1), r13
    bn.sw 0x14(r1), r14
    bn.sw 0x10(r1), r15
    bn.sw 0xc(r1), r16
    bn.sw 0x8(r1), r17
    bt.mov r12, r3
    bg.jal 0x222819
    bt.mov r13, r3
    bt.mov r4, r12
    bg.jal 0x21f6c5
    bt.mov r17, r3
    bt.mov r3, r13
    bt.mov r4, r12
    bg.jal 0x21f5b1
    bt.mov r14, r3
    bn.ori r7, r0, 0xb0
    bn.muls r6, r12, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r6, r5
    bn.lwz r7, 0x4(r6)
    bg.ori r5, r0, 0x400
    bn.and r7, r7, r5
    bg.beqi r7, 0x0, loc_23d2ee
    bn.lbz r6, 0x70(r6)
    bg.beqi r6, 0x0, loc_23d2d0
loc_23d17e:
    bt.mov r3, r13
    bg.jal 0x21d913
    bt.mov r11, r3
    bt.mov r3, r13
    bt.mov r4, r12
    bg.jal 0x21f6c5
    bt.mov r10, r3
    bt.mov r3, r13
    bt.mov r4, r12
    bg.jal 0x21f61e
    bn.sub r10, r10, r3
    bn.sub r11, r11, r10
    bt.addi r11, 0x2
    bn.exthz r3, r11
loc_23d1a3:
    bn.ori r7, r0, 0xb0
    bn.muls r7, r12, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r7, r5
    bg.lbz r5, 0x89(r7)
    bn.muls r6, r3, r5
    bn.exthz r11, r6
    bn.lwz r3, 0x0(r7)
    bt.movi r4, 0x0
    bg.jal 0x20ece9
    bn.andi r7, r3, 0x3
    bg.bnei r7, 0x0, loc_23d27d
    bt.mov r3, r11
loc_23d1cf:
    bn.ori r7, r0, 0xb0
    bn.muls r6, r12, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r6, r7
    bg.lbz r7, 0x88(r6)
    bt.addi r7, 0x1
    bn.muls r7, r7, r3
    bn.exthz r11, r7
    bn.lwz r7, 0x4(r6)
    bg.ori r5, r0, 0x400
    bn.and r7, r7, r5
    bg.beqi r7, 0x0, loc_23d2be
    bn.lbz r6, 0x70(r6)
    bg.beqi r6, 0x0, loc_23d2a0
loc_23d200:
    bt.mov r3, r13
    bt.mov r4, r12
    bg.jal 0x21f544
    bn.sub r3, r3, r14
    bn.exthz r10, r3
loc_23d20e:
    bn.ori r7, r0, 0xb0
    bn.muls r7, r12, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r7, r5
    bn.lwz r6, 0x4(r7)
    bn.andi r7, r6, 0xe
    bn.bnei r7, 0x0, loc_23d22e
    bn.andi r7, r6, 0x20
    bg.beqi r7, 0x0, loc_23d300
loc_23d22e:
    bn.ori r7, r0, 0xb0
    bn.muls r7, r12, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bn.lbz r7, 0x20(r7)
    bn.andi r7, r7, 0x10
    bn.bnei r7, 0x0, loc_23d288
loc_23d247:
    bn.sh_2 0x6(r1), r10
    bn.sh_1 0x4(r1), r11
    bn.sh_2 0x2(r1), r14
    bn.sh_1 0x0(r1), r17
    bn.lwz r15, 0x0(r1)
    bn.lwz r16, 0x4(r1)
    bt.mov r3, r15
    bt.mov r4, r16
    bn.lwz r17, 0x8(r1)
    bn.lwz r16, 0xc(r1)
    bn.lwz r15, 0x10(r1)
    bn.lwz r14, 0x14(r1)
    bn.lwz r13, 0x18(r1)
    bn.lwz r12, 0x1c(r1)
    bn.lwz r11, 0x20(r1)
    bn.lwz r10, 0x24(r1)
    bn.lwz r9, 0x28(r1)
    bn.addi r1, r1, 0x2c
    bt.jr r9
loc_23d27d:
    bn.sub r7, r11, r3
    bn.sfeqi r7, 0x2
    bn.cmov_0 r3, r3, r11
    bt.j loc_23d1cf
loc_23d288:
    bt.mov r3, r13
    bg.jal 0x21d76c
    bg.beqi r3, 0x1, loc_23d329
    bn.ori r7, r14, 0x1
    bn.exthz r14, r7
    bn.addi r7, r10, -0x1
    bn.exthz r10, r7
    bt.j loc_23d247
loc_23d2a0:
    bt.mov r3, r13
    bg.jal 0x2227ef
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r3, r6
    bg.lbz r3, 0xa2(r3)
    bg.bnei r3, 0x0, loc_23d200
loc_23d2be:
    bt.mov r3, r13
    bt.mov r4, r12
    bg.jal 0x21f544
    bn.sub r3, r3, r14
    bt.addi r3, 0x1
    bn.exthz r10, r3
    bt.j loc_23d20e
loc_23d2d0:
    bt.mov r3, r13
    bg.jal 0x2227ef
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r3, r6
    bg.lbz r3, 0xa2(r3)
    bg.bnei r3, 0x0, loc_23d17e
loc_23d2ee:
    bt.mov r3, r13
    bt.mov r4, r12
    bg.jal 0x21f61e
    bn.sub r3, r3, r17
    bt.addi r3, 0x1
    bn.exthz r3, r3
    bt.j loc_23d1a3
loc_23d300:
    bn.andi r7, r6, 0x80
    bg.bnei r7, 0x0, loc_23d22e
    bt.mov r3, r12
    bg.jal 0x2422ee
    bt.mov r11, r3
    bt.mov r3, r12
    bg.jal 0x2422a6
    bg.ori r10, r0, 0x360
    bn.sfnei r3, 0x12
    bn.bnf loc_23d247
    bt.mov r3, r12
    bg.jal 0x2422ce
    bt.mov r10, r3
    bt.j loc_23d247
loc_23d329:
    bg.ori r7, r0, 0xfffe
    bn.and r14, r14, r7
    bt.mov r3, r13
    bg.jal 0x21d749
    bn.beqi r3, 0x0, loc_23d341
    bn.addi r7, r10, -0x3
    bn.exthz r10, r7
    bt.j loc_23d247
loc_23d341:
    bn.addi r7, r10, 0x1
    bn.exthz r10, r7
    bt.j loc_23d247
