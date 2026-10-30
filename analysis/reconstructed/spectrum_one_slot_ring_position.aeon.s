# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20c73b,0x20c7a8); Per-slot halfword read from the initialized register base.
# Fixed original addresses; not a hardware-validated implementation.
    bg.beqi r3, 0x7, loc_20c771
    bn.beqi r3, 0x0, loc_20c75e
    bn.beqi r3, 0x1, loc_20c795
    bn.beqi r3, 0x2, loc_20c784
    bt.movi r7, 0x0
    bn.bnei r3, 0x3, loc_20c76d
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lhz r7, 0x7d74(r7)
    bn.exthz r7, r7
    bt.j loc_20c76d
loc_20c75e:
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lhz r7, 0x7d8c(r7)
    bn.exthz r7, r7
loc_20c76d:
    bt.mov r3, r7
    bt.jr r9
loc_20c771:
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lhz r7, 0x7dc8(r7)
    bn.exthz r7, r7
    bt.mov r3, r7
    bt.jr r9
loc_20c784:
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lhz r7, 0x7da4(r7)
    bn.exthz r7, r7
    bt.j loc_20c76d
loc_20c795:
    bg.movhi r7, 0x45
    bg.lwz r7, 0x3cf0(r7)
    bg.lhz r7, 0x7d98(r7)
    bn.exthz r7, r7
    bt.mov r3, r7
    bt.jr r9
