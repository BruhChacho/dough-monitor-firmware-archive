# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x222898,0x2228e1); byte-exact only; hardware untested.
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r3, r5
    bn.lh r6, 0x2c(r3)
    bt.movi r3, 0x0
    bn.beqi r6, 0x0, loc_2228df
    bt.movi r4, 0x0
    bn.ori r23, r0, 0x7c
loc_2228b5:
    bn.extbz r5, r4
    bn.andi r7, r6, 0x1
    bn.beqi r7, 0x0, loc_2228d7
    bn.muls r7, r5, r23
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lh r7, 0x38(r7)
    bn.beqi r7, 0x0, loc_2228d7
    bn.addi r7, r3, 0x1
    bn.extbz r3, r7
loc_2228d7:
    bn.srli r6, r6, 0x1
    bt.addi r4, 0x1
    bn.bnei r6, 0x0, loc_2228b5
loc_2228df:
    bt.jr r9
