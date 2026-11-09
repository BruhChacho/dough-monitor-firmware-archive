# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23e18c,0x23e1d0); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r10, r3
    bt.addi r3, 0x2
    bg.jal 0x23dd44
    bt.mov r11, r3
    bn.addi r3, r10, 0x1
    bg.jal 0x23dd44
    bt.mov r12, r3
    bt.mov r3, r10
    bg.jal 0x23dd44
    bn.slli r12, r12, 0x8
    bn.slli r11, r11, 0x10
    bn.or r11, r11, r3
    bn.or r3, r12, r11
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
