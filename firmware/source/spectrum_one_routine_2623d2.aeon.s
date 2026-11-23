# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2623d2,0x2624df); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x28
    bn.sw 0x24(r1), r9
    bn.sw 0x20(r1), r10
    bn.sw 0x1c(r1), r11
    bn.sw 0x18(r1), r12
    bn.sw 0x14(r1), r13
    bn.sw 0x10(r1), r14
    bt.mov r10, r3
    bn.sw 0x0(r1), r5
    bn.sw 0x4(r1), r6
    bn.lh r11, 0x6(r1)
    bn.lh r12, 0x4(r1)
    bn.lh r13, 0x2(r1)
    bn.lh r14, 0x0(r1)
    bg.movhi r6, 0x48
    bg.lbz r7, 0x21ec(r6)
    bn.sfeqi r7, 0x0
    bn.cmovsi_2 r5, r0, 0x1
    bg.addi r6, r6, 0x21ec
    bg.lbz r7, 0xa8(r6)
    bn.beqi r7, 0x0, loc_26241a
    bn.addi r7, r5, 0x1
    bn.extbz r5, r7
loc_26241a:
    bg.lbz r7, 0x150(r6)
    bn.beqi r7, 0x0, loc_262427
    bn.addi r7, r5, 0x1
    bn.extbz r5, r7
loc_262427:
    bg.lbz r6, 0x1f8(r6)
    bn.beqi r6, 0x0, loc_262434
    bn.addi r7, r5, 0x1
    bn.extbz r5, r7
loc_262434:
    bg.movhi r7, 0x3b
    bg.lwz r7, 0x5f38(r7)
    bn.lbz r7, 0x59(r7)
    bg.bnei r7, 0x0, loc_2624d7
    bt.movi r3, 0x0
    bn.beqi r5, 0x1, loc_26244a
loc_262448:
    bt.movi r3, 0x2
loc_26244a:
    bg.jal 0x254212
    bt.mov r3, r10
    bt.movi r4, 0x0
    bg.jal 0x253d95
    bt.mov r3, r10
    bt.movi r4, 0x0
    bg.jal 0x253da4
    bn.sh_2 0x6(r1), r11
    bn.sh_1 0x4(r1), r12
    bn.sh_2 0x2(r1), r13
    bn.sh_1 0x0(r1), r14
    bt.mov r3, r10
    bn.lwz r4, 0x0(r1)
    bn.lwz r5, 0x4(r1)
    bt.movi r6, 0x0
    bg.jal 0x25469c
    bn.addi r11, r1, 0xf
    bt.mov r3, r10
    bt.mov r4, r11
    bn.addi r5, r1, 0xe
    bn.addi r6, r1, 0xc
    bg.jal 0x2540bb
    bg.movhi r7, 0x45
    bg.lbz r7, 0x51e1(r7)
    bn.beqi r7, 0x0, loc_2624a5
    bg.movhi r7, 0x48
    bg.lwz r7, 0x24a0(r7)
    bn.beqi r7, 0x0, loc_2624a5
    bt.mov r3, r10
    bt.mov r4, r11
    bt.jalr r7
loc_2624a5:
    bt.mov r3, r10
    bn.lbz r4, 0xf(r1)
    bg.jal 0x23e6dc
    bt.mov r3, r10
    bn.lbz r4, 0xe(r1)
    bn.lh r5, 0xc(r1)
    bg.jal 0x23e6f1
    bt.mov r3, r10
    bg.jal 0x260c02
    bn.lwz r14, 0x10(r1)
    bn.lwz r13, 0x14(r1)
    bn.lwz r12, 0x18(r1)
    bn.lwz r11, 0x1c(r1)
    bn.lwz r10, 0x20(r1)
    bn.lwz r9, 0x24(r1)
    bn.addi r1, r1, 0x28
    bt.jr r9
loc_2624d7:
    bt.movi r3, 0x1
    bg.bnei r7, 0x1, loc_262448
    bt.j loc_26244a
