# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x262c1d,0x262c42); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.ori r7, r0, 0xa8
    bn.sw 0x0(r1), r7
    bn.ori r4, r0, 0x32
    bn.ori r5, r0, 0x64
    bn.ori r6, r0, 0x96
    bn.ori r7, r0, 0x58
    bn.ori r8, r0, 0x80
    bg.jal 0x262b8a
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
