# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x243825,0x243865); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bn.andi r3, r3, 0x8c
    bg.sfeqi r3, 0x8c
    bn.bf loc_24385e
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
loc_24385e:
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
