# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x222cbd,0x222ce8); byte-exact only; hardware untested.
    bn.beqi r3, 0x0, loc_222ce6
    bt.movi r5, 0x0
    bn.ori r23, r0, 0x7c
loc_222cc5:
    bn.extbz r6, r5
    bn.andi r7, r3, 0x1
    bn.beqi r7, 0x0, loc_222cde
    bn.muls r7, r6, r23
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.sw 0x8(r7), r4
loc_222cde:
    bn.srli r3, r3, 0x1
    bt.addi r5, 0x1
    bn.bnei r3, 0x0, loc_222cc5
loc_222ce6:
    bt.jr r9
