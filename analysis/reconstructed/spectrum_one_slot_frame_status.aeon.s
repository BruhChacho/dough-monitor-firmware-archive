# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20c9fa,0x20ca70); Return the slot-specific frame status bit.
# Fixed original addresses; not a hardware-validated implementation.
    bg.beqi r3, 0x7, loc_20ca36
    bn.beqi r3, 0x0, loc_20ca20
    bn.beqi r3, 0x1, loc_20ca5d
    bn.beqi r3, 0x2, loc_20ca49
    bt.movi r7, 0x0
    bn.bnei r3, 0x3, loc_20ca32
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lbz r7, 0x7d6c(r7)
    bn.andi r7, r7, 0x20
    bn.extbz r7, r7
    bt.j loc_20ca32
loc_20ca20:
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lbz r7, 0x7d84(r7)
    bn.andi r7, r7, 0x2
    bn.extbz r7, r7
loc_20ca32:
    bt.mov r3, r7
    bt.jr r9
loc_20ca36:
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lbz r7, 0x7d84(r7)
    bn.andi r7, r7, 0x1
    bt.mov r3, r7
    bt.jr r9
loc_20ca49:
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lbz r7, 0x7de0(r7)
    bn.andi r7, r7, 0x2
    bn.extbz r7, r7
    bt.j loc_20ca32
loc_20ca5d:
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lbz r7, 0x7de0(r7)
    bn.andi r7, r7, 0x1
    bt.mov r3, r7
    bt.jr r9
