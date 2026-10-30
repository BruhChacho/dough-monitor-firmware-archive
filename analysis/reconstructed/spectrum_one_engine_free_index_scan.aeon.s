# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x222b65,0x222b8a); Scan engine records and return a free engine index, if found.
# Fixed original addresses; not hardware-validated.
    bt.movi r5, 0x5
    bt.movi r3, 0x5
    bg.movhi r7, 0x48
    bg.addi r6, r7, -0x2f0
loc_222b71:
    bn.lwz r7, 0x0(r6)
    bn.beqi r7, 0x0, loc_222b88
    bn.addi r7, r5, 0x1
    bn.extbz r5, r7
    bt.addi r3, 0x1
    bn.addi r6, r6, 0x7c
    bg.bnei r5, 0xd, loc_222b71
    bt.movi r3, 0xd
loc_222b88:
    bt.jr r9
