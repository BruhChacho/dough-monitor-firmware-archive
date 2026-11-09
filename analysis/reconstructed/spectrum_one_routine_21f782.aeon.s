# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21f782,0x21fac9); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x24
    bn.sw 0x20(r1), r9
    bn.sw 0x1c(r1), r10
    bn.sw 0x18(r1), r11
    bn.sw 0x14(r1), r12
    bn.sw 0x10(r1), r13
    bn.sw 0xc(r1), r14
    bn.sw 0x8(r1), r15
    bt.mov r15, r3
    bg.jal 0x222804
    bt.mov r12, r3
    bn.sh_2 0x6(r1), r0
    bn.sh_1 0x4(r1), r0
    bt.movhi r11, -0xf
    bg.ori r3, r11, 0x151c
    bg.jal 0x23dd44
    bt.mov r10, r3
    bg.ori r3, r11, 0x1519
    bg.jal 0x23dd44
    bn.andi r10, r10, 0xf
    bn.slli r10, r10, 0x4
    bn.andi r3, r3, 0xf
    bt.addi r3, 0x1
    bt.add r10, r3
    bn.extbz r14, r10
    bg.ori r3, r11, 0x151c
    bg.jal 0x23dd44
    bt.mov r10, r3
    bg.ori r3, r11, 0x1519
    bg.jal 0x23dd44
    bn.andi r3, r3, 0xf0
    bn.srai r3, r3, 0x4
    bt.movi r7, -0x10
    bn.and r10, r10, r7
    bt.addi r10, 0x1
    bt.add r3, r10
    bn.extbz r13, r3
    bn.ori r7, r0, 0xb0
    bn.muls r12, r12, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r12, r7
    bn.lbz r7, 0x20(r12)
    bn.andi r7, r7, 0x10
    bn.beqi r7, 0x0, loc_21f80f
    bn.slli r7, r13, 0x1
    bn.extbz r13, r7
loc_21f80f:
    bn.lwz r6, 0x4(r12)
    bn.andi r7, r6, 0x8
    bg.bnei r7, 0x0, loc_21f9df
loc_21f819:
    bn.andi r7, r6, 0x20
    bg.beqi r7, 0x0, loc_21f8b1
    bn.lwz r3, 0x0(r12)
    bn.addi r4, r1, 0x6
    bn.addi r5, r1, 0x4
    bg.jal 0x20eb70
    bn.lh r10, 0x6(r1)
    bt.mov r3, r15
    bg.jal 0x21e9ba
    bg.lbz r5, 0x89(r12)
    bg.lbz r6, 0x88(r12)
    bn.lbz r7, 0x70(r12)
    bn.sfeqi r7, 0x0
    bn.cmovi r7, 0x1, 0x2
    bn.muls r10, r10, r3
    bn.muls r10, r14, r10
    bn.divu r10, r10, r5
    bt.addi r6, 0x1
    bn.divu r10, r10, r6
    bn.divu r12, r10, r7
loc_21f858:
    bg.jal 0x21bd14
    bt.mov r11, r3
    bg.jal 0x21bd8d
    bn.beqi r3, 0x0, loc_21f8a3
    bn.srli r10, r11, 0x1f
    bt.add r10, r11
    bn.srai r10, r10, 0x1
    bg.jal 0x21bd1e
    bn.muls r10, r10, r3
    bn.muls r10, r13, r10
    bt.movi r11, 0x2
loc_21f879:
    bg.jal 0x21bd91
    bn.muls r7, r11, r10
    bn.divu r3, r7, r3
    bn.beqi r12, 0x0, loc_21f889
    bn.bnei r3, 0x0, loc_21f8d8
loc_21f889:
    bn.lwz r15, 0x8(r1)
    bn.lwz r14, 0xc(r1)
    bn.lwz r13, 0x10(r1)
    bn.lwz r12, 0x14(r1)
    bn.lwz r11, 0x18(r1)
    bn.lwz r10, 0x1c(r1)
    bn.lwz r9, 0x20(r1)
    bn.addi r1, r1, 0x24
    bt.jr r9
loc_21f8a3:
    bg.jal 0x21bd1e
    bn.muls r3, r3, r11
    bn.muls r10, r13, r3
    bt.movi r11, 0x1
    bt.j loc_21f879
loc_21f8b1:
    bt.mov r3, r15
    bg.jal 0x21d913
    bn.addi r10, r3, 0x1
    bg.lbz r7, 0x89(r12)
    bn.divs r10, r10, r7
    bg.lbz r7, 0x88(r12)
    bt.addi r7, 0x1
    bn.divs r10, r10, r7
    bt.mov r3, r15
    bg.jal 0x21e9ba
    bn.muls r10, r10, r3
    bn.muls r12, r14, r10
    bt.j loc_21f858
loc_21f8d8:
    bg.movhi r4, 0x45
    bn.ori r7, r0, 0xfa
    bg.sw_1 0x5208(r4), r7
    bt.mov r6, r12
    bt.mov r5, r3
    bt.movi r10, 0x1
    bn.beqi r6, 0x0, loc_21f908
loc_21f8ec:
    bn.beqi r5, 0x0, loc_21f908
    bg.lhz r7, 0x5208(r4)
    bn.beqi r7, 0x0, loc_21f908
    bg.ble r5, r6, loc_21fab8
    bn.divu r7, r5, r6
    bn.muls r7, r7, r6
    bn.sub r5, r5, r7
    bt.mov r10, r6
    bn.bnei r6, 0x0, loc_21f8ec
loc_21f908:
    bn.divu r12, r12, r10
    bn.divu r13, r3, r10
    bg.sfleui r12, 0x7cf
    bn.bnf loc_21f9f3
loc_21f915:
    bg.bgt r13, r12, loc_21f9fc
    bg.ori r7, r0, 0x7d0
    bn.divu r7, r7, r13
    bt.addi r7, 0x1
loc_21f922:
    bn.muls r12, r12, r7
    bn.muls r13, r13, r7
loc_21f928:
    bg.movhi r6, 0x45
    bg.lbz r7, 0x4824(r6)
    bn.srli r6, r7, 0x3
    bt.movi r11, 0x0
    bn.or r11, r6, r11
    bn.slli r10, r7, 0x1d
    bt.mov r3, r10
    bt.mov r4, r11
    bt.movi r5, 0x0
    bt.movi r6, 0x0
    bg.jal 0x2aad0b
    bg.blesi r3, 0x0, loc_21fa30
    bt.mov r3, r10
    bt.mov r4, r11
    bg.jal 0x2aae3d
    bt.mov r11, r3
loc_21f955:
    bg.blesi r13, -0x1, loc_21fa1b
    bt.mov r3, r13
    bg.jal 0x2ac120
loc_21f95f:
    bg.movhi r7, 0x34
    bg.lwz r4, 0x3890(r7)
    bg.jal 0x2abe2e
    bg.movhi r4, 0x4100
    bg.jal 0x2abe2e
    bt.mov r4, r3
    bt.mov r3, r11
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bt.movi r15, 0x0
    bn.ori r14, r0, 0x10
    bn.sfgtui r3, 0x1f
    bn.bf loc_21fa07
loc_21f98a:
    bt.movhi r11, -0xf
    bg.ori r3, r11, 0x1516
    bt.mov r4, r15
    bt.movi r5, 0xf
    bg.jal 0x23dfe1
    bg.ori r3, r11, 0x1516
    bt.mov r4, r14
    bn.ori r5, r0, 0xf0
    bg.jal 0x23dfe1
    bg.ori r3, r11, 0x1517
    bt.mov r4, r15
    bt.movi r5, 0xf
    bg.jal 0x23dfe1
    bg.ori r3, r11, 0x1517
    bt.mov r4, r14
    bn.ori r5, r0, 0xf0
    bg.jal 0x23dfe1
    bn.addi r10, r12, -0x1
    bn.srli r7, r10, 0x18
    bn.bnei r7, 0x0, loc_21f9d0
    bt.addi r13, -0x1
    bn.srli r7, r13, 0x18
    bg.beqi r7, 0x0, loc_21fa55
loc_21f9d0:
    bg.ori r3, r11, 0x15e1
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x88
    bg.jal 0x23dfe1
    bt.j loc_21f889
loc_21f9df:
    bn.lwz r3, 0x0(r12)
    bg.jal 0x20ebba
    bt.addi r3, 0x1
    bn.muls r3, r14, r3
    bn.extbz r14, r3
    bn.lwz r6, 0x4(r12)
    bt.j loc_21f819
loc_21f9f3:
    bg.sfgti r13, 0x7cf
    bn.bf loc_21f928
    bt.j loc_21f915
loc_21f9fc:
    bg.ori r7, r0, 0x7d0
    bn.divu r7, r7, r12
    bt.addi r7, 0x1
    bt.j loc_21f922
loc_21fa07:
    bg.jal 0x2402ab
    bn.addi r7, r3, -0x5
    bn.extbz r15, r7
    bt.addi r3, -0x4
    bn.slli r3, r3, 0x4
    bn.extbz r14, r3
    bt.j loc_21f98a
loc_21fa1b:
    bn.andi r7, r13, 0x1
    bn.srli r3, r13, 0x1
    bn.or r3, r7, r3
    bg.jal 0x2ac120
    bt.mov r4, r3
    bg.jal 0x2abd99
    bt.j loc_21f95f
loc_21fa30:
    bn.andi r3, r10, 0x1
    bt.movi r4, 0x0
    bn.slli r6, r11, 0x1f
    bn.srli r7, r10, 0x1
    bn.or r7, r6, r7
    bn.srli r8, r11, 0x1
    bn.or r3, r3, r7
    bn.or r4, r4, r8
    bg.jal 0x2aae3d
    bt.mov r4, r3
    bg.jal 0x2abd99
    bt.mov r11, r3
    bt.j loc_21f955
loc_21fa55:
    bg.ori r3, r11, 0x1532
    bn.extbz r4, r10
    bg.jal 0x23ddb9
    bn.srli r4, r10, 0x8
    bg.ori r3, r11, 0x1533
    bn.extbz r4, r4
    bg.jal 0x23ddb9
    bn.srli r4, r10, 0x10
    bg.ori r3, r11, 0x1534
    bg.ori r7, r0, 0x1ff
    bn.and r4, r4, r7
    bg.jal 0x23dfb6
    bg.ori r3, r11, 0x1536
    bn.extbz r4, r13
    bg.jal 0x23ddb9
    bn.srli r4, r13, 0x8
    bg.ori r3, r11, 0x1537
    bn.extbz r4, r4
    bg.jal 0x23ddb9
    bn.srli r4, r13, 0x10
    bg.ori r3, r11, 0x1538
    bn.extbz r4, r4
    bg.jal 0x23ddb9
    bg.ori r3, r11, 0x15e1
    bn.ori r4, r0, 0x80
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bn.j loc_21f889
loc_21fab8:
    bn.divu r7, r6, r5
    bn.muls r7, r7, r5
    bn.sub r6, r6, r7
    bt.mov r10, r5
    bg.beqi r6, 0x0, loc_21f908
    bt.j loc_21f8ec
