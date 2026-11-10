# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x237dde,0x237dfd); byte-exact only; hardware untested.
    bn.beqi r3, 0x0, loc_237def
    bt.movhi r3, -0x10
    bg.ori r3, r3, 0x11be
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.j 0x23dead
loc_237def:
    bt.movhi r3, -0x10
    bg.ori r3, r3, 0x11be
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.j 0x23dead
