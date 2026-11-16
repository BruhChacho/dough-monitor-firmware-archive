# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20e8e9,0x20e92a); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r10, r3
    bt.mov r11, r4
    bg.jal 0x20e6c5
    bg.beqi r3, 0x4, loc_20e90f
    bt.movi r3, 0x0
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_20e90f:
    bt.mov r3, r10
    bg.jal 0x20e736
    bt.mov r4, r11
    bg.jal 0x21057b
    bt.movi r3, 0x0
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
