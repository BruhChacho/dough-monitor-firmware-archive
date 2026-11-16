# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x26e218,0x26e24a); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r0
    bn.beqi r3, 0x0, loc_26e228
    bt.movi r7, 0x1
    bn.sw 0x4(r1), r7
loc_26e228:
    bg.movhi r7, 0x3d
    bg.addi r7, r7, -0x4cf4
    bn.lwz r3, 0x24(r7)
    bn.lwz r7, 0x8(r7)
    bt.add r3, r7
    bt.addi r3, 0x8
    bn.addi r4, r1, 0x4
    bt.movi r5, 0x4
    bg.jal 0x27099e
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
