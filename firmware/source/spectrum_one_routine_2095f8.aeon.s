# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2095f8,0x20964c); byte-exact only; hardware untested.
    bt.mov r24, r4
    bt.mov r29, r5
    bn.addi r27, r4, 0x6
    bn.addi r26, r4, 0xc
    bt.movi r28, 0x0
loc_209604:
    bt.movi r23, 0x0
    bn.add r25, r29, r28
loc_209609:
    bn.add r4, r23, r25
    bn.lh_0 r7, 0x0(r3)
    bn.add r6, r24, r23
    bn.lh_0 r6, 0x0(r6)
    bn.muls r7, r7, r6
    bn.lh_0 r6, 0x2(r3)
    bn.add r5, r23, r27
    bn.lh_0 r5, 0x0(r5)
    bn.muls r6, r6, r5
    bt.add r7, r6
    bn.lh_0 r6, 0x4(r3)
    bn.add r5, r23, r26
    bn.lh_0 r5, 0x0(r5)
    bn.muls r6, r6, r5
    bt.add r7, r6
    bn.srai r7, r7, 0xa
    bn.sh_1 0x0(r4), r7
    bt.addi r23, 0x2
    bg.bnei r23, 0x6, loc_209609
    bt.addi r28, 0x6
    bt.addi r3, 0x6
    bn.sfnei r28, 0x12
    bn.bf loc_209604
    bt.jr r9
