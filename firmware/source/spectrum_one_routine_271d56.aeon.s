# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x271d56,0x271dcf); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bn.sw 0x14(r1), r10
    bn.sw 0x10(r1), r11
    bn.sw 0xc(r1), r12
    bn.sw 0x8(r1), r13
    bt.mov r10, r3
    bg.movhi r7, 0x3d
    bg.lbz r7, -0x4cc7(r7)
    bn.bnei r7, 0x0, loc_271d8b
loc_271d75:
    bt.mov r3, r10
    bn.lwz r13, 0x8(r1)
    bn.lwz r12, 0xc(r1)
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
loc_271d8b:
    bg.movhi r13, 0x48
    bt.movi r7, 0x1
    bg.sbz -0x23b0(r13), r7
    bg.movhi r11, 0x48
    bg.lwz r3, -0x23ac(r11)
    bn.beqi r3, 0x0, loc_271dbc
    bn.addi r12, r1, 0x7
    bg.beqi r10, 0xa, loc_271dc0
loc_271da7:
    bn.sbz 0x7(r1), r10
    bg.lwz r3, -0x23ac(r11)
    bt.mov r4, r12
    bt.movi r5, 0x1
    bg.jal 0x271d1a
    bg.sbz -0x23b0(r13), r0
    bt.j loc_271d75
loc_271dbc:
    bt.movi r10, -0x1
    bt.j loc_271d75
loc_271dc0:
    bt.movi r7, 0xd
    bn.sbz 0x7(r1), r7
    bt.mov r4, r12
    bt.movi r5, 0x1
    bg.jal 0x271d1a
    bt.j loc_271da7
