# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2493be,0x2493e3); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bg.jal 0x2487b6
    bn.sw 0x0(r1), r3
    bn.sw 0x4(r1), r4
    bn.sw 0x8(r1), r3
    bn.sw 0xc(r1), r4
    bn.addi r3, r1, 0x8
    bg.jal 0x248b96
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
