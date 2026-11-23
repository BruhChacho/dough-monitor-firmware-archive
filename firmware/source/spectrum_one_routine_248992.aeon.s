# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x248992,0x2489bf); byte-exact only; hardware untested.
    bn.slli r23, r3, 0x2
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x5254
    bt.add r23, r7
    bt.add r3, r7
    bn.lbz r7, 0x40(r3)
    bn.muls r4, r4, r7
    bt.add r4, r5
    bn.lbz r3, 0x4b(r3)
    bn.muls r4, r4, r3
    bt.add r4, r6
    bn.exthz r4, r4
    bg.lwz r7, 0x90(r23)
    bt.add r7, r4
    bn.lbz r3, 0x0(r7)
    bt.jr r9
