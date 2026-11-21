# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2ac288,0x2ac2be); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bn.sw 0x14(r1), r3
    bn.addi r3, r1, 0x14
    bn.addi r4, r1, 0x4
    bg.jal 0x2abba0
    bn.lwz r6, 0x10(r1)
    bt.movi r7, 0x0
    bn.srli r5, r6, 0x2
    bn.or r7, r5, r7
    bn.slli r6, r6, 0x1e
    bn.lwz r3, 0x4(r1)
    bn.lwz r4, 0x8(r1)
    bn.lwz r5, 0xc(r1)
    bg.jal 0x2ad142
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
