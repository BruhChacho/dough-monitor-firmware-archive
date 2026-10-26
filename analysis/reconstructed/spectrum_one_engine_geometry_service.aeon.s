# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23d4fc,0x23d71e); Metadata/configuration guards and engine mode service after rectangle copy; external services and full execution unverified.
# Fixed original addresses; not a hardware-validated implementation.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bn.sw 0x14(r1), r10
    bn.sw 0x10(r1), r11
    bn.sw 0xc(r1), r12
    bn.sw 0x8(r1), r13
    bn.sw 0x4(r1), r14
    bn.sw 0x0(r1), r15
    bt.mov r11, r3
    bg.jal 0x2227ef
    bt.mov r14, r3
    bn.bleui r11, 0x3, loc_23d53b
loc_23d51f:
    bt.movi r3, 0x0
loc_23d521:
    bn.lwz r15, 0x0(r1)
    bn.lwz r14, 0x4(r1)
    bn.lwz r13, 0x8(r1)
    bn.lwz r12, 0xc(r1)
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
loc_23d53b:
    bt.mov r3, r11
    bg.jal 0x222804
    bn.ori r10, r0, 0xb0
    bn.muls r3, r3, r10
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r3, r6
    bn.lbz r7, 0x20(r3)
    bn.andi r7, r7, 0x20
    bn.bnei r7, 0x0, loc_23d51f
    bt.mov r3, r11
    bg.jal 0x222804
    bn.muls r3, r3, r10
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lbz r7, 0x20(r3)
    bn.andi r7, r7, 0xc
    bn.beqi r7, 0x0, loc_23d58d
    bn.ori r7, r0, 0xa8
    bn.muls r7, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bg.lbz r7, 0x81(r7)
    bn.beqi r7, 0x0, loc_23d51f
loc_23d58d:
    bg.jal 0x2686dd
    bg.bnei r3, 0x0, loc_23d6ac
    bg.movhi r15, 0x3b
    bg.lwz r7, 0x5f38(r15)
    bg.lbz r7, 0xa8(r7)
    bn.beqi r7, 0x1, loc_23d5c5
loc_23d5a4:
    bg.jal 0x2686dd
    bn.beqi r3, 0x0, loc_23d5c5
    bg.lwz r6, 0x5f38(r15)
    bg.lbz r7, 0x9c(r6)
    bg.beqi r7, 0x0, loc_23d69e
    bg.lbz r7, 0xa8(r6)
    bg.bnei r7, 0x0, loc_23d69e
    bt.movi r7, 0x1
    bg.sbz 0xa8(r6), r7
loc_23d5c5:
    bn.ori r7, r0, 0x7c
    bn.muls r10, r11, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r10, r6
    bn.lbz r6, 0xf(r10)
    bn.andi r7, r6, 0xfe
    bn.sbz 0xf(r10), r7
    bt.mov r3, r11
    bg.jal 0x2334ec
    bn.ori r7, r0, 0xa8
    bn.muls r12, r14, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r12, r7
    bg.lbz r6, 0x81(r12)
    bg.bnei r6, 0x0, loc_23d690
    bt.movi r13, 0xa
    bn.lbz r10, 0xc(r10)
    bg.bnei r10, 0x0, loc_23d6d9
loc_23d605:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x51a0(r7)
    bn.extbs r6, r7
    bn.andi r7, r7, 0x7f
    bn.sflesi r6, -0x1
    bn.cmov_0 r13, r7, r13
    bn.beqi r13, 0x0, loc_23d63e
    bg.beqi r13, 0x4, loc_23d63e
    bg.beqi r13, 0x5, loc_23d63e
    bg.beqi r13, 0x6, loc_23d63e
    bg.beqi r13, 0x7, loc_23d630
    bg.bnei r13, 0xb, loc_23d64e
loc_23d630:
    bt.movi r3, 0x0
    bg.jal 0x21bcec
    bt.movi r3, 0x0
    bg.jal 0x21bcf6
    bt.j loc_23d64e
loc_23d63e:
    bg.ori r3, r0, 0x13a0
    bg.jal 0x21bd00
    bg.ori r3, r0, 0x8ef
    bg.jal 0x21bd0a
loc_23d64e:
    bt.mov r3, r13
    bt.mov r4, r11
    bg.jal 0x2213d0
    bt.mov r3, r11
    bg.jal 0x21ffb3
    bt.mov r3, r11
    bg.jal 0x222804
    bg.jal 0x222819
    bg.beq r11, r3, loc_23d6b2
loc_23d66a:
    bg.lwz r7, 0x5f38(r15)
    bn.lbz r7, 0x49(r7)
    bn.slli r7, r7, 0x8
    bg.ori r6, r0, 0x200
    bn.and r7, r7, r6
    bn.beqi r7, 0x0, loc_23d694
    bt.movi r3, 0x1
    bg.jal 0x21b944
    bt.movi r3, 0x1
    bt.j loc_23d521
loc_23d688:
    bg.jal 0x2229b7
    bg.bleui r3, 0x1, loc_23d71a
loc_23d690:
    bt.movi r13, 0x0
    bt.j loc_23d605
loc_23d694:
    bt.movi r3, 0x0
    bg.jal 0x21b944
    bt.movi r3, 0x1
    bt.j loc_23d521
loc_23d69e:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5229(r7)
    bg.sbz 0xa8(r6), r7
    bt.j loc_23d5c5
loc_23d6ac:
    bg.movhi r15, 0x3b
    bt.j loc_23d5a4
loc_23d6b2:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r14, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bg.lbz r7, 0x81(r7)
    bn.bnei r7, 0x0, loc_23d66a
    bt.movi r4, 0x1
    bn.sll r4, r4, r11
    bt.movi r3, 0x1
    bn.exthz r4, r4
    bg.jal 0x23d3a0
    bt.j loc_23d66a
loc_23d6d9:
    bt.mov r3, r11
    bg.jal 0x222804
    bn.ori r10, r0, 0xb0
    bn.muls r3, r3, r10
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bg.lbz r3, 0x8a(r3)
    bn.bnei r3, 0x0, loc_23d688
    bt.mov r3, r11
    bg.jal 0x222804
    bn.muls r3, r3, r10
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r3, r6
    bg.lbz r3, 0x8b(r3)
    bg.bnei r3, 0x0, loc_23d688
    bt.movi r13, 0x6
    bn.lbz r12, 0x34(r12)
    bg.beqi r12, 0x0, loc_23d605
loc_23d71a:
    bt.movi r13, 0x9
    bt.j loc_23d605
