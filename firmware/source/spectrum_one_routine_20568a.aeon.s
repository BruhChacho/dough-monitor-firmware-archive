# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20568a,0x205711); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r10, r3
    bt.mov r12, r5
    bt.mov r11, r6
    bn.bnei r4, 0x0, loc_2056fb
    bn.bnei r10, 0x0, loc_2056b8
loc_2056a4:
    bn.beqi r12, 0x0, loc_2056e8
loc_2056a7:
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
loc_2056b8:
    bg.movhi r10, 0x3b
    bg.lwz r7, 0x5f38(r10)
    bn.lbz r3, 0x5a(r7)
    bt.mov r4, r11
    bg.jal 0x23a0b1
    bg.lwz r7, 0x5f38(r10)
    bn.lbz r3, 0x5a(r7)
    bt.mov r4, r11
    bg.jal 0x239ff2
    bg.lwz r7, 0x5f38(r10)
    bn.lbz r3, 0x5a(r7)
    bt.mov r4, r11
    bt.movi r5, 0x0
    bg.jal 0x239fc0
    bn.bnei r12, 0x0, loc_2056a7
loc_2056e8:
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bg.j 0x205190
loc_2056fb:
    bg.movhi r7, 0x3b
    bg.lwz r7, 0x5f38(r7)
    bn.lbz r3, 0x5a(r7)
    bt.mov r4, r6
    bg.jal 0x23a12d
    bn.beqi r10, 0x0, loc_2056a4
    bt.j loc_2056b8
