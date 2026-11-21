# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20409a,0x2040d2); byte-exact only; hardware untested.
    bt.mov r25, r3
    bt.movi r3, 0x1
    bn.blesi r4, 0x0, loc_2040cc
    bt.movi r24, 0x1
    bt.movi r23, 0x1
    bt.movi r5, 0x0
loc_2040a7:
    bn.add r7, r25, r5
    bn.lbz r6, 0x0(r7)
    bt.mov r7, r23
    bn.beqi r6, 0x0, loc_2040bf
    bt.mov r7, r24
    bt.movi r23, 0x0
    bg.sfnei r6, 0xff
    bn.bnf loc_2040c1
    bt.movi r7, 0x0
loc_2040bf:
    bt.movi r24, 0x0
loc_2040c1:
    bn.beqi r7, 0x0, loc_2040ce
    bt.addi r5, 0x1
    bg.bne r5, r4, loc_2040a7
    bt.movi r3, 0x1
loc_2040cc:
    bt.jr r9
loc_2040ce:
    bt.movi r3, 0x0
    bt.jr r9
