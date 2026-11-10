# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21cc5e,0x21cc90); byte-exact only; hardware untested.
    bn.ori r7, r0, 0x7c
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lwz r7, 0x4(r7)
    bn.andi r3, r3, 0x1
    bg.movhi r6, 0x4c80
    bn.bnei r3, 0x0, loc_21cc7f
    bg.movhi r6, 0x6580
loc_21cc7f:
    bn.ori r6, r6, 0x1c
    bn.add r3, r7, r6
    bg.ori r7, r0, 0x3fff
    bn.and r4, r4, r7
    bg.j 0x23dfb6
