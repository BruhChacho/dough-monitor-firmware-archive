# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x211949,0x211959); byte-exact only; hardware untested.
    bn.lwz r7, 0x24(r3)
    bt.movi r3, 0x2
    bn.beqi r7, 0x2, loc_211957
    bn.sfnei r7, 0x3
    bn.cmovi r3, 0x1, 0x4
loc_211957:
    bt.jr r9
