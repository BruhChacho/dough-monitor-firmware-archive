# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x242a8d,0x242aaf); byte-exact only; hardware untested.
    bg.movhi r6, 0x45
    bg.lbz r7, 0x3c41(r6)
    bt.addi r7, -0x1
    bn.extbz r7, r7
    bg.sbz 0x3c41(r6), r7
    bn.beqi r7, 0x0, loc_242aa3
    bt.jr r9
loc_242aa3:
    bg.movhi r7, 0x45
    bg.lbz r3, 0x3c42(r7)
    bg.j 0x20e178
