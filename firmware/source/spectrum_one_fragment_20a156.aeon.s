# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20a156,0x20a329); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x58
    bn.sw 0x54(r1), r9
    bn.sw 0x50(r1), r10
    bn.sw 0x4c(r1), r11
    bn.sw 0x48(r1), r12
    bt.mov r11, r3
    bn.ori r7, r0, 0x58
    bn.muls r3, r3, r7
    bg.movhi r5, 0x45
    bg.addi r5, r5, 0x3fc4
    bn.add r6, r3, r5
    bn.lwz r7, 0x44(r6)
    bn.andi r7, r7, 0x1
    bg.movhi r5, 0x45
    bg.addi r5, r5, 0x3fd2
    bn.add r4, r3, r5
    bg.bnei r7, 0x0, loc_20a2de
loc_20a18d:
    bn.ori r7, r0, 0x58
    bn.muls r12, r11, r7
    bg.movhi r5, 0x45
    bg.addi r5, r5, 0x3fc4
    bt.add r12, r5
    bn.lwz r6, 0x3c(r12)
    bn.beqi r6, 0x0, loc_20a21d
    bn.lh r7, 0x0(r6)
    bn.sh_2 0x36(r1), r7
    bn.lh r7, 0x2(r6)
    bn.sh_1 0x38(r1), r7
    bn.lh r7, 0x4(r6)
    bn.sh_2 0x3a(r1), r7
    bn.lh r7, 0x6(r6)
    bn.sh_1 0x3c(r1), r7
    bn.lh r7, 0x8(r6)
    bn.sh_2 0x3e(r1), r7
    bn.lh r7, 0xa(r6)
    bn.sh_1 0x40(r1), r7
    bn.lh r7, 0xc(r6)
    bn.sh_2 0x42(r1), r7
    bn.lh r7, 0xe(r6)
    bn.sh_1 0x44(r1), r7
    bn.lh r7, 0x10(r6)
    bn.sh_2 0x46(r1), r7
    bn.lh r7, 0x0(r4)
    bn.sh_1 0x24(r1), r7
    bn.lh r7, 0x2(r4)
    bn.sh_2 0x26(r1), r7
    bn.lh r7, 0x4(r4)
    bn.sh_1 0x28(r1), r7
    bn.lh r7, 0x6(r4)
    bn.sh_2 0x2a(r1), r7
    bn.lh r7, 0x8(r4)
    bn.sh_1 0x2c(r1), r7
    bn.lh r7, 0xa(r4)
    bn.sh_2 0x2e(r1), r7
    bn.lh r7, 0xc(r4)
    bn.sh_1 0x30(r1), r7
    bn.lh r7, 0xe(r4)
    bn.sh_2 0x32(r1), r7
    bn.lh r7, 0x10(r4)
    bn.sh_1 0x34(r1), r7
    bn.addi r3, r1, 0x36
    bn.addi r4, r1, 0x24
    bt.mov r5, r1
    bg.jal 0x2095f8
    bt.mov r4, r1
loc_20a21d:
    bn.lwz r6, 0x34(r12)
    bn.beqi r6, 0x0, loc_20a29d
    bn.lh r7, 0x0(r6)
    bn.sh_2 0x36(r1), r7
    bn.lh r7, 0x2(r6)
    bn.sh_1 0x38(r1), r7
    bn.lh r7, 0x4(r6)
    bn.sh_2 0x3a(r1), r7
    bn.lh r7, 0x6(r6)
    bn.sh_1 0x3c(r1), r7
    bn.lh r7, 0x8(r6)
    bn.sh_2 0x3e(r1), r7
    bn.lh r7, 0xa(r6)
    bn.sh_1 0x40(r1), r7
    bn.lh r7, 0xc(r6)
    bn.sh_2 0x42(r1), r7
    bn.lh r7, 0xe(r6)
    bn.sh_1 0x44(r1), r7
    bn.lh r7, 0x10(r6)
    bn.sh_2 0x46(r1), r7
    bn.lh r7, 0x0(r4)
    bn.sh_1 0x24(r1), r7
    bn.lh r7, 0x2(r4)
    bn.sh_2 0x26(r1), r7
    bn.lh r7, 0x4(r4)
    bn.sh_1 0x28(r1), r7
    bn.lh r7, 0x6(r4)
    bn.sh_2 0x2a(r1), r7
    bn.lh r7, 0x8(r4)
    bn.sh_1 0x2c(r1), r7
    bn.lh r7, 0xa(r4)
    bn.sh_2 0x2e(r1), r7
    bn.lh r7, 0xc(r4)
    bn.sh_1 0x30(r1), r7
    bn.lh r7, 0xe(r4)
    bn.sh_2 0x32(r1), r7
    bn.lh r7, 0x10(r4)
    bn.sh_1 0x34(r1), r7
    bn.addi r3, r1, 0x36
    bn.addi r4, r1, 0x24
    bt.mov r5, r1
    bg.jal 0x2095f8
    bt.mov r4, r1
loc_20a29d:
    bt.mov r3, r11
    bg.jal 0x209920
    bt.mov r3, r11
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x20a0b9
    bn.lbz r12, 0x52(r12)
    bn.beqi r12, 0x0, loc_20a2d4
    bt.mov r3, r11
    bt.movi r4, 0x1
    bg.jal 0x209ccb
loc_20a2bb:
    bt.mov r3, r11
    bt.movi r4, 0x1
    bg.jal 0x209deb
    bn.lwz r12, 0x48(r1)
    bn.lwz r11, 0x4c(r1)
    bn.lwz r10, 0x50(r1)
    bn.lwz r9, 0x54(r1)
    bn.addi r1, r1, 0x58
    bt.jr r9
loc_20a2d4:
    bt.mov r3, r11
    bt.movi r4, 0x1
    bg.jal 0x20a02c
    bt.j loc_20a2bb
loc_20a2de:
    bn.lwz r6, 0x40(r6)
    bn.lh r7, 0x0(r6)
    bn.sh_2 0x36(r1), r7
    bn.lh r7, 0x2(r6)
    bn.sh_1 0x38(r1), r7
    bn.lh r7, 0x4(r6)
    bn.sh_2 0x3a(r1), r7
    bn.lh r7, 0x6(r6)
    bn.sh_1 0x3c(r1), r7
    bn.lh r7, 0x8(r6)
    bn.sh_2 0x3e(r1), r7
    bn.lh r7, 0xa(r6)
    bn.sh_1 0x40(r1), r7
    bn.lh r7, 0xc(r6)
    bn.sh_2 0x42(r1), r7
    bn.lh r7, 0xe(r6)
    bn.sh_1 0x44(r1), r7
    bn.lh r7, 0x10(r6)
    bn.sh_2 0x46(r1), r7
    bn.addi r10, r1, 0x12
    bt.mov r3, r4
    bn.addi r4, r1, 0x36
    bt.mov r5, r10
    bg.jal 0x2095f8
    bt.mov r4, r10
    bt.j loc_20a18d
