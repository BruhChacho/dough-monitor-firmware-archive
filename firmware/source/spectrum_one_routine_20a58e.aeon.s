# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20a58e,0x20a79a); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x24
    bn.sw 0x20(r1), r9
    bn.sw 0x1c(r1), r10
    bn.sw 0x18(r1), r11
    bn.sw 0x14(r1), r12
    bn.sw 0x10(r1), r13
    bn.sw 0xc(r1), r14
    bn.sw 0x8(r1), r15
    bn.sw 0x4(r1), r16
    bn.sw 0x0(r1), r17
    bt.mov r16, r3
    bt.movi r3, 0x0
    bg.jal 0x222b8a
    bt.mov r3, r16
    bg.jal 0x23e79e
    bt.mov r11, r3
    bg.movhi r17, 0x45
    bg.lbz r7, 0x5211(r17)
    bg.movhi r15, 0x45
    bg.sbz 0x5210(r15), r0
    bn.beqi r7, 0x0, loc_20a5f8
    bt.movi r7, 0x1
    bg.sbz 0x5210(r15), r7
    bg.jal 0x23e49c
    bt.movi r3, 0xa
    bt.movi r4, 0x1
    bg.jal 0x23e13b
    bn.movhi_2 r3, 0x90
    bg.ori r3, r3, 0x2f02
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bt.movi r3, 0xa
    bt.movi r4, 0x0
    bg.jal 0x23e13b
loc_20a5f8:
    bg.beqi r11, 0x0, loc_20a688
    bt.movi r14, 0x0
    bn.ori r7, r0, 0x58
    bn.muls r13, r16, r7
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x3fc4
    bt.add r13, r7
    bt.j loc_20a61b
loc_20a610:
    bn.srli r7, r11, 0x1
    bn.exthz r11, r7
    bt.addi r14, 0x1
    bn.beqi r11, 0x0, loc_20a688
loc_20a61b:
    bn.extbz r10, r14
    bn.andi r7, r11, 0x1
    bn.beqi r7, 0x0, loc_20a610
    bt.mov r3, r10
    bg.jal 0x222b8a
    bt.mov r12, r3
    bn.andi r7, r10, 0x1
    bg.beqi r7, 0x0, loc_20a6da
    bg.lbz r7, 0x5210(r15)
    bg.beqi r7, 0x0, loc_20a750
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x48
    bt.add r3, r7
    bn.lh r4, 0x4c(r13)
    bg.jal 0x23e58a
loc_20a64b:
    bg.lbz r7, 0x5210(r15)
    bg.beqi r7, 0x0, loc_20a724
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x4a
    bn.add r3, r12, r7
    bn.lh r4, 0x4e(r13)
    bg.jal 0x23e58a
    bg.lbz r7, 0x5210(r15)
    bg.beqi r7, 0x0, loc_20a73d
loc_20a66c:
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x4c
    bn.add r3, r12, r7
    bn.lh r4, 0x50(r13)
    bg.jal 0x23e58a
    bn.srli r7, r11, 0x1
    bn.exthz r11, r7
    bt.addi r14, 0x1
    bn.bnei r11, 0x0, loc_20a61b
loc_20a688:
    bg.lbz r17, 0x5211(r17)
    bn.beqi r17, 0x0, loc_20a6b4
    bg.jal 0x23e4a0
    bg.sbz 0x5210(r15), r0
    bt.movi r3, 0xa
    bt.movi r4, 0x1
    bg.jal 0x23e13b
    bn.movhi_2 r3, 0x90
    bg.ori r3, r3, 0x2f02
    bt.movi r4, 0x5
    bg.jal 0x23ddb9
    bt.movi r3, 0xa
    bt.movi r4, 0x0
    bg.jal 0x23e13b
loc_20a6b4:
    bt.mov r3, r16
    bt.movi r4, 0x1
    bn.lwz r17, 0x0(r1)
    bn.lwz r16, 0x4(r1)
    bn.lwz r15, 0x8(r1)
    bn.lwz r14, 0xc(r1)
    bn.lwz r13, 0x10(r1)
    bn.lwz r12, 0x14(r1)
    bn.lwz r11, 0x18(r1)
    bn.lwz r10, 0x1c(r1)
    bn.lwz r9, 0x20(r1)
    bn.addi r1, r1, 0x24
    bg.j 0x209ccb
loc_20a6da:
    bg.lbz r7, 0x5210(r15)
    bg.beqi r7, 0x0, loc_20a788
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x54
    bt.add r3, r7
    bn.lh r4, 0x4c(r13)
    bg.jal 0x23e58a
loc_20a6f2:
    bg.lbz r7, 0x5210(r15)
    bn.beqi r7, 0x0, loc_20a775
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x56
    bn.add r3, r12, r7
    bn.lh r4, 0x4e(r13)
    bg.jal 0x23e58a
loc_20a70a:
    bg.lbz r7, 0x5210(r15)
    bn.beqi r7, 0x0, loc_20a762
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x58
    bn.add r3, r12, r7
    bn.lh r4, 0x50(r13)
    bg.jal 0x23e58a
    bt.j loc_20a610
loc_20a724:
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x4a
    bn.add r3, r12, r7
    bn.lh r4, 0x4e(r13)
    bg.jal 0x23dfb6
    bg.lbz r7, 0x5210(r15)
    bg.bnei r7, 0x0, loc_20a66c
loc_20a73d:
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x4c
    bn.add r3, r12, r7
    bn.lh r4, 0x50(r13)
    bg.jal 0x23dfb6
    bt.j loc_20a610
loc_20a750:
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x48
    bt.add r3, r7
    bn.lh r4, 0x4c(r13)
    bg.jal 0x23dfb6
    bt.j loc_20a64b
loc_20a762:
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x58
    bn.add r3, r12, r7
    bn.lh r4, 0x50(r13)
    bg.jal 0x23dfb6
    bt.j loc_20a610
loc_20a775:
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x56
    bn.add r3, r12, r7
    bn.lh r4, 0x4e(r13)
    bg.jal 0x23dfb6
    bt.j loc_20a70a
loc_20a788:
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x54
    bt.add r3, r7
    bn.lh r4, 0x4c(r13)
    bg.jal 0x23dfb6
    bt.j loc_20a6f2
