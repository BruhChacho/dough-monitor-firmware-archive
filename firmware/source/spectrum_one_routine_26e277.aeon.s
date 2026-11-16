# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x26e277,0x26e2a2); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r3
    bg.movhi r7, 0x3d
    bg.addi r7, r7, -0x4cf4
    bn.sw 0x1c(r7), r3
    bn.lwz r6, 0x24(r7)
    bn.lwz r3, 0x8(r7)
    bt.add r3, r6
    bn.addi r4, r1, 0x4
    bt.movi r5, 0x4
    bg.jal 0x27099e
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
