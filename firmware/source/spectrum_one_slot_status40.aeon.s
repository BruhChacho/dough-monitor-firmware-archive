# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20c91d,0x20c98a); Return bit 6 of the slot control byte.
# Fixed original addresses; not a hardware-validated implementation.
    bg.beqi r3, 0x7, loc_20c953
    bn.beqi r3, 0x0, loc_20c940
    bn.beqi r3, 0x1, loc_20c977
    bn.beqi r3, 0x2, loc_20c966
    bt.movi r7, 0x0
    bn.bnei r3, 0x3, loc_20c94f
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lbz r7, 0x7d78(r7)
    bn.andi r7, r7, 0x40
    bt.j loc_20c94f
loc_20c940:
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lbz r7, 0x7d90(r7)
    bn.andi r7, r7, 0x40
loc_20c94f:
    bt.mov r3, r7
    bt.jr r9
loc_20c953:
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lbz r7, 0x7dcc(r7)
    bn.andi r7, r7, 0x40
    bt.mov r3, r7
    bt.jr r9
loc_20c966:
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lbz r7, 0x7dc0(r7)
    bn.andi r7, r7, 0x40
    bt.j loc_20c94f
loc_20c977:
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lbz r7, 0x7d9c(r7)
    bn.andi r7, r7, 0x40
    bt.mov r3, r7
    bt.jr r9
