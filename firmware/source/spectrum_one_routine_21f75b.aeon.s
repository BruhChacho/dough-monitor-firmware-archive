# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21f75b,0x21f782); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r11, r4
    bg.jal 0x21d3b1
    bn.addi r3, r3, 0x20
    bt.movi r4, 0x2
    bt.mov r5, r11
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x23a618
