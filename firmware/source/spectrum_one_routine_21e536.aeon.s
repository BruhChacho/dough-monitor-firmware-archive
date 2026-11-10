# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21e536,0x21e582); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r11, r3
    bt.mov r3, r4
    bg.jal 0x21d3b1
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5210(r7)
    bn.beqi r7, 0x0, loc_21e56b
    bt.addi r3, 0xe
    bt.mov r4, r11
    bg.ori r5, r0, 0x7fff
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x23e4a6
loc_21e56b:
    bt.addi r3, 0xe
    bt.mov r4, r11
    bg.ori r5, r0, 0x7fff
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x23e152
