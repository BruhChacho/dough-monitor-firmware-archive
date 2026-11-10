# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x238f69,0x238f8b); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bt.movhi r3, -0x10
    bg.ori r3, r3, 0x33f1
    bg.jal 0x23dd44
    bn.bnei r3, 0x0, loc_238f82
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_238f82:
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bg.j 0x238edd
