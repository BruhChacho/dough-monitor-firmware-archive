# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23382c,0x233856); byte-exact only; hardware untested.
    bn.ori r7, r0, 0x84
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0xe8
    bt.add r7, r6
    bn.lwz r7, 0x0(r7)
    bg.beqi r7, 0x4, loc_23384e
    bg.movhi r7, 0x45
    bg.lbz r7, 0x485e(r7)
    bn.beqi r7, 0x0, loc_233852
loc_23384e:
    bg.j 0x211e4a
loc_233852:
    bt.movi r3, 0x5
    bt.jr r9
