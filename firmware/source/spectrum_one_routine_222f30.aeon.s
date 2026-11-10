# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x222f30,0x222f55); byte-exact only; hardware untested.
    bt.movi r5, 0x0
    bt.movi r3, 0x0
    bg.movhi r7, 0x48
    bg.addi r6, r7, -0x5c4
loc_222f3c:
    bn.lbz r7, 0x0(r6)
    bn.beqi r7, 0x0, loc_222f53
    bn.addi r7, r5, 0x1
    bn.extbz r5, r7
    bt.addi r3, 0x1
    bn.addi r6, r6, 0x18
    bg.bnei r5, 0x4, loc_222f3c
    bt.movi r3, 0x4
loc_222f53:
    bt.jr r9
