# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x26e062,0x26e08b); byte-exact only; hardware untested.
    bn.lbz r23, 0x0(r1)
    bn.lbz r25, 0x4(r1)
    bg.movhi r24, 0x45
    bg.sbz 0x7980(r24), r3
    bg.addi r24, r24, 0x7980
    bn.sbz 0x1(r24), r4
    bn.sbz 0x2(r24), r5
    bn.sbz 0x3(r24), r6
    bn.sbz 0x4(r24), r7
    bn.sbz 0x5(r24), r8
    bn.sbz 0x6(r24), r23
    bn.sbz 0x7(r24), r25
    bt.jr r9
