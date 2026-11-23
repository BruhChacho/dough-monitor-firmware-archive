# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x209128,0x209218); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bn.sw 0x14(r1), r10
    bn.sw 0x10(r1), r11
    bn.sw 0xc(r1), r12
    bn.sw 0x8(r1), r13
    bn.sw 0x4(r1), r14
    bn.sw 0x0(r1), r15
    bt.mov r14, r3
    bt.mov r15, r4
    bn.ori r7, r0, 0xa8
    bn.muls r7, r3, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lh r10, 0x2a(r7)
    bn.beqi r10, 0x0, loc_2091d4
    bt.movi r13, 0x0
    bt.j loc_209184
loc_20915e:
    bt.mov r3, r11
    bn.ori r4, r0, 0x10
    bg.jal 0x23ddb9
    bn.movhi_2 r6, 0x1080
    bn.ori r6, r6, 0xa0
    bt.add r11, r6
    bt.mov r3, r11
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x1
    bg.bnei r3, 0x0, loc_209200
loc_20917c:
    bn.srli r10, r10, 0x1
    bt.addi r13, 0x1
    bn.beqi r10, 0x0, loc_2091d4
loc_209184:
    bn.extbz r6, r13
    bn.andi r7, r10, 0x1
    bn.beqi r7, 0x0, loc_20917c
    bn.ori r7, r0, 0x7c
    bn.muls r7, r6, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lwz r11, 0x4(r7)
    bn.andi r7, r6, 0x1
    bn.bnei r7, 0x0, loc_20915e
    bt.mov r3, r11
    bt.movi r4, 0xf
    bg.jal 0x23ddb9
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x30
    bn.add r12, r11, r7
    bt.mov r3, r12
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x1
    bn.bnei r3, 0x0, loc_20920c
loc_2091c3:
    bt.mov r3, r11
    bn.ori r4, r0, 0x10
    bg.jal 0x23ddb9
    bn.srli r10, r10, 0x1
    bt.addi r13, 0x1
    bn.bnei r10, 0x0, loc_209184
loc_2091d4:
    bt.movi r10, 0x0
loc_2091d6:
    bt.mov r3, r14
    bn.extbz r4, r10
    bt.mov r5, r15
    bg.jal 0x208f82
    bt.addi r10, 0x1
    bn.bnei r10, 0x3, loc_2091d6
    bn.lwz r15, 0x0(r1)
    bn.lwz r14, 0x4(r1)
    bn.lwz r13, 0x8(r1)
    bn.lwz r12, 0xc(r1)
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
loc_209200:
    bt.mov r3, r11
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dead
    bt.j loc_20917c
loc_20920c:
    bt.mov r3, r12
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dead
    bt.j loc_2091c3
