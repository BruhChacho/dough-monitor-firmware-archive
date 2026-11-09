# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2abd99,0x2abdde); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x44
    bn.sw 0x40(r1), r9
    bn.sw 0x3c(r1), r10
    bn.sw 0x38(r1), r11
    bn.sw 0x34(r1), r3
    bn.sw 0x30(r1), r4
    bn.addi r11, r1, 0x20
    bn.addi r3, r1, 0x34
    bt.mov r4, r11
    bg.jal 0x2abba0
    bn.addi r10, r1, 0x10
    bn.addi r3, r1, 0x30
    bt.mov r4, r10
    bg.jal 0x2abba0
    bt.mov r3, r11
    bt.mov r4, r10
    bt.mov r5, r1
    bn.jal 0x2abc45
    bg.jal 0x2aba8f
    bn.lwz r11, 0x38(r1)
    bn.lwz r10, 0x3c(r1)
    bn.lwz r9, 0x40(r1)
    bn.addi r1, r1, 0x44
    bt.jr r9
