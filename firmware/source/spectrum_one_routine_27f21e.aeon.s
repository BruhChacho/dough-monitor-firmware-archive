# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27f21e,0x27f31c); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x74
    bn.sw 0x70(r1), r9
    bn.sw 0x6c(r1), r10
    bn.sw 0x68(r1), r11
    bn.sw 0x64(r1), r12
    bn.sw 0x60(r1), r13
    bt.mov r11, r3
    bt.mov r12, r4
    bt.mov r13, r5
    bg.movhi r7, 0x45
    bg.lbz r7, 0x7df8(r7)
    bn.beqi r7, 0x0, loc_27f2b3
    bn.addi r3, r1, 0x40
    bg.jal 0x27f0b6
    bn.addi r3, r1, 0x20
    bt.mov r4, r12
    bt.mov r5, r13
    bt.movi r6, 0x0
    bg.jal 0x27f10b
    bn.lwz r26, 0x20(r1)
    bn.sw 0x40(r1), r26
    bn.lwz r25, 0x24(r1)
    bn.sw 0x44(r1), r25
    bn.lwz r24, 0x28(r1)
    bn.sw 0x48(r1), r24
    bn.lwz r23, 0x2c(r1)
    bn.sw 0x4c(r1), r23
    bn.lwz r4, 0x30(r1)
    bn.sw 0x50(r1), r4
    bn.lwz r5, 0x34(r1)
    bn.sw 0x54(r1), r5
    bn.lwz r6, 0x38(r1)
    bn.sw 0x58(r1), r6
    bn.lwz r7, 0x3c(r1)
loc_27f282:
    bn.sw 0x5c(r1), r7
    bn.sw 0x0(r11), r26
    bn.sw 0x4(r11), r25
    bn.sw 0x8(r11), r24
    bn.sw 0xc(r11), r23
    bn.sw 0x10(r11), r4
    bn.sw 0x14(r11), r5
    bn.sw 0x18(r11), r6
    bn.sw 0x1c(r11), r7
    bt.mov r3, r11
    bn.lwz r13, 0x60(r1)
    bn.lwz r12, 0x64(r1)
    bn.lwz r11, 0x68(r1)
    bn.lwz r10, 0x6c(r1)
    bn.lwz r9, 0x70(r1)
    bn.addi r1, r1, 0x74
    bt.jr r9
loc_27f2b3:
    bn.addi r3, r1, 0x40
    bg.jal 0x27f0b6
    bg.movhi r10, 0x45
    bg.addi r10, r10, 0x7f26
    bt.mov r3, r10
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x20
    bg.jal 0x2a941f
    bt.mov r3, r12
    bt.mov r4, r13
    bg.jal 0x27d992
    bn.ori r4, r0, 0x87
    bn.ori r5, r0, 0x20
    bt.mov r6, r10
    bg.jal 0x20ef9b
    bt.mov r3, r1
    bt.mov r4, r12
    bt.mov r5, r13
    bt.mov r6, r10
    bg.jal 0x27e66d
    bn.lwz r26, 0x0(r1)
    bn.sw 0x40(r1), r26
    bn.lwz r25, 0x4(r1)
    bn.sw 0x44(r1), r25
    bn.lwz r24, 0x8(r1)
    bn.sw 0x48(r1), r24
    bn.lwz r23, 0xc(r1)
    bn.sw 0x4c(r1), r23
    bn.lwz r4, 0x10(r1)
    bn.sw 0x50(r1), r4
    bn.lwz r5, 0x14(r1)
    bn.sw 0x54(r1), r5
    bn.lwz r6, 0x18(r1)
    bn.sw 0x58(r1), r6
    bn.lwz r7, 0x1c(r1)
    bt.j loc_27f282
