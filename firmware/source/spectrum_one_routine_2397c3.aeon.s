# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2397c3,0x2398ed); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x20
    bn.sw 0x1c(r1), r9
    bn.sw 0x18(r1), r10
    bn.sw 0x14(r1), r11
    bn.sw 0x10(r1), r12
    bt.mov r11, r3
    bn.ori r7, r0, 0x18
    bn.muls r12, r3, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4318
    bn.add r10, r12, r5
    bn.lwz r4, 0x4(r10)
    bn.addi r7, r4, -0x7
    bn.bgtui r7, 0x2, loc_239820
    bn.lbz r6, 0xe(r10)
    bn.bnei r6, 0x0, loc_23984e
    bn.lbz r8, 0x8(r10)
    bn.sw 0x0(r1), r0
    bn.sw 0x4(r1), r0
    bn.sw 0x8(r1), r0
    bt.movi r3, 0x0
    bn.extbz r4, r4
    bt.movi r5, 0x0
    bt.movi r6, 0x0
    bt.movi r7, 0x0
    bg.jal 0x2395c7
loc_23980f:
    bn.lwz r12, 0x10(r1)
    bn.lwz r11, 0x14(r1)
    bn.lwz r10, 0x18(r1)
    bn.lwz r9, 0x1c(r1)
    bn.addi r1, r1, 0x20
    bt.jr r9
loc_239820:
    bn.lbz r6, 0x10(r10)
    bg.beqi r6, 0x0, loc_2398b4
    bg.movhi r7, 0x45
    bg.lbz r7, 0x509f(r7)
    bg.bnei r7, 0x0, loc_2398df
loc_239833:
    bt.movi r3, 0x0
    bn.extbz r4, r4
    bn.lbz r5, 0x8(r10)
    bn.lwz r12, 0x10(r1)
    bn.lwz r11, 0x14(r1)
    bn.lwz r10, 0x18(r1)
    bn.lwz r9, 0x1c(r1)
    bn.addi r1, r1, 0x20
    bg.j 0x239410
loc_23984e:
    bn.slli r7, r3, 0x1
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x43a8
    bt.add r7, r5
    bn.lbz r8, 0x0(r7)
    bn.lbz r7, 0x1(r7)
    bn.sw 0x0(r1), r7
    bn.sw 0x4(r1), r0
    bn.sw 0x8(r1), r0
    bt.movi r3, 0x0
    bn.extbz r4, r4
    bt.movi r5, 0x0
    bt.movi r6, 0x0
    bt.movi r7, 0x0
    bg.jal 0x2395c7
    bn.lbz r3, 0x4(r10)
    bt.movi r4, 0x0
    bg.jal 0x23935c
    bg.movhi r6, 0x3b
    bg.lbz r7, 0x4278(r6)
    bg.bne r11, r7, loc_23980f
    bt.mov r7, r12
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4288
    bt.add r7, r5
    bn.sbz 0xf(r7), r0
    bt.movi r7, -0x1
    bg.sbz 0x4278(r6), r7
    bn.lwz r12, 0x10(r1)
    bn.lwz r11, 0x14(r1)
    bn.lwz r10, 0x18(r1)
    bn.lwz r9, 0x1c(r1)
    bn.addi r1, r1, 0x20
    bt.jr r9
loc_2398b4:
    bt.movi r3, 0x0
    bn.extbz r4, r4
    bn.lbz r5, 0x8(r10)
    bt.movi r6, 0x1
    bg.jal 0x239441
    bt.movi r3, 0x0
    bn.lbz r4, 0x4(r10)
    bn.lbz r5, 0x8(r10)
    bt.movi r6, 0x0
    bn.lwz r12, 0x10(r1)
    bn.lwz r11, 0x14(r1)
    bn.lwz r10, 0x18(r1)
    bn.lwz r9, 0x1c(r1)
    bn.addi r1, r1, 0x20
    bg.j 0x2393b3
loc_2398df:
    bn.extbz r3, r4
    bt.movi r4, 0x0
    bg.jal 0x239614
    bn.lwz r4, 0x4(r10)
    bt.j loc_239833
