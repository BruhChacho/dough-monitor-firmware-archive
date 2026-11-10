# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2ab6d2,0x2aba8f); byte-exact only; hardware untested.
    bt.mov r23, r5
    bt.mov r28, r3
    bt.mov r24, r4
    bg.bnei r6, 0x0, loc_2ab78d
    bg.bgt r5, r4, loc_2ab7dc
    bg.beqi r5, 0x0, loc_2ab8a5
    bg.ori r4, r0, 0xffff
    bn.sfgtu r23, r4
    bn.bf loc_2ab88a
loc_2ab6ee:
    bt.movi r6, 0x0
    bt.movi r7, 0x0
    bg.sfgti r23, 0xff
    bn.bnf loc_2ab6fd
    bt.movi r6, 0x8
    bt.movi r7, 0x8
loc_2ab6fd:
    bn.srl r7, r23, r7
    bg.movhi r31, 0x34
    bg.addi r31, r31, -0x49d8
    bt.add r7, r31
    bn.lbz r7, 0x0(r7)
    bt.add r7, r6
    bn.ori r6, r0, 0x20
    bn.sub r29, r6, r7
    bg.bnei r29, 0x0, loc_2ab8ff
    bn.sub r5, r24, r23
    bn.srli r24, r23, 0x10
    bg.ori r4, r0, 0xffff
    bn.and r25, r23, r4
    bt.movi r30, 0x0
loc_2ab728:
    bn.divu r7, r5, r24
    bn.muls r4, r25, r7
    bn.muls r7, r7, r24
    bn.sub r7, r5, r7
    bn.slli r7, r7, 0x10
    bn.srli r6, r28, 0x10
    bn.or r5, r7, r6
    bg.ble r4, r5, loc_2ab750
    bt.add r5, r23
    bg.bgt r23, r5, loc_2ab750
    bn.add r7, r5, r23
    bn.sfgtu r4, r5
    bn.cmov_0 r5, r7, r5
loc_2ab750:
    bn.sub r7, r5, r4
    bn.divu r6, r7, r24
    bn.muls r4, r25, r6
    bn.muls r6, r6, r24
    bn.sub r7, r7, r6
    bn.slli r7, r7, 0x10
    bg.ori r5, r0, 0xffff
    bn.and r6, r28, r5
    bn.or r5, r7, r6
    bg.ble r4, r5, loc_2ab77f
    bt.add r5, r23
    bg.bgt r23, r5, loc_2ab77f
    bn.add r7, r5, r23
    bn.sfgtu r4, r5
    bn.cmov_0 r5, r7, r5
loc_2ab77f:
    bn.sub r5, r5, r4
loc_2ab782:
    bn.srl r26, r5, r30
    bt.movi r27, 0x0
loc_2ab787:
    bt.mov r3, r26
    bt.mov r4, r27
    bt.jr r9
loc_2ab78d:
    bt.mov r26, r3
    bt.mov r27, r4
    bg.bgt r6, r4, loc_2ab787
    bg.ori r7, r0, 0xffff
    bn.sfgtu r6, r7
    bn.bf loc_2ab8d1
    bt.movi r5, 0x0
    bt.movi r7, 0x0
    bg.sfgti r6, 0xff
    bn.bnf loc_2ab7ae
    bt.movi r5, 0x8
    bt.movi r7, 0x8
loc_2ab7ae:
    bn.srl r7, r6, r7
    bg.movhi r4, 0x34
    bg.addi r4, r4, -0x49d8
    bt.add r7, r4
    bn.lbz r7, 0x0(r7)
    bt.add r7, r5
    bn.ori r5, r0, 0x20
    bn.sub r29, r5, r7
    bg.bnei r29, 0x0, loc_2ab96b
    bg.bgt r24, r6, loc_2ab8ec
    bg.ble r23, r28, loc_2ab8ec
loc_2ab7d2:
    bt.mov r26, r28
    bt.mov r27, r24
    bt.mov r3, r26
    bt.mov r4, r27
    bt.jr r9
loc_2ab7dc:
    bg.ori r4, r0, 0xffff
    bn.sfgtu r5, r4
    bn.bf loc_2ab8b6
    bt.movi r7, 0x0
    bg.sfgti r5, 0xff
    bn.bnf loc_2ab7f3
    bt.movi r6, 0x8
    bt.movi r7, 0x8
loc_2ab7f3:
    bn.srl r7, r23, r7
    bg.movhi r31, 0x34
    bg.addi r31, r31, -0x49d8
    bt.add r7, r31
    bn.lbz r7, 0x0(r7)
    bt.add r7, r6
    bn.ori r5, r0, 0x20
    bn.sub r7, r5, r7
    bt.movi r30, 0x0
    bn.beqi r7, 0x0, loc_2ab824
    bt.mov r30, r7
    bn.sll r23, r23, r7
    bn.sll r6, r24, r7
    bn.sub r7, r5, r7
    bn.srl r7, r28, r7
    bn.or r24, r6, r7
    bn.sll r28, r28, r30
loc_2ab824:
    bn.srli r4, r23, 0x10
    bg.ori r5, r0, 0xffff
    bn.and r29, r23, r5
    bn.divu r7, r24, r4
    bn.muls r25, r29, r7
    bn.muls r7, r7, r4
    bn.sub r7, r24, r7
    bn.slli r7, r7, 0x10
    bn.srli r6, r28, 0x10
    bn.or r5, r7, r6
    bg.ble r25, r5, loc_2ab856
    bt.add r5, r23
    bg.bgt r23, r5, loc_2ab856
    bn.add r7, r5, r23
    bn.sfgtu r25, r5
    bn.cmov_0 r5, r7, r5
loc_2ab856:
    bn.sub r7, r5, r25
    bn.divu r6, r7, r4
    bn.muls r24, r29, r6
    bn.muls r6, r6, r4
    bn.sub r7, r7, r6
    bn.slli r7, r7, 0x10
    bg.ori r31, r0, 0xffff
    bn.and r6, r28, r31
    bn.or r5, r7, r6
    bg.ble r24, r5, loc_2ab885
    bt.add r5, r23
    bg.bgt r23, r5, loc_2ab885
    bn.add r7, r5, r23
    bn.sfgtu r24, r5
    bn.cmov_0 r5, r7, r5
loc_2ab885:
    bn.sub r5, r5, r24
    bt.j loc_2ab782
loc_2ab88a:
    bn.ori r6, r0, 0x10
    bn.ori r7, r0, 0x10
    bn.movhi_2 r5, 0xff
    bg.ori r5, r5, 0xffff
    bn.sfgtu r23, r5
    bn.bnf loc_2ab6fd
    bn.ori r6, r0, 0x18
    bn.ori r7, r0, 0x18
    bt.j loc_2ab6fd
loc_2ab8a5:
    bt.movi r7, 0x1
    bn.divu r23, r7, r5
    bg.ori r4, r0, 0xffff
    bn.sfgtu r23, r4
    bn.bf loc_2ab88a
    bt.j loc_2ab6ee
loc_2ab8b6:
    bn.ori r6, r0, 0x10
    bn.ori r7, r0, 0x10
    bn.movhi_2 r5, 0xff
    bg.ori r5, r5, 0xffff
    bn.sfgtu r23, r5
    bn.bnf loc_2ab7f3
    bn.ori r6, r0, 0x18
    bn.ori r7, r0, 0x18
    bt.j loc_2ab7f3
loc_2ab8d1:
    bn.ori r5, r0, 0x10
    bn.ori r7, r0, 0x10
    bn.movhi_2 r31, 0xff
    bg.ori r31, r31, 0xffff
    bn.sfgtu r6, r31
    bn.bnf loc_2ab7ae
    bn.ori r5, r0, 0x18
    bn.ori r7, r0, 0x18
    bt.j loc_2ab7ae
loc_2ab8ec:
    bn.sub r5, r28, r23
    bn.sub r6, r24, r6
    bn.sfleu r5, r28
    bn.cmovsi_2 r7, r0, 0x1
    bn.sub r24, r6, r7
    bt.mov r28, r5
    bt.j loc_2ab7d2
loc_2ab8ff:
    bt.mov r30, r29
    bn.sll r23, r23, r29
    bn.sub r7, r6, r29
    bn.srl r6, r24, r7
    bn.sll r5, r24, r29
    bn.srl r7, r28, r7
    bn.or r5, r5, r7
    bn.srli r24, r23, 0x10
    bg.ori r7, r0, 0xffff
    bn.and r25, r23, r7
    bn.divu r7, r6, r24
    bn.muls r4, r25, r7
    bn.muls r7, r7, r24
    bn.sub r6, r6, r7
    bn.slli r6, r6, 0x10
    bn.srli r7, r5, 0x10
    bn.or r6, r6, r7
    bg.ble r4, r6, loc_2ab93c
    bt.add r6, r23
    bg.ble r23, r6, loc_2aba84
loc_2ab93c:
    bn.sub r7, r6, r4
    bn.divu r6, r7, r24
    bn.muls r4, r25, r6
    bn.muls r6, r6, r24
    bn.sub r7, r7, r6
    bn.slli r7, r7, 0x10
    bg.ori r31, r0, 0xffff
    bn.and r6, r5, r31
    bn.or r5, r7, r6
    bg.ble r4, r5, loc_2ab962
    bt.add r5, r23
    bg.ble r23, r5, loc_2aba79
loc_2ab962:
    bn.sll r28, r28, r29
    bn.sub r5, r5, r4
    bn.j loc_2ab728
loc_2ab96b:
    bn.sub r31, r5, r29
    bn.sll r6, r6, r29
    bn.srl r7, r23, r31
    bn.or r30, r6, r7
    bn.sll r2, r23, r29
    bn.srl r6, r24, r31
    bn.sll r5, r24, r29
    bn.srl r7, r28, r31
    bn.or r5, r5, r7
    bn.sll r28, r28, r29
    bn.srli r23, r30, 0x10
    bg.ori r7, r0, 0xffff
    bn.and r25, r30, r7
    bn.divu r24, r6, r23
    bn.muls r4, r25, r24
    bn.muls r7, r24, r23
    bn.sub r6, r6, r7
    bn.slli r6, r6, 0x10
    bn.srli r7, r5, 0x10
    bn.or r6, r6, r7
    bg.ble r4, r6, loc_2ab9b4
    bt.addi r24, -0x1
    bt.add r6, r30
    bg.ble r30, r6, loc_2aba6f
loc_2ab9b4:
    bn.sub r7, r6, r4
    bn.divu r4, r7, r23
    bn.muls r25, r25, r4
    bn.muls r6, r4, r23
    bn.sub r7, r7, r6
    bn.slli r7, r7, 0x10
    bg.ori r23, r0, 0xffff
    bn.and r6, r5, r23
    bn.or r5, r7, r6
    bg.ble r25, r5, loc_2ab9dc
    bt.addi r4, -0x1
    bt.add r5, r30
    bg.ble r30, r5, loc_2aba65
loc_2ab9dc:
    bn.sub r25, r5, r25
    bn.slli r6, r24, 0x10
    bn.or r6, r4, r6
    bg.ori r24, r0, 0xffff
    bn.and r5, r6, r24
    bn.srli r6, r6, 0x10
    bn.and r4, r2, r24
    bn.srli r7, r2, 0x10
    bn.muls r23, r5, r4
    bn.muls r5, r5, r7
    bn.muls r4, r6, r4
    bn.muls r6, r6, r7
    bt.add r5, r4
    bn.srli r7, r23, 0x10
    bt.add r7, r5
    bt.movhi r24, 0x1
    bn.add r5, r6, r24
    bn.sfgtu r4, r7
    bn.cmov_0 r6, r5, r6
    bn.srli r5, r7, 0x10
    bn.add r24, r6, r5
    bn.slli r7, r7, 0x10
    bg.ori r4, r0, 0xffff
    bn.and r23, r23, r4
    bt.add r7, r23
    bg.bgt r24, r25, loc_2aba52
    bg.beq r25, r24, loc_2aba4e
loc_2aba2d:
    bn.sub r6, r28, r7
    bn.sub r5, r25, r24
    bn.sfleu r6, r28
    bn.cmovsi_2 r7, r0, 0x1
    bn.sub r5, r5, r7
    bn.sll r7, r5, r31
    bn.srl r6, r6, r29
    bn.or r26, r7, r6
    bn.srl r27, r5, r29
    bt.mov r3, r26
    bt.mov r4, r27
    bt.jr r9
loc_2aba4e:
    bg.ble r7, r28, loc_2aba2d
loc_2aba52:
    bn.sub r5, r7, r2
    bn.sub r6, r24, r30
    bn.sfleu r5, r7
    bn.cmovsi_2 r7, r0, 0x1
    bn.sub r24, r6, r7
    bt.mov r7, r5
    bt.j loc_2aba2d
loc_2aba65:
    bg.ble r25, r5, loc_2ab9dc
    bt.addi r4, -0x1
    bt.add r5, r30
    bt.j loc_2ab9dc
loc_2aba6f:
    bg.ble r4, r6, loc_2ab9b4
    bt.addi r24, -0x1
    bt.add r6, r30
    bt.j loc_2ab9b4
loc_2aba79:
    bn.add r7, r5, r23
    bn.sfgtu r4, r5
    bn.cmov_0 r5, r7, r5
    bt.j loc_2ab962
loc_2aba84:
    bn.add r7, r6, r23
    bn.sfgtu r4, r6
    bn.cmov_0 r6, r7, r6
    bt.j loc_2ab93c
