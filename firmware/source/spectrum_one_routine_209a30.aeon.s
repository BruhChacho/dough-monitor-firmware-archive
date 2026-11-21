# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x209a30,0x209b99); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bn.sw 0x14(r1), r10
    bn.sw 0x10(r1), r11
    bn.sw 0xc(r1), r12
    bn.sw 0x8(r1), r13
    bn.sw 0x4(r1), r14
    bn.sw 0x0(r1), r15
    bt.mov r10, r3
    bt.movi r3, 0x0
    bg.jal 0x222b8a
    bt.mov r3, r10
    bg.jal 0x23e79e
    bt.mov r11, r3
    bn.ori r7, r0, 0x58
    bn.muls r10, r10, r7
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x3fc4
    bt.add r10, r7
    bg.addi r7, r0, 0x400
    bn.sh_2 0x2(r10), r7
    bn.sh_2 0x46(r10), r7
    bn.sh_1 0x48(r10), r7
    bn.sh_2 0x4a(r10), r7
    bn.beqi r3, 0x0, loc_209ae6
    bt.movi r13, 0x0
    bt.mov r14, r10
    bt.mov r15, r10
    bt.j loc_209a8e
loc_209a83:
    bn.srli r7, r11, 0x1
    bn.exthz r11, r7
    bt.addi r13, 0x1
    bn.beqi r11, 0x0, loc_209ae6
loc_209a8e:
    bn.extbz r10, r13
    bn.andi r7, r11, 0x1
    bn.beqi r7, 0x0, loc_209a83
    bt.mov r3, r10
    bg.jal 0x222b8a
    bt.mov r12, r3
    bn.andi r7, r10, 0x1
    bn.beqi r7, 0x0, loc_209b00
    bn.lbz r7, 0x54(r15)
    bg.bnei r7, 0x0, loc_209b37
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x6c
    bt.add r3, r7
    bn.lh r4, 0x46(r15)
    bg.jal 0x23dfb6
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x6e
    bn.add r3, r12, r7
    bn.lh r4, 0x48(r15)
    bg.jal 0x23dfb6
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x70
    bn.add r3, r12, r7
    bn.lh r4, 0x4a(r15)
    bg.jal 0x23dfb6
    bn.srli r7, r11, 0x1
    bn.exthz r11, r7
    bt.addi r13, 0x1
    bn.bnei r11, 0x0, loc_209a8e
loc_209ae6:
    bn.lwz r15, 0x0(r1)
    bn.lwz r14, 0x4(r1)
    bn.lwz r13, 0x8(r1)
    bn.lwz r12, 0xc(r1)
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
loc_209b00:
    bn.lbz r7, 0x54(r14)
    bn.bnei r7, 0x0, loc_209b68
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x72
    bt.add r3, r7
    bn.lh r4, 0x46(r14)
    bg.jal 0x23dfb6
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x74
    bn.add r3, r12, r7
    bn.lh r4, 0x48(r14)
    bg.jal 0x23dfb6
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x76
    bn.add r3, r12, r7
    bn.lh r4, 0x4a(r14)
    bg.jal 0x23dfb6
    bt.j loc_209a83
loc_209b37:
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x9a
    bt.add r3, r7
    bn.lh r4, 0x46(r15)
    bg.jal 0x23dfb6
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x9c
    bn.add r3, r12, r7
    bn.lh r4, 0x48(r15)
    bg.jal 0x23dfb6
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0x9e
    bn.add r3, r12, r7
    bn.lh r4, 0x4a(r15)
    bg.jal 0x23dfb6
    bt.j loc_209a83
loc_209b68:
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0xa0
    bt.add r3, r7
    bn.lh r4, 0x46(r14)
    bg.jal 0x23dfb6
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0xa2
    bn.add r3, r12, r7
    bn.lh r4, 0x48(r14)
    bg.jal 0x23dfb6
    bn.movhi_2 r7, 0xf80
    bn.ori r7, r7, 0xa4
    bn.add r3, r12, r7
    bn.lh r4, 0x4a(r14)
    bg.jal 0x23dfb6
    bt.j loc_209a83
