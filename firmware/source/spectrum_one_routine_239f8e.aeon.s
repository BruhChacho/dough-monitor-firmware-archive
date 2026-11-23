# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x239f8e,0x239fb8); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r10, r3
    bt.mov r11, r4
    bt.mov r4, r5
    bt.movi r5, 0x7
    bg.jal 0x239f86
    bt.mov r3, r10
    bt.mov r4, r11
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x239f8a
