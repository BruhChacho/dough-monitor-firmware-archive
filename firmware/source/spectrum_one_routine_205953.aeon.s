# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x205953,0x205b11); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x18
    bn.sw 0x14(r1), r9
    bn.sw 0x10(r1), r10
    bn.sw 0xc(r1), r11
    bn.sw 0x8(r1), r12
    bn.sw 0x4(r1), r13
    bn.sw 0x0(r1), r14
    bt.mov r12, r4
    bt.mov r13, r5
    bt.mov r14, r6
    bg.bnei r3, 0x0, loc_205a06
    bg.movhi r11, 0x45
    bg.lhz r7, 0x3ec0(r11)
    bg.bnei r7, 0x0, loc_205a00
    bg.movhi r12, 0x45
    bg.lhz r7, 0x3ec2(r12)
    bn.beqi r7, 0x0, loc_2059ae
loc_205989:
    bt.movhi r10, -0x10
    bg.ori r3, r10, 0x2f00
    bn.ori r4, r0, 0x10
    bg.jal 0x23ddb9
    bg.ori r3, r10, 0x2f10
    bg.lhz r4, 0x3ec0(r11)
    bg.jal 0x23dfb6
    bg.ori r3, r10, 0x2f12
    bg.lhz r4, 0x3ec2(r12)
    bg.jal 0x23dfb6
loc_2059ae:
    bg.movhi r11, 0x45
    bg.lhz r7, 0x3ec4(r11)
    bg.bnei r7, 0x0, loc_205aa8
    bg.movhi r12, 0x45
    bg.lhz r7, 0x3ec6(r12)
    bg.beqi r7, 0x0, loc_205aae
loc_2059c6:
    bt.movhi r10, -0x10
    bg.ori r3, r10, 0x2b00
    bn.ori r4, r0, 0x10
    bg.jal 0x23ddb9
    bg.ori r3, r10, 0x2b10
    bg.lhz r4, 0x3ec4(r11)
    bg.jal 0x23dfb6
    bg.ori r3, r10, 0x2b12
    bg.lhz r4, 0x3ec6(r12)
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bg.j 0x23dfb6
loc_205a00:
    bg.movhi r12, 0x45
    bt.j loc_205989
loc_205a06:
    bt.movhi r10, -0x10
    bg.ori r3, r10, 0x2f00
    bn.ori r4, r0, 0x10
    bg.jal 0x23ddb9
    bg.ori r3, r10, 0x2f10
    bg.jal 0x23df85
    bn.exths r11, r3
    bg.ori r3, r10, 0x2f12
    bg.jal 0x23df85
    bn.exths r3, r3
    bn.or r7, r11, r3
    bg.bnei r7, 0x0, loc_205aeb
loc_205a30:
    bg.ori r3, r10, 0x2f33
    bt.mov r4, r12
    bg.jal 0x23ddb9
    bg.ori r3, r10, 0x2f34
    bt.mov r4, r13
    bg.jal 0x23ddb9
    bg.ori r3, r10, 0x2f35
    bt.mov r4, r14
    bg.jal 0x23ddb9
    bg.ori r3, r10, 0x2b00
    bn.ori r4, r0, 0x10
    bg.jal 0x23ddb9
    bg.ori r3, r10, 0x2b10
    bg.jal 0x23df85
    bn.exths r11, r3
    bg.ori r3, r10, 0x2b12
    bg.jal 0x23df85
    bn.exths r3, r3
    bn.or r7, r11, r3
    bn.bnei r7, 0x0, loc_205ac5
loc_205a75:
    bg.ori r3, r10, 0x2b33
    bt.mov r4, r12
    bg.jal 0x23ddb9
    bg.ori r3, r10, 0x2b34
    bt.mov r4, r13
    bg.jal 0x23ddb9
    bg.ori r3, r10, 0x2b35
    bt.mov r4, r14
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bg.j 0x23ddb9
loc_205aa8:
    bg.movhi r12, 0x45
    bt.j loc_2059c6
loc_205aae:
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bt.jr r9
loc_205ac5:
    bg.movhi r7, 0x45
    bg.sw_1 0x3ec4(r7), r11
    bg.movhi r7, 0x45
    bg.sh 0x3ec4(r7), r3
    bg.ori r3, r10, 0x2b10
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bg.ori r3, r10, 0x2b12
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bt.j loc_205a75
loc_205aeb:
    bg.movhi r7, 0x45
    bg.sw_1 0x3ec0(r7), r11
    bg.movhi r7, 0x45
    bg.sh 0x3ec0(r7), r3
    bg.ori r3, r10, 0x2f10
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bg.ori r3, r10, 0x2f12
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bt.j loc_205a30
