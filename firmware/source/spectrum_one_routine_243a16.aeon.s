# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x243a16,0x243ac2); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x30
    bn.sw 0x2c(r1), r9
    bn.sw 0x28(r1), r10
    bg.jal 0x242f90
    bt.mov r10, r3
    bg.movhi r7, 0x45
    bg.lwz r7, 0x5230(r7)
    bn.beqi r7, 0x1, loc_243a8d
loc_243a30:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x3c43(r7)
    bg.sfnei r7, 0x9d
    bn.bnf loc_243aa4
    bn.sfnei r7, 0x1c
    bn.bnf loc_243aaa
    bn.sfnei r7, 0x37
    bn.bnf loc_243ab2
    bg.sfnei r7, 0xc2
    bn.bnf loc_243a80
    bg.sfnei r7, 0xef
    bn.bnf loc_243aba
loc_243a59:
    bt.mov r3, r10
    bg.jal 0x243825
loc_243a5f:
    bg.ori r3, r0, 0x426
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dead
    bg.ori r3, r0, 0x428
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bn.lwz r10, 0x28(r1)
    bn.lwz r9, 0x2c(r1)
    bn.addi r1, r1, 0x30
    bg.j 0x23dead
loc_243a80:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x522e(r7)
    bn.bnei r7, 0x3, loc_243a59
    bt.j loc_243a5f
loc_243a8d:
    bt.mov r3, r1
    bt.movi r4, 0x1
    bg.jal 0x242968
    bn.lwz r7, 0x0(r1)
    bn.bnei r7, 0x1, loc_243a30
    bn.ori r3, r0, 0x38
    bg.jal 0x243142
    bt.j loc_243a5f
loc_243aa4:
    bg.jal 0x242b66
    bt.j loc_243a5f
loc_243aaa:
    bt.mov r3, r10
    bg.jal 0x2439d6
    bt.j loc_243a5f
loc_243ab2:
    bt.mov r3, r10
    bg.jal 0x243996
    bt.j loc_243a5f
loc_243aba:
    bt.mov r3, r10
    bg.jal 0x243865
    bt.j loc_243a5f
