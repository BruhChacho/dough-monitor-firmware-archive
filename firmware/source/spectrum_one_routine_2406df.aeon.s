# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2406df,0x240725); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r10, r3
    bt.mov r11, r4
    bt.j loc_2406f2
loc_2406f0:
    bt.addi r11, 0x1
loc_2406f2:
    bn.addi r7, r10, -0x1
    bn.extbz r10, r7
    bg.sfnei r10, 0xff
    bn.bnf loc_240716
    bn.lbz r3, 0x0(r11)
    bg.jal 0x2405f5
    bn.bnei r3, 0x0, loc_2406f0
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_240716:
    bt.movi r3, 0x1
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
