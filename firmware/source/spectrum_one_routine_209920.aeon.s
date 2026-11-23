# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x209920,0x209a30); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x30
    bn.sw 0x2c(r1), r9
    bn.sw 0x28(r1), r10
    bn.sw 0x24(r1), r11
    bn.sw 0x20(r1), r12
    bn.sw 0x1c(r1), r13
    bn.sw 0x18(r1), r14
    bn.sw 0x14(r1), r15
    bn.sw 0x10(r1), r16
    bn.sw 0xc(r1), r17
    bn.sw 0x8(r1), r18
    bn.sw 0x4(r1), r19
    bn.sw 0x0(r1), r20
    bt.mov r10, r3
    bt.mov r20, r4
    bt.movi r3, 0x0
    bg.jal 0x222b8a
    bt.mov r3, r10
    bg.jal 0x23e79e
    bt.mov r15, r3
    bg.beqi r3, 0x0, loc_209a07
    bt.movi r18, 0x0
    bg.addi r17, r0, 0xfff
    bg.addi r19, r0, -0x1000
    bt.j loc_209975
loc_209969:
    bn.srli r7, r15, 0x1
    bn.exthz r15, r7
    bt.addi r18, 0x1
    bg.beqi r15, 0x0, loc_209a07
loc_209975:
    bn.extbz r10, r18
    bn.andi r7, r15, 0x1
    bn.beqi r7, 0x0, loc_209969
    bt.mov r3, r10
    bg.jal 0x222b8a
    bn.andi r7, r10, 0x1
    bn.movhi_2 r5, 0xf80
    bn.ori r5, r5, 0x3a
    bn.add r6, r3, r5
    bn.sfeqi r7, 0x0
    bn.movhi_2 r7, 0x1080
    bn.ori r7, r7, 0x4c
    bt.add r3, r7
    bn.cmov_0 r14, r6, r3
    bt.mov r13, r20
    bt.movi r16, 0x0
loc_2099a2:
    bt.mov r12, r13
    bt.mov r11, r14
    bt.movi r10, 0x0
    bt.j loc_2099c7
loc_2099aa:
    bg.sflesi r7, 0xfff
    bn.cmov_0 r4, r7, r17
    bt.mov r3, r11
    bn.exthz r4, r4
    bg.jal 0x23dfb6
    bt.addi r11, 0x2
    bn.addi r7, r10, 0x1
    bn.extbz r10, r7
    bt.addi r12, 0x2
    bn.beqi r10, 0x3, loc_2099ee
loc_2099c7:
    bn.lh_0 r7, 0x0(r12)
    bn.bgtsi r7, -0x1, loc_2099aa
    bg.sfgtsi r7, -0x1001
    bn.cmov_0 r4, r7, r19
    bn.exthz r4, r4
    bt.mov r3, r11
    bg.ori r4, r4, 0x1000
    bg.jal 0x23dfb6
    bt.addi r11, 0x2
    bn.addi r7, r10, 0x1
    bn.extbz r10, r7
    bt.addi r12, 0x2
    bn.bnei r10, 0x3, loc_2099c7
loc_2099ee:
    bt.addi r14, 0x6
    bn.addi r7, r16, 0x1
    bn.extbz r16, r7
    bt.addi r13, 0x6
    bn.bnei r16, 0x3, loc_2099a2
    bn.srli r7, r15, 0x1
    bn.exthz r15, r7
    bt.addi r18, 0x1
    bg.bnei r15, 0x0, loc_209975
loc_209a07:
    bn.lwz r20, 0x0(r1)
    bn.lwz r19, 0x4(r1)
    bn.lwz r18, 0x8(r1)
    bn.lwz r17, 0xc(r1)
    bn.lwz r16, 0x10(r1)
    bn.lwz r15, 0x14(r1)
    bn.lwz r14, 0x18(r1)
    bn.lwz r13, 0x1c(r1)
    bn.lwz r12, 0x20(r1)
    bn.lwz r11, 0x24(r1)
    bn.lwz r10, 0x28(r1)
    bn.lwz r9, 0x2c(r1)
    bn.addi r1, r1, 0x30
    bt.jr r9
