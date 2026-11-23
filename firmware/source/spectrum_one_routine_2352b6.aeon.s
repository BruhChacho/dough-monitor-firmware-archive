# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2352b6,0x2352fb); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bg.movhi r3, 0x7790
    bg.ori r3, r3, 0x2f5e
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x7
    bg.beqi r3, 0x7, loc_2352dd
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_2352dd:
    bt.mov r3, r10
    bg.jal 0x235290
    bg.ori r3, r0, 0x3ff
    bg.ori r4, r0, 0x3ff
    bg.ori r5, r0, 0x3ff
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x23524b
