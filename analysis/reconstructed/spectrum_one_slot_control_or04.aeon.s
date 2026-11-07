# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20cb4e,0x20cbd6); Set bit 2 in the slot control byte.
# Fixed original addresses; not a hardware-validated implementation.
    bg.beqi r3, 0x7, loc_20cb8e
    bn.beqi r3, 0x0, loc_20cb76
    bn.beqi r3, 0x1, loc_20cbbe
    bn.beqi r3, 0x2, loc_20cba6
    bn.bnei r3, 0x3, loc_20cb74
    bg.movhi r7, 0x45
    bg.lwz r6, 0x3cf0(r7)
    bg.lbz r7, 0x7d78(r6)
    bn.extbz r7, r7
    bn.ori r7, r7, 0x4
    bg.sbz 0x7d78(r6), r7
loc_20cb74:
    bt.jr r9
loc_20cb76:
    bg.movhi r7, 0x45
    bg.lwz r6, 0x3cf0(r7)
    bg.lbz r7, 0x7d90(r6)
    bn.extbz r7, r7
    bn.ori r7, r7, 0x4
    bg.sbz 0x7d90(r6), r7
    bt.jr r9
loc_20cb8e:
    bg.movhi r7, 0x45
    bg.lwz r6, 0x3cf0(r7)
    bg.lbz r7, 0x7dcc(r6)
    bn.extbz r7, r7
    bn.ori r7, r7, 0x4
    bg.sbz 0x7dcc(r6), r7
    bt.jr r9
loc_20cba6:
    bg.movhi r7, 0x45
    bg.lwz r6, 0x3cf0(r7)
    bg.lbz r7, 0x7dc0(r6)
    bn.extbz r7, r7
    bn.ori r7, r7, 0x4
    bg.sbz 0x7dc0(r6), r7
    bt.jr r9
loc_20cbbe:
    bg.movhi r7, 0x45
    bg.lwz r6, 0x3cf0(r7)
    bg.lbz r7, 0x7d9c(r6)
    bn.extbz r7, r7
    bn.ori r7, r7, 0x4
    bg.sbz 0x7d9c(r6), r7
    bt.jr r9
