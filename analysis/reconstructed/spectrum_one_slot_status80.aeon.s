# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20c98a,0x20c9fa); Return bit 7 of the slot control byte.
# Fixed original addresses; not a hardware-validated implementation.
    bg.beqi r3, 0x7, loc_20c9c1
    bn.beqi r3, 0x0, loc_20c9ad
    bn.beqi r3, 0x1, loc_20c9e6
    bn.beqi r3, 0x2, loc_20c9d5
    bt.movi r7, 0x0
    bn.bnei r3, 0x3, loc_20c9bc
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lbz r7, 0x7d78(r7)
    bn.extbz r7, r7
    bt.j loc_20c9bc
loc_20c9ad:
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lbz r7, 0x7d90(r7)
    bn.extbz r7, r7
loc_20c9bc:
    bn.andi r3, r7, 0x80
    bt.jr r9
loc_20c9c1:
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lbz r7, 0x7dcc(r7)
    bn.extbz r7, r7
    bn.andi r3, r7, 0x80
    bt.jr r9
loc_20c9d5:
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lbz r7, 0x7dc0(r7)
    bn.extbz r7, r7
    bt.j loc_20c9bc
loc_20c9e6:
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lbz r7, 0x7d9c(r7)
    bn.extbz r7, r7
    bn.andi r3, r7, 0x80
    bt.jr r9
