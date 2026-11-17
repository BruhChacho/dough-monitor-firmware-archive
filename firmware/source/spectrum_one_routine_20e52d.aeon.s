# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20e52d,0x20e567); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.movi r10, 0x9
loc_20e537:
    bg.ori r3, r0, 0x10fc
    bg.jal 0x23e18c
    bn.bnei r3, 0x0, loc_20e55b
    bn.addi r7, r10, -0x1
    bn.extbz r10, r7
    bg.sfnei r10, 0xff
    bn.bf loc_20e537
    bt.movi r3, 0x0
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_20e55b:
    bt.movi r3, 0x1
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
