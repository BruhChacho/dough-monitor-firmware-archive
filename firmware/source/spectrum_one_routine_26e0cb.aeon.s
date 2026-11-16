# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x26e0cb,0x26e115); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r4
    bg.jal 0x2250c5
    bn.ori r7, r0, 0x7c
    bn.muls r3, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r3, r6
    bn.lwz r3, 0x4(r3)
    bn.movhi_2 r6, 0x80
    bn.and r7, r10, r6
    bn.beqi r7, 0x0, loc_26e105
    bt.add r3, r10
    bg.jal 0x23dd44
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_26e105:
    bt.mov r3, r10
    bg.jal 0x23dd44
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
