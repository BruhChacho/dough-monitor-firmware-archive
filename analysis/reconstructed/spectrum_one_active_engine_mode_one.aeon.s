# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21fb61,0x21fe2c); Active engine configuration, including the default return and longer register update path.
# Fixed original addresses; not hardware-validated.
    bn.addi r1, r1, -0x38
    bn.sw 0x34(r1), r9
    bn.sw 0x30(r1), r10
    bn.sw 0x2c(r1), r11
    bn.sw 0x28(r1), r12
    bn.sw 0x24(r1), r13
    bn.sw 0x20(r1), r14
    bn.sw 0x1c(r1), r15
    bn.sw 0x18(r1), r16
    bn.sw 0x14(r1), r17
    bn.sw 0x10(r1), r18
    bn.sw 0xc(r1), r19
    bn.sw 0x8(r1), r20
    bn.sw 0x4(r1), r21
    bn.sw 0x0(r1), r22
    bt.mov r10, r3
    bg.jal 0x21fb2b
    bt.mov r11, r3
    bn.bnei r3, 0x0, loc_21fbcc
loc_21fb99:
    bt.movi r14, 0x0
loc_21fb9b:
    bt.mov r3, r14
    bn.lwz r22, 0x0(r1)
    bn.lwz r21, 0x4(r1)
    bn.lwz r20, 0x8(r1)
    bn.lwz r19, 0xc(r1)
    bn.lwz r18, 0x10(r1)
    bn.lwz r17, 0x14(r1)
    bn.lwz r16, 0x18(r1)
    bn.lwz r15, 0x1c(r1)
    bn.lwz r14, 0x20(r1)
    bn.lwz r13, 0x24(r1)
    bn.lwz r12, 0x28(r1)
    bn.lwz r11, 0x2c(r1)
    bn.lwz r10, 0x30(r1)
    bn.lwz r9, 0x34(r1)
    bn.addi r1, r1, 0x38
    bt.jr r9
loc_21fbcc:
    bg.jal 0x21bd14
    bt.mov r16, r3
    bn.beqi r3, 0x0, loc_21fb99
    bg.jal 0x21bd1e
    bt.mov r19, r3
    bn.beqi r3, 0x0, loc_21fb99
    bn.sub r7, r11, r10
    bn.srai r6, r7, 0x1f
    bn.xor r7, r6, r7
    bn.sub r7, r7, r6
    bg.blesi r7, 0x2, loc_21fd8e
    bg.movhi r7, 0x48
    bn.ori r6, r0, 0xb0
    bg.lbz r7, -0x4cb(r7)
    bn.muls r6, r6, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r6, r7
    bn.lbz r7, 0x20(r6)
    bn.andi r7, r7, 0x10
    bn.sfeqi r7, 0x0
    bn.cmovi r24, 0x1, 0x2
    bt.mov r29, r24
    bt.movi r28, 0x1
    bt.movi r4, 0x1
    bt.movi r27, -0x1
loc_21fc1a:
    bn.muls r26, r11, r24
    bt.movi r7, 0x0
    bt.movi r5, 0x1
loc_21fc21:
    bn.extbz r25, r5
    bn.add r23, r7, r10
    bg.beq r26, r23, loc_21fd85
    bn.slli r7, r24, 0x10
    bn.divu r7, r7, r5
    bn.slli r6, r10, 0x10
    bn.divu r6, r6, r11
    bn.sub r7, r7, r6
    bn.srai r6, r7, 0x1f
    bn.xor r7, r6, r7
    bn.sub r7, r7, r6
    bg.ble r27, r7, loc_21fc4d
    bt.mov r28, r24
    bt.mov r4, r25
    bt.mov r27, r7
loc_21fc4d:
    bt.mov r7, r23
    bt.addi r5, 0x1
    bn.sfnei r5, 0x21
    bn.bf loc_21fc21
loc_21fc57:
    bn.add r7, r24, r29
    bn.extbz r24, r7
    bn.sfleui r24, 0x20
    bn.bf loc_21fc1a
    bt.mov r12, r4
    bt.movi r13, 0x0
    bt.mov r18, r28
    bn.addi r6, r28, -0x1
    bn.extbz r6, r6
    bt.addi r4, -0x1
    bn.extbz r4, r4
    bn.andi r7, r4, 0xf
    bn.slli r7, r7, 0x4
    bn.andi r5, r6, 0xf
    bn.or r22, r7, r5
    bn.extbs r21, r4
    bn.srli r7, r6, 0x4
    bn.extbs r20, r7
    bn.xor r6, r6, r4
    bn.ff1 r6, r6
    bn.sub r6, r0, r6
    bn.srli r14, r6, 0x1f
loc_21fc95:
    bg.movhi r7, 0x45
    bg.lbz r10, 0x4824(r7)
    bg.jal 0x21bd8d
    bn.sfeqi r3, 0x0
    bn.cmovi r17, 0x1, 0x2
    bt.mov r3, r10
    bt.movi r4, 0x0
    bg.movhi r5, 0x8000
    bt.movi r6, 0x4
    bg.jal 0x2aacb9
    bt.mov r10, r3
    bt.mov r11, r4
    bt.movi r5, 0x0
    bt.movi r6, 0x0
    bg.jal 0x2aad0b
    bg.blesi r3, 0x0, loc_21fe07
    bt.mov r3, r10
    bt.mov r4, r11
    bg.jal 0x2aae3d
    bt.mov r15, r3
loc_21fccf:
    bn.divs r3, r16, r17
    bn.srai r4, r3, 0x1f
    bt.mov r5, r19
    bt.movi r6, 0x0
    bg.jal 0x2aacb9
    bt.mov r5, r3
    bt.mov r6, r4
    bt.mov r3, r12
    bt.mov r4, r13
    bg.jal 0x2aacb9
    bt.mov r10, r3
    bt.mov r11, r4
    bt.movi r5, 0x0
    bt.movi r6, 0x0
    bg.jal 0x2aad0b
    bg.blesi r3, 0x0, loc_21fde4
    bt.mov r3, r10
    bt.mov r4, r11
    bg.jal 0x2aae3d
loc_21fd01:
    bg.movhi r7, 0x34
    bg.lwz r4, 0x3890(r7)
    bg.jal 0x2abe2e
    bg.movhi r4, 0x4100
    bg.jal 0x2abe2e
    bt.mov r4, r3
    bt.mov r3, r15
    bg.jal 0x2abf74
    bg.jal 0x2aad27
    bt.movi r12, 0x0
    bn.ori r11, r0, 0x10
    bn.sfgtui r3, 0x1f
    bn.bf loc_21fdd0
loc_21fd2c:
    bg.movhi r7, 0x45
    bg.sw_1 0x3bc4(r7), r18
    bt.movhi r10, -0xf
    bg.ori r3, r10, 0x1516
    bt.mov r4, r12
    bt.movi r5, 0xf
    bg.jal 0x23dfe1
    bg.ori r3, r10, 0x1516
    bt.mov r4, r11
    bn.ori r5, r0, 0xf0
    bg.jal 0x23dfe1
    bg.ori r3, r10, 0x1517
    bt.mov r4, r12
    bt.movi r5, 0xf
    bg.jal 0x23dfe1
    bg.ori r3, r10, 0x1517
    bt.mov r4, r11
    bn.ori r5, r0, 0xf0
    bg.jal 0x23dfe1
    bg.ori r3, r10, 0x1519
    bt.mov r4, r22
    bg.jal 0x23ddb9
    bn.andi r4, r21, 0xf0
    bg.ori r3, r10, 0x151c
    bn.or r4, r4, r20
    bn.ori r5, r0, 0xff
    bg.jal 0x23dfe1
    bt.j loc_21fb9b
loc_21fd85:
    bt.mov r28, r24
    bt.mov r4, r25
    bn.ori r24, r0, 0x21
    bt.j loc_21fc57
loc_21fd8e:
    bg.movhi r7, 0x48
    bn.ori r6, r0, 0xb0
    bg.lbz r7, -0x4cb(r7)
    bn.muls r6, r6, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r6, r7
    bn.lbz r7, 0x20(r6)
    bn.andi r7, r7, 0x10
    bn.bnei r7, 0x0, loc_21fdbf
    bt.movi r12, 0x1
    bt.movi r13, 0x0
    bt.movi r18, 0x1
    bt.movi r22, 0x0
    bt.movi r21, 0x0
    bt.movi r20, 0x0
    bt.movi r14, 0x0
    bt.j loc_21fc95
loc_21fdbf:
    bt.movi r12, 0x2
    bt.movi r13, 0x0
    bt.movi r18, 0x2
    bn.ori r22, r0, 0x11
    bt.movi r21, 0x1
    bt.movi r20, 0x0
    bt.movi r14, 0x0
    bt.j loc_21fc95
loc_21fdd0:
    bg.jal 0x2402ab
    bn.addi r7, r3, -0x5
    bn.extbz r12, r7
    bt.addi r3, -0x4
    bn.slli r3, r3, 0x4
    bn.extbz r11, r3
    bt.j loc_21fd2c
loc_21fde4:
    bn.andi r3, r10, 0x1
    bt.movi r4, 0x0
    bn.slli r6, r11, 0x1f
    bn.srli r7, r10, 0x1
    bn.or r7, r6, r7
    bn.srli r8, r11, 0x1
    bn.or r3, r3, r7
    bn.or r4, r4, r8
    bg.jal 0x2aae3d
    bt.mov r4, r3
    bg.jal 0x2abd99
    bt.j loc_21fd01
loc_21fe07:
    bn.andi r3, r10, 0x1
    bt.movi r4, 0x0
    bn.slli r6, r11, 0x1f
    bn.srli r7, r10, 0x1
    bn.or r7, r6, r7
    bn.srli r8, r11, 0x1
    bn.or r3, r3, r7
    bn.or r4, r4, r8
    bg.jal 0x2aae3d
    bt.mov r4, r3
    bg.jal 0x2abd99
    bt.mov r15, r3
    bt.j loc_21fccf
