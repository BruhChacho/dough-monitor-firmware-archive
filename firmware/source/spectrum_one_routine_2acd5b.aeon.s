# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2acd5b,0x2acec8); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x4c
    bn.sw 0x48(r1), r9
    bn.sw 0x44(r1), r10
    bn.sw 0x40(r1), r11
    bn.sw 0x38(r1), r3
    bn.sw 0x3c(r1), r4
    bn.sw 0x30(r1), r5
    bn.sw 0x34(r1), r6
    bn.addi r11, r1, 0x18
    bn.addi r3, r1, 0x38
    bt.mov r4, r11
    bg.jal 0x2ac756
    bn.addi r3, r1, 0x30
    bt.mov r4, r1
    bg.jal 0x2ac756
    bn.lwz r5, 0x18(r1)
    bt.mov r3, r11
    bn.bleui r5, 0x1, loc_2acdba
    bn.lwz r4, 0x0(r1)
    bt.mov r3, r1
    bn.bleui r4, 0x1, loc_2acdba
    bn.lwz r7, 0x1c(r1)
    bn.lwz r6, 0x4(r1)
    bn.xor r7, r7, r6
    bn.sw 0x1c(r1), r7
    bg.beqi r5, 0x4, loc_2acdcc
    bn.beqi r5, 0x2, loc_2acdcc
    bg.bnei r4, 0x4, loc_2acdec
    bn.sw 0x28(r1), r0
    bn.sw 0x2c(r1), r0
    bn.sw 0x20(r1), r0
    bt.mov r3, r11
loc_2acdba:
    bg.jal 0x2ac55d
    bn.lwz r11, 0x40(r1)
    bn.lwz r10, 0x44(r1)
    bn.lwz r9, 0x48(r1)
    bn.addi r1, r1, 0x4c
    bt.jr r9
loc_2acdcc:
    bt.mov r3, r11
    bg.bne r4, r5, loc_2acdba
    bg.movhi r7, 0x34
    bg.addi r3, r7, -0x49f0
    bg.jal 0x2ac55d
    bn.lwz r11, 0x40(r1)
    bn.lwz r10, 0x44(r1)
    bn.lwz r9, 0x48(r1)
    bn.addi r1, r1, 0x4c
    bt.jr r9
loc_2acdec:
    bg.beqi r4, 0x2, loc_2ace71
    bn.lwz r6, 0x20(r1)
    bn.lwz r7, 0x8(r1)
    bn.sub r4, r6, r7
    bn.sw 0x20(r1), r4
    bn.lwz r23, 0x28(r1)
    bn.lwz r24, 0x2c(r1)
    bn.lwz r25, 0x10(r1)
    bn.lwz r26, 0x14(r1)
    bg.bgt r26, r24, loc_2ace84
    bg.beq r26, r24, loc_2ace80
loc_2ace10:
    bt.movi r4, 0x0
    bn.movhi_2 r5, 0x1000
    bt.movi r28, 0x0
    bt.movi r29, 0x0
    bt.movi r27, 0x0
loc_2ace1b:
    bg.bgt r26, r24, loc_2ace33
    bg.beq r26, r24, loc_2ace7a
loc_2ace23:
    bn.or r7, r28, r4
    bn.or r8, r29, r5
    bt.mov r28, r7
    bt.mov r29, r8
    bn.sub r23, r23, r25
    bn.subb r24, r24, r26
loc_2ace33:
    bn.slli r6, r5, 0x1f
    bn.srli r7, r4, 0x1
    bn.or r7, r6, r7
    bn.srli r8, r5, 0x1
    bt.mov r4, r7
    bt.mov r5, r8
    bn.srli r6, r23, 0x1f
    bn.slli r8, r24, 0x1
    bn.or r8, r6, r8
    bn.slli r7, r23, 0x1
    bt.mov r23, r7
    bt.mov r24, r8
    bt.addi r27, 0x1
    bn.sfnei r27, 0x3d
    bn.bf loc_2ace1b
    bn.andi r7, r28, 0xff
    bt.movi r8, 0x0
    bg.sfnei r7, 0x80
    bn.bnf loc_2ace9c
loc_2ace67:
    bn.sw 0x28(r1), r28
    bn.sw 0x2c(r1), r29
    bt.mov r3, r11
    bt.j loc_2acdba
loc_2ace71:
    bt.movi r7, 0x4
    bn.sw 0x18(r1), r7
    bt.mov r3, r11
    bt.j loc_2acdba
loc_2ace7a:
    bg.bgt r25, r23, loc_2ace33
    bt.j loc_2ace23
loc_2ace80:
    bg.ble r25, r23, loc_2ace10
loc_2ace84:
    bn.srli r7, r23, 0x1f
    bn.slli r6, r24, 0x1
    bn.or r6, r7, r6
    bn.slli r5, r23, 0x1
    bt.mov r23, r5
    bt.mov r24, r6
    bn.addi r7, r4, -0x1
    bn.sw 0x20(r1), r7
    bt.j loc_2ace10
loc_2ace9c:
    bn.bnei r8, 0x0, loc_2ace67
    bg.ori r6, r0, 0x100
    bn.and r7, r28, r6
    bn.or r7, r7, r8
    bn.bnei r7, 0x0, loc_2ace67
    bn.or r7, r23, r24
    bn.beqi r7, 0x0, loc_2ace67
    bt.mov r7, r28
    bt.mov r8, r29
    bg.addi r7, r7, 0x80
    bn.addc r8, r8, r0
    bg.addi r6, r0, -0x100
    bn.and r28, r7, r6
    bt.mov r29, r8
    bt.j loc_2ace67
