# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x26e2a2,0x26e2dd); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r0
    bg.movhi r7, 0x3d
    bg.addi r7, r7, -0x4cf4
    bn.lwz r4, 0x24(r7)
    bn.lwz r7, 0x4(r7)
    bt.add r4, r7
    bn.addi r3, r1, 0x4
    bt.addi r4, 0x8
    bt.movi r5, 0x4
    bg.jal 0x27099e
    bn.lwz r7, 0x4(r1)
    bn.sfnei r7, 0x0
    bn.cmovsi_2 r3, r0, 0x1
    bt.movi r7, 0x1
    bn.xor r3, r3, r7
    bn.andi r3, r3, 0x1
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
