# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20edc8,0x20eed3); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r10, r3
    bt.mov r12, r4
    bg.jal 0x20e79d
    bt.mov r13, r3
    bt.mov r3, r10
    bg.jal 0x20e6c5
    bt.mov r11, r3
    bt.movi r7, 0x0
    bg.movhi r4, 0x3b
    bg.addi r6, r4, 0x4950
loc_20edf6:
    bn.extbz r5, r7
    bn.lbz r23, 0x0(r6)
    bg.beq r10, r23, loc_20ee4e
    bt.addi r7, 0x1
    bg.addi r6, r6, 0xb0
    bg.bnei r7, 0x6, loc_20edf6
loc_20ee0a:
    bt.mov r3, r10
    bg.jal 0x20e736
    bt.mov r10, r3
    bn.beqi r11, 0x3, loc_20ee43
    bn.bgtui r11, 0x2, loc_20ee34
loc_20ee18:
    bt.mov r4, r12
    bg.jal 0x2336d1
loc_20ee1e:
    bt.movi r3, 0x1
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
loc_20ee34:
    bg.bnei r11, 0x4, loc_20ee1e
    bn.bnei r13, 0x0, loc_20ee1e
    bt.mov r4, r12
    bg.jal 0x211014
    bt.j loc_20ee1e
loc_20ee43:
    bg.jal 0x20ff43
    bn.bnei r3, 0x0, loc_20ee9b
    bt.mov r3, r10
    bt.j loc_20ee18
loc_20ee4e:
    bn.ori r7, r0, 0xb0
    bn.muls r7, r5, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bn.lwz r4, 0x4(r7)
    bt.movhi r23, 0x2
    bn.and r7, r4, r23
    bn.beqi r7, 0x0, loc_20ee0a
    bt.movi r7, 0x1
    bn.sll r7, r7, r5
    bn.exths r5, r7
    bg.movhi r6, 0x45
    bg.lhz r23, 0x508e(r6)
    bn.or r7, r5, r23
    bg.sh 0x508c(r6), r7
    bn.beqi r12, 0x0, loc_20eebf
    bg.movhi r6, 0x45
    bg.lhz r23, 0x5090(r6)
    bn.or r7, r5, r23
    bg.sw_1 0x5090(r6), r7
loc_20ee92:
    bn.andi r7, r4, 0x20
    bg.beqi r7, 0x0, loc_20ee0a
    bt.j loc_20ee1e
loc_20ee9b:
    bt.mov r3, r10
    bt.movi r4, 0x1
    bg.jal 0x2336d1
    bt.mov r3, r10
    bg.jal 0x21008c
    bt.movi r3, 0x1
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
loc_20eebf:
    bg.movhi r6, 0x45
    bn.nand r7, r5, r5
    bg.lhz r5, 0x5090(r6)
    bn.and r7, r7, r5
    bg.sw_1 0x5090(r6), r7
    bt.j loc_20ee92
