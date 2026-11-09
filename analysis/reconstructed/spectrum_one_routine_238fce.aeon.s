# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x238fce,0x23924c); byte-exact only; hardware untested.
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
    bn.sw 0x4(r1), r18
    bn.sw 0x0(r1), r19
    bt.mov r12, r3
    bt.mov r13, r4
    bt.mov r15, r5
    bt.mov r11, r6
    bt.mov r17, r7
    bt.mov r19, r8
    bg.movhi r14, 0x45
    bg.addi r7, r0, 0x2710
    bg.sw_1 0x5208(r14), r7
    bt.movhi r10, -0x10
loc_23900c:
    bg.jal 0x238f69
    bg.ori r3, r10, 0x33c0
    bg.jal 0x23dd44
    bn.beqi r3, 0x0, loc_239022
    bg.lhz r7, 0x5208(r14)
    bn.bnei r7, 0x0, loc_23900c
loc_239022:
    bg.lhz r7, 0x5208(r14)
    bt.movi r3, 0x0
    bn.bnei r7, 0x0, loc_239051
loc_23902b:
    bn.lwz r19, 0x0(r1)
    bn.lwz r18, 0x4(r1)
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
loc_239051:
    bt.mov r3, r12
    bt.mov r4, r13
    bt.mov r5, r15
    bg.jal 0x238f8b
    bg.beqi r11, 0x0, loc_239132
    bn.addi r7, r11, 0x1f
    bn.srai r7, r7, 0x5
    bn.extbz r13, r7
    bn.addi r7, r11, -0x1
    bn.srai r6, r7, 0x1f
    bn.srli r6, r6, 0x1b
    bt.add r7, r6
    bn.andi r7, r7, 0x1f
    bn.sub r7, r7, r6
    bt.addi r7, 0x1
    bn.extbz r16, r7
    bg.ori r3, r10, 0x33c5
    bt.movi r4, 0x1
    bg.jal 0x23ddb9
    bg.ori r3, r10, 0x33c6
    bt.mov r4, r13
    bg.jal 0x23ddb9
    bg.ori r3, r10, 0x33c7
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
    bg.ori r3, r10, 0x33c8
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
    bg.ori r3, r10, 0x33c9
    bt.mov r4, r16
    bg.jal 0x23ddb9
    bg.ori r3, r10, 0x33c0
    bt.movi r4, 0x1
    bg.jal 0x23ddb9
    bg.addi r6, r0, 0x2710
    bg.movhi r7, 0x45
    bg.sw_1 0x5208(r7), r6
    bt.movi r10, 0x0
    bt.movhi r15, -0x10
    bt.j loc_2390dc
loc_2390cc:
    bg.jal 0x238f69
    bg.beq r10, r13, loc_23916e
    bg.lhz r7, 0x5208(r14)
    bg.beqi r7, 0x0, loc_23916e
loc_2390dc:
    bg.ori r3, r15, 0x33c8
    bg.jal 0x23dd44
    bg.bne r10, r3, loc_2390cc
    bn.addi r12, r10, 0x1
    bn.slli r7, r10, 0x5
    bn.add r10, r17, r7
    bt.movi r11, 0x1
    bt.j loc_2390ff
loc_2390f5:
    bt.addi r10, 0x1
    bt.addi r11, 0x1
    bn.sfnei r11, 0x21
    bn.bnf loc_239117
loc_2390ff:
    bt.movhi r7, -0x10
    bg.ori r7, r7, 0x33cf
    bn.add r3, r11, r7
    bn.lbz r4, 0x0(r10)
    bg.jal 0x23ddb9
    bg.bne r12, r13, loc_2390f5
    bg.bne r16, r11, loc_2390f5
loc_239117:
    bg.ori r3, r15, 0x33c7
    bg.jal 0x23dd44
    bn.addi r4, r3, 0x1
    bg.ori r3, r15, 0x33c7
    bn.extbz r4, r4
    bg.jal 0x23ddb9
    bn.extbz r10, r12
    bt.j loc_2390cc
loc_239132:
    bg.ori r3, r10, 0x33c5
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
    bg.ori r3, r10, 0x33c6
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
    bg.ori r3, r10, 0x33c7
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
    bg.ori r3, r10, 0x33c8
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
    bg.ori r3, r10, 0x33c9
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
    bg.ori r3, r10, 0x33c0
    bt.movi r4, 0x1
    bg.jal 0x23ddb9
loc_23916e:
    bt.movi r3, 0x1
    bg.beqi r19, 0x0, loc_23902b
    bg.addi r7, r0, 0x2710
    bg.sw_1 0x5208(r14), r7
    bt.movhi r16, -0x10
loc_23917e:
    bg.ori r3, r16, 0x33c1
    bg.jal 0x23dd44
    bn.bnei r3, 0x0, loc_2391aa
    bg.jal 0x238f69
    bg.lhz r7, 0x5208(r14)
    bn.bnei r7, 0x0, loc_23917e
    bg.lhz r7, 0x5208(r14)
    bn.exthz r7, r7
    bn.ff1 r7, r7
    bt.addi r7, -0x1
    bn.srli r7, r7, 0x1f
    bt.movi r6, 0x1
    bn.xor r3, r7, r6
    bt.j loc_23902b
loc_2391aa:
    bg.ori r3, r16, 0x33c6
    bg.jal 0x23dd44
    bt.mov r15, r3
    bg.ori r3, r16, 0x33c9
    bg.jal 0x23dd44
    bt.mov r18, r3
    bt.movi r10, 0x0
    bt.movhi r17, -0x10
    bt.j loc_2391d3
loc_2391c4:
    bg.jal 0x238f69
    bg.beq r10, r15, loc_23922b
    bg.lhz r7, 0x5208(r14)
    bn.beqi r7, 0x0, loc_23922b
loc_2391d3:
    bg.ori r3, r17, 0x33c7
    bg.jal 0x23dd44
    bt.mov r12, r3
    bn.addi r13, r10, 0x1
    bg.bne r3, r13, loc_2391c4
    bn.slli r7, r10, 0x5
    bn.add r10, r19, r7
    bt.movi r11, 0x1
    bt.j loc_2391f8
loc_2391ee:
    bt.addi r10, 0x1
    bt.addi r11, 0x1
    bn.sfnei r11, 0x21
    bn.bnf loc_239210
loc_2391f8:
    bt.movhi r7, -0x10
    bg.ori r7, r7, 0x33cf
    bn.add r3, r11, r7
    bg.jal 0x23dd44
    bn.sbz 0x0(r10), r3
    bg.bne r15, r12, loc_2391ee
    bg.bne r18, r11, loc_2391ee
loc_239210:
    bg.ori r3, r17, 0x33c8
    bg.jal 0x23dd44
    bn.addi r4, r3, 0x1
    bg.ori r3, r17, 0x33c8
    bn.extbz r4, r4
    bg.jal 0x23ddb9
    bn.extbz r10, r13
    bt.j loc_2391c4
loc_23922b:
    bg.ori r3, r16, 0x33c1
    bt.movi r4, 0x0
    bg.jal 0x23ddb9
    bg.lhz r7, 0x5208(r14)
    bn.exthz r7, r7
    bn.ff1 r7, r7
    bt.addi r7, -0x1
    bn.srli r7, r7, 0x1f
    bt.movi r6, 0x1
    bn.xor r3, r7, r6
    bn.j loc_23902b
