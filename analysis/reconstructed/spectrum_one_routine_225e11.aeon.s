# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x225e11,0x225e4e); byte-exact only; hardware untested.
    bn.ori r7, r0, 0x7c
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lwz r7, 0x4(r7)
    bn.andi r3, r3, 0x1
    bn.beqi r3, 0x0, loc_225e3c
    bg.movhi r6, 0x2380
    bn.ori r6, r6, 0x16
    bn.add r3, r7, r6
    bg.ori r4, r0, 0x303
    bg.j 0x23dfb6
loc_225e3c:
    bg.movhi r6, 0x2380
    bn.ori r6, r6, 0x56
    bn.add r3, r7, r6
    bg.ori r4, r0, 0x303
    bg.j 0x23dfb6
