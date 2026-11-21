# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23a327,0x23a423); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x20
    bn.sw 0x1c(r1), r9
    bn.sw 0x18(r1), r10
    bn.sw 0x14(r1), r11
    bn.sw 0x10(r1), r12
    bt.mov r10, r3
    bt.mov r11, r4
    bn.sw 0xc(r1), r0
    bn.sw 0x8(r1), r0
    bt.movi r7, 0x1
    bn.sw 0x4(r1), r7
    bn.addi r4, r1, 0xc
    bg.jal 0x23e697
    bt.mov r3, r10
    bn.addi r4, r1, 0x8
    bn.addi r5, r1, 0x4
    bg.jal 0x23e661
    bg.movhi r12, 0x3b
    bg.lwz r7, 0x5f38(r12)
    bn.lbz r3, 0x5a(r7)
    bg.jal 0x27e9b2
    bn.beqi r3, 0x0, loc_23a39e
    bt.mov r3, r10
    bg.jal 0x23e760
    bg.beqi r3, 0x0, loc_23a415
    bt.mov r3, r11
    bg.jal 0x262c42
    bn.slli r3, r3, 0x3
    bn.exthz r4, r3
loc_23a380:
    bg.lwz r7, 0x5f38(r12)
    bn.lbz r3, 0x5a(r7)
    bt.movi r5, 0x0
    bg.jal 0x28f6c7
    bn.lwz r12, 0x10(r1)
    bn.lwz r11, 0x14(r1)
    bn.lwz r10, 0x18(r1)
    bn.lwz r9, 0x1c(r1)
    bn.addi r1, r1, 0x20
    bt.jr r9
loc_23a39e:
    bg.movhi r7, 0x3b
    bg.lhz r7, 0x494a(r7)
    bn.muls r6, r11, r7
    bg.addi r7, r6, 0x3ff
    bn.sflesi r6, -0x1
    bn.cmov_0 r7, r7, r6
    bn.srai r7, r7, 0xa
    bn.exthz r11, r7
    bt.mov r3, r10
    bg.jal 0x23e760
    bn.beqi r3, 0x0, loc_23a3f2
    bt.mov r3, r10
    bt.movi r4, 0x0
    bg.jal 0x209a30
    bt.mov r3, r11
    bg.jal 0x262c42
    bn.extbz r4, r3
    bt.mov r3, r10
    bg.jal 0x20acfb
loc_23a3d9:
    bg.jal 0x235230
    bg.jal 0x2352b6
    bn.lwz r12, 0x10(r1)
    bn.lwz r11, 0x14(r1)
    bn.lwz r10, 0x18(r1)
    bn.lwz r9, 0x1c(r1)
    bn.addi r1, r1, 0x20
    bt.jr r9
loc_23a3f2:
    bn.lwz r7, 0x4(r1)
    bn.sfnei r7, 0x0
    bn.cmovsi_2 r4, r0, 0x1
    bt.mov r3, r10
    bn.andi r4, r4, 0x1
    bg.jal 0x209a30
    bt.mov r3, r11
    bg.jal 0x262c1d
    bn.extbz r4, r3
    bt.mov r3, r10
    bg.jal 0x20ab72
    bt.j loc_23a3d9
loc_23a415:
    bt.mov r3, r11
    bg.jal 0x262c1d
    bn.slli r3, r3, 0x3
    bn.exthz r4, r3
    bt.j loc_23a380
