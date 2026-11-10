# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21b944,0x21b995); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bt.movi r3, 0xa
    bt.movi r4, 0x1
    bg.jal 0x23e13b
    bn.beqi r10, 0x0, loc_21b976
    bn.movhi_2 r3, 0x1690
    bg.ori r3, r3, 0x2f20
    bt.movi r4, 0x3
    bg.jal 0x23ddb9
    bt.movi r3, 0xa
    bt.movi r4, 0x0
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x23e13b
loc_21b976:
    bn.movhi_2 r3, 0x1690
    bg.ori r3, r3, 0x2f20
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dead
    bt.movi r3, 0xa
    bt.movi r4, 0x0
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x23e13b
