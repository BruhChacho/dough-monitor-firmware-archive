# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x262bd5,0x262bfa); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bg.ori r7, r0, 0x7ff
    bn.sw 0x0(r1), r7
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x32
    bn.ori r6, r0, 0x64
    bt.movi r7, 0x0
    bg.ori r8, r0, 0x400
    bg.jal 0x262b8a
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
