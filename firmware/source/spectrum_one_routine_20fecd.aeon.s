# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20fecd,0x20fef1); byte-exact only; hardware untested.
    bt.movi r7, 0x0
    bn.beqi r3, 0x0, loc_20feed
    bt.movi r7, 0x1
    bn.beqi r3, 0x1, loc_20feed
    bt.movi r7, 0x2
    bn.beqi r3, 0x2, loc_20feed
    bt.movi r7, 0x3
    bn.beqi r3, 0x3, loc_20feed
    bt.movi r7, 0x4
    bg.beqi r3, 0x4, loc_20feed
    bn.sfeqi r3, 0x5
    bn.cmovi r7, 0x5, 0x7
loc_20feed:
    bt.mov r3, r7
    bt.jr r9
