# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20e627,0x20e64d); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.jal 0x20e5b9
    bg.ori r3, r0, 0x393
    bt.movi r4, 0x1
    bg.jal 0x23ddb9
    bg.ori r3, r0, 0x38a
    bn.ori r4, r0, 0x80
    bn.ori r5, r0, 0xc0
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bg.j 0x23dfe1
