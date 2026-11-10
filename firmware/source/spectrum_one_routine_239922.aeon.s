# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x239922,0x239a06); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x18
    bn.sw 0x14(r1), r9
    bn.sw 0x10(r1), r10
    bn.sw 0xc(r1), r11
    bn.sw 0x8(r1), r12
    bn.sw 0x4(r1), r13
    bn.sw 0x0(r1), r14
    bg.movhi r7, 0x45
    bg.lbz r7, 0x508c(r7)
    bn.beqi r7, 0x0, loc_2399a8
    bg.movhi r11, 0x45
    bg.movhi r12, 0x45
    bg.lbz r7, 0x50a0(r12)
    bg.lbz r6, 0x509f(r11)
    bg.beq r7, r6, loc_239976
    bt.movi r10, 0x2
    bt.mov r13, r11
loc_23995a:
    bt.mov r3, r10
    bg.lbz r4, 0x509f(r11)
    bg.jal 0x2398ed
    bn.addi r7, r10, 0x1
    bn.extbz r10, r7
    bg.bnei r10, 0x4, loc_23995a
    bg.lbz r7, 0x509f(r13)
    bg.sbz 0x50a0(r12), r7
loc_239976:
    bg.movhi r7, 0x3b
    bg.addi r13, r7, 0x4318
    bt.movi r14, 0x0
    bt.movi r12, 0x0
    bg.movhi r7, 0x3b
    bg.addi r11, r7, 0x4288
loc_23998a:
    bn.extbz r10, r12
    bn.lbz r7, 0x0(r11)
    bn.beqi r7, 0x0, loc_23999c
    bn.lbz r6, 0x11(r11)
    bn.beqi r6, 0x0, loc_2399bf
loc_239999:
    bn.sbz 0x0(r11), r14
loc_23999c:
    bt.addi r12, 0x1
    bn.addi r11, r11, 0x18
    bn.addi r13, r13, 0x18
    bg.bnei r12, 0x6, loc_23998a
loc_2399a8:
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bt.jr r9
loc_2399bf:
    bt.movi r3, 0x1
    bg.jal 0x2393e6
    bn.lbz r7, 0x1(r11)
    bn.bnei r7, 0x0, loc_2399e4
    bn.lbz r7, 0x1(r13)
    bn.bnei r7, 0x0, loc_2399f6
loc_2399d1:
    bt.mov r3, r13
    bt.mov r4, r11
    bn.ori r5, r0, 0x18
    bg.jal 0x27099e
loc_2399dc:
    bt.movi r3, 0x0
    bg.jal 0x2393e6
    bt.j loc_239999
loc_2399e4:
    bn.beqi r7, 0x1, loc_2399fe
    bt.mov r3, r10
    bg.jal 0x2397c3
    bt.movi r7, 0x1
    bn.sbz 0x1(r11), r7
    bt.movi r14, 0x1
    bt.j loc_2399dc
loc_2399f6:
    bt.mov r3, r10
    bg.jal 0x2397c3
    bt.j loc_2399d1
loc_2399fe:
    bt.mov r3, r10
    bg.jal 0x239641
    bt.j loc_2399d1
