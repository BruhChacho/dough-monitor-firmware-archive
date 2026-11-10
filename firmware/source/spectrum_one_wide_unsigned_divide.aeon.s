# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2ab331,0x2ab6d2); Unsigned wide divide helper; calls no external routines.
# Fixed original addresses; not hardware-validated.
    bt.mov r24, r5
    bt.mov r30, r3
    bt.mov r3, r4
    bg.bnei r6, 0x0, loc_2ab3eb
    bg.bgt r5, r4, loc_2ab438
    bg.beqi r5, 0x0, loc_2ab520
    bg.ori r5, r0, 0xffff
    bn.sfgtu r24, r5
    bn.bf loc_2ab505
loc_2ab34d:
    bt.movi r6, 0x0
    bt.movi r7, 0x0
    bg.sfgti r24, 0xff
    bn.bnf loc_2ab35c
    bt.movi r6, 0x8
    bt.movi r7, 0x8
loc_2ab35c:
    bn.srl r7, r24, r7
    bg.movhi r26, 0x34
    bg.addi r26, r26, -0x49d8
    bt.add r7, r26
    bn.lbz r7, 0x0(r7)
    bt.add r7, r6
    bn.ori r6, r0, 0x20
    bn.sub r27, r6, r7
    bg.bnei r27, 0x0, loc_2ab60f
    bn.sub r3, r3, r24
    bn.srli r26, r24, 0x10
    bg.ori r4, r0, 0xffff
    bn.and r31, r24, r4
    bt.movi r4, 0x1
loc_2ab387:
    bn.divu r25, r3, r26
    bn.muls r5, r31, r25
    bn.muls r7, r25, r26
    bn.sub r7, r3, r7
    bn.slli r7, r7, 0x10
    bn.srli r6, r30, 0x10
    bn.or r3, r7, r6
    bg.ble r5, r3, loc_2ab3ac
    bt.addi r25, -0x1
    bt.add r3, r24
    bg.bgt r24, r3, loc_2ab3ac
    bg.bgt r5, r3, loc_2ab6c1
loc_2ab3ac:
    bn.sub r7, r3, r5
    bn.divu r23, r7, r26
    bn.muls r5, r31, r23
    bn.muls r6, r23, r26
    bn.sub r7, r7, r6
    bn.slli r7, r7, 0x10
    bg.ori r26, r0, 0xffff
    bn.and r6, r30, r26
    bn.or r3, r7, r6
    bg.ble r5, r3, loc_2ab3dd
    bt.addi r23, -0x1
    bt.add r3, r24
    bg.bgt r24, r3, loc_2ab3dd
    bn.addi r7, r23, -0x1
    bn.sfgtu r5, r3
    bn.cmov_0 r23, r7, r23
loc_2ab3dd:
    bn.slli r7, r25, 0x10
    bn.or r5, r23, r7
    bt.mov r6, r4
    bt.mov r3, r5
    bt.mov r4, r6
    bt.jr r9
loc_2ab3eb:
    bt.mov r5, r6
    bg.bgt r6, r4, loc_2ab42e
    bg.ori r4, r0, 0xffff
    bn.sfgtu r6, r4
    bn.bf loc_2ab4ea
    bt.movi r6, 0x0
    bt.movi r7, 0x0
    bg.sfgti r5, 0xff
    bn.bnf loc_2ab40a
    bt.movi r6, 0x8
    bt.movi r7, 0x8
loc_2ab40a:
    bn.srl r7, r5, r7
    bg.movhi r26, 0x34
    bg.addi r26, r26, -0x49d8
    bt.add r7, r26
    bn.lbz r7, 0x0(r7)
    bt.add r7, r6
    bn.ori r6, r0, 0x20
    bn.sub r26, r6, r7
    bg.bnei r26, 0x0, loc_2ab556
    bg.bgt r3, r5, loc_2ab54c
    bg.ble r24, r30, loc_2ab54c
loc_2ab42e:
    bt.movi r5, 0x0
    bt.movi r6, 0x0
loc_2ab432:
    bt.mov r3, r5
    bt.mov r4, r6
    bt.jr r9
loc_2ab438:
    bg.ori r4, r0, 0xffff
    bn.sfgtu r5, r4
    bn.bf loc_2ab531
    bt.movi r7, 0x0
    bg.sfgti r5, 0xff
    bn.bnf loc_2ab44f
    bt.movi r6, 0x8
    bt.movi r7, 0x8
loc_2ab44f:
    bn.srl r7, r24, r7
    bg.movhi r25, 0x34
    bg.addi r25, r25, -0x49d8
    bt.add r7, r25
    bn.lbz r7, 0x0(r7)
    bt.add r7, r6
    bn.ori r5, r0, 0x20
    bn.sub r23, r5, r7
    bn.beqi r23, 0x0, loc_2ab47c
    bn.sll r24, r24, r23
    bn.sll r6, r3, r23
    bn.sub r7, r5, r23
    bn.srl r7, r30, r7
    bn.or r3, r6, r7
    bn.sll r30, r30, r23
loc_2ab47c:
    bn.srli r25, r24, 0x10
    bg.ori r26, r0, 0xffff
    bn.and r4, r24, r26
    bn.divu r26, r3, r25
    bn.muls r5, r4, r26
    bn.muls r7, r26, r25
    bn.sub r7, r3, r7
    bn.slli r7, r7, 0x10
    bn.srli r6, r30, 0x10
    bn.or r3, r7, r6
    bg.ble r5, r3, loc_2ab4ab
    bt.addi r26, -0x1
    bt.add r3, r24
    bg.bgt r24, r3, loc_2ab4ab
    bg.bgt r5, r3, loc_2ab6ba
loc_2ab4ab:
    bn.sub r7, r3, r5
    bn.divu r23, r7, r25
    bn.muls r5, r4, r23
    bn.muls r6, r23, r25
    bn.sub r7, r7, r6
    bn.slli r7, r7, 0x10
    bg.ori r4, r0, 0xffff
    bn.and r6, r30, r4
    bn.or r3, r7, r6
    bg.ble r5, r3, loc_2ab4dc
    bt.addi r23, -0x1
    bt.add r3, r24
    bg.bgt r24, r3, loc_2ab4dc
    bn.addi r7, r23, -0x1
    bn.sfgtu r5, r3
    bn.cmov_0 r23, r7, r23
loc_2ab4dc:
    bn.slli r7, r26, 0x10
    bn.or r5, r23, r7
    bt.movi r6, 0x0
    bt.mov r3, r5
    bt.mov r4, r6
    bt.jr r9
loc_2ab4ea:
    bn.ori r6, r0, 0x10
    bn.ori r7, r0, 0x10
    bn.movhi_2 r25, 0xff
    bg.ori r25, r25, 0xffff
    bn.sfgtu r5, r25
    bn.bnf loc_2ab40a
    bn.ori r6, r0, 0x18
    bn.ori r7, r0, 0x18
    bt.j loc_2ab40a
loc_2ab505:
    bn.ori r6, r0, 0x10
    bn.ori r7, r0, 0x10
    bn.movhi_2 r25, 0xff
    bg.ori r25, r25, 0xffff
    bn.sfgtu r24, r25
    bn.bnf loc_2ab35c
    bn.ori r6, r0, 0x18
    bn.ori r7, r0, 0x18
    bt.j loc_2ab35c
loc_2ab520:
    bt.movi r7, 0x1
    bn.divu r24, r7, r5
    bg.ori r5, r0, 0xffff
    bn.sfgtu r24, r5
    bn.bf loc_2ab505
    bt.j loc_2ab34d
loc_2ab531:
    bn.ori r6, r0, 0x10
    bn.ori r7, r0, 0x10
    bn.movhi_2 r5, 0xff
    bg.ori r5, r5, 0xffff
    bn.sfgtu r24, r5
    bn.bnf loc_2ab44f
    bn.ori r6, r0, 0x18
    bn.ori r7, r0, 0x18
    bt.j loc_2ab44f
loc_2ab54c:
    bt.movi r5, 0x1
    bt.movi r6, 0x0
    bt.mov r3, r5
    bt.mov r4, r6
    bt.jr r9
loc_2ab556:
    bn.sub r6, r6, r26
    bn.sll r5, r5, r26
    bn.srl r7, r24, r6
    bn.or r25, r5, r7
    bn.sll r31, r24, r26
    bn.srl r5, r3, r6
    bn.sll r7, r3, r26
    bn.srl r6, r30, r6
    bn.or r3, r7, r6
    bn.srli r6, r25, 0x10
    bg.ori r4, r0, 0xffff
    bn.and r27, r25, r4
    bn.divu r23, r5, r6
    bn.muls r24, r27, r23
    bn.muls r7, r23, r6
    bn.sub r5, r5, r7
    bn.slli r5, r5, 0x10
    bn.srli r7, r3, 0x10
    bn.or r5, r5, r7
    bg.ble r24, r5, loc_2ab59c
    bt.addi r23, -0x1
    bt.add r5, r25
    bg.ble r25, r5, loc_2ab6b0
loc_2ab59c:
    bn.sub r7, r5, r24
    bn.divu r5, r7, r6
    bn.muls r4, r27, r5
    bn.muls r6, r5, r6
    bn.sub r7, r7, r6
    bn.slli r7, r7, 0x10
    bg.ori r24, r0, 0xffff
    bn.and r6, r3, r24
    bn.or r3, r7, r6
    bg.ble r4, r3, loc_2ab5c4
    bt.addi r5, -0x1
    bt.add r3, r25
    bg.ble r25, r3, loc_2ab6a6
loc_2ab5c4:
    bn.sub r3, r3, r4
    bn.slli r7, r23, 0x10
    bn.or r23, r5, r7
    bg.ori r25, r0, 0xffff
    bn.and r5, r23, r25
    bn.srli r6, r23, 0x10
    bn.and r4, r31, r25
    bn.srli r7, r31, 0x10
    bn.muls r24, r5, r4
    bn.muls r5, r5, r7
    bn.muls r4, r6, r4
    bn.muls r6, r6, r7
    bt.add r5, r4
    bn.srli r7, r24, 0x10
    bt.add r5, r7
    bt.movhi r25, 0x1
    bn.add r7, r6, r25
    bn.sfgtu r4, r5
    bn.cmov_0 r6, r7, r6
    bn.srli r7, r5, 0x10
    bn.add r4, r6, r7
    bg.bgt r4, r3, loc_2ab69e
    bg.beq r3, r4, loc_2ab68b
loc_2ab609:
    bt.mov r5, r23
    bt.movi r6, 0x0
    bt.j loc_2ab432
loc_2ab60f:
    bn.sll r24, r24, r27
    bn.sub r7, r6, r27
    bn.srl r6, r3, r7
    bn.sll r5, r3, r27
    bn.srl r7, r30, r7
    bn.or r3, r5, r7
    bn.srli r26, r24, 0x10
    bg.ori r5, r0, 0xffff
    bn.and r31, r24, r5
    bn.divu r25, r6, r26
    bn.muls r23, r31, r25
    bn.muls r7, r25, r26
    bn.sub r6, r6, r7
    bn.slli r6, r6, 0x10
    bn.srli r7, r3, 0x10
    bn.or r6, r6, r7
    bg.ble r23, r6, loc_2ab64c
    bt.addi r25, -0x1
    bt.add r6, r24
    bg.ble r24, r6, loc_2ab6c8
loc_2ab64c:
    bn.sub r7, r6, r23
    bn.divu r23, r7, r26
    bn.muls r5, r31, r23
    bn.muls r6, r23, r26
    bn.sub r7, r7, r6
    bn.slli r7, r7, 0x10
    bg.ori r4, r0, 0xffff
    bn.and r6, r3, r4
    bn.or r3, r7, r6
    bg.ble r5, r3, loc_2ab67c
    bt.addi r23, -0x1
    bt.add r3, r24
    bg.bgt r24, r3, loc_2ab67c
    bg.ble r5, r3, loc_2ab67c
    bt.addi r23, -0x1
    bt.add r3, r24
loc_2ab67c:
    bn.sll r30, r30, r27
    bn.sub r3, r3, r5
    bn.slli r7, r25, 0x10
    bn.or r4, r23, r7
    bn.j loc_2ab387
loc_2ab68b:
    bn.sll r7, r30, r26
    bn.slli r6, r5, 0x10
    bg.ori r26, r0, 0xffff
    bn.and r5, r24, r26
    bt.add r6, r5
    bg.ble r6, r7, loc_2ab609
loc_2ab69e:
    bn.addi r5, r23, -0x1
    bt.movi r6, 0x0
    bn.j loc_2ab432
loc_2ab6a6:
    bg.ble r4, r3, loc_2ab5c4
    bt.addi r5, -0x1
    bt.add r3, r25
    bt.j loc_2ab5c4
loc_2ab6b0:
    bg.ble r24, r5, loc_2ab59c
    bt.addi r23, -0x1
    bt.add r5, r25
    bt.j loc_2ab59c
loc_2ab6ba:
    bt.addi r26, -0x1
    bt.add r3, r24
    bn.j loc_2ab4ab
loc_2ab6c1:
    bt.addi r25, -0x1
    bt.add r3, r24
    bn.j loc_2ab3ac
loc_2ab6c8:
    bg.ble r23, r6, loc_2ab64c
    bt.addi r25, -0x1
    bt.add r6, r24
    bt.j loc_2ab64c
