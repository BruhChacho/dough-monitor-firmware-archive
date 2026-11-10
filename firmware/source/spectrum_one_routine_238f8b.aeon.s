# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x238f8b,0x238fce); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r7, r3
    bt.mov r11, r4
    bt.mov r12, r5
    bt.movhi r10, -0x10
    bg.ori r3, r10, 0x33c2
    bt.mov r4, r7
    bg.jal 0x23ddb9
    bg.ori r3, r10, 0x33c3
    bt.mov r4, r11
    bg.jal 0x23ddb9
    bg.ori r3, r10, 0x33c4
    bt.mov r4, r12
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bg.j 0x23ddb9
