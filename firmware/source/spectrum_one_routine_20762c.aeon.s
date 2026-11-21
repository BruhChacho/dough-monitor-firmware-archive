# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20762c,0x20773b); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x20
    bn.sw 0x1c(r1), r9
    bn.sw 0x18(r1), r10
    bn.sw 0x14(r1), r11
    bn.sw 0x10(r1), r12
    bn.sw 0xc(r1), r13
    bn.sw 0x8(r1), r14
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r3, r5
    bn.lh r11, 0x2a(r3)
    bn.sbz 0x7(r1), r0
    bg.beqi r11, 0x0, loc_207724
    bt.movi r13, 0x0
    bt.j loc_2076a9
loc_20765f:
    bg.movhi r7, 0x5580
    bn.ori r7, r7, 0x20
    bn.add r3, r10, r7
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bg.movhi r5, 0x5580
    bn.ori r5, r5, 0x22
    bn.add r3, r10, r5
    bn.srli r4, r12, 0x3
    bg.jal 0x23dfb6
    bg.movhi r7, 0x5580
    bn.ori r7, r7, 0x24
    bn.add r3, r10, r7
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bg.movhi r5, 0x5580
    bn.ori r5, r5, 0x26
    bn.add r3, r10, r5
    bn.srli r4, r14, 0x3
    bg.jal 0x23dfb6
loc_2076a1:
    bn.srli r11, r11, 0x1
    bt.addi r13, 0x1
    bn.beqi r11, 0x0, loc_207724
loc_2076a9:
    bn.extbz r6, r13
    bn.ori r7, r0, 0x7c
    bn.muls r7, r6, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lwz r10, 0x4(r7)
    bn.lh r14, 0x50(r7)
    bn.lh r12, 0x52(r7)
    bn.andi r7, r11, 0x1
    bn.beqi r7, 0x0, loc_2076a1
    bn.lbz r7, 0x7(r1)
    bn.extbz r7, r7
    bn.sbz 0x7(r1), r7
    bn.andi r7, r6, 0x1
    bn.bnei r7, 0x0, loc_20765f
    bg.movhi r7, 0x9a80
    bn.ori r7, r7, 0x20
    bn.add r3, r10, r7
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bg.movhi r5, 0x9a80
    bn.ori r5, r5, 0x22
    bn.add r3, r10, r5
    bn.srli r4, r12, 0x3
    bg.jal 0x23dfb6
    bg.movhi r7, 0x9a80
    bn.ori r7, r7, 0x24
    bn.add r3, r10, r7
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bg.movhi r5, 0x9a80
    bn.ori r5, r5, 0x26
    bn.add r3, r10, r5
    bn.srli r4, r14, 0x3
    bg.jal 0x23dfb6
    bn.srli r11, r11, 0x1
    bt.addi r13, 0x1
    bn.bnei r11, 0x0, loc_2076a9
loc_207724:
    bn.lwz r14, 0x8(r1)
    bn.lwz r13, 0xc(r1)
    bn.lwz r12, 0x10(r1)
    bn.lwz r11, 0x14(r1)
    bn.lwz r10, 0x18(r1)
    bn.lwz r9, 0x1c(r1)
    bn.addi r1, r1, 0x20
    bt.jr r9
