# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x235290,0x2352b6); byte-exact only; hardware untested.
    bn.beqi r3, 0x0, loc_2352a5
    bg.movhi r3, 0x2490
    bg.ori r3, r3, 0x2f20
    bn.ori r4, r0, 0x20
    bn.ori r5, r0, 0x20
    bg.j 0x23dfe1
loc_2352a5:
    bg.movhi r3, 0x2490
    bg.ori r3, r3, 0x2f20
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x20
    bg.j 0x23dfe1
