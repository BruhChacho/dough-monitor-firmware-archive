# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x211817,0x211836); byte-exact only; hardware untested.
    bg.ori r7, r0, 0x400
    bn.beqi r3, 0x2, loc_21182a
    bg.ori r7, r0, 0x600
    bn.beqi r3, 0x3, loc_21182a
    bt.movi r7, 0x0
    bn.beqi r3, 0x1, loc_21182e
loc_21182a:
    bt.mov r3, r7
    bt.jr r9
loc_21182e:
    bg.ori r7, r0, 0x200
    bt.mov r3, r7
    bt.jr r9
