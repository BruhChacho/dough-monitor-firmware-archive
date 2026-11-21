# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x252d4f,0x252d93); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bt.mov r7, r3
    bn.beqi r3, 0x0, loc_252d65
    bt.movi r3, 0x0
    bn.beqi r7, 0x1, loc_252d7c
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_252d65:
    bn.extbz r3, r4
    bn.extbz r4, r5
    bn.extbz r5, r6
    bg.jal 0x248933
    bn.exthz r3, r3
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_252d7c:
    bn.extbz r3, r4
    bn.extbz r4, r5
    bn.extbz r5, r6
    bg.jal 0x24a03f
    bn.exthz r3, r3
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
