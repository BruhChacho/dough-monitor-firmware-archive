# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20cbd6,0x20cc43); Read the slot event-related byte.
# Fixed original addresses; not a hardware-validated implementation.
    bg.beqi r3, 0x7, loc_20cc0c
    bn.beqi r3, 0x0, loc_20cbf9
    bn.beqi r3, 0x1, loc_20cc30
    bn.beqi r3, 0x2, loc_20cc1f
    bt.movi r7, 0x0
    bn.bnei r3, 0x3, loc_20cc08
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lbz r7, 0x7d48(r7)
    bn.extbz r7, r7
    bt.j loc_20cc08
loc_20cbf9:
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lbz r7, 0x7c24(r7)
    bn.extbz r7, r7
loc_20cc08:
    bt.mov r3, r7
    bt.jr r9
loc_20cc0c:
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lbz r7, 0x7c20(r7)
    bn.extbz r7, r7
    bt.mov r3, r7
    bt.jr r9
loc_20cc1f:
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lbz r7, 0x7ca8(r7)
    bn.extbz r7, r7
    bt.j loc_20cc08
loc_20cc30:
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lbz r7, 0x7c25(r7)
    bn.extbz r7, r7
    bt.mov r3, r7
    bt.jr r9
