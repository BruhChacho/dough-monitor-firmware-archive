# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2670d3,0x267177); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bg.movhi r10, 0x3b
    bt.mov r11, r10
    bg.lwz r5, 0x5f38(r10)
    bn.lbz r3, 0x5a(r5)
    bn.add r4, r5, r3
    bn.ori r7, r0, 0x29
    bn.muls r7, r3, r7
    bn.ori r6, r0, 0xa4
    bn.lbz r4, 0x5b(r4)
    bn.muls r6, r6, r4
    bt.add r7, r6
    bt.add r7, r5
    bg.lbz r7, 0xf6(r7)
    bn.beqi r7, 0x0, loc_267137
    bn.beqi r7, 0x2, loc_267129
    bn.beqi r7, 0x3, loc_26715b
    bn.beqi r7, 0x1, loc_267169
loc_267111:
    bg.lwz r7, 0x5f38(r11)
    bn.lbz r3, 0x5a(r7)
    bt.movi r4, 0x1
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x20814b
loc_267129:
    bg.movhi r4, 0x3d
    bg.addi r4, r4, -0x4e04
    bg.jal 0x207806
    bt.j loc_267111
loc_267137:
    bg.movhi r4, 0x45
    bg.addi r4, r4, 0x7973
    bg.jal 0x207806
    bg.lwz r7, 0x5f38(r10)
    bn.lbz r3, 0x5a(r7)
    bt.movi r4, 0x0
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x20814b
loc_26715b:
    bg.movhi r4, 0x3d
    bg.addi r4, r4, -0x4dfc
    bg.jal 0x207806
    bt.j loc_267111
loc_267169:
    bg.movhi r4, 0x3d
    bg.addi r4, r4, -0x4e0c
    bg.jal 0x207806
    bt.j loc_267111
