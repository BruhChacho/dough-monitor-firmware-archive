# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2398ed,0x239922); byte-exact only; hardware untested.
    bn.beqi r4, 0x0, loc_239909
    bn.ori r7, r0, 0x18
    bn.muls r7, r3, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4318
    bt.add r7, r6
    bn.lbz r3, 0x4(r7)
    bt.movi r4, 0x0
    bg.j 0x239614
loc_239909:
    bn.ori r7, r0, 0x18
    bn.muls r7, r3, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4318
    bt.add r7, r6
    bn.lbz r3, 0x4(r7)
    bt.movi r4, 0x1
    bg.j 0x239614
