# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20ca70,0x20caf8); OR low byte of r4 into a slot event-related register.
# Fixed original addresses; not a hardware-validated implementation.
    bg.beqi r3, 0x7, loc_20cab0
    bn.beqi r3, 0x0, loc_20ca98
    bn.beqi r3, 0x1, loc_20cae0
    bn.beqi r3, 0x2, loc_20cac8
    bn.bnei r3, 0x3, loc_20ca96
    bg.movhi r7, 0x45
    bg.lwz r6, 0x3cf0(r7)
    bg.lbz r7, 0x7d4d(r6)
    bn.extbz r7, r7
    bn.or r7, r7, r4
    bg.sbz 0x7d4d(r6), r7
loc_20ca96:
    bt.jr r9
loc_20ca98:
    bg.movhi r7, 0x45
    bg.lwz r6, 0x3cf0(r7)
    bg.lbz r7, 0x7c3c(r6)
    bn.extbz r7, r7
    bn.or r7, r4, r7
    bg.sbz 0x7c3c(r6), r7
    bt.jr r9
loc_20cab0:
    bg.movhi r7, 0x45
    bg.lwz r6, 0x3cf0(r7)
    bg.lbz r7, 0x7c38(r6)
    bn.extbz r7, r7
    bn.or r7, r4, r7
    bg.sbz 0x7c38(r6), r7
    bt.jr r9
loc_20cac8:
    bg.movhi r7, 0x45
    bg.lwz r6, 0x3cf0(r7)
    bg.lbz r7, 0x7cad(r6)
    bn.extbz r7, r7
    bn.or r7, r4, r7
    bg.sbz 0x7cad(r6), r7
    bt.jr r9
loc_20cae0:
    bg.movhi r7, 0x45
    bg.lwz r6, 0x3cf0(r7)
    bg.lbz r7, 0x7c3d(r6)
    bn.extbz r7, r7
    bn.or r7, r4, r7
    bg.sbz 0x7c3d(r6), r7
    bt.jr r9
