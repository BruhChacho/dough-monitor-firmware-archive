# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2052b2,0x2053ad); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x24
    bn.sw 0x20(r1), r9
    bn.sw 0x1c(r1), r10
    bn.sw 0x18(r1), r11
    bn.sw 0x14(r1), r12
    bn.sw 0x10(r1), r13
    bn.sw 0xc(r1), r14
    bn.sw 0x8(r1), r15
    bn.sw 0x4(r1), r16
    bn.sw 0x0(r1), r17
    bt.mov r17, r4
    bt.mov r16, r5
    bt.mov r15, r6
    bt.mov r14, r7
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r3, r6
    bn.lh r12, 0x2a(r3)
    bg.beqi r12, 0x0, loc_20538d
    bt.movi r13, 0x0
    bt.j loc_2052fc
loc_2052f3:
    bn.srli r12, r12, 0x1
    bt.addi r13, 0x1
    bg.beqi r12, 0x0, loc_20538d
loc_2052fc:
    bn.extbz r6, r13
    bn.andi r7, r12, 0x1
    bn.beqi r7, 0x0, loc_2052f3
    bn.ori r7, r0, 0x7c
    bn.muls r7, r6, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lwz r11, 0x4(r7)
    bn.ff1 r10, r17
    bn.sub r10, r0, r10
    bn.srli r10, r10, 0x1f
    bn.movhi_2 r7, 0x1480
    bn.ori r7, r7, 0x3
    bn.add r3, r11, r7
    bt.mov r4, r10
    bg.jal 0x23ddb9
    bg.movhi r6, 0x2580
    bn.ori r6, r6, 0x60
    bn.add r3, r11, r6
    bt.mov r4, r10
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x62
    bn.add r3, r11, r7
    bt.mov r4, r10
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bg.movhi r6, 0x2580
    bn.ori r6, r6, 0x64
    bn.add r3, r11, r6
    bt.mov r4, r16
    bg.jal 0x23dfb6
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x66
    bn.add r3, r11, r7
    bt.mov r4, r15
    bg.jal 0x23dfb6
    bg.movhi r6, 0x2580
    bn.ori r6, r6, 0x68
    bn.add r3, r11, r6
    bt.mov r4, r14
    bg.jal 0x23dfb6
    bn.srli r12, r12, 0x1
    bt.addi r13, 0x1
    bg.bnei r12, 0x0, loc_2052fc
loc_20538d:
    bn.lwz r17, 0x0(r1)
    bn.lwz r16, 0x4(r1)
    bn.lwz r15, 0x8(r1)
    bn.lwz r14, 0xc(r1)
    bn.lwz r13, 0x10(r1)
    bn.lwz r12, 0x14(r1)
    bn.lwz r11, 0x18(r1)
    bn.lwz r10, 0x1c(r1)
    bn.lwz r9, 0x20(r1)
    bn.addi r1, r1, 0x24
    bt.jr r9
