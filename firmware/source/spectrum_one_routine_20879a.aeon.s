# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20879a,0x2088c3); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x24
    bn.sw 0x20(r1), r9
    bn.sw 0x1c(r1), r10
    bn.sw 0x18(r1), r11
    bn.sw 0x14(r1), r12
    bn.sw 0x10(r1), r13
    bn.sw 0xc(r1), r14
    bn.sw 0x8(r1), r15
    bn.sw 0x4(r1), r16
    bn.sw 0x0(r1), r17
    bt.mov r11, r4
    bt.mov r16, r5
    bn.ori r7, r0, 0xa8
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lh r17, 0x2a(r7)
    bg.jal 0x2250c5
    bn.ori r7, r0, 0x7c
    bn.muls r3, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r3, r7
    bn.lwz r10, 0x4(r3)
    bn.ori r13, r0, 0xab
    bn.beqi r11, 0x1, loc_2087f8
    bn.sfnei r11, 0x2
    bn.ori r6, r0, 0x8b
    bn.ori r7, r0, 0xcb
    bn.cmov_0 r13, r6, r7
loc_2087f8:
    bt.mov r3, r17
    bt.movi r4, 0x1
    bg.jal 0x23e13b
    bg.movhi r6, 0x2d80
    bn.ori r6, r6, 0xc2
    bn.add r3, r10, r6
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bg.movhi r7, 0x2d80
    bn.ori r7, r7, 0xc4
    bn.add r12, r10, r7
    bt.mov r3, r12
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bg.movhi r6, 0x2d80
    bn.ori r6, r6, 0xc6
    bn.add r14, r10, r6
    bt.mov r3, r14
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bg.movhi r7, 0x2d80
    bn.ori r7, r7, 0xc0
    bn.add r15, r10, r7
    bt.mov r3, r15
    bt.mov r4, r13
    bt.mov r5, r13
    bg.jal 0x23e152
    bn.slli r7, r11, 0x2
    bn.add r13, r7, r16
    bt.movi r10, 0x0
loc_208850:
    bn.lwz r7, 0x0(r13)
    bt.add r7, r10
    bn.lbz r6, 0x0(r7)
    bn.lbz r7, 0x1(r7)
    bn.slli r7, r7, 0x8
    bt.add r6, r7
    bn.exthz r11, r6
    bt.mov r3, r12
    bt.mov r4, r11
    bg.jal 0x23dfb6
    bt.addi r10, 0x2
    bg.sfnei r10, 0x200
    bn.bf loc_208850
    bg.ori r10, r0, 0x100
loc_208878:
    bt.mov r3, r12
    bt.mov r4, r11
    bg.jal 0x23dfb6
    bt.mov r3, r14
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bn.addi r7, r10, 0x1
    bn.exthz r10, r7
    bg.sfnei r10, 0x258
    bn.bf loc_208878
    bt.mov r3, r15
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bt.mov r3, r17
    bt.movi r4, 0x0
    bn.lwz r17, 0x0(r1)
    bn.lwz r16, 0x4(r1)
    bn.lwz r15, 0x8(r1)
    bn.lwz r14, 0xc(r1)
    bn.lwz r13, 0x10(r1)
    bn.lwz r12, 0x14(r1)
    bn.lwz r11, 0x18(r1)
    bn.lwz r10, 0x1c(r1)
    bn.lwz r9, 0x20(r1)
    bn.addi r1, r1, 0x24
    bg.j 0x23e13b
