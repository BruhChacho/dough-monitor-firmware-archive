# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27e66d,0x27e866); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r11, r3
    bt.mov r10, r6
    bt.mov r3, r4
    bt.mov r4, r5
    bg.jal 0x27d956
    bg.beqi r3, 0x0, loc_27e795
    bg.movhi r4, 0x45
    bn.lbz r7, 0x0(r10)
    bg.sbz 0x7fc8(r4), r7
    bg.addi r5, r4, 0x7fc8
    bn.lbz r7, 0x1(r10)
    bn.sbz 0x1(r5), r7
    bn.lbz r7, 0x2(r10)
    bn.sbz 0x3(r5), r7
    bn.lbz r7, 0x3(r10)
    bn.sbz 0x4(r5), r7
    bn.lbz r7, 0x5(r10)
    bn.slli r7, r7, 0x8
    bn.lbz r6, 0x4(r10)
    bt.add r7, r6
    bn.sh_2 0x6(r5), r7
    bn.lbz r7, 0x7(r10)
    bn.slli r7, r7, 0x8
    bn.lbz r6, 0x6(r10)
    bt.add r7, r6
    bn.sh_1 0x8(r5), r7
    bn.lbz r7, 0x9(r10)
    bn.slli r7, r7, 0x8
    bn.lbz r6, 0x8(r10)
    bt.add r7, r6
    bn.sh_2 0xa(r5), r7
    bn.lbz r7, 0xb(r10)
    bn.slli r7, r7, 0x8
    bn.lbz r6, 0xa(r10)
    bt.add r7, r6
    bn.sh_1 0xc(r5), r7
    bn.lbz r7, 0xd(r10)
    bn.slli r7, r7, 0x8
    bn.lbz r6, 0xc(r10)
    bt.add r7, r6
    bn.sh_2 0xe(r5), r7
    bn.lbz r7, 0xf(r10)
    bn.slli r7, r7, 0x8
    bn.lbz r6, 0xe(r10)
    bt.add r7, r6
    bn.sh_1 0x10(r5), r7
    bn.lbz r7, 0x11(r10)
    bn.slli r7, r7, 0x8
    bn.lbz r6, 0x10(r10)
    bt.add r7, r6
    bn.sh_2 0x12(r5), r7
    bn.lbz r7, 0x13(r10)
    bn.slli r7, r7, 0x8
    bn.lbz r6, 0x12(r10)
    bt.add r7, r6
    bn.sh_1 0x14(r5), r7
    bn.lbz r7, 0x15(r10)
    bn.slli r7, r7, 0x8
    bn.lbz r6, 0x14(r10)
    bt.add r7, r6
    bn.sh_2 0x16(r5), r7
    bn.lbz r7, 0x17(r10)
    bn.slli r7, r7, 0x8
    bn.lbz r6, 0x16(r10)
    bt.add r7, r6
    bn.sh_1 0x18(r5), r7
    bn.lbz r7, 0x19(r10)
    bn.slli r7, r7, 0x8
    bn.lbz r6, 0x18(r10)
    bt.add r7, r6
    bn.sh_2 0x1a(r5), r7
    bn.lbz r7, 0x1b(r10)
    bn.slli r7, r7, 0x8
    bn.lbz r6, 0x1a(r10)
    bt.add r7, r6
    bn.sh_1 0x1c(r5), r7
loc_27e751:
    bg.lwz r7, 0x7fc8(r4)
    bn.sw 0x0(r11), r7
    bg.addi r6, r4, 0x7fc8
    bn.lwz r7, 0x4(r6)
    bn.sw 0x4(r11), r7
    bn.lwz r7, 0x8(r6)
    bn.sw 0x8(r11), r7
    bn.lwz r7, 0xc(r6)
    bn.sw 0xc(r11), r7
    bn.lwz r7, 0x10(r6)
    bn.sw 0x10(r11), r7
    bn.lwz r7, 0x14(r6)
    bn.sw 0x14(r11), r7
    bn.lwz r7, 0x18(r6)
    bn.sw 0x18(r11), r7
    bn.lwz r7, 0x1c(r6)
    bn.sw 0x1c(r11), r7
    bt.mov r3, r11
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_27e795:
    bg.movhi r4, 0x45
    bn.lbz r7, 0x0(r10)
    bg.sbz 0x7fc8(r4), r7
    bg.addi r5, r4, 0x7fc8
    bn.lbz r7, 0x1(r10)
    bn.sbz 0x1(r5), r7
    bn.lbz r7, 0x2(r10)
    bn.sbz 0x2(r5), r7
    bn.lbz r7, 0x3(r10)
    bn.sbz 0x3(r5), r7
    bn.lbz r7, 0x4(r10)
    bn.sbz 0x4(r5), r7
    bn.lbz r7, 0x6(r10)
    bn.slli r7, r7, 0x8
    bn.lbz r6, 0x5(r10)
    bt.add r7, r6
    bn.sh_2 0x6(r5), r7
    bn.lbz r7, 0x8(r10)
    bn.slli r7, r7, 0x8
    bn.lbz r6, 0x7(r10)
    bt.add r7, r6
    bn.sh_1 0x8(r5), r7
    bn.lbz r7, 0xa(r10)
    bn.slli r7, r7, 0x8
    bn.lbz r6, 0x9(r10)
    bt.add r7, r6
    bn.sh_2 0xa(r5), r7
    bn.lbz r7, 0xc(r10)
    bn.slli r7, r7, 0x8
    bn.lbz r6, 0xb(r10)
    bt.add r7, r6
    bn.sh_1 0xc(r5), r7
    bn.lbz r7, 0xe(r10)
    bn.slli r7, r7, 0x8
    bn.lbz r6, 0xd(r10)
    bt.add r7, r6
    bn.sh_2 0xe(r5), r7
    bn.lbz r7, 0x10(r10)
    bn.slli r7, r7, 0x8
    bn.lbz r6, 0xf(r10)
    bt.add r7, r6
    bn.sh_1 0x10(r5), r7
    bn.lbz r7, 0x12(r10)
    bn.slli r7, r7, 0x8
    bn.lbz r6, 0x11(r10)
    bt.add r7, r6
    bn.sh_2 0x12(r5), r7
    bn.lbz r7, 0x14(r10)
    bn.slli r7, r7, 0x8
    bn.lbz r6, 0x13(r10)
    bt.add r7, r6
    bn.sh_1 0x14(r5), r7
    bn.lbz r7, 0x16(r10)
    bn.slli r7, r7, 0x8
    bn.lbz r6, 0x15(r10)
    bt.add r7, r6
    bn.sh_2 0x16(r5), r7
    bn.lbz r7, 0x18(r10)
    bn.slli r7, r7, 0x8
    bn.lbz r6, 0x17(r10)
    bt.add r7, r6
    bn.sh_1 0x18(r5), r7
    bn.lbz r7, 0x1a(r10)
    bn.slli r7, r7, 0x8
    bn.lbz r6, 0x19(r10)
    bt.add r7, r6
    bn.sh_2 0x1a(r5), r7
    bn.lbz r7, 0x1c(r10)
    bn.slli r7, r7, 0x8
    bn.lbz r6, 0x1b(r10)
    bt.add r7, r6
    bn.sh_1 0x1c(r5), r7
    bt.j loc_27e751
