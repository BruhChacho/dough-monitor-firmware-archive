# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23a241,0x23a295); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r13, r3
    bt.mov r11, r5
    bt.mov r10, r6
    bt.mov r3, r4
    bg.jal 0x262bd5
    bt.mov r12, r3
    bt.mov r3, r10
    bg.jal 0x262bd5
    bt.mov r10, r3
    bt.mov r3, r11
    bg.jal 0x262bd5
    bt.mov r5, r3
    bt.mov r3, r13
    bt.mov r4, r12
    bt.mov r6, r10
    bg.jal 0x209e75
    bt.mov r3, r13
    bt.movi r4, 0x1
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bg.j 0x2074a3
