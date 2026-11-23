# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20a329,0x20a473); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x50
    bn.sw 0x4c(r1), r9
    bn.sw 0x48(r1), r10
    bn.sw 0x44(r1), r11
    bn.sw 0x40(r1), r12
    bn.sw 0x3c(r1), r13
    bn.sw 0x38(r1), r14
    bt.mov r11, r3
    bn.addi r14, r1, 0x26
    bn.ori r7, r0, 0x58
    bn.muls r12, r3, r7
    bg.movhi r6, 0x45
    bg.addi r6, r6, 0x3fc4
    bn.add r10, r12, r6
    bn.lwz r6, 0x40(r10)
    bn.lh r7, 0x0(r6)
    bn.sh_2 0x26(r1), r7
    bn.lh r7, 0x2(r6)
    bn.sh_1 0x28(r1), r7
    bn.lh r7, 0x4(r6)
    bn.sh_2 0x2a(r1), r7
    bn.lh r7, 0x6(r6)
    bn.sh_1 0x2c(r1), r7
    bn.lh r7, 0x8(r6)
    bn.sh_2 0x2e(r1), r7
    bn.lh r7, 0xa(r6)
    bn.sh_1 0x30(r1), r7
    bn.lh r7, 0xc(r6)
    bn.sh_2 0x32(r1), r7
    bn.lh r7, 0xe(r6)
    bn.sh_1 0x34(r1), r7
    bn.lh r7, 0x10(r6)
    bn.sh_2 0x36(r1), r7
    bn.addi r13, r1, 0x14
    bt.mov r3, r14
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x3fe4
    bn.add r4, r12, r7
    bt.mov r5, r13
    bg.jal 0x2095f8
    bn.lwz r6, 0x34(r10)
    bg.beqi r6, 0x0, loc_20a459
    bn.lh r7, 0x0(r6)
    bn.sh_2 0x26(r1), r7
    bn.lh r7, 0x2(r6)
    bn.sh_1 0x28(r1), r7
    bn.lh r7, 0x4(r6)
    bn.sh_2 0x2a(r1), r7
    bn.lh r7, 0x6(r6)
    bn.sh_1 0x2c(r1), r7
    bn.lh r7, 0x8(r6)
    bn.sh_2 0x2e(r1), r7
    bn.lh r7, 0xa(r6)
    bn.sh_1 0x30(r1), r7
    bn.lh r7, 0xc(r6)
    bn.sh_2 0x32(r1), r7
    bn.lh r7, 0xe(r6)
    bn.sh_1 0x34(r1), r7
    bn.lh r7, 0x10(r6)
    bn.sh_2 0x36(r1), r7
    bn.addi r10, r1, 0x2
    bt.mov r3, r14
    bt.mov r4, r13
    bt.mov r5, r10
    bg.jal 0x2095f8
    bg.movhi r6, 0x45
    bg.addi r6, r6, 0x3fd2
    bn.add r3, r12, r6
    bt.mov r4, r10
    bt.mov r5, r13
    bg.jal 0x2095f8
    bt.mov r4, r13
loc_20a402:
    bt.mov r3, r11
    bg.jal 0x209920
    bt.mov r3, r11
    bt.movi r4, 0x1
    bt.movi r5, 0x0
    bg.jal 0x20a0b9
    bn.ori r7, r0, 0x58
    bn.muls r7, r11, r7
    bg.movhi r6, 0x45
    bg.addi r6, r6, 0x3fc4
    bt.add r7, r6
    bn.lbz r7, 0x52(r7)
    bn.beqi r7, 0x0, loc_20a44f
    bt.mov r3, r11
    bt.movi r4, 0x1
    bg.jal 0x209ccb
loc_20a430:
    bt.mov r3, r11
    bt.movi r4, 0x1
    bg.jal 0x209deb
    bn.lwz r14, 0x38(r1)
    bn.lwz r13, 0x3c(r1)
    bn.lwz r12, 0x40(r1)
    bn.lwz r11, 0x44(r1)
    bn.lwz r10, 0x48(r1)
    bn.lwz r9, 0x4c(r1)
    bn.addi r1, r1, 0x50
    bt.jr r9
loc_20a44f:
    bt.mov r3, r11
    bt.movi r4, 0x1
    bg.jal 0x20a02c
    bt.j loc_20a430
loc_20a459:
    bn.addi r10, r1, 0x2
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x3fd2
    bn.add r3, r12, r7
    bt.mov r4, r13
    bt.mov r5, r10
    bg.jal 0x2095f8
    bt.mov r4, r10
    bt.j loc_20a402
