# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x206e73,0x206f72); byte-exact only; hardware untested.
    bn.addi r27, r3, 0x1
    bt.movi r30, 0x0
    bt.movi r31, 0x5
loc_206e7a:
    bn.exthz r6, r30
    bn.lbz r29, -0x1(r27)
    bn.ff1 r7, r6
    bt.addi r7, -0x1
    bn.srli r28, r7, 0x1f
    bt.mov r24, r27
    bn.divu r6, r6, r31
    bn.slli r6, r6, 0x4
    bn.add r23, r4, r6
    bt.mov r25, r23
    bt.movi r26, 0x0
loc_206e97:
    bn.lbz r5, 0x0(r24)
    bg.beqi r28, 0x0, loc_206f4c
    bn.extbz r7, r26
    bg.bnei r7, 0x0, loc_206f4c
    bn.slli r6, r5, 0x2
    bn.slli r7, r26, 0x1
    bn.sra r7, r29, r7
    bn.andi r7, r7, 0x3
    bt.add r6, r7
    bn.slli r6, r6, 0x4
    bn.sw 0x0(r25), r6
loc_206eb9:
    bt.addi r26, 0x1
    bt.addi r24, 0x1
    bt.addi r25, 0x4
    bt.addi r23, 0x4
    bg.bnei r26, 0x4, loc_206e97
    bt.addi r30, 0x5
    bt.addi r27, 0x5
    bg.sfnei r30, 0x136
    bn.bf loc_206e7a
    bg.lbz r25, 0x136(r3)
    bt.mov r23, r4
    bt.movi r24, 0x0
loc_206ed8:
    bn.add r7, r3, r24
    bg.lbz r7, 0x137(r7)
    bn.andi r5, r7, 0xf
    bn.slli r5, r5, 0x2
    bg.lwz r6, 0x3dc(r23)
    bn.srli r6, r6, 0x6
    bn.srli r7, r7, 0x4
    bt.add r6, r7
    bn.slli r6, r6, 0x6
    bn.sra r7, r25, r24
    bn.andi r7, r7, 0x1
    bn.slli r7, r7, 0x1
    bt.add r6, r7
    bt.add r5, r6
    bg.sw_0 0x3e0(r23), r5
    bt.addi r24, 0x1
    bt.addi r23, 0x4
    bg.bnei r24, 0x8, loc_206ed8
    bg.lbz r7, 0x13f(r3)
    bg.lwz r6, 0x3fc(r4)
    bn.srli r6, r6, 0x6
    bn.srli r5, r7, 0x4
    bt.add r6, r5
    bn.slli r6, r6, 0x6
    bn.andi r7, r7, 0xf
    bn.slli r7, r7, 0x2
    bt.add r6, r7
    bg.sw_0 0x400(r4), r6
    bt.movi r5, 0x0
loc_206f2e:
    bn.lwz r6, 0x0(r4)
    bn.lwz r7, 0x4(r4)
    bg.ble r6, r7, loc_206f3b
    bn.sw 0x4(r4), r6
loc_206f3b:
    bn.addi r7, r5, 0x1
    bn.exthz r5, r7
    bt.addi r4, 0x4
    bg.sfnei r5, 0x100
    bn.bf loc_206f2e
    bt.jr r9
loc_206f4c:
    bn.lwz r6, -0x4(r23)
    bn.srli r6, r6, 0x6
    bn.srli r7, r5, 0x4
    bt.add r6, r7
    bn.slli r6, r6, 0x6
    bn.andi r5, r5, 0xf
    bn.slli r5, r5, 0x2
    bn.slli r7, r26, 0x1
    bn.sra r7, r29, r7
    bn.andi r7, r7, 0x3
    bt.add r5, r7
    bt.add r6, r5
    bn.sw 0x0(r23), r6
    bt.j loc_206eb9
