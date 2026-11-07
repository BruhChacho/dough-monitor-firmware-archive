# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x279e04,0x279e50); Create candidate timer handle and configure it through four external functions; timing units unknown.
# Fixed original addresses; not a hardware-validated implementation.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r13, r4
    bt.mov r11, r5
    bt.mov r12, r6
    bg.jal 0x2a9646
    bt.mov r10, r3
    bt.mov r3, r11
    bt.mov r4, r10
    bg.jal 0x2a94d3
    bt.mov r3, r12
    bt.mov r4, r10
    bg.jal 0x2a94c4
    bt.mov r3, r13
    bt.mov r4, r10
    bg.jal 0x2a9488
    bt.mov r3, r10
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
