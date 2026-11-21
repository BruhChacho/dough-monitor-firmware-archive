# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2a9310,0x2a93a3); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x0(r1), r4
    bn.sw 0x4(r1), r5
    bn.sw 0x8(r1), r6
    bn.sw 0xc(r1), r7
    bn.sw 0x10(r1), r8
    bg.addi r1, r1, -0x118
    bg.sw_0 0x114(r1), r9
    bg.sw_0 0x110(r1), r10
    bg.sw_0 0x10c(r1), r11
    bg.sw_0 0x108(r1), r12
    bt.mov r5, r3
    bt.movi r11, 0x0
    bg.movhi r7, 0x45
    bg.lbz r7, 0x79a4(r7)
    bn.bnei r7, 0x0, loc_2a935d
loc_2a9345:
    bt.mov r3, r11
    bg.lwz r12, 0x108(r1)
    bg.lwz r11, 0x10c(r1)
    bg.lwz r10, 0x110(r1)
    bg.lwz r9, 0x114(r1)
    bg.addi r1, r1, 0x12c
    bt.jr r9
loc_2a935d:
    bg.addi r7, r1, 0x118
    bg.sw_0 0x104(r1), r7
    bn.addi r12, r1, 0x4
    bt.mov r3, r12
    bg.ori r4, r0, 0x100
    bt.mov r6, r7
    bg.jal 0x2a8db2
    bt.mov r11, r3
    bn.blesi r3, 0x0, loc_2a9345
    bt.movi r10, 0x0
loc_2a937b:
    bn.add r7, r12, r10
    bn.lbs r3, 0x0(r7)
    bg.jal 0x271d56
    bt.addi r10, 0x1
    bg.bne r11, r10, loc_2a937b
    bt.mov r3, r11
    bg.lwz r12, 0x108(r1)
    bg.lwz r11, 0x10c(r1)
    bg.lwz r10, 0x110(r1)
    bg.lwz r9, 0x114(r1)
    bg.addi r1, r1, 0x12c
    bt.jr r9
