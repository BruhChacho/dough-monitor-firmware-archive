# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2684e9,0x26851f); byte-exact only; hardware untested.
    bg.movhi r7, 0x3b
    bg.lwz r6, 0x5f38(r7)
    bn.lbz r7, 0x49(r6)
    bn.slli r7, r7, 0x8
    bg.ori r5, r0, 0x100
    bn.and r7, r7, r5
    bn.beqi r7, 0x0, loc_26850d
    bg.movhi r7, 0x47
    bg.lbz r3, -0x2d54(r7)
    bg.j 0x2684dd
loc_26850d:
    bg.movhi r7, 0x48
    bg.lbz r7, -0x4cb(r7)
    bt.add r7, r6
    bg.lbz r3, 0x91(r7)
    bg.j 0x23a594
