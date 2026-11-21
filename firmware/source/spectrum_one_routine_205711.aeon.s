# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x205711,0x205953); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x3c
    bn.sw 0x38(r1), r9
    bn.sw 0x34(r1), r10
    bn.sw 0x30(r1), r11
    bt.mov r10, r3
    bt.mov r11, r4
    bn.sbz 0x2f(r1), r0
    bn.sbz 0x2e(r1), r0
    bn.sbz 0x2d(r1), r0
    bn.addi r4, r1, 0x2f
    bn.addi r5, r1, 0x2e
    bn.addi r6, r1, 0x2d
    bg.jal 0x20417e
    bn.lbz r3, 0x2f(r1)
    bn.lbz r4, 0x2e(r1)
    bn.lbz r5, 0x2d(r1)
    bt.movi r6, 0x0
    bg.jal 0x20568a
    bn.lbz r7, 0x2f(r1)
    bg.bnei r7, 0x0, loc_205881
loc_20574d:
    bn.sbz 0x2c(r1), r0
    bn.lbz r4, 0x2e(r1)
    bn.bnei r4, 0x0, loc_205770
loc_205756:
    bn.lbz r3, 0x2f(r1)
    bn.lbz r5, 0x2d(r1)
    bt.movi r6, 0x1
    bg.jal 0x20568a
    bn.lwz r11, 0x30(r1)
    bn.lwz r10, 0x34(r1)
    bn.lwz r9, 0x38(r1)
    bn.addi r1, r1, 0x3c
    bt.jr r9
loc_205770:
    bn.sh_1 0x28(r1), r0
    bt.mov r3, r10
    bt.mov r4, r11
    bn.addi r5, r1, 0x28
    bg.jal 0x20546f
    bg.beqi r3, 0x0, loc_2058d5
    bn.lh r3, 0x28(r1)
    bt.addi r3, 0x2
    bn.exthz r3, r3
    bn.addi r4, r1, 0x2c
    bg.jal 0x2461f6
    bn.sbz 0x2b(r1), r0
    bn.lh r3, 0x28(r1)
    bt.addi r3, 0x4
    bn.exthz r3, r3
    bn.addi r4, r1, 0x2b
    bg.jal 0x2461f6
    bn.lbz r3, 0x2b(r1)
    bg.jal 0x20557d
    bn.lh r3, 0x28(r1)
    bg.jal 0x20444d
loc_2057b1:
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x1ea4
    bn.sw 0x1c(r1), r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x1d64
    bn.sw 0x20(r1), r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x1c24
    bn.sw 0x24(r1), r7
    bg.movhi r10, 0x3b
    bg.lwz r7, 0x5f38(r10)
    bn.lbz r3, 0x5a(r7)
    bn.addi r4, r1, 0x1c
    bg.jal 0x23a135
    bn.lbz r7, 0x2c(r1)
    bn.sfnei r7, 0x12
    bn.bnf loc_2058e5
    bn.sfnei r7, 0x14
    bn.bnf loc_2058f9
    bn.sfnei r7, 0x16
    bn.bnf loc_205811
    bn.sfnei r7, 0x18
    bn.bnf loc_205921
    bn.sfnei r7, 0x1a
    bn.bnf loc_205935
    bn.sfnei r7, 0x56
    bn.bnf loc_205949
    bn.sfnei r7, 0x42
    bn.bnf loc_20590d
loc_205811:
    bg.movhi r7, 0x34
    bg.addi r7, r7, 0x1550
loc_205819:
    bn.sw 0x10(r1), r7
    bn.sw 0x14(r1), r7
    bn.sw 0x18(r1), r7
    bg.lwz r7, 0x5f38(r10)
    bn.lbz r3, 0x5a(r7)
    bn.addi r4, r1, 0x10
    bg.jal 0x23a295
    bn.lbz r7, 0x2c(r1)
    bn.sfnei r7, 0x12
    bn.bnf loc_2058db
    bn.sfnei r7, 0x14
    bn.bnf loc_2058ef
    bn.sfnei r7, 0x16
    bn.bnf loc_20585d
    bn.sfnei r7, 0x18
    bn.bnf loc_205917
    bn.sfnei r7, 0x1a
    bn.bnf loc_20592b
    bn.sfnei r7, 0x56
    bn.bnf loc_20593f
    bn.sfnei r7, 0x42
    bn.bnf loc_205903
loc_20585d:
    bg.movhi r7, 0x34
    bg.addi r7, r7, 0x750
loc_205865:
    bn.sw 0x4(r1), r7
    bn.sw 0x8(r1), r7
    bn.sw 0xc(r1), r7
    bg.lwz r7, 0x5f38(r10)
    bn.lbz r3, 0x5a(r7)
    bn.addi r4, r1, 0x4
    bg.jal 0x23a01f
    bn.lbz r4, 0x2e(r1)
    bt.j loc_205756
loc_205881:
    bt.mov r3, r10
    bt.mov r4, r11
    bg.jal 0x2053ad
    bg.movhi r4, 0x48
    bg.addi r5, r4, -0x1ae0
    bg.ori r23, r0, 0x1000
loc_205895:
    bn.lh_0 r6, 0x0(r5)
    bg.ori r24, r0, 0x1000
    bn.and r7, r6, r24
    bn.beqi r7, 0x0, loc_2058af
    bg.ori r24, r0, 0xfff
    bn.and r7, r6, r24
    bn.sub r7, r7, r23
    bn.exths r6, r7
loc_2058af:
    bn.sh_1 0x0(r5), r6
    bt.addi r5, 0x2
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x1ace
    bg.bne r5, r7, loc_205895
    bg.movhi r7, 0x3b
    bg.lwz r7, 0x5f38(r7)
    bn.lbz r3, 0x5a(r7)
    bg.addi r4, r4, -0x1ae0
    bg.jal 0x20981f
    bt.j loc_20574d
loc_2058d5:
    bg.jal 0x2040d2
    bt.j loc_2057b1
loc_2058db:
    bg.movhi r7, 0x34
    bg.addi r7, r7, 0x350
    bt.j loc_205865
loc_2058e5:
    bg.movhi r7, 0x34
    bg.addi r7, r7, 0x1150
    bt.j loc_205819
loc_2058ef:
    bg.movhi r7, 0x34
    bg.addi r7, r7, 0x550
    bt.j loc_205865
loc_2058f9:
    bg.movhi r7, 0x34
    bg.addi r7, r7, 0x1350
    bt.j loc_205819
loc_205903:
    bg.movhi r7, 0x34
    bg.addi r7, r7, 0x150
    bt.j loc_205865
loc_20590d:
    bg.movhi r7, 0x34
    bg.addi r7, r7, 0xf50
    bt.j loc_205819
loc_205917:
    bg.movhi r7, 0x34
    bg.addi r7, r7, 0x950
    bt.j loc_205865
loc_205921:
    bg.movhi r7, 0x34
    bg.addi r7, r7, 0x1750
    bt.j loc_205819
loc_20592b:
    bg.movhi r7, 0x34
    bg.addi r7, r7, 0xb50
    bt.j loc_205865
loc_205935:
    bg.movhi r7, 0x34
    bg.addi r7, r7, 0x1950
    bt.j loc_205819
loc_20593f:
    bg.movhi r7, 0x34
    bg.addi r7, r7, 0xd50
    bt.j loc_205865
loc_205949:
    bg.movhi r7, 0x34
    bg.addi r7, r7, 0x1b50
    bt.j loc_205819
