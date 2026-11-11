# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27bd2b,0x27bd51); byte-exact only; hardware untested.
    bt.mov r6, r3
    bt.movhi r7, -0x10
    bg.ori r3, r7, 0x2f00
    bn.beqi r6, 0x1, loc_27bd4f
    bg.ori r3, r7, 0x3100
    bn.beqi r6, 0x2, loc_27bd4f
    bg.ori r3, r7, 0x2b00
    bg.beqi r6, 0x4, loc_27bd4f
    bg.ori r7, r7, 0x2d00
    bn.sfeqi r6, 0x8
    bn.cmov_0 r3, r7, r0
loc_27bd4f:
    bt.jr r9
