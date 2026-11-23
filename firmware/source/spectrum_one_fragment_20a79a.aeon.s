# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20a79a,0x20aade); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x2c
    bn.sw 0x28(r1), r9
    bn.sw 0x24(r1), r10
    bn.sw 0x20(r1), r11
    bn.sw 0x1c(r1), r12
    bn.sw 0x18(r1), r13
    bn.sw 0x14(r1), r14
    bn.sw 0x10(r1), r15
    bn.sw 0xc(r1), r16
    bn.sw 0x8(r1), r17
    bn.sw 0x4(r1), r18
    bn.sw 0x0(r1), r19
    bt.mov r18, r3
    bt.movi r3, 0x0
    bg.jal 0x222b8a
    bt.mov r3, r18
    bg.jal 0x23e79e
    bt.mov r11, r3
    bg.movhi r19, 0x45
    bg.lbz r7, 0x5211(r19)
    bg.movhi r15, 0x45
    bg.sbz 0x5210(r15), r0
    bn.beqi r7, 0x0, loc_20a80a
    bt.movi r7, 0x1
    bg.sbz 0x5210(r15), r7
    bg.jal 0x23e49c
    bt.movi r3, 0xa
    bt.movi r4, 0x1
    bg.jal 0x23e13b
    bn.movhi_2 r3, 0x90
    bg.ori r3, r3, 0x2f02
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bt.movi r3, 0xa
    bt.movi r4, 0x0
    bg.jal 0x23e13b
loc_20a80a:
    bg.beqi r11, 0x0, loc_20a8a2
    bt.movi r14, 0x0
    bn.ori r7, r0, 0x58
    bn.muls r13, r18, r7
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x3fc4
    bt.add r13, r7
    bt.mov r16, r13
    bt.mov r17, r13
    bt.j loc_20a831
loc_20a826:
    bn.srli r7, r11, 0x1
    bn.exthz r11, r7
    bt.addi r14, 0x1
    bn.beqi r11, 0x0, loc_20a8a2
loc_20a831:
    bn.extbz r10, r14
    bn.andi r7, r11, 0x1
    bn.beqi r7, 0x0, loc_20a826
    bt.mov r3, r10
    bg.jal 0x222b8a
    bt.mov r12, r3
    bn.andi r7, r10, 0x1
    bg.beqi r7, 0x0, loc_20a8fa
    bn.lbz r7, 0x53(r16)
    bg.beqi r7, 0x0, loc_20a94a
    bg.lbz r7, 0x5210(r15)
    bg.beqi r7, 0x0, loc_20aa9c
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x8e
    bt.add r3, r7
    bn.lh r4, 0x2(r16)
    bg.jal 0x23e58a
    bg.lbz r7, 0x5210(r15)
    bg.beqi r7, 0x0, loc_20aab3
loc_20a86f:
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x90
    bn.add r3, r12, r7
    bn.lh r4, 0x2(r13)
    bg.jal 0x23e58a
    bg.lbz r7, 0x5210(r15)
    bg.beqi r7, 0x0, loc_20aacb
loc_20a887:
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x92
    bn.add r3, r12, r7
    bn.lh r4, 0x2(r13)
    bg.jal 0x23e58a
    bn.srli r7, r11, 0x1
    bn.exthz r11, r7
    bt.addi r14, 0x1
    bn.bnei r11, 0x0, loc_20a831
loc_20a8a2:
    bg.lbz r19, 0x5211(r19)
    bn.beqi r19, 0x0, loc_20a8ce
    bg.jal 0x23e4a0
    bg.sbz 0x5210(r15), r0
    bt.movi r3, 0xa
    bt.movi r4, 0x1
    bg.jal 0x23e13b
    bn.movhi_2 r3, 0x90
    bg.ori r3, r3, 0x2f02
    bt.movi r4, 0x5
    bg.jal 0x23ddb9
    bt.movi r3, 0xa
    bt.movi r4, 0x0
    bg.jal 0x23e13b
loc_20a8ce:
    bt.mov r3, r18
    bt.movi r4, 0x1
    bn.lwz r19, 0x0(r1)
    bn.lwz r18, 0x4(r1)
    bn.lwz r17, 0x8(r1)
    bn.lwz r16, 0xc(r1)
    bn.lwz r15, 0x10(r1)
    bn.lwz r14, 0x14(r1)
    bn.lwz r13, 0x18(r1)
    bn.lwz r12, 0x1c(r1)
    bn.lwz r11, 0x20(r1)
    bn.lwz r10, 0x24(r1)
    bn.lwz r9, 0x28(r1)
    bn.addi r1, r1, 0x2c
    bg.j 0x20a02c
loc_20a8fa:
    bn.lbz r7, 0x53(r17)
    bg.beqi r7, 0x0, loc_20a993
    bg.lbz r7, 0x5210(r15)
    bg.beqi r7, 0x0, loc_20aa5a
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x94
    bt.add r3, r7
    bn.lh r4, 0x2(r17)
    bg.jal 0x23e58a
    bg.lbz r7, 0x5210(r15)
    bg.beqi r7, 0x0, loc_20aa71
loc_20a920:
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x96
    bn.add r3, r12, r7
    bn.lh r4, 0x2(r13)
    bg.jal 0x23e58a
    bg.lbz r7, 0x5210(r15)
    bg.beqi r7, 0x0, loc_20aa89
loc_20a938:
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x98
    bn.add r3, r12, r7
    bn.lh r4, 0x2(r13)
    bg.jal 0x23e58a
    bt.j loc_20a826
loc_20a94a:
    bg.lbz r7, 0x5210(r15)
    bg.beqi r7, 0x0, loc_20aa18
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x8e
    bt.add r3, r7
    bn.lh r4, 0x4c(r16)
    bg.jal 0x23e58a
    bg.lbz r7, 0x5210(r15)
    bg.beqi r7, 0x0, loc_20aa2f
loc_20a969:
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x90
    bn.add r3, r12, r7
    bn.lh r4, 0x4e(r13)
    bg.jal 0x23e58a
    bg.lbz r7, 0x5210(r15)
    bg.beqi r7, 0x0, loc_20aa47
loc_20a981:
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x92
    bn.add r3, r12, r7
    bn.lh r4, 0x50(r13)
    bg.jal 0x23e58a
    bt.j loc_20a826
loc_20a993:
    bg.lbz r7, 0x5210(r15)
    bn.beqi r7, 0x0, loc_20a9d9
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x94
    bt.add r3, r7
    bn.lh r4, 0x4c(r17)
    bg.jal 0x23e58a
    bg.lbz r7, 0x5210(r15)
    bn.beqi r7, 0x0, loc_20a9ef
loc_20a9b0:
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x96
    bn.add r3, r12, r7
    bn.lh r4, 0x4e(r13)
    bg.jal 0x23e58a
    bg.lbz r7, 0x5210(r15)
    bn.beqi r7, 0x0, loc_20aa06
loc_20a9c7:
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x98
    bn.add r3, r12, r7
    bn.lh r4, 0x50(r13)
    bg.jal 0x23e58a
    bt.j loc_20a826
loc_20a9d9:
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x94
    bt.add r3, r7
    bn.lh r4, 0x4c(r17)
    bg.jal 0x23dfb6
    bg.lbz r7, 0x5210(r15)
    bn.bnei r7, 0x0, loc_20a9b0
loc_20a9ef:
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x96
    bn.add r3, r12, r7
    bn.lh r4, 0x4e(r13)
    bg.jal 0x23dfb6
    bg.lbz r7, 0x5210(r15)
    bn.bnei r7, 0x0, loc_20a9c7
loc_20aa06:
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x98
    bn.add r3, r12, r7
    bn.lh r4, 0x50(r13)
    bg.jal 0x23dfb6
    bt.j loc_20a826
loc_20aa18:
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x8e
    bt.add r3, r7
    bn.lh r4, 0x4c(r16)
    bg.jal 0x23dfb6
    bg.lbz r7, 0x5210(r15)
    bg.bnei r7, 0x0, loc_20a969
loc_20aa2f:
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x90
    bn.add r3, r12, r7
    bn.lh r4, 0x4e(r13)
    bg.jal 0x23dfb6
    bg.lbz r7, 0x5210(r15)
    bg.bnei r7, 0x0, loc_20a981
loc_20aa47:
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x92
    bn.add r3, r12, r7
    bn.lh r4, 0x50(r13)
    bg.jal 0x23dfb6
    bn.j loc_20a826
loc_20aa5a:
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x94
    bt.add r3, r7
    bn.lh r4, 0x2(r17)
    bg.jal 0x23dfb6
    bg.lbz r7, 0x5210(r15)
    bg.bnei r7, 0x0, loc_20a920
loc_20aa71:
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x96
    bn.add r3, r12, r7
    bn.lh r4, 0x2(r13)
    bg.jal 0x23dfb6
    bg.lbz r7, 0x5210(r15)
    bg.bnei r7, 0x0, loc_20a938
loc_20aa89:
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x98
    bn.add r3, r12, r7
    bn.lh r4, 0x2(r13)
    bg.jal 0x23dfb6
    bn.j loc_20a826
loc_20aa9c:
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x8e
    bt.add r3, r7
    bn.lh r4, 0x2(r16)
    bg.jal 0x23dfb6
    bg.lbz r7, 0x5210(r15)
    bg.bnei r7, 0x0, loc_20a86f
loc_20aab3:
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x90
    bn.add r3, r12, r7
    bn.lh r4, 0x2(r13)
    bg.jal 0x23dfb6
    bg.lbz r7, 0x5210(r15)
    bg.bnei r7, 0x0, loc_20a887
loc_20aacb:
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x92
    bn.add r3, r12, r7
    bn.lh r4, 0x2(r13)
    bg.jal 0x23dfb6
    bn.j loc_20a826
