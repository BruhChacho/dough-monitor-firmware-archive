# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x243865,0x243996); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.movhi r7, 0x45
    bg.lbz r7, 0x522e(r7)
    bn.sfnei r7, 0x13
    bn.bnf loc_2438bf
    bg.sfnei r7, 0x95
    bn.bnf loc_2438d0
    bn.sfnei r7, 0x12
    bn.bnf loc_24392e
    bn.sfnei r7, 0x11
    bn.bnf loc_243962
    bn.andi r7, r3, 0x8c
    bg.sfeqi r7, 0x8c
    bn.bf loc_2438c9
    bg.ori r3, r0, 0x426
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dead
    bg.ori r3, r0, 0x428
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dead
    bt.movi r3, 0x1
    bg.jal 0x2420bb
    bn.ori r3, r0, 0x8c
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bg.j 0x243142
loc_2438bf:
    bn.andi r7, r3, 0xac
    bg.sfeqi r7, 0xac
    bn.bnf loc_243904
loc_2438c9:
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_2438d0:
    bn.andi r7, r3, 0xe0
    bg.sfeqi r7, 0xe0
    bn.bf loc_2438c9
    bg.ori r3, r0, 0x426
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dead
    bg.ori r3, r0, 0x428
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dead
    bt.movi r3, 0x1
    bg.jal 0x2420bb
    bn.ori r3, r0, 0xe0
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bg.j 0x243142
loc_243904:
    bg.ori r3, r0, 0x426
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dead
    bg.ori r3, r0, 0x428
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dead
    bt.movi r3, 0x1
    bg.jal 0x2420bb
    bn.ori r3, r0, 0xac
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bg.j 0x243142
loc_24392e:
    bn.andi r7, r3, 0xa8
    bg.sfeqi r7, 0xa8
    bn.bf loc_2438c9
    bg.ori r3, r0, 0x426
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dead
    bg.ori r3, r0, 0x428
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dead
    bt.movi r3, 0x1
    bg.jal 0x2420bb
    bn.ori r3, r0, 0xa8
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bg.j 0x243142
loc_243962:
    bn.andi r7, r3, 0xa4
    bg.sfeqi r7, 0xa4
    bn.bf loc_2438c9
    bg.ori r3, r0, 0x426
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dead
    bg.ori r3, r0, 0x428
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dead
    bt.movi r3, 0x1
    bg.jal 0x2420bb
    bn.ori r3, r0, 0xa4
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bg.j 0x243142
