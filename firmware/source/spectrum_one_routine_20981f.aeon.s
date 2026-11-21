# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20981f,0x209920); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x2c
    bn.sw 0x28(r1), r9
    bn.sw 0x24(r1), r10
    bn.sw 0x20(r1), r11
    bn.sw 0x1c(r1), r12
    bn.sw 0x18(r1), r13
    bn.sw 0x14(r1), r14
    bn.sw 0x10(r1), r15
    bn.sw 0xc(r1), r16
    bn.sw 0x8(r1), r17
    bn.sw 0x4(r1), r18
    bn.sw 0x0(r1), r19
    bt.mov r10, r3
    bt.mov r19, r4
    bt.movi r3, 0x0
    bg.jal 0x222b8a
    bt.mov r3, r10
    bg.jal 0x23e79e
    bt.mov r15, r3
    bg.beqi r3, 0x0, loc_2098fa
    bt.movi r18, 0x0
    bg.addi r17, r0, 0xfff
    bt.j loc_20986d
loc_209861:
    bn.srli r7, r15, 0x1
    bn.exthz r15, r7
    bt.addi r18, 0x1
    bg.beqi r15, 0x0, loc_2098fa
loc_20986d:
    bn.extbz r10, r18
    bn.andi r7, r15, 0x1
    bn.beqi r7, 0x0, loc_209861
    bt.mov r3, r10
    bg.jal 0x222b8a
    bn.andi r7, r10, 0x1
    bg.movhi r5, 0x2580
    bn.ori r5, r5, 0x24
    bn.add r6, r3, r5
    bn.sfeqi r7, 0x0
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x4
    bt.add r3, r7
    bn.cmov_0 r14, r6, r3
    bt.mov r13, r19
    bt.movi r16, 0x0
loc_20989c:
    bt.mov r12, r13
    bt.mov r11, r14
    bt.movi r10, 0x0
    bt.j loc_2098c1
loc_2098a4:
    bg.sflesi r4, 0xfff
    bn.cmov_0 r4, r4, r17
    bt.mov r3, r11
    bn.exthz r4, r4
    bg.jal 0x23dfb6
    bt.addi r11, 0x2
    bn.addi r7, r10, 0x1
    bn.extbz r10, r7
    bt.addi r12, 0x2
    bn.beqi r10, 0x3, loc_2098e1
loc_2098c1:
    bn.lh_0 r4, 0x0(r12)
    bn.bgtsi r4, -0x1, loc_2098a4
    bg.ori r4, r4, 0x1000
    bt.mov r3, r11
    bn.exthz r4, r4
    bg.jal 0x23dfb6
    bt.addi r11, 0x2
    bn.addi r7, r10, 0x1
    bn.extbz r10, r7
    bt.addi r12, 0x2
    bn.bnei r10, 0x3, loc_2098c1
loc_2098e1:
    bt.addi r14, 0x6
    bn.addi r7, r16, 0x1
    bn.extbz r16, r7
    bt.addi r13, 0x6
    bn.bnei r16, 0x3, loc_20989c
    bn.srli r7, r15, 0x1
    bn.exthz r15, r7
    bt.addi r18, 0x1
    bg.bnei r15, 0x0, loc_20986d
loc_2098fa:
    bn.lwz r19, 0x0(r1)
    bn.lwz r18, 0x4(r1)
    bn.lwz r17, 0x8(r1)
    bn.lwz r16, 0xc(r1)
    bn.lwz r15, 0x10(r1)
    bn.lwz r14, 0x14(r1)
    bn.lwz r13, 0x18(r1)
    bn.lwz r12, 0x1c(r1)
    bn.lwz r11, 0x20(r1)
    bn.lwz r10, 0x24(r1)
    bn.lwz r9, 0x28(r1)
    bn.addi r1, r1, 0x2c
    bt.jr r9
