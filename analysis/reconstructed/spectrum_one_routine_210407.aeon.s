# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x210407,0x21047a); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.jal 0x2100d2
    bn.ori r7, r0, 0x74
    bn.muls r3, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x7e8
    bt.add r3, r7
    bn.lbz r7, 0x3c(r3)
    bn.bnei r7, 0x0, loc_210454
    bn.lh r5, 0x22(r3)
    bg.ori r6, r0, 0x2d0
    bn.divu r7, r5, r6
    bn.muls r7, r7, r6
    bn.sub r7, r5, r7
    bn.exthz r7, r7
    bn.bnei r7, 0x0, loc_21044d
    bn.lh r7, 0x24(r3)
    bg.sfeqi r7, 0xf0
    bn.bf loc_210471
    bg.sfeqi r7, 0x11b
    bn.bf loc_210471
loc_21044d:
    bg.sfnei r5, 0x780
    bn.bnf loc_21045d
loc_210454:
    bt.movi r3, 0x0
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_21045d:
    bn.lh r7, 0x24(r3)
    bg.sfnei r7, 0x21c
    bn.cmovsi_2 r7, r0, 0x1
    bn.extbz r3, r7
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_210471:
    bt.movi r3, 0x1
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
