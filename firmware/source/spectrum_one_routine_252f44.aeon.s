# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x252f44,0x252fe9); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r10, r3
    bt.mov r11, r4
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x1
    bn.bnei r7, 0x0, loc_252fd7
loc_252f61:
    bn.beqi r11, 0x0, loc_252fab
    bt.mov r3, r10
    bn.ori r4, r0, 0x1f
    bg.jal 0x252efc
    bt.mov r4, r3
    bt.mov r3, r10
    bn.ori r5, r0, 0x1f
    bg.jal 0x252e20
    bt.mov r3, r10
    bn.ori r4, r0, 0x20
    bg.jal 0x252efc
    bt.mov r4, r3
    bt.mov r3, r10
    bn.ori r5, r0, 0x20
    bg.jal 0x252e20
    bt.mov r3, r10
    bn.ori r4, r0, 0x21
    bg.jal 0x252efc
    bt.mov r4, r3
    bt.mov r3, r10
    bn.ori r5, r0, 0x21
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x252e20
loc_252fab:
    bt.mov r3, r10
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x1f
    bg.jal 0x252e20
    bt.mov r3, r10
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x20
    bg.jal 0x252e20
    bt.movi r4, 0x0
    bt.mov r3, r10
    bn.ori r5, r0, 0x21
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x252e20
loc_252fd7:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x38cd
    bt.mov r4, r10
    bt.mov r5, r11
    bg.jal 0x2a9310
    bt.j loc_252f61
