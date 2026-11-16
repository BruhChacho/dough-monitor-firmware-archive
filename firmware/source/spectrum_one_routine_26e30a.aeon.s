# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x26e30a,0x26e335); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r0
    bg.movhi r7, 0x3d
    bg.addi r7, r7, -0x4cf4
    bn.lwz r6, 0x24(r7)
    bn.lwz r4, 0x4(r7)
    bn.addi r3, r1, 0x4
    bt.add r4, r6
    bt.movi r5, 0x4
    bg.jal 0x27099e
    bn.lwz r3, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
