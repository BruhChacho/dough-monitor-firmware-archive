# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20f7d2,0x20f833); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r10, r3
    bt.mov r11, r4
    bg.jal 0x20e736
    bt.mov r12, r3
    bt.mov r3, r10
    bg.jal 0x20e6c5
    bn.bleui r3, 0x2, loc_20f810
    bn.beqi r3, 0x3, loc_20f807
loc_20f7f6:
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
loc_20f807:
    bt.mov r3, r12
    bg.jal 0x20ff1f
    bn.bnei r3, 0x0, loc_20f7f6
loc_20f810:
    bt.mov r3, r12
    bt.mov r4, r11
    bg.jal 0x20f67f
    bn.bnei r11, 0x0, loc_20f7f6
    bt.mov r3, r12
    bn.ori r4, r0, 0x50
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bg.j 0x20f66a
