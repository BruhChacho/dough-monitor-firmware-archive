# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x260673,0x260824); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x18
    bn.sw 0x14(r1), r9
    bn.sw 0x10(r1), r10
    bn.sw 0xc(r1), r11
    bn.sw 0x8(r1), r12
    bn.sw 0x4(r1), r13
    bn.sw 0x0(r1), r14
    bt.mov r13, r3
    bg.jal 0x2227da
    bn.ori r11, r0, 0xb0
    bn.muls r3, r3, r11
    bg.movhi r4, 0x3b
    bg.addi r4, r4, 0x4950
    bt.add r3, r4
    bt.movi r10, 0x1
    bn.lh r3, 0x26(r3)
    bg.bnei r3, 0x0, loc_260775
loc_2606a7:
    bg.movhi r7, 0x48
    bg.addi r12, r7, -0x564
    bn.ori r11, r0, 0xb0
    bg.lbz r5, 0x99(r12)
    bn.muls r7, r11, r5
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bn.lbz r7, 0x20(r7)
    bn.andi r7, r7, 0x10
    bn.beqi r7, 0x0, loc_2606d2
    bn.slli r7, r10, 0x1
    bn.exthz r10, r7
loc_2606d2:
    bt.mov r3, r10
    bg.jal 0x265e53
    bn.bnei r3, 0x0, loc_2606ef
    bg.movhi r7, 0x3b
    bg.lwz r6, 0x5f38(r7)
    bg.movhi r7, 0x45
    bg.lbz r7, 0x5229(r7)
    bg.sbz 0xa8(r6), r7
loc_2606ef:
    bg.lbz r12, 0x99(r12)
    bn.muls r7, r11, r12
    bg.movhi r4, 0x3b
    bg.addi r4, r4, 0x4950
    bt.add r7, r4
    bn.lbz r7, 0x20(r7)
    bn.andi r7, r7, 0x10
    bn.bnei r7, 0x0, loc_260717
    bg.movhi r7, 0x3b
    bg.lwz r6, 0x5f38(r7)
    bn.lbz r5, 0x59(r6)
    bn.beqi r5, 0x0, loc_260734
loc_260717:
    bt.mov r3, r13
    bt.movi r4, 0x0
loc_26071b:
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bg.j 0x23e709
loc_260734:
    bn.bnei r3, 0x0, loc_260717
    bn.lbz r7, 0x5a(r6)
    bt.add r7, r6
    bn.lbz r7, 0x5b(r7)
    bn.muls r7, r11, r7
    bg.movhi r4, 0x3b
    bg.addi r4, r4, 0x4950
    bt.add r7, r4
    bg.lbz r5, 0x8a(r7)
    bn.bnei r5, 0x0, loc_2607c6
    bg.lbz r4, 0x8b(r7)
    bn.bnei r4, 0x0, loc_2607c6
loc_26075a:
    bg.lbz r6, 0xa8(r6)
    bn.bnei r6, 0x0, loc_260768
    bg.sfleui r10, 0x4af
    bn.bf loc_260717
loc_260768:
    bg.sfgti r10, 0x1df
    bn.bnf loc_260717
loc_26076f:
    bt.mov r3, r13
    bt.movi r4, 0x1
    bt.j loc_26071b
loc_260775:
    bt.mov r3, r13
    bg.jal 0x2227da
    bn.muls r3, r3, r11
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r3, r5
    bg.ori r14, r0, 0x3e8
    bn.lh r3, 0x22(r3)
    bn.bnei r3, 0x0, loc_2607e1
loc_260792:
    bt.mov r3, r13
    bg.jal 0x2227da
    bn.ori r12, r0, 0xb0
    bn.muls r3, r3, r12
    bg.movhi r11, 0x3b
    bg.addi r11, r11, 0x4950
    bt.add r3, r11
    bn.lh r10, 0x26(r3)
    bn.srli r10, r10, 0x1
    bt.add r10, r14
    bt.mov r3, r13
    bg.jal 0x2227da
    bn.muls r3, r3, r12
    bt.add r3, r11
    bn.lh r7, 0x26(r3)
    bn.divu r10, r10, r7
    bn.exthz r10, r10
    bt.j loc_2606a7
loc_2607c6:
    bn.lwz r4, 0x4(r7)
    bn.andi r7, r4, 0x8
    bn.bnei r7, 0x0, loc_2607d8
    bn.beqi r5, 0x0, loc_26075a
    bn.andi r7, r4, 0x20
    bn.beqi r7, 0x0, loc_26075a
loc_2607d8:
    bg.sfleui r10, 0x1db
    bn.bf loc_26075a
    bt.j loc_26076f
loc_2607e1:
    bt.mov r3, r13
    bg.jal 0x2227da
    bn.muls r3, r3, r11
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r3, r6
    bn.lh r10, 0x22(r3)
    bn.srli r10, r10, 0x1
    bt.movhi r7, 0x1
    bg.ori r7, r7, 0xd4c0
    bt.add r10, r7
    bt.mov r3, r13
    bg.jal 0x2227da
    bn.muls r3, r3, r11
    bg.movhi r4, 0x3b
    bg.addi r4, r4, 0x4950
    bt.add r3, r4
    bn.lh r7, 0x22(r3)
    bn.divu r10, r10, r7
    bg.ori r7, r0, 0x3e8
    bn.muls r14, r10, r7
    bt.j loc_260792
