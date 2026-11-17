# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x242aaf,0x242adc); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bg.movhi r10, 0x45
    bg.lbz r7, 0x3c41(r10)
    bn.bnei r7, 0x0, loc_242ac8
    bt.movi r3, 0x1
    bg.jal 0x20e178
loc_242ac8:
    bg.lbz r7, 0x3c41(r10)
    bt.addi r7, 0x1
    bg.sbz 0x3c41(r10), r7
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
