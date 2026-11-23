# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20a0b9,0x20a156); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x18
    bn.sw 0x14(r1), r9
    bn.sw 0x10(r1), r10
    bn.sw 0xc(r1), r11
    bn.sw 0x8(r1), r12
    bn.sw 0x4(r1), r13
    bn.sw 0x0(r1), r14
    bt.mov r10, r3
    bt.mov r13, r4
    bt.mov r14, r5
    bt.movi r3, 0x0
    bg.jal 0x222b8a
    bt.mov r3, r10
    bg.jal 0x23e79e
    bt.mov r10, r3
    bn.beqi r3, 0x0, loc_20a13f
    bt.movi r11, 0x0
    bt.j loc_20a0f4
loc_20a0e9:
    bn.srli r7, r10, 0x1
    bn.exthz r10, r7
    bt.addi r11, 0x1
    bn.beqi r10, 0x0, loc_20a13f
loc_20a0f4:
    bn.extbz r12, r11
    bn.andi r7, r10, 0x1
    bn.beqi r7, 0x0, loc_20a0e9
    bt.mov r3, r12
    bg.jal 0x222b8a
    bt.mov r5, r3
    bt.movi r4, 0x0
    bn.beqi r13, 0x0, loc_20a116
    bn.sfeqi r14, 0x0
    bn.ori r6, r0, 0x35
    bn.ori r7, r0, 0x30
    bn.cmov_0 r4, r6, r7
loc_20a116:
    bn.andi r7, r12, 0x1
    bn.movhi_2 r6, 0xf80
    bn.ori r6, r6, 0x4c
    bn.add r3, r5, r6
    bn.sfeqi r7, 0x0
    bn.movhi_2 r7, 0x1080
    bn.ori r7, r7, 0x5e
    bt.add r5, r7
    bn.cmov_0 r3, r3, r5
    bg.jal 0x23ddb9
    bn.srli r7, r10, 0x1
    bn.exthz r10, r7
    bt.addi r11, 0x1
    bn.bnei r10, 0x0, loc_20a0f4
loc_20a13f:
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bt.jr r9
