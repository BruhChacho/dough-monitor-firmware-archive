# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x213a77,0x213ab3); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r4
    bg.jal 0x211893
    bn.beqi r10, 0x0, loc_213a9e
    bg.addi r3, r3, 0x180a
    bn.ori r4, r0, 0xf0
    bn.ori r5, r0, 0xf0
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x23dfe1
loc_213a9e:
    bg.addi r3, r3, 0x180a
    bt.movi r4, 0x0
    bn.ori r5, r0, 0xf0
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x23dfe1
