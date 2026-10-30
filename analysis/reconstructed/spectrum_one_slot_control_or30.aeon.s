# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20c895,0x20c91d); Set bits 4 and 5 in the slot control byte.
# Fixed original addresses; not a hardware-validated implementation.
    bg.beqi r3, 0x7, loc_20c8d5
    bn.beqi r3, 0x0, loc_20c8bd
    bn.beqi r3, 0x1, loc_20c905
    bn.beqi r3, 0x2, loc_20c8ed
    bn.bnei r3, 0x3, loc_20c8bb
    bg.movhi r7, 0x45
    bg.lwz r6, 0x3cf0(r7)
    bg.lbz r7, 0x7d78(r6)
    bn.extbz r7, r7
    bn.ori r7, r7, 0x30
    bg.sbz 0x7d78(r6), r7
loc_20c8bb:
    bt.jr r9
loc_20c8bd:
    bg.movhi r7, 0x45
    bg.lwz r6, 0x3cf0(r7)
    bg.lbz r7, 0x7d90(r6)
    bn.extbz r7, r7
    bn.ori r7, r7, 0x30
    bg.sbz 0x7d90(r6), r7
    bt.jr r9
loc_20c8d5:
    bg.movhi r7, 0x45
    bg.lwz r6, 0x3cf0(r7)
    bg.lbz r7, 0x7dcc(r6)
    bn.extbz r7, r7
    bn.ori r7, r7, 0x30
    bg.sbz 0x7dcc(r6), r7
    bt.jr r9
loc_20c8ed:
    bg.movhi r7, 0x45
    bg.lwz r6, 0x3cf0(r7)
    bg.lbz r7, 0x7dc0(r6)
    bn.extbz r7, r7
    bn.ori r7, r7, 0x30
    bg.sbz 0x7dc0(r6), r7
    bt.jr r9
loc_20c905:
    bg.movhi r7, 0x45
    bg.lwz r6, 0x3cf0(r7)
    bg.lbz r7, 0x7d9c(r6)
    bn.extbz r7, r7
    bn.ori r7, r7, 0x30
    bg.sbz 0x7d9c(r6), r7
    bt.jr r9
