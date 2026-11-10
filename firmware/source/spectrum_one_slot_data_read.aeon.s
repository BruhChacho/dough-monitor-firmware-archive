# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20cc43,0x20ccb0); Read the slot data register.
# Fixed original addresses; not a hardware-validated implementation.
    bg.beqi r3, 0x7, loc_20cc79
    bn.beqi r3, 0x0, loc_20cc66
    bn.beqi r3, 0x1, loc_20cc9d
    bn.beqi r3, 0x2, loc_20cc8c
    bt.movi r7, 0x0
    bn.bnei r3, 0x3, loc_20cc75
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lbz r7, 0x7d40(r7)
    bn.extbz r7, r7
    bt.j loc_20cc75
loc_20cc66:
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lbz r7, 0x7c08(r7)
    bn.extbz r7, r7
loc_20cc75:
    bt.mov r3, r7
    bt.jr r9
loc_20cc79:
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lbz r7, 0x7c00(r7)
    bn.extbz r7, r7
    bt.mov r3, r7
    bt.jr r9
loc_20cc8c:
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lbz r7, 0x7ca0(r7)
    bn.extbz r7, r7
    bt.j loc_20cc75
loc_20cc9d:
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lbz r7, 0x7c0c(r7)
    bn.extbz r7, r7
    bt.mov r3, r7
    bt.jr r9
