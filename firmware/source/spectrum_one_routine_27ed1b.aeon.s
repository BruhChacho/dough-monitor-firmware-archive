# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27ed1b,0x27ed45); byte-exact only; hardware untested.
    bn.beqi r3, 0x0, loc_27ed43
    bg.movhi r6, 0x45
    bn.lbz r7, 0x0(r3)
    bg.sbz 0x7d99(r6), r7
    bg.addi r6, r6, 0x7d99
    bn.lbz r7, 0x1(r3)
    bn.sbz 0x1(r6), r7
    bn.lbz r7, 0x2(r3)
    bn.sbz 0x2(r6), r7
    bt.movi r6, 0x1
    bg.movhi r7, 0x45
    bg.sbz 0x7d98(r7), r6
loc_27ed43:
    bt.jr r9
