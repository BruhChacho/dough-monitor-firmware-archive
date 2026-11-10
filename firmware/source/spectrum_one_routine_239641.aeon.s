# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x239641,0x2397c3); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x20
    bn.sw 0x1c(r1), r9
    bn.sw 0x18(r1), r10
    bn.sw 0x14(r1), r11
    bn.sw 0x10(r1), r12
    bt.mov r11, r3
    bn.ori r7, r0, 0x18
    bn.muls r12, r3, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4288
    bn.add r10, r12, r6
    bn.lwz r4, 0x4(r10)
    bn.addi r7, r4, -0x7
    bn.bgtui r7, 0x2, loc_2396bd
    bn.lbz r7, 0xe(r10)
    bn.beqi r7, 0x0, loc_239681
    bg.movhi r7, 0x3b
    bg.lwz r7, 0x5f38(r7)
    bn.lbz r7, 0x59(r7)
    bg.beqi r7, 0x0, loc_23976c
loc_239681:
    bn.ori r7, r0, 0x18
    bn.muls r7, r11, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4288
    bt.add r7, r6
    bn.lbz r8, 0x8(r7)
    bn.sw 0x0(r1), r0
    bn.sw 0x4(r1), r0
    bn.sw 0x8(r1), r0
    bt.movi r3, 0x1
    bn.extbz r4, r4
    bt.movi r5, 0x0
    bt.movi r6, 0x0
    bt.movi r7, 0x0
    bg.jal 0x2395c7
loc_2396ac:
    bn.lwz r12, 0x10(r1)
    bn.lwz r11, 0x14(r1)
    bn.lwz r10, 0x18(r1)
    bn.lwz r9, 0x1c(r1)
    bn.addi r1, r1, 0x20
    bt.jr r9
loc_2396bd:
    bn.lbz r7, 0x10(r10)
    bn.bnei r7, 0x0, loc_2396ee
    bt.movi r3, 0x1
    bn.extbz r4, r4
    bn.lbz r5, 0x8(r10)
    bt.movi r6, 0x1
    bg.jal 0x239441
    bt.movi r3, 0x1
    bn.lbz r4, 0x4(r10)
    bn.lbz r5, 0x8(r10)
    bt.movi r6, 0x0
    bn.lwz r12, 0x10(r1)
    bn.lwz r11, 0x14(r1)
    bn.lwz r10, 0x18(r1)
    bn.lwz r9, 0x1c(r1)
    bn.addi r1, r1, 0x20
    bg.j 0x2393b3
loc_2396ee:
    bg.ori r4, r0, 0x2bc
    bg.jal 0x23f257
    bg.movhi r7, 0x45
    bg.lbz r7, 0x509f(r7)
    bn.bnei r7, 0x0, loc_239755
loc_239701:
    bt.movi r3, 0x1
    bn.lbz r4, 0x4(r10)
    bn.lbz r5, 0x8(r10)
    bg.jal 0x239410
    bn.lbz r10, 0xe(r10)
    bn.beqi r10, 0x0, loc_23974d
    bt.movi r3, 0x1
    bg.jal 0x239389
loc_239719:
    bg.movhi r7, 0x3b
    bg.lbz r7, 0x4274(r7)
    bg.bnei r7, 0x4, loc_2396ac
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4288
    bt.movi r6, 0x1
    bn.sbz 0x41(r7), r6
    bn.sbz 0x59(r7), r6
    bn.sbz 0x71(r7), r6
    bg.sbz 0x89(r7), r6
    bn.lwz r12, 0x10(r1)
    bn.lwz r11, 0x14(r1)
    bn.lwz r10, 0x18(r1)
    bn.lwz r9, 0x1c(r1)
    bn.addi r1, r1, 0x20
    bt.jr r9
loc_23974d:
    bt.movi r3, 0x0
    bg.jal 0x239389
    bt.j loc_239719
loc_239755:
    bt.mov r7, r12
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4318
    bt.add r7, r6
    bn.lbz r3, 0x4(r7)
    bt.movi r4, 0x1
    bg.jal 0x239614
    bt.j loc_239701
loc_23976c:
    bg.ori r4, r0, 0x28a
    bg.jal 0x23f257
    bn.lbz r3, 0x4(r10)
    bt.movi r4, 0x1
    bg.jal 0x23935c
    bn.lbz r4, 0x4(r10)
    bn.slli r7, r11, 0x1
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x43a8
    bt.add r7, r6
    bn.lbz r8, 0x0(r7)
    bn.lbz r7, 0x1(r7)
    bn.sw 0x0(r1), r7
    bn.sw 0x4(r1), r0
    bn.sw 0x8(r1), r0
    bt.movi r3, 0x1
    bt.movi r5, 0x0
    bt.movi r6, 0x0
    bt.movi r7, 0x0
    bg.jal 0x2395c7
    bt.movi r6, -0x1
    bg.movhi r7, 0x3b
    bg.sbz 0x4277(r7), r6
    bn.lwz r12, 0x10(r1)
    bn.lwz r11, 0x14(r1)
    bn.lwz r10, 0x18(r1)
    bn.lwz r9, 0x1c(r1)
    bn.addi r1, r1, 0x20
    bt.jr r9
