# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x211893,0x2118b2); byte-exact only; hardware untested.
    bg.ori r7, r0, 0x200
    bn.beqi r3, 0x2, loc_2118a6
    bg.ori r7, r0, 0x300
    bn.beqi r3, 0x3, loc_2118a6
    bt.movi r7, 0x0
    bn.beqi r3, 0x1, loc_2118aa
loc_2118a6:
    bt.mov r3, r7
    bt.jr r9
loc_2118aa:
    bg.ori r7, r0, 0x100
    bt.mov r3, r7
    bt.jr r9
