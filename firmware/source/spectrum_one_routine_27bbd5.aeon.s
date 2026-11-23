# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27bbd5,0x27bc11); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r12, r3
    bt.mov r11, r4
    bt.mov r10, r5
    bg.jal 0x27baf6
    bn.nand r7, r10, r10
    bn.and r4, r3, r7
    bn.and r10, r10, r11
    bn.or r4, r4, r10
    bt.mov r3, r12
    bn.extbz r4, r4
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bg.j 0x27bb39
