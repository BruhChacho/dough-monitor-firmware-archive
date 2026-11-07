# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20c80d,0x20c895); Set bit 3 in the slot control byte; peripheral semantics unknown.
# Fixed original addresses; not a hardware-validated implementation.
    bg.beqi r3, 0x7, loc_20c84d
    bn.beqi r3, 0x0, loc_20c835
    bn.beqi r3, 0x1, loc_20c87d
    bn.beqi r3, 0x2, loc_20c865
    bn.bnei r3, 0x3, loc_20c833
    bg.movhi r7, 0x45
    bg.lwz r6, 0x3cf0(r7)
    bg.lbz r7, 0x7d78(r6)
    bn.extbz r7, r7
    bn.ori r7, r7, 0x8
    bg.sbz 0x7d78(r6), r7
loc_20c833:
    bt.jr r9
loc_20c835:
    bg.movhi r7, 0x45
    bg.lwz r6, 0x3cf0(r7)
    bg.lbz r7, 0x7d90(r6)
    bn.extbz r7, r7
    bn.ori r7, r7, 0x8
    bg.sbz 0x7d90(r6), r7
    bt.jr r9
loc_20c84d:
    bg.movhi r7, 0x45
    bg.lwz r6, 0x3cf0(r7)
    bg.lbz r7, 0x7dcc(r6)
    bn.extbz r7, r7
    bn.ori r7, r7, 0x8
    bg.sbz 0x7dcc(r6), r7
    bt.jr r9
loc_20c865:
    bg.movhi r7, 0x45
    bg.lwz r6, 0x3cf0(r7)
    bg.lbz r7, 0x7dc0(r6)
    bn.extbz r7, r7
    bn.ori r7, r7, 0x8
    bg.sbz 0x7dc0(r6), r7
    bt.jr r9
loc_20c87d:
    bg.movhi r7, 0x45
    bg.lwz r6, 0x3cf0(r7)
    bg.lbz r7, 0x7d9c(r6)
    bn.extbz r7, r7
    bn.ori r7, r7, 0x8
    bg.sbz 0x7d9c(r6), r7
    bt.jr r9
