# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x208676,0x20879a); byte-exact only; hardware untested.
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
    bt.mov r11, r4
    bt.mov r13, r5
    bn.ori r7, r0, 0xa8
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lh r19, 0x2a(r7)
    bn.ori r12, r0, 0x2b
    bn.beqi r4, 0x1, loc_2086c0
    bn.sfnei r4, 0x2
    bn.ori r7, r0, 0x4b
    bn.cmov_1 r12, r11, r7
loc_2086c0:
    bg.jal 0x2250c5
    bn.ori r7, r0, 0x7c
    bn.muls r3, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r3, r7
    bn.lwz r10, 0x4(r3)
    bt.mov r3, r19
    bt.movi r4, 0x1
    bg.jal 0x23e13b
    bg.movhi r6, 0x2580
    bn.ori r6, r6, 0xf2
    bn.add r18, r10, r6
    bt.mov r3, r18
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0xf4
    bn.add r17, r10, r7
    bt.mov r3, r17
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bg.movhi r6, 0x2580
    bn.ori r6, r6, 0xf0
    bt.add r10, r6
    bt.mov r3, r10
    bt.mov r4, r12
    bt.mov r5, r12
    bg.jal 0x23e152
    bn.slli r7, r11, 0x2
    bn.add r16, r13, r7
    bt.movi r14, 0x0
    bt.movi r15, 0x0
loc_208720:
    bn.exthz r12, r14
    bn.lwz r7, 0x0(r16)
    bt.add r7, r15
    bn.lbz r13, 0x0(r7)
    bn.lbz r7, 0x1(r7)
    bn.andi r7, r7, 0x3f
    bn.slli r11, r7, 0x8
loc_208734:
    bt.mov r3, r10
    bg.jal 0x23df85
    bn.andi r3, r3, 0x8
    bn.bnei r3, 0x0, loc_208734
    bt.mov r3, r18
    bt.mov r4, r12
    bg.jal 0x23dfb6
    bt.mov r3, r17
    bn.add r4, r13, r11
    bg.jal 0x23dfb6
    bt.mov r3, r10
    bt.movi r4, 0x8
    bt.movi r5, 0x8
    bg.jal 0x23e152
    bt.addi r14, 0x1
    bt.addi r15, 0x2
    bg.sfnei r14, 0x100
    bn.bf loc_208720
    bt.mov r3, r10
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bt.mov r3, r19
    bt.movi r4, 0x0
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
    bg.j 0x23e13b
