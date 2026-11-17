# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x24512f,0x245179); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x18
    bn.sw 0x14(r1), r9
    bn.sw 0x10(r1), r10
    bn.sw 0xc(r1), r11
    bn.sw 0x8(r1), r12
    bn.sw 0x4(r1), r13
    bn.sw 0x0(r1), r14
    bt.mov r10, r3
    bt.mov r11, r4
    bt.mov r12, r5
    bt.mov r13, r6
    bt.mov r14, r7
    bg.jal 0x27057f
    bg.jal 0x20e627
    bt.mov r3, r10
    bt.mov r4, r11
    bt.mov r5, r12
    bt.mov r6, r13
    bt.mov r7, r14
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bg.j 0x24490d
