# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x238de2,0x238e79); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x20
    bn.sw 0x1c(r1), r9
    bn.sw 0x18(r1), r10
    bn.sw 0x14(r1), r11
    bn.sw 0x10(r1), r12
    bn.sw 0xc(r1), r13
    bn.sw 0x8(r1), r14
    bn.sw 0x4(r1), r15
    bn.sw 0x0(r1), r16
    bn.lbz r14, 0x0(r3)
    bn.lbz r6, 0x2(r3)
    bn.slli r6, r6, 0x8
    bn.lbz r7, 0x1(r3)
    bn.or r7, r7, r6
    bn.exths r7, r7
    bn.beqi r7, 0x0, loc_238e5c
    bn.exthz r12, r7
    bt.movi r13, 0x1
    bg.movhi r16, 0x3b
    bg.movhi r15, 0x3b
loc_238e1f:
    bn.andi r7, r12, 0x1
    bn.beqi r7, 0x0, loc_238e47
    bg.addi r10, r16, 0x4290
    bg.addi r11, r15, 0x4950
loc_238e2d:
    bn.lwz r7, 0x0(r10)
    bg.beq r7, r13, loc_238e51
loc_238e34:
    bn.addi r10, r10, 0x18
    bg.addi r11, r11, 0xb0
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4320
    bg.bne r10, r7, loc_238e2d
loc_238e47:
    bn.srli r12, r12, 0x1
    bn.beqi r12, 0x0, loc_238e5c
    bt.addi r13, 0x1
    bt.j loc_238e1f
loc_238e51:
    bn.lwz r3, 0x0(r11)
    bt.mov r4, r14
    bg.jal 0x20eed3
    bt.j loc_238e34
loc_238e5c:
    bn.lwz r16, 0x0(r1)
    bn.lwz r15, 0x4(r1)
    bn.lwz r14, 0x8(r1)
    bn.lwz r13, 0xc(r1)
    bn.lwz r12, 0x10(r1)
    bn.lwz r11, 0x14(r1)
    bn.lwz r10, 0x18(r1)
    bn.lwz r9, 0x1c(r1)
    bn.addi r1, r1, 0x20
    bt.jr r9
