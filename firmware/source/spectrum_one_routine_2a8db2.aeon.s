# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2a8db2,0x2a9310); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x50
    bn.sw 0x4c(r1), r9
    bn.sw 0x48(r1), r10
    bn.sw 0x44(r1), r11
    bn.sw 0x40(r1), r12
    bn.sw 0x3c(r1), r13
    bn.sw 0x38(r1), r14
    bn.sw 0x34(r1), r15
    bn.sw 0x30(r1), r16
    bn.sw 0x2c(r1), r17
    bn.sw 0x28(r1), r18
    bn.sw 0x24(r1), r19
    bn.sw 0x20(r1), r20
    bn.sw 0x1c(r1), r21
    bn.sw 0x18(r1), r22
    bt.mov r20, r3
    bt.mov r11, r5
    bt.mov r18, r6
    bn.add r15, r3, r4
    bt.mov r10, r3
loc_2a8dea:
    bn.lbs r7, 0x0(r11)
    bn.beqi r7, 0x0, loc_2a8e07
loc_2a8df0:
    bt.addi r11, 0x1
    bn.sfnei r7, 0x25
    bn.bnf loc_2a8e3c
    bg.ble r15, r10, loc_2a8dea
    bn.sbz 0x0(r10), r7
    bt.addi r10, 0x1
    bn.lbs r7, 0x0(r11)
    bn.bnei r7, 0x0, loc_2a8df0
loc_2a8e07:
    bn.sbz 0x0(r10), r0
loc_2a8e0a:
    bn.sub r3, r10, r20
    bn.lwz r22, 0x18(r1)
    bn.lwz r21, 0x1c(r1)
    bn.lwz r20, 0x20(r1)
    bn.lwz r19, 0x24(r1)
    bn.lwz r18, 0x28(r1)
    bn.lwz r17, 0x2c(r1)
    bn.lwz r16, 0x30(r1)
    bn.lwz r15, 0x34(r1)
    bn.lwz r14, 0x38(r1)
    bn.lwz r13, 0x3c(r1)
    bn.lwz r12, 0x40(r1)
    bn.lwz r11, 0x44(r1)
    bn.lwz r10, 0x48(r1)
    bn.lwz r9, 0x4c(r1)
    bn.addi r1, r1, 0x50
    bt.jr r9
loc_2a8e3c:
    bt.movi r19, 0x0
    bt.movi r17, 0x0
    bt.movi r16, -0x1
    bt.movi r23, 0x0
loc_2a8e44:
    bn.lbs r5, 0x0(r11)
    bt.addi r11, 0x1
loc_2a8e49:
    bn.addi r7, r5, -0x2a
    bn.sfgtui r7, 0x4e
    bn.bf loc_2a8e64
    bn.slli r7, r7, 0x2
    bg.movhi r4, 0x34
    bg.addi r4, r4, -0x4ddc
    bt.add r7, r4
    bn.lwz r7, 0x0(r7)
    bt.jr r7
loc_2a8e64:
    bg.ble r15, r10, loc_2a8dea
    bn.extbs r7, r5
    bn.sbz 0x0(r10), r7
    bt.addi r10, 0x1
    bg.bnei r7, 0x0, loc_2a8dea
    bt.j loc_2a8e0a
    bg.bnei r23, 0x2, loc_2a90d1
    bt.movi r23, 0x1
    bt.j loc_2a8e44
    bn.lwz r7, 0x0(r18)
    bn.sbz 0x0(r1), r7
    bt.addi r18, 0x4
    bt.movi r16, 0x1
    bt.mov r14, r1
loc_2a8e8a:
    bg.bgts r17, r16, loc_2a8ef9
loc_2a8e8e:
    bg.blesi r16, 0x0, loc_2a8dea
    bg.ble r15, r10, loc_2a8dea
    bt.mov r6, r14
    bt.mov r3, r10
    bn.add r4, r14, r16
    bn.sub r7, r15, r10
    bn.add r5, r14, r7
    bt.j loc_2a8ea9
loc_2a8ea5:
    bg.beq r6, r5, loc_2a8eb7
loc_2a8ea9:
    bn.lbz r7, 0x0(r6)
    bn.sbz 0x0(r3), r7
    bt.addi r3, 0x1
    bt.addi r6, 0x1
    bg.bne r6, r4, loc_2a8ea5
loc_2a8eb7:
    bt.mov r10, r3
    bt.j loc_2a8dea
    bn.sfnei r23, 0x3
    bn.cmovi r23, 0x3, 0x4
    bt.j loc_2a8e44
    bt.mov r7, r18
    bt.addi r18, 0x4
    bn.lwz r14, 0x0(r7)
    bg.bnei r17, 0x0, loc_2a90d6
    bg.blesi r16, -0x1, loc_2a9260
loc_2a8ed2:
    bn.lbz r5, 0x0(r14)
    bg.beqi r5, 0x0, loc_2a928a
    bt.mov r7, r14
    bn.add r6, r14, r16
    bn.bgtsi r16, 0x0, loc_2a8ee8
    bn.j loc_2a928a
loc_2a8ee4:
    bg.beq r7, r6, loc_2a8ef0
loc_2a8ee8:
    bt.addi r7, 0x1
    bn.lbz r5, 0x0(r7)
    bn.bnei r5, 0x0, loc_2a8ee4
loc_2a8ef0:
    bn.sub r7, r7, r14
loc_2a8ef3:
    bt.mov r16, r7
loc_2a8ef5:
    bg.bles r17, r16, loc_2a8e8e
loc_2a8ef9:
    bn.sub r23, r17, r16
    bn.andi r7, r19, 0x6
    bg.bnei r7, 0x0, loc_2a901b
    bn.beqi r23, 0x0, loc_2a8f23
    bn.andi r7, r19, 0x1
    bn.sfeqi r7, 0x0
    bn.ori r6, r0, 0x20
    bn.ori r7, r0, 0x30
    bn.cmov_0 r7, r6, r7
loc_2a8f15:
    bg.ble r15, r10, loc_2a8f1e
    bn.sbz 0x0(r10), r7
    bt.addi r10, 0x1
loc_2a8f1e:
    bt.addi r23, -0x1
    bn.bnei r23, 0x0, loc_2a8f15
loc_2a8f23:
    bt.mov r6, r16
loc_2a8f25:
    bg.blesi r6, 0x0, loc_2a8dea
    bg.ble r15, r10, loc_2a8f37
    bn.lbz r7, 0x0(r14)
    bn.sbz 0x0(r10), r7
    bt.addi r10, 0x1
    bt.addi r14, 0x1
loc_2a8f37:
    bt.addi r6, -0x1
    bt.j loc_2a8f25
    bt.mov r3, r18
    bg.beqi r23, 0x4, loc_2a9166
    bn.sfnei r5, 0x64
    bn.bnf loc_2a9196
    bt.addi r18, 0x4
    bn.lwz r3, 0x0(r3)
    bn.addi r14, r1, 0x18
    bt.movi r5, 0xa
    bg.bgtui r3, 0x9, loc_2a90af
    bg.movhi r5, 0x34
    bg.addi r5, r5, -0x4ca0
    bt.add r3, r5
    bn.lbz r7, 0x0(r3)
    bn.sbz 0x17(r1), r7
    bn.addi r14, r1, 0x17
    bt.j loc_2a8f8f
    bt.mov r5, r18
    bg.beqi r23, 0x4, loc_2a913d
    bt.addi r18, 0x4
    bn.lwz r5, 0x0(r5)
    bn.addi r14, r1, 0x18
    bg.bgtui r5, 0xf, loc_2a9092
    bg.movhi r7, 0x34
    bg.addi r7, r7, -0x4ca0
    bt.add r5, r7
    bn.lbz r7, 0x0(r5)
    bn.sbz 0x17(r1), r7
    bn.addi r14, r1, 0x17
loc_2a8f8f:
    bn.addi r5, r1, 0x18
    bn.sub r7, r5, r14
    bg.blesi r16, -0x1, loc_2a8ef3
    bg.bles r16, r7, loc_2a8e8a
    bt.mov r16, r7
    bt.j loc_2a8ef5
    bn.lwz r17, 0x0(r18)
    bt.addi r18, 0x4
    bt.j loc_2a8e44
    bn.ori r19, r19, 0x2
    bt.j loc_2a8e44
    bn.lbs r7, 0x0(r11)
    bt.addi r11, 0x1
    bn.sfnei r7, 0x2a
    bn.bnf loc_2a9308
    bt.mov r5, r7
    bn.addi r7, r7, -0x30
    bg.bgtui r7, 0x9, loc_2a8e49
    bt.mov r16, r7
    bn.lbs r5, 0x0(r11)
    bt.addi r11, 0x1
    bn.addi r7, r5, -0x30
    bg.bgtui r7, 0x9, loc_2a8e49
    bt.movi r6, 0xa
loc_2a8fd1:
    bn.muls r7, r16, r6
    bt.add r7, r5
    bn.addi r16, r7, -0x30
    bn.lbs r5, 0x0(r11)
    bt.addi r11, 0x1
    bn.addi r7, r5, -0x30
    bg.bleui r7, 0x9, loc_2a8fd1
    bt.j loc_2a8e49
    bn.ori r19, r19, 0x1
    bt.j loc_2a8e44
    bn.addi r17, r5, -0x30
    bn.lbs r5, 0x0(r11)
    bt.addi r11, 0x1
    bn.addi r7, r5, -0x30
    bg.bgtui r7, 0x9, loc_2a8e49
loc_2a8ffb:
    bn.slli r7, r17, 0x1
    bn.slli r6, r17, 0x3
    bt.add r7, r5
    bt.add r6, r7
    bn.addi r17, r6, -0x30
    bn.lbs r5, 0x0(r11)
    bt.addi r11, 0x1
    bn.addi r7, r5, -0x30
    bg.bleui r7, 0x9, loc_2a8ffb
    bt.j loc_2a8e49
    bn.ori r19, r19, 0x4
    bt.j loc_2a8e44
loc_2a901b:
    bn.andi r7, r19, 0x2
    bg.bnei r7, 0x0, loc_2a90f0
    bn.srli r6, r23, 0x1
    bg.blesi r6, 0x0, loc_2a92ff
    bg.ble r15, r10, loc_2a92ff
    bt.mov r3, r10
    bn.add r5, r10, r6
    bn.ori r4, r0, 0x20
    bt.mov r7, r15
    bt.j loc_2a903d
loc_2a9039:
    bg.beq r3, r7, loc_2a9046
loc_2a903d:
    bn.sbz 0x0(r3), r4
    bt.addi r3, 0x1
    bg.bne r3, r5, loc_2a9039
loc_2a9046:
    bn.blesi r16, 0x0, loc_2a906c
    bg.ble r15, r3, loc_2a906c
    bt.mov r5, r14
    bn.add r4, r14, r16
    bn.sub r7, r15, r3
    bn.add r24, r14, r7
    bt.j loc_2a905e
loc_2a905a:
    bg.beq r5, r24, loc_2a906c
loc_2a905e:
    bn.lbz r7, 0x0(r5)
    bn.sbz 0x0(r3), r7
    bt.addi r3, 0x1
    bt.addi r5, 0x1
    bg.bne r5, r4, loc_2a905a
loc_2a906c:
    bn.sub r6, r23, r6
    bg.beqi r6, 0x0, loc_2a8eb7
    bg.ble r15, r3, loc_2a8eb7
    bt.mov r10, r3
    bt.add r6, r3
    bn.ori r7, r0, 0x20
    bt.mov r5, r15
    bt.j loc_2a9086
loc_2a9082:
    bg.beq r10, r5, loc_2a8dea
loc_2a9086:
    bn.sbz 0x0(r10), r7
    bt.addi r10, 0x1
    bg.bne r10, r6, loc_2a9082
    bn.j loc_2a8dea
loc_2a9092:
    bt.addi r14, -0x1
    bn.andi r7, r5, 0xf
    bg.movhi r4, 0x34
    bg.addi r4, r4, -0x4ca0
    bt.add r7, r4
    bn.lbz r7, 0x0(r7)
    bn.sbz 0x0(r14), r7
    bn.srli r5, r5, 0x4
    bn.bnei r5, 0x0, loc_2a9092
    bt.j loc_2a8f8f
loc_2a90af:
    bt.addi r14, -0x1
    bn.divu r7, r3, r5
    bn.muls r6, r7, r5
    bn.sub r6, r3, r6
    bg.movhi r4, 0x34
    bg.addi r4, r4, -0x4ca0
    bt.add r6, r4
    bn.lbz r6, 0x0(r6)
    bn.sbz 0x0(r14), r6
    bt.mov r3, r7
    bn.bnei r7, 0x0, loc_2a90af
    bt.j loc_2a8f8f
loc_2a90d1:
    bt.movi r23, 0x2
    bn.j loc_2a8e44
loc_2a90d6:
    bg.bgtsi r16, -0x1, loc_2a8ed2
    bn.lbz r6, 0x0(r14)
    bg.beqi r6, 0x0, loc_2a928a
    bt.mov r7, r14
loc_2a90e3:
    bt.addi r7, 0x1
    bn.lbz r4, 0x0(r7)
    bn.bnei r4, 0x0, loc_2a90e3
    bn.sub r7, r7, r14
    bt.j loc_2a8ef3
loc_2a90f0:
    bg.blesi r16, 0x0, loc_2a9304
    bg.ble r15, r10, loc_2a9304
    bt.mov r6, r14
    bt.mov r3, r10
    bn.add r4, r14, r16
    bn.sub r7, r15, r10
    bn.add r5, r14, r7
    bt.j loc_2a910b
loc_2a9107:
    bg.beq r6, r5, loc_2a9119
loc_2a910b:
    bn.lbz r7, 0x0(r6)
    bn.sbz 0x0(r3), r7
    bt.addi r3, 0x1
    bt.addi r6, 0x1
    bg.bne r6, r4, loc_2a9107
loc_2a9119:
    bg.beqi r23, 0x0, loc_2a8eb7
    bg.ble r15, r3, loc_2a8eb7
    bt.mov r10, r3
    bn.add r6, r3, r23
    bn.ori r7, r0, 0x20
    bt.mov r5, r15
    bt.j loc_2a9131
loc_2a912d:
    bg.beq r10, r5, loc_2a8dea
loc_2a9131:
    bn.sbz 0x0(r10), r7
    bt.addi r10, 0x1
    bg.bne r10, r6, loc_2a912d
    bn.j loc_2a8dea
loc_2a913d:
    bt.addi r18, 0x8
    bn.lwz r4, 0x0(r5)
    bn.lwz r5, 0x4(r5)
    bg.bgtui r5, 0x0, loc_2a91dc
    bn.bnei r5, 0x0, loc_2a9150
    bg.bgtui r4, 0xf, loc_2a91dc
loc_2a9150:
    bg.movhi r6, 0x34
    bg.addi r6, r6, -0x4ca0
    bn.add r7, r4, r6
    bn.lbz r7, 0x0(r7)
    bn.sbz 0x17(r1), r7
    bn.addi r14, r1, 0x17
    bt.j loc_2a8f8f
loc_2a9166:
    bt.addi r18, 0x8
    bn.lwz r12, 0x0(r3)
    bn.lwz r13, 0x4(r3)
    bn.sfnei r5, 0x64
    bn.bnf loc_2a9291
    bg.bgtui r13, 0x0, loc_2a920d
    bn.bnei r13, 0x0, loc_2a917f
    bg.bgtui r12, 0x9, loc_2a920d
loc_2a917f:
    bg.movhi r4, 0x34
    bg.addi r4, r4, -0x4ca0
    bn.add r7, r12, r4
    bn.lbz r7, 0x0(r7)
    bn.sbz 0x17(r1), r7
    bn.addi r14, r1, 0x17
    bn.j loc_2a8f8f
loc_2a9196:
    bt.addi r18, 0x4
    bn.lwz r3, 0x0(r3)
    bn.srai r7, r3, 0x1f
    bn.xor r5, r7, r3
    bn.sub r5, r5, r7
    bn.addi r14, r1, 0x18
    bt.movi r23, 0xa
    bg.bleui r5, 0x9, loc_2a9247
loc_2a91ad:
    bt.addi r14, -0x1
    bn.divu r7, r5, r23
    bn.muls r6, r7, r23
    bn.sub r6, r5, r6
    bg.movhi r4, 0x34
    bg.addi r4, r4, -0x4ca0
    bt.add r6, r4
    bn.lbz r6, 0x0(r6)
    bn.sbz 0x0(r14), r6
    bt.mov r5, r7
    bn.bnei r7, 0x0, loc_2a91ad
    bg.bgtsi r3, -0x1, loc_2a8f8f
loc_2a91d1:
    bt.addi r14, -0x1
    bn.ori r7, r0, 0x2d
    bn.sbz 0x0(r14), r7
    bn.j loc_2a8f8f
loc_2a91dc:
    bn.addi r14, r1, 0x18
loc_2a91df:
    bt.addi r14, -0x1
    bn.andi r7, r4, 0xf
    bg.movhi r6, 0x34
    bg.addi r6, r6, -0x4ca0
    bt.add r7, r6
    bn.lbz r7, 0x0(r7)
    bn.sbz 0x0(r14), r7
    bn.slli r6, r5, 0x1c
    bn.srli r7, r4, 0x4
    bn.or r7, r6, r7
    bn.srli r8, r5, 0x4
    bt.mov r4, r7
    bt.mov r5, r8
    bn.or r7, r7, r8
    bn.bnei r7, 0x0, loc_2a91df
    bn.j loc_2a8f8f
loc_2a920d:
    bn.addi r14, r1, 0x18
loc_2a9210:
    bt.addi r14, -0x1
    bt.mov r3, r12
    bt.mov r4, r13
    bt.movi r5, 0xa
    bt.movi r6, 0x0
    bg.jal 0x2ab6d2
    bg.movhi r5, 0x34
    bg.addi r5, r5, -0x4ca0
    bt.add r3, r5
    bn.lbz r7, 0x0(r3)
    bn.sbz 0x0(r14), r7
    bt.mov r3, r12
    bt.mov r4, r13
    bt.movi r5, 0xa
    bt.movi r6, 0x0
    bg.jal 0x2ab331
    bt.mov r12, r3
    bt.mov r13, r4
    bn.or r7, r3, r4
    bn.bnei r7, 0x0, loc_2a9210
    bn.j loc_2a8f8f
loc_2a9247:
    bg.movhi r6, 0x34
    bg.addi r6, r6, -0x4ca0
    bt.add r5, r6
    bn.lbz r7, 0x0(r5)
    bn.sbz 0x17(r1), r7
    bn.addi r14, r1, 0x17
    bg.bgtsi r3, -0x1, loc_2a8f8f
    bt.j loc_2a91d1
loc_2a9260:
    bg.ble r15, r10, loc_2a8dea
    bn.lbs r7, 0x0(r14)
    bn.sbz 0x0(r10), r7
    bt.mov r6, r10
    bt.mov r5, r15
    bn.bnei r7, 0x0, loc_2a927f
    bn.j loc_2a8dea
loc_2a9274:
    bt.addi r14, 0x1
    bn.lbs r7, 0x0(r14)
    bn.sbz 0x0(r6), r7
    bn.beqi r7, 0x0, loc_2a9285
loc_2a927f:
    bt.addi r6, 0x1
    bg.bne r6, r5, loc_2a9274
loc_2a9285:
    bt.mov r10, r6
    bn.j loc_2a8dea
loc_2a928a:
    bt.movi r7, 0x0
    bt.mov r16, r7
    bn.j loc_2a8ef5
loc_2a9291:
    bt.mov r22, r13
    bn.blesi r13, -0x1, loc_2a92ba
loc_2a9296:
    bn.bgtui r13, 0x0, loc_2a92c2
    bn.bnei r13, 0x0, loc_2a92a0
    bg.bgtui r12, 0x9, loc_2a92c2
loc_2a92a0:
    bg.movhi r6, 0x34
    bg.addi r6, r6, -0x4ca0
    bn.add r7, r12, r6
    bn.lbz r7, 0x0(r7)
    bn.sbz 0x17(r1), r7
    bn.addi r14, r1, 0x17
    bg.bgtsi r22, -0x1, loc_2a8f8f
    bt.j loc_2a91d1
loc_2a92ba:
    bn.sub r12, r0, r12
    bn.subb r13, r0, r13
    bt.j loc_2a9296
loc_2a92c2:
    bn.addi r14, r1, 0x18
loc_2a92c5:
    bt.addi r14, -0x1
    bt.mov r3, r12
    bt.mov r4, r13
    bt.movi r5, 0xa
    bt.movi r6, 0x0
    bg.jal 0x2ab6d2
    bg.movhi r7, 0x34
    bg.addi r7, r7, -0x4ca0
    bt.add r3, r7
    bn.lbz r7, 0x0(r3)
    bn.sbz 0x0(r14), r7
    bt.mov r3, r12
    bt.mov r4, r13
    bt.movi r5, 0xa
    bt.movi r6, 0x0
    bg.jal 0x2ab331
    bt.mov r12, r3
    bt.mov r13, r4
    bn.or r7, r3, r4
    bn.bnei r7, 0x0, loc_2a92c5
    bg.bgtsi r22, -0x1, loc_2a8f8f
    bt.j loc_2a91d1
loc_2a92ff:
    bt.mov r3, r10
    bn.j loc_2a9046
loc_2a9304:
    bt.mov r3, r10
    bt.j loc_2a9119
loc_2a9308:
    bn.lwz r16, 0x0(r18)
    bt.addi r18, 0x4
    bn.j loc_2a8e44
