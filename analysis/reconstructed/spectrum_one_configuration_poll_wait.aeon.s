# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2421d3,0x242247); Conditional two-phase poll using countdown0x455208; configuration bit0x20 or inactive flag bypasses polling.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bg.movhi r7, 0x3b
    bg.lwz r7, 0x5f38(r7)
    bn.lbz r7, 0x4c(r7)
    bn.andi r7, r7, 0x20
    bn.bnei r7, 0x0, loc_24223d
    bg.movhi r7, 0x45
    bg.lbz r7, 0x51e8(r7)
    bn.beqi r7, 0x0, loc_24223d
    bg.movhi r10, 0x45
    bn.ori r7, r0, 0x32
    bg.sw_1 0x5208(r10), r7
loc_242202:
    bt.movi r3, 0x1
    bg.jal 0x21d3b1
    bn.addi r3, r3, 0x3c
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x1
    bn.bnei r3, 0x0, loc_24221c
    bg.lhz r7, 0x5208(r10)
    bn.bnei r7, 0x0, loc_242202
loc_24221c:
    bn.ori r7, r0, 0x32
    bg.sw_1 0x5208(r10), r7
loc_242223:
    bt.movi r3, 0x1
    bg.jal 0x21d3b1
    bn.addi r3, r3, 0x3c
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x1
    bn.beqi r3, 0x0, loc_24223d
    bg.lhz r7, 0x5208(r10)
    bn.bnei r7, 0x0, loc_242223
loc_24223d:
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
