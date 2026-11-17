# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x240a8b,0x240bca); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x30
    bn.sw 0x2c(r1), r9
    bn.sw 0x28(r1), r10
    bn.sw 0x24(r1), r11
    bn.sw 0x20(r1), r12
    bn.sw 0x1c(r1), r13
    bn.sw 0x18(r1), r14
    bn.sw 0x14(r1), r15
    bn.sw 0x10(r1), r16
    bn.sw 0xc(r1), r17
    bn.sw 0x8(r1), r18
    bt.mov r14, r4
    bt.mov r15, r5
    bt.mov r11, r6
    bg.movhi r18, 0x45
    bn.srli r7, r4, 0x8
    bg.sbz 0x3c3f(r18), r7
    bg.beqi r6, 0x0, loc_240b7f
    bn.andi r13, r4, 0xff
    bn.extbs r17, r3
    bn.extbz r16, r4
    bt.movi r12, 0x0
    bt.movi r7, 0x0
    bn.sub r7, r12, r7
    bt.add r7, r13
    bn.exthz r13, r7
    bn.add r7, r14, r12
    bn.srai r4, r7, 0x8
    bg.sfgti r13, 0xff
    bn.bnf loc_240ae9
loc_240ae3:
    bg.sbz 0x3c3f(r18), r4
    bt.movi r13, 0x0
loc_240ae9:
    bn.add r7, r16, r12
    bn.sbz 0x7(r1), r7
    bn.slli r4, r4, 0x1
    bn.or r4, r17, r4
    bt.movi r3, 0x0
    bn.extbz r4, r4
    bg.jal 0x2408ff
    bg.beqi r3, 0x0, loc_240b7f
    bt.movi r3, 0x1
    bn.addi r4, r1, 0x7
    bg.jal 0x2406df
    bn.beqi r3, 0x0, loc_240b7f
    bn.lbz r7, 0x7(r1)
    bn.andi r6, r7, 0xf
    bn.ori r7, r0, 0x10
    bn.sub r7, r7, r6
    bn.extbz r10, r7
    bg.bgt r11, r10, loc_240bac
    bn.sfleui r11, 0x10
    bn.bf loc_240b68
    bn.ori r3, r0, 0x10
    bn.add r4, r15, r12
    bg.jal 0x2406df
    bn.beqi r3, 0x0, loc_240b7f
    bg.jal 0x240725
    bn.addi r7, r11, -0x10
    bn.exthz r11, r7
    bn.addi r7, r12, 0x10
    bn.exthz r10, r7
loc_240b44:
    bt.movi r3, 0xf
    bg.jal 0x240469
    bt.mov r7, r12
    bn.beqi r11, 0x0, loc_240b7f
    bt.mov r12, r10
    bn.sub r7, r12, r7
    bt.add r7, r13
    bn.exthz r13, r7
    bn.add r7, r14, r12
    bn.srai r4, r7, 0x8
    bg.sfgti r13, 0xff
    bn.bnf loc_240ae9
    bt.j loc_240ae3
loc_240b68:
    bn.extbz r3, r11
    bn.add r4, r12, r15
    bg.jal 0x2406df
    bn.beqi r3, 0x0, loc_240b7f
    bg.jal 0x240725
    bt.movi r3, 0xf
    bg.jal 0x240469
loc_240b7f:
    bg.jal 0x240725
    bt.movi r3, 0xf
    bg.jal 0x240469
    bn.lwz r18, 0x8(r1)
    bn.lwz r17, 0xc(r1)
    bn.lwz r16, 0x10(r1)
    bn.lwz r15, 0x14(r1)
    bn.lwz r14, 0x18(r1)
    bn.lwz r13, 0x1c(r1)
    bn.lwz r12, 0x20(r1)
    bn.lwz r11, 0x24(r1)
    bn.lwz r10, 0x28(r1)
    bn.lwz r9, 0x2c(r1)
    bn.addi r1, r1, 0x30
    bt.jr r9
loc_240bac:
    bt.mov r3, r10
    bn.add r4, r15, r12
    bg.jal 0x2406df
    bn.beqi r3, 0x0, loc_240b7f
    bg.jal 0x240725
    bn.sub r7, r11, r10
    bn.exthz r11, r7
    bn.add r7, r10, r12
    bn.exthz r10, r7
    bt.j loc_240b44
