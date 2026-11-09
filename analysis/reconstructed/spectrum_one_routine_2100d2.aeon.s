# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2100d2,0x2100ee); byte-exact only; hardware untested.
    bt.movi r7, 0x1
    bg.beqi r3, 0x5, loc_2100e4
    bt.movi r7, 0x2
    bg.beqi r3, 0x6, loc_2100e4
    bt.movi r7, 0x3
    bg.beqi r3, 0x4, loc_2100e8
loc_2100e4:
    bt.mov r3, r7
    bt.jr r9
loc_2100e8:
    bt.movi r7, 0x0
    bt.mov r3, r7
    bt.jr r9
