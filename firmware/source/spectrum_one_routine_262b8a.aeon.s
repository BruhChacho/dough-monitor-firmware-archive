# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x262b8a,0x262bd5); byte-exact only; hardware untested.
    bt.mov r24, r3
    bt.mov r23, r5
    bt.mov r5, r6
    bt.mov r25, r7
    bn.lh r6, 0x0(r1)
    bt.mov r3, r8
    bg.beq r24, r23, loc_262bb8
    bg.bgt r24, r23, loc_262bba
    bn.sub r5, r23, r4
    bn.sub r7, r24, r4
    bn.sub r6, r8, r25
    bn.muls r7, r7, r6
    bn.srai r6, r5, 0x1
    bt.add r7, r6
    bn.divu r7, r7, r5
    bt.add r7, r25
    bn.exthz r3, r7
loc_262bb8:
    bt.jr r9
loc_262bba:
    bn.sub r5, r5, r23
    bn.sub r7, r24, r23
    bn.sub r6, r6, r8
    bn.muls r7, r7, r6
    bn.srai r6, r5, 0x1
    bt.add r7, r6
    bn.divu r7, r7, r5
    bt.add r7, r8
    bn.exthz r3, r7
    bt.jr r9
