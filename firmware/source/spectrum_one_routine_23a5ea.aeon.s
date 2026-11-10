# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23a5ea,0x23a618); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r11, r3
    bt.mov r10, r4
    bt.mov r3, r4
    bg.jal 0x222819
    bt.mov r4, r10
    bg.jal 0x21f75b
    bt.mov r3, r11
    bg.jal 0x23df85
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
