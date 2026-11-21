# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23a5aa,0x23a5ea); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.ori r25, r0, 0x2a
    bn.sbz 0x5(r1), r25
    bn.ori r24, r0, 0x22
    bn.sbz 0x6(r1), r24
    bn.ori r23, r0, 0x1a
    bn.sbz 0x7(r1), r23
    bn.ori r6, r0, 0x12
    bn.sbz 0x8(r1), r6
    bt.movi r7, 0xc
    bn.sbz 0x9(r1), r7
    bn.sbz 0xa(r1), r0
    bn.sbz 0xb(r1), r7
    bn.sbz 0xc(r1), r6
    bn.sbz 0xd(r1), r23
    bn.sbz 0xe(r1), r24
    bn.sbz 0xf(r1), r25
    bn.addi r7, r1, 0x10
    bt.add r4, r7
    bn.lbz r4, -0xb(r4)
    bn.addi r1, r1, 0x10
    bg.j 0x207f4b
