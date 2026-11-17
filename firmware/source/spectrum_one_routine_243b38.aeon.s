# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x243b38,0x243c25); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x34
    bn.sw 0x30(r1), r9
    bn.sw 0x2c(r1), r10
    bn.sw 0x28(r1), r11
    bt.mov r10, r3
    bg.jal 0x242f90
    bt.mov r11, r3
    bg.movhi r7, 0x45
    bg.lwz r7, 0x5230(r7)
    bn.beqi r7, 0x1, loc_243bad
loc_243b57:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x3c43(r7)
    bg.sfnei r7, 0x9d
    bn.bnf loc_243bcd
    bn.sfnei r7, 0x1c
    bn.bnf loc_243bdf
    bn.sfeqi r7, 0x37
    bn.bf loc_243c17
    bg.sfnei r7, 0xc2
    bn.bnf loc_243b92
    bg.sfnei r7, 0xef
    bn.bnf loc_243bf1
loc_243b80:
    bt.mov r3, r11
    bn.lwz r11, 0x28(r1)
    bn.lwz r10, 0x2c(r1)
    bn.lwz r9, 0x30(r1)
    bn.addi r1, r1, 0x34
    bg.j 0x243738
loc_243b92:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x522e(r7)
    bn.bnei r7, 0x3, loc_243b80
    bn.lwz r11, 0x28(r1)
    bn.lwz r10, 0x2c(r1)
    bn.lwz r9, 0x30(r1)
    bn.addi r1, r1, 0x34
    bg.j 0x243ac2
loc_243bad:
    bt.mov r3, r1
    bt.movi r4, 0x1
    bg.jal 0x242968
    bn.lwz r7, 0x0(r1)
    bn.bnei r7, 0x1, loc_243b57
    bt.movi r3, 0x0
    bn.lwz r11, 0x28(r1)
    bn.lwz r10, 0x2c(r1)
    bn.lwz r9, 0x30(r1)
    bn.addi r1, r1, 0x34
    bg.j 0x243142
loc_243bcd:
    bt.mov r3, r10
    bn.lwz r11, 0x28(r1)
    bn.lwz r10, 0x2c(r1)
    bn.lwz r9, 0x30(r1)
    bn.addi r1, r1, 0x34
    bg.j 0x242c77
loc_243bdf:
    bt.mov r3, r11
    bn.lwz r11, 0x28(r1)
    bn.lwz r10, 0x2c(r1)
    bn.lwz r9, 0x30(r1)
    bn.addi r1, r1, 0x34
    bg.j 0x2437c1
loc_243bf1:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x522e(r7)
    bg.sfeqi r7, 0x95
    bn.bf loc_243c07
    bg.sfnei r7, 0x97
    bn.bf loc_243b80
loc_243c07:
    bn.lwz r11, 0x28(r1)
    bn.lwz r10, 0x2c(r1)
    bn.lwz r9, 0x30(r1)
    bn.addi r1, r1, 0x34
    bg.j 0x24377b
loc_243c17:
    bn.lwz r11, 0x28(r1)
    bn.lwz r10, 0x2c(r1)
    bn.lwz r9, 0x30(r1)
    bn.addi r1, r1, 0x34
    bt.jr r9
