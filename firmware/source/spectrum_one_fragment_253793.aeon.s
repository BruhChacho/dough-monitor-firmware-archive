# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x253793,0x2538f6); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bn.sw 0x14(r1), r10
    bn.sw 0x10(r1), r11
    bn.sw 0xc(r1), r12
    bn.sw 0x8(r1), r13
    bn.sw 0x4(r1), r14
    bn.sw 0x0(r1), r15
    bt.mov r12, r4
    bg.bnei r3, 0x0, loc_253842
    bn.sfgtui r4, 0x1c
    bn.bf loc_253828
    bt.movi r13, 0x0
    bg.movhi r14, 0x45
    bt.j loc_2537cf
loc_2537bf:
    bt.movi r3, 0x0
    bt.mov r4, r10
    bt.mov r5, r11
    bg.jal 0x252e20
    bt.addi r13, 0x1
    bg.beqi r13, 0x4, loc_253828
loc_2537cf:
    bn.exthz r10, r13
    bt.movi r3, 0x0
    bt.movi r4, 0x0
    bt.mov r5, r10
    bg.jal 0x252cd9
    bt.mov r11, r3
    bn.sfnei r12, 0x1c
    bn.bnf loc_253877
    bt.movi r3, 0x0
    bt.movi r4, 0x0
    bt.mov r5, r12
    bt.mov r6, r10
    bg.jal 0x2535c7
    bt.mov r10, r3
loc_2537f2:
    bg.lhz r7, 0x7644(r14)
    bn.andi r7, r7, 0x8
    bn.beqi r7, 0x0, loc_2537bf
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x35cc
    bg.movhi r7, 0x45
    bg.lhz r4, 0x765c(r7)
    bt.mov r5, r12
    bt.mov r6, r13
    bt.mov r7, r11
    bt.mov r8, r10
    bg.jal 0x2a9310
    bt.movi r3, 0x0
    bt.mov r4, r10
    bt.mov r5, r11
    bg.jal 0x252e20
    bt.addi r13, 0x1
    bg.bnei r13, 0x4, loc_2537cf
loc_253828:
    bn.lwz r15, 0x0(r1)
    bn.lwz r14, 0x4(r1)
    bn.lwz r13, 0x8(r1)
    bn.lwz r12, 0xc(r1)
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
loc_253842:
    bn.beqi r3, 0x1, loc_253883
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x8
    bn.beqi r7, 0x0, loc_253828
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3593
    bn.lwz r15, 0x0(r1)
    bn.lwz r14, 0x4(r1)
    bn.lwz r13, 0x8(r1)
    bn.lwz r12, 0xc(r1)
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bg.j 0x2a93a3
loc_253877:
    bt.movi r3, 0x0
    bt.mov r4, r11
    bg.jal 0x252efc
    bt.mov r10, r3
    bt.j loc_2537f2
loc_253883:
    bg.bgtui r4, 0x4, loc_253828
    bt.movi r13, 0x0
    bg.movhi r14, 0x45
    bg.movhi r7, 0x45
    bg.addi r15, r7, 0x765c
    bt.j loc_2538a6
loc_253897:
    bt.movi r3, 0x1
    bt.mov r4, r10
    bt.mov r5, r11
    bg.jal 0x252e20
    bt.addi r13, 0x1
    bn.beqi r13, 0x3, loc_253828
loc_2538a6:
    bn.exthz r10, r13
    bt.movi r3, 0x1
    bt.movi r4, 0x0
    bt.mov r5, r10
    bg.jal 0x252cd9
    bt.mov r11, r3
    bg.beqi r12, 0x4, loc_2538ea
    bt.movi r3, 0x1
    bt.movi r4, 0x0
    bt.mov r5, r12
    bt.mov r6, r10
    bg.jal 0x2535c7
    bt.mov r10, r3
loc_2538c7:
    bg.lhz r7, 0x7644(r14)
    bn.andi r7, r7, 0x8
    bn.beqi r7, 0x0, loc_253897
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x35cc
    bn.lh r4, 0x2(r15)
    bt.mov r5, r12
    bt.mov r6, r13
    bt.mov r7, r11
    bt.mov r8, r10
    bg.jal 0x2a9310
    bt.j loc_253897
loc_2538ea:
    bt.movi r3, 0x1
    bt.mov r4, r11
    bg.jal 0x252efc
    bt.mov r10, r3
    bt.j loc_2538c7
