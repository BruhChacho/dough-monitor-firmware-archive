# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27bce7,0x27bd2b); byte-exact only; hardware untested.
    bn.movhi_2 r6, 0x7f
    bg.ori r6, r6, 0xff00
    bn.and r3, r3, r6
    bt.movi r7, 0x1
    bt.movhi r6, -0x10
    bg.ori r6, r6, 0x2f00
    bn.sfne r3, r6
    bn.bnf loc_27bd27
    bt.movi r7, 0x2
    bt.movhi r6, -0x10
    bg.ori r6, r6, 0x3100
    bn.sfne r3, r6
    bn.bnf loc_27bd27
    bt.movi r7, 0x4
    bt.movhi r6, -0x10
    bg.ori r6, r6, 0x2b00
    bn.sfne r3, r6
    bn.bnf loc_27bd27
    bt.movhi r7, -0x10
    bg.ori r7, r7, 0x2d00
    bn.sfne r3, r7
    bn.cmovsi_2 r7, r0, 0x8
loc_27bd27:
    bt.mov r3, r7
    bt.jr r9
