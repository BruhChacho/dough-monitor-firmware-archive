# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27f422,0x27f448); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.movhi r7, 0x45
    bg.lbz r7, 0x79cd(r7)
    bn.bnei r7, 0x0, loc_27f439
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_27f439:
    bg.jal 0x2a9310
    bt.movi r3, 0xa
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bg.j 0x271d56
