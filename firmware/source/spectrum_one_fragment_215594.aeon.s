# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x215594,0x2155ff); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r10, r3
    bt.mov r11, r4
    bg.jal 0x211bda
    bn.beqi r3, 0x1, loc_2155d4
    bn.bnei r11, 0x0, loc_2155e1
    bn.bnei r10, 0x0, loc_2155d1
loc_2155b0:
    bg.ori r3, r0, 0x11ad
    bt.movi r4, 0x1
    bn.bnei r11, 0x0, loc_2155bf
    bg.ori r3, r0, 0x11ad
    bt.movi r4, 0x0
loc_2155bf:
    bn.ori r5, r0, 0x10
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x23dead
loc_2155d1:
    bn.beqi r10, 0x1, loc_2155ee
loc_2155d4:
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_2155e1:
    bt.mov r3, r10
    bt.movi r4, 0x0
    bg.jal 0x212ff4
    bn.beqi r10, 0x0, loc_2155b0
    bt.j loc_2155d1
loc_2155ee:
    bg.ori r3, r0, 0x12ad
    bt.movi r4, 0x1
    bn.bnei r11, 0x0, loc_2155bf
    bg.ori r3, r0, 0x12ad
    bt.movi r4, 0x0
    bt.j loc_2155bf
