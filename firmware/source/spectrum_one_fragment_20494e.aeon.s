# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20494e,0x204b65); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x28
    bn.sw 0x24(r1), r9
    bn.sw 0x20(r1), r10
    bn.sw 0x1c(r1), r11
    bn.sw 0x18(r1), r12
    bn.sw 0x14(r1), r13
    bn.sw 0x10(r1), r14
    bn.sw 0xc(r1), r15
    bn.sw 0x8(r1), r16
    bn.sw 0x4(r1), r17
    bn.sw 0x0(r1), r18
    bt.mov r10, r3
    bt.mov r17, r4
    bt.mov r16, r5
    bt.mov r15, r6
    bt.movi r3, 0x0
    bg.jal 0x222b8a
    bt.mov r3, r10
    bg.jal 0x23e79e
    bt.mov r11, r3
    bg.movhi r18, 0x45
    bg.lbz r7, 0x5211(r18)
    bg.movhi r14, 0x45
    bg.sbz 0x5210(r14), r0
    bn.beqi r7, 0x0, loc_2049c1
    bt.movi r7, 0x1
    bg.sbz 0x5210(r14), r7
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
loc_2049c1:
    bn.beqi r11, 0x0, loc_204a3d
    bt.movi r13, 0x0
    bt.j loc_2049d3
loc_2049c8:
    bn.srli r7, r11, 0x1
    bn.exthz r11, r7
    bt.addi r13, 0x1
    bn.beqi r11, 0x0, loc_204a3d
loc_2049d3:
    bn.extbz r10, r13
    bn.andi r7, r11, 0x1
    bn.beqi r7, 0x0, loc_2049c8
    bt.mov r3, r10
    bg.jal 0x222b8a
    bt.mov r12, r3
    bn.andi r7, r10, 0x1
    bg.beqi r7, 0x0, loc_204a68
    bg.lbz r7, 0x5210(r14)
    bg.beqi r7, 0x0, loc_204ad9
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x42
    bt.add r3, r7
    bt.mov r4, r17
    bg.jal 0x23e58a
loc_204a02:
    bg.lbz r7, 0x5210(r14)
    bg.beqi r7, 0x0, loc_204aaf
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x44
    bn.add r3, r12, r7
    bt.mov r4, r16
    bg.jal 0x23e58a
    bg.lbz r7, 0x5210(r14)
    bg.beqi r7, 0x0, loc_204ac7
loc_204a22:
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x46
    bn.add r3, r12, r7
    bt.mov r4, r15
    bg.jal 0x23e58a
    bn.srli r7, r11, 0x1
    bn.exthz r11, r7
    bt.addi r13, 0x1
    bn.bnei r11, 0x0, loc_2049d3
loc_204a3d:
    bg.lbz r18, 0x5211(r18)
    bg.bnei r18, 0x0, loc_204b1f
    bn.lwz r18, 0x0(r1)
    bn.lwz r17, 0x4(r1)
    bn.lwz r16, 0x8(r1)
    bn.lwz r15, 0xc(r1)
    bn.lwz r14, 0x10(r1)
    bn.lwz r13, 0x14(r1)
    bn.lwz r12, 0x18(r1)
    bn.lwz r11, 0x1c(r1)
    bn.lwz r10, 0x20(r1)
    bn.lwz r9, 0x24(r1)
    bn.addi r1, r1, 0x28
    bt.jr r9
loc_204a68:
    bg.lbz r7, 0x5210(r14)
    bg.beqi r7, 0x0, loc_204b0e
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x4e
    bt.add r3, r7
    bt.mov r4, r17
    bg.jal 0x23e58a
loc_204a7f:
    bg.lbz r7, 0x5210(r14)
    bn.beqi r7, 0x0, loc_204afc
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x50
    bn.add r3, r12, r7
    bt.mov r4, r16
    bg.jal 0x23e58a
loc_204a96:
    bg.lbz r7, 0x5210(r14)
    bn.beqi r7, 0x0, loc_204aea
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x52
    bn.add r3, r12, r7
    bt.mov r4, r15
    bg.jal 0x23e58a
    bt.j loc_2049c8
loc_204aaf:
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x44
    bn.add r3, r12, r7
    bt.mov r4, r16
    bg.jal 0x23dfb6
    bg.lbz r7, 0x5210(r14)
    bg.bnei r7, 0x0, loc_204a22
loc_204ac7:
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x46
    bn.add r3, r12, r7
    bt.mov r4, r15
    bg.jal 0x23dfb6
    bt.j loc_2049c8
loc_204ad9:
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x42
    bt.add r3, r7
    bt.mov r4, r17
    bg.jal 0x23dfb6
    bt.j loc_204a02
loc_204aea:
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x52
    bn.add r3, r12, r7
    bt.mov r4, r15
    bg.jal 0x23dfb6
    bt.j loc_2049c8
loc_204afc:
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x50
    bn.add r3, r12, r7
    bt.mov r4, r16
    bg.jal 0x23dfb6
    bt.j loc_204a96
loc_204b0e:
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x4e
    bt.add r3, r7
    bt.mov r4, r17
    bg.jal 0x23dfb6
    bt.j loc_204a7f
loc_204b1f:
    bg.jal 0x23e4a0
    bg.sbz 0x5210(r14), r0
    bt.movi r3, 0xa
    bt.movi r4, 0x1
    bg.jal 0x23e13b
    bn.movhi_2 r3, 0x90
    bg.ori r3, r3, 0x2f02
    bt.movi r4, 0x5
    bg.jal 0x23ddb9
    bt.movi r3, 0xa
    bt.movi r4, 0x0
    bn.lwz r18, 0x0(r1)
    bn.lwz r17, 0x4(r1)
    bn.lwz r16, 0x8(r1)
    bn.lwz r15, 0xc(r1)
    bn.lwz r14, 0x10(r1)
    bn.lwz r13, 0x14(r1)
    bn.lwz r12, 0x18(r1)
    bn.lwz r11, 0x1c(r1)
    bn.lwz r10, 0x20(r1)
    bn.lwz r9, 0x24(r1)
    bn.addi r1, r1, 0x28
    bg.j 0x23e13b
