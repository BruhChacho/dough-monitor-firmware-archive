# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20caf8,0x20cb4e); Write low byte of r4 to the slot data register.
# Fixed original addresses; not a hardware-validated implementation.
    bg.beqi r3, 0x7, loc_20cb24
    bn.beqi r3, 0x0, loc_20cb16
    bn.beqi r3, 0x1, loc_20cb40
    bn.beqi r3, 0x2, loc_20cb32
    bn.bnei r3, 0x3, loc_20cb14
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.sbz 0x7d41(r7), r4
loc_20cb14:
    bt.jr r9
loc_20cb16:
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.sbz 0x7c09(r7), r4
    bt.jr r9
loc_20cb24:
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.sbz 0x7c01(r7), r4
    bt.jr r9
loc_20cb32:
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.sbz 0x7ca1(r7), r4
    bt.jr r9
loc_20cb40:
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.sbz 0x7c0d(r7), r4
    bt.jr r9
