# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x214fd3,0x21507d); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bn.sw 0x14(r1), r10
    bn.sw 0x10(r1), r11
    bn.sw 0xc(r1), r12
    bn.sw 0x8(r1), r13
    bn.sw 0x4(r1), r14
    bn.sw 0x0(r1), r15
    bt.mov r11, r3
    bg.jal 0x211d3e
    bt.mov r15, r3
    bn.slli r11, r11, 0x8
    bt.movhi r7, -0xa
    bg.ori r7, r7, 0x1d61
    bn.add r3, r11, r7
    bg.jal 0x23df85
    bt.mov r14, r3
    bt.movhi r7, -0xa
    bg.ori r7, r7, 0x1d60
    bn.add r3, r11, r7
    bg.jal 0x23dd44
    bt.mov r12, r3
    bt.movhi r7, -0xa
    bg.ori r7, r7, 0x1d65
    bn.add r3, r11, r7
    bg.jal 0x23df85
    bt.mov r10, r3
    bt.movhi r7, -0xa
    bg.ori r7, r7, 0x1d64
    bn.add r3, r11, r7
    bg.jal 0x23dd44
    bn.slli r10, r10, 0x8
    bn.add r13, r10, r3
    bt.movi r3, 0x0
    bn.beqi r13, 0x0, loc_215063
    bn.slli r10, r14, 0x8
    bt.add r10, r12
    bt.movi r11, 0x0
    bt.mov r3, r15
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x64
    bt.movi r6, 0x0
    bg.jal 0x2aacb9
    bt.mov r5, r3
    bt.mov r6, r4
    bt.mov r3, r10
    bt.mov r4, r11
    bg.jal 0x2aacb9
    bt.mov r5, r13
    bt.movi r6, 0x0
    bg.jal 0x2ab331
loc_215063:
    bn.lwz r15, 0x0(r1)
    bn.lwz r14, 0x4(r1)
    bn.lwz r13, 0x8(r1)
    bn.lwz r12, 0xc(r1)
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
