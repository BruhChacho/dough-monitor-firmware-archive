# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x240872,0x2408ff); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.ori r3, r0, 0x422
    bt.movi r4, 0x1
    bn.ori r5, r0, 0x20
    bg.jal 0x23dead
    bg.ori r3, r0, 0x422
    bt.movi r4, 0x1
    bn.ori r5, r0, 0x10
    bg.jal 0x23dead
    bg.jal 0x24229a
    bg.movhi r7, 0x45
    bg.lwz r6, 0x3cf0(r7)
    bg.lbz r7, 0x848(r6)
    bn.andi r7, r7, 0x20
    bn.beqi r7, 0x0, loc_2408b1
    bg.lbz r7, 0x848(r6)
    bn.andi r7, r7, 0x10
    bn.bnei r7, 0x0, loc_2408ba
loc_2408b1:
    bt.movi r3, 0x0
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_2408ba:
    bg.ori r3, r0, 0x420
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x20
    bg.jal 0x23dead
    bg.ori r3, r0, 0x422
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x20
    bg.jal 0x23dead
    bg.jal 0x24229a
    bg.ori r3, r0, 0x420
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23dead
    bg.ori r3, r0, 0x422
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23dead
    bg.jal 0x24229a
    bt.movi r3, 0x1
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
