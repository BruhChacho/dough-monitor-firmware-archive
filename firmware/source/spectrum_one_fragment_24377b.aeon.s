# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x24377b,0x2437c1); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
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
    bn.beqi r7, 0x0, loc_2437b5
    bn.ori r3, r0, 0xc0
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bg.j 0x243142
loc_2437b5:
    bn.ori r3, r0, 0xe0
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bg.j 0x243142
