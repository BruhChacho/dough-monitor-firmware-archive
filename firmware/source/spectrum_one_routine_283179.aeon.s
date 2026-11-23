# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x283179,0x2831c0); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r11, r3
    bg.jal 0x27d929
    bn.ori r7, r0, 0x7c
    bn.muls r3, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r3, r6
    bn.lwz r10, 0x4(r3)
    bt.mov r3, r11
    bg.jal 0x27d929
    bn.andi r3, r3, 0x1
    bg.movhi r6, 0x8000
    bn.or r7, r10, r6
    bn.sfeqi r3, 0x0
    bn.cmov_0 r3, r7, r10
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
