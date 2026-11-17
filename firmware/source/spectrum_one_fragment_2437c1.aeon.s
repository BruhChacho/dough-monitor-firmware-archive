# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2437c1,0x243825); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
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
    bg.movhi r7, 0x45
    bg.lbz r7, 0x522c(r7)
    bn.bnei r7, 0x0, loc_243817
    bn.andi r7, r10, 0x94
    bg.sfeqi r7, 0x94
    bn.bf loc_24380d
    bn.ori r3, r0, 0x94
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x243142
loc_24380d:
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_243817:
    bt.movi r3, 0x0
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x243142
