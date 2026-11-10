# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x211874,0x211893); byte-exact only; hardware untested.
    bg.ori r7, r0, 0x400
    bn.beqi r3, 0x2, loc_211887
    bg.ori r7, r0, 0x600
    bn.beqi r3, 0x3, loc_211887
    bt.movi r7, 0x0
    bn.beqi r3, 0x1, loc_21188b
loc_211887:
    bt.mov r3, r7
    bt.jr r9
loc_21188b:
    bg.ori r7, r0, 0x200
    bt.mov r3, r7
    bt.jr r9
