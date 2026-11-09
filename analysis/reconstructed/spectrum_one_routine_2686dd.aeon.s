# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2686dd,0x2688e9); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bn.sw 0x14(r1), r10
    bn.sw 0x10(r1), r11
    bn.sw 0xc(r1), r12
    bn.sw 0x8(r1), r13
    bn.sw 0x4(r1), r14
    bn.sw 0x0(r1), r15
    bt.movi r3, 0x0
    bg.jal 0x2250c5
    bn.extbz r3, r3
    bg.jal 0x21e86c
    bg.sfgti r3, 0x31f
    bn.bf loc_26871d
    bt.movi r3, 0x0
    bg.jal 0x2250c5
    bn.extbz r3, r3
    bg.jal 0x21e67e
    bg.sfleui r3, 0x257
    bn.bf loc_268767
loc_26871d:
    bt.movi r3, 0x0
    bg.jal 0x2227da
    bn.ori r11, r0, 0xb0
    bn.muls r3, r3, r11
    bg.movhi r14, 0x3b
    bg.addi r7, r14, 0x4950
    bt.add r3, r7
    bt.movi r10, 0x0
    bn.lh r3, 0x26(r3)
    bg.bnei r3, 0x0, loc_2687dd
loc_26873c:
    bt.movi r3, 0x0
    bg.jal 0x2227da
    bn.ori r13, r0, 0xb0
    bn.muls r3, r3, r13
    bg.addi r11, r14, 0x4950
    bt.add r3, r11
    bn.lbz r7, 0x20(r3)
    bn.andi r7, r7, 0x10
    bn.sfeqi r7, 0x0
    bn.ori r7, r0, 0x14
    bn.cmov_1 r7, r10, r7
    bn.muls r7, r10, r7
    bg.sfleui r7, 0x1df
    bn.bnf loc_268783
loc_268767:
    bt.movi r3, 0x0
loc_268769:
    bn.lwz r15, 0x0(r1)
    bn.lwz r14, 0x4(r1)
    bn.lwz r13, 0x8(r1)
    bn.lwz r12, 0xc(r1)
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
loc_268783:
    bt.movi r3, 0x0
    bg.jal 0x2227da
    bn.ori r12, r0, 0xb0
    bn.muls r3, r3, r12
    bt.add r3, r11
    bt.movi r10, 0x0
    bn.lh r3, 0x26(r3)
    bg.bnei r3, 0x0, loc_268865
loc_26879a:
    bt.movi r3, 0x0
    bg.jal 0x2227da
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lbz r7, 0x20(r3)
    bn.andi r7, r7, 0x10
    bn.sfeqi r7, 0x0
    bn.ori r3, r0, 0x14
    bn.cmov_1 r3, r10, r3
    bn.muls r3, r10, r3
    bg.ori r7, r0, 0xfffe
    bn.and r3, r3, r7
    bg.jal 0x265e53
    bn.sfeqi r3, 0x0
    bn.cmovsi_2 r7, r0, 0x1
    bt.movi r6, 0x1
    bn.xor r7, r7, r6
    bn.extbz r3, r7
    bt.j loc_268769
loc_2687dd:
    bt.movi r3, 0x0
    bg.jal 0x2227da
    bn.muls r3, r3, r11
    bg.addi r7, r14, 0x4950
    bt.add r3, r7
    bg.ori r13, r0, 0x3e8
    bn.lh r3, 0x22(r3)
    bn.bnei r3, 0x0, loc_26882a
loc_2687f6:
    bt.movi r3, 0x0
    bg.jal 0x2227da
    bn.ori r12, r0, 0xb0
    bn.muls r3, r3, r12
    bg.addi r11, r14, 0x4950
    bt.add r3, r11
    bn.lh r10, 0x26(r3)
    bn.srli r10, r10, 0x1
    bt.add r10, r13
    bt.movi r3, 0x0
    bg.jal 0x2227da
    bn.muls r3, r3, r12
    bt.add r3, r11
    bn.lh r7, 0x26(r3)
    bn.divu r10, r10, r7
    bt.addi r10, 0x5
    bt.movi r7, 0xa
    bn.divu r10, r10, r7
    bt.j loc_26873c
loc_26882a:
    bt.movi r3, 0x0
    bg.jal 0x2227da
    bn.muls r3, r3, r11
    bg.addi r7, r14, 0x4950
    bt.add r3, r7
    bn.lh r10, 0x22(r3)
    bn.srli r10, r10, 0x1
    bt.movhi r7, 0x1
    bg.ori r7, r7, 0xd4c0
    bt.add r10, r7
    bt.movi r3, 0x0
    bg.jal 0x2227da
    bn.muls r3, r3, r11
    bg.addi r7, r14, 0x4950
    bt.add r3, r7
    bn.lh r7, 0x22(r3)
    bn.divu r10, r10, r7
    bg.ori r7, r0, 0x3e8
    bn.muls r13, r10, r7
    bt.j loc_2687f6
loc_268865:
    bt.movi r3, 0x0
    bg.jal 0x2227da
    bn.muls r3, r3, r12
    bg.movhi r11, 0x3b
    bg.addi r11, r11, 0x4950
    bt.add r3, r11
    bg.ori r15, r0, 0x3e8
    bn.lh r3, 0x22(r3)
    bn.bnei r3, 0x0, loc_2688b6
loc_268882:
    bt.movi r3, 0x0
    bg.jal 0x2227da
    bn.ori r12, r0, 0xb0
    bn.muls r3, r3, r12
    bg.addi r11, r14, 0x4950
    bt.add r3, r11
    bn.lh r10, 0x26(r3)
    bn.srli r10, r10, 0x1
    bt.add r10, r15
    bt.movi r3, 0x0
    bg.jal 0x2227da
    bn.muls r3, r3, r12
    bt.add r3, r11
    bn.lh r7, 0x26(r3)
    bn.divu r10, r10, r7
    bt.addi r10, 0x5
    bt.movi r7, 0xa
    bn.divu r10, r10, r7
    bt.j loc_26879a
loc_2688b6:
    bt.movi r3, 0x0
    bg.jal 0x2227da
    bn.muls r3, r3, r13
    bt.add r3, r11
    bn.lh r10, 0x22(r3)
    bn.srli r10, r10, 0x1
    bt.movhi r7, 0x1
    bg.ori r7, r7, 0xd4c0
    bt.add r10, r7
    bt.movi r3, 0x0
    bg.jal 0x2227da
    bn.muls r3, r3, r13
    bt.add r3, r11
    bn.lh r7, 0x22(r3)
    bn.divu r10, r10, r7
    bg.ori r7, r0, 0x3e8
    bn.muls r15, r10, r7
    bt.j loc_268882
