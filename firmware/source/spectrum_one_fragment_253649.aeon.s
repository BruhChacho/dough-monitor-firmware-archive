# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x253649,0x253749); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x34
    bn.sw 0x30(r1), r9
    bn.sw 0x2c(r1), r10
    bn.sw 0x28(r1), r11
    bn.sw 0x24(r1), r12
    bn.sw 0x20(r1), r13
    bn.sw 0x1c(r1), r14
    bn.sw 0x18(r1), r15
    bn.sw 0x14(r1), r16
    bn.sw 0x10(r1), r17
    bt.mov r12, r3
    bt.mov r13, r4
    bn.bgtui r4, 0x2, loc_2536dd
    bt.movi r14, 0x0
    bn.addi r17, r1, 0x8
    bg.movhi r16, 0x45
    bn.slli r15, r3, 0x1
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x765c
    bt.add r15, r7
loc_253684:
    bn.exthz r10, r14
    bt.mov r3, r12
    bt.movi r4, 0x4
    bt.mov r5, r10
    bg.jal 0x252cd9
    bt.mov r11, r3
    bn.bnei r12, 0x0, loc_2536fd
    bn.ori r3, r0, 0xfe
    bn.extbz r4, r11
    bg.jal 0x248849
    bn.sw 0x0(r1), r3
    bn.sw 0x4(r1), r4
    bn.sw 0x8(r1), r3
    bn.sw 0xc(r1), r4
    bt.mov r3, r17
    bg.jal 0x249112
    bn.beqi r13, 0x2, loc_25371c
loc_2536b5:
    bt.mov r3, r12
    bt.movi r4, 0x4
    bt.mov r5, r13
    bt.mov r6, r10
    bg.jal 0x2535c7
    bt.mov r10, r3
    bg.lhz r7, 0x7644(r16)
    bn.andi r7, r7, 0x8
    bn.bnei r7, 0x0, loc_253730
loc_2536cd:
    bt.mov r3, r12
    bt.mov r4, r10
    bt.mov r5, r11
    bg.jal 0x252e20
    bt.addi r14, 0x1
    bg.bnei r14, 0x4, loc_253684
loc_2536dd:
    bn.lwz r17, 0x10(r1)
    bn.lwz r16, 0x14(r1)
    bn.lwz r15, 0x18(r1)
    bn.lwz r14, 0x1c(r1)
    bn.lwz r13, 0x20(r1)
    bn.lwz r12, 0x24(r1)
    bn.lwz r11, 0x28(r1)
    bn.lwz r10, 0x2c(r1)
    bn.lwz r9, 0x30(r1)
    bn.addi r1, r1, 0x34
    bt.jr r9
loc_2536fd:
    bn.ori r3, r0, 0xfe
    bn.extbz r4, r11
    bg.jal 0x249f55
    bn.sw 0x0(r1), r3
    bn.sw 0x4(r1), r4
    bn.sw 0x8(r1), r3
    bn.sw 0xc(r1), r4
    bt.mov r3, r17
    bg.jal 0x24a81e
    bn.bnei r13, 0x2, loc_2536b5
loc_25371c:
    bt.mov r3, r12
    bt.mov r4, r11
    bg.jal 0x252efc
    bt.mov r10, r3
    bg.lhz r7, 0x7644(r16)
    bn.andi r7, r7, 0x8
    bn.beqi r7, 0x0, loc_2536cd
loc_253730:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3658
    bn.lh r4, 0x0(r15)
    bt.mov r5, r13
    bt.mov r6, r14
    bt.mov r7, r11
    bt.mov r8, r10
    bg.jal 0x2a9310
    bt.j loc_2536cd
