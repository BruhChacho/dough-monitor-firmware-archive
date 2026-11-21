# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2053ad,0x20546f); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x24
    bn.sw 0x20(r1), r9
    bn.sw 0x1c(r1), r10
    bn.sw 0x18(r1), r11
    bn.sw 0x14(r1), r12
    bn.sw 0x10(r1), r13
    bn.sw 0xc(r1), r14
    bn.sw 0x8(r1), r15
    bt.mov r12, r3
    bt.mov r14, r4
    bn.sbz 0x7(r1), r0
    bn.sbz 0x6(r1), r0
    bt.movi r10, 0x0
    bn.addi r13, r1, 0x7
    bg.movhi r7, 0x48
    bg.addi r15, r7, -0x1ae2
loc_2053dc:
    bt.mov r3, r10
    bg.jal 0x2041b0
    bt.mov r11, r3
    bt.mov r4, r13
    bg.jal 0x2461f6
    bn.lbz r7, 0x7(r1)
    bg.beq r12, r7, loc_205418
loc_2053f1:
    bn.addi r7, r10, 0x1
    bn.extbz r10, r7
    bn.bnei r10, 0x2, loc_2053dc
loc_2053fa:
    bg.jal 0x2041c9
loc_2053fe:
    bn.lwz r15, 0x8(r1)
    bn.lwz r14, 0xc(r1)
    bn.lwz r13, 0x10(r1)
    bn.lwz r12, 0x14(r1)
    bn.lwz r11, 0x18(r1)
    bn.lwz r10, 0x1c(r1)
    bn.lwz r9, 0x20(r1)
    bn.addi r1, r1, 0x24
    bt.jr r9
loc_205418:
    bn.addi r3, r11, 0x1
    bn.exthz r3, r3
    bn.addi r4, r1, 0x6
    bg.jal 0x2461f6
    bn.lbz r7, 0x6(r1)
    bg.bne r14, r7, loc_2053f1
    bt.mov r3, r11
    bt.mov r4, r15
    bn.ori r5, r0, 0x16
    bg.jal 0x2461d6
    bg.movhi r11, 0x48
    bg.addi r3, r11, -0x1ae0
    bn.ori r4, r0, 0x12
    bg.jal 0x204080
    bn.lbz r7, 0x14(r15)
    bn.lbz r6, 0x15(r15)
    bn.slli r6, r6, 0x8
    bn.or r6, r6, r7
    bn.exths r6, r6
    bn.exths r3, r3
    bg.bne r6, r3, loc_2053fa
    bn.beqi r10, 0x2, loc_2053fa
    bg.addi r3, r11, -0x1ae0
    bn.ori r4, r0, 0x12
    bg.jal 0x20409a
    bn.bnei r3, 0x0, loc_2053fa
    bt.j loc_2053fe
