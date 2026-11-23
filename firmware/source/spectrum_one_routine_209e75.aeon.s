# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x209e75,0x20a02c); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x2c
    bn.sw 0x28(r1), r9
    bn.sw 0x24(r1), r10
    bn.sw 0x20(r1), r11
    bn.sw 0x1c(r1), r12
    bn.sw 0x18(r1), r13
    bn.sw 0x14(r1), r14
    bn.sw 0x10(r1), r15
    bn.sw 0xc(r1), r16
    bn.sw 0x8(r1), r17
    bn.sw 0x4(r1), r18
    bn.sw 0x0(r1), r19
    bt.mov r15, r3
    bt.mov r18, r4
    bt.mov r17, r5
    bt.mov r16, r6
    bt.movi r3, 0x0
    bg.jal 0x222b8a
    bt.mov r3, r15
    bg.jal 0x23e79e
    bt.mov r11, r3
    bn.beqi r3, 0x0, loc_209f2a
    bt.movi r13, 0x0
    bn.ori r7, r0, 0x58
    bn.muls r14, r15, r7
    bg.movhi r19, 0x45
    bg.addi r6, r19, 0x3fc4
    bt.add r14, r6
    bt.j loc_209ed1
loc_209ec6:
    bn.srli r7, r11, 0x1
    bn.exthz r11, r7
    bt.addi r13, 0x1
    bn.beqi r11, 0x0, loc_209f2a
loc_209ed1:
    bn.extbz r10, r13
    bn.andi r7, r11, 0x1
    bn.beqi r7, 0x0, loc_209ec6
    bt.mov r3, r10
    bg.jal 0x222b8a
    bt.mov r12, r3
    bn.andi r7, r10, 0x1
    bg.beqi r7, 0x0, loc_209f6d
    bn.lbz r7, 0x54(r14)
    bg.beqi r7, 0x0, loc_209fa4
    bg.movhi r6, 0x2580
    bn.ori r6, r6, 0x42
    bt.add r3, r6
    bt.mov r4, r18
    bg.jal 0x23dfb6
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x44
    bn.add r3, r12, r7
    bt.mov r4, r17
    bg.jal 0x23dfb6
    bg.movhi r6, 0x2580
    bn.ori r6, r6, 0x46
    bn.add r3, r12, r6
    bt.mov r4, r16
    bg.jal 0x23dfb6
    bn.srli r7, r11, 0x1
    bn.exthz r11, r7
    bt.addi r13, 0x1
    bn.bnei r11, 0x0, loc_209ed1
loc_209f2a:
    bn.ori r7, r0, 0x58
    bn.muls r7, r15, r7
    bg.movhi r6, 0x45
    bg.addi r6, r6, 0x3fc4
    bt.add r7, r6
    bn.lbz r7, 0x54(r7)
    bg.beqi r7, 0x0, loc_20a000
    bt.mov r3, r15
    bt.movi r4, 0x1
    bn.lwz r19, 0x0(r1)
    bn.lwz r18, 0x4(r1)
    bn.lwz r17, 0x8(r1)
    bn.lwz r16, 0xc(r1)
    bn.lwz r15, 0x10(r1)
    bn.lwz r14, 0x14(r1)
    bn.lwz r13, 0x18(r1)
    bn.lwz r12, 0x1c(r1)
    bn.lwz r11, 0x20(r1)
    bn.lwz r10, 0x24(r1)
    bn.lwz r9, 0x28(r1)
    bn.addi r1, r1, 0x2c
    bg.j 0x209d5b
loc_209f6d:
    bn.lbz r6, 0x54(r14)
    bn.beqi r6, 0x0, loc_209fd2
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x4e
    bt.add r3, r7
    bt.mov r4, r18
    bg.jal 0x23dfb6
    bg.movhi r6, 0x2580
    bn.ori r6, r6, 0x50
    bn.add r3, r12, r6
    bt.mov r4, r17
    bg.jal 0x23dfb6
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x52
    bn.add r3, r12, r7
    bt.mov r4, r16
    bg.jal 0x23dfb6
    bt.j loc_209ec6
loc_209fa4:
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x9a
    bt.add r3, r7
    bt.mov r4, r18
    bg.jal 0x23dfb6
    bn.movhi_2 r6, 0xf80
    bn.ori r6, r6, 0x9c
    bn.add r3, r12, r6
    bt.mov r4, r17
    bg.jal 0x23dfb6
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x9e
    bn.add r3, r12, r7
    bt.mov r4, r16
    bg.jal 0x23dfb6
    bt.j loc_209ec6
loc_209fd2:
    bn.movhi_2 r6, 0xf80
    bn.ori r6, r6, 0xa0
    bt.add r3, r6
    bt.mov r4, r18
    bg.jal 0x23dfb6
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0xa2
    bn.add r3, r12, r7
    bt.mov r4, r17
    bg.jal 0x23dfb6
    bn.movhi_2 r6, 0xf80
    bn.ori r6, r6, 0xa4
    bn.add r3, r12, r6
    bt.mov r4, r16
    bg.jal 0x23dfb6
    bt.j loc_209ec6
loc_20a000:
    bt.mov r3, r15
    bt.movi r4, 0x1
    bn.lwz r19, 0x0(r1)
    bn.lwz r18, 0x4(r1)
    bn.lwz r17, 0x8(r1)
    bn.lwz r16, 0xc(r1)
    bn.lwz r15, 0x10(r1)
    bn.lwz r14, 0x14(r1)
    bn.lwz r13, 0x18(r1)
    bn.lwz r12, 0x1c(r1)
    bn.lwz r11, 0x20(r1)
    bn.lwz r10, 0x24(r1)
    bn.lwz r9, 0x28(r1)
    bn.addi r1, r1, 0x2c
    bg.j 0x209deb
