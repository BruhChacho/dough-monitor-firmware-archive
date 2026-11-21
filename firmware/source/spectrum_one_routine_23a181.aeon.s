# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23a181,0x23a1b8); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bt.mov r10, r3
    bn.sw 0x4(r1), r0
    bn.addi r4, r1, 0x4
    bg.jal 0x23e697
    bn.lwz r7, 0x4(r1)
    bn.sfnei r7, 0x0
    bn.cmovsi_2 r4, r0, 0x1
    bt.mov r3, r10
    bn.andi r4, r4, 0x1
    bg.jal 0x2072e4
    bt.mov r3, r10
    bg.jal 0x20762c
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
