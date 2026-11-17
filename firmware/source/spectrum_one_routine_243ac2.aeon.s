# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x243ac2,0x243b38); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x2c
    bn.sw 0x28(r1), r9
    bg.movhi r7, 0x45
    bg.lwz r7, 0x5230(r7)
    bn.beqi r7, 0x1, loc_243b14
loc_243ad3:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x3c43(r7)
    bg.sfnei r7, 0xc2
    bn.bnf loc_243aea
loc_243ae2:
    bn.lwz r9, 0x28(r1)
    bn.addi r1, r1, 0x2c
    bt.jr r9
loc_243aea:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x522e(r7)
    bn.bnei r7, 0x3, loc_243ae2
    bn.ori r3, r0, 0x7f
    bg.jal 0x243142
    bg.movhi r7, 0x45
    bg.lbz r7, 0x522c(r7)
    bn.beqi r7, 0x0, loc_243b2b
    bn.ori r3, r0, 0x40
    bn.lwz r9, 0x28(r1)
    bn.addi r1, r1, 0x2c
    bg.j 0x243142
loc_243b14:
    bt.mov r3, r1
    bt.movi r4, 0x1
    bg.jal 0x242968
    bn.lwz r7, 0x0(r1)
    bn.bnei r7, 0x1, loc_243ad3
    bn.ori r3, r0, 0xb8
    bg.jal 0x243142
    bt.j loc_243ad3
loc_243b2b:
    bn.ori r3, r0, 0x60
    bn.lwz r9, 0x28(r1)
    bn.addi r1, r1, 0x2c
    bg.j 0x243142
