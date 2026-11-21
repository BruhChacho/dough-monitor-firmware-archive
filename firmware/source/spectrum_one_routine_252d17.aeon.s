# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x252d17,0x252d4f); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bt.mov r7, r3
    bn.beqi r3, 0x0, loc_252d2d
    bt.movi r3, 0x0
    bn.beqi r7, 0x1, loc_252d3e
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_252d2d:
    bn.extbz r3, r4
    bn.extbz r4, r5
    bg.jal 0x24891c
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_252d3e:
    bn.extbz r3, r4
    bn.extbz r4, r5
    bg.jal 0x24a028
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
