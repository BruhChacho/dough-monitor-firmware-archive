# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x207806,0x2078d1); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bn.sw 0x14(r1), r10
    bn.sw 0x10(r1), r11
    bn.sw 0xc(r1), r12
    bn.sw 0x8(r1), r13
    bn.sw 0x4(r1), r14
    bn.sw 0x0(r1), r15
    bt.mov r15, r4
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r3, r6
    bn.lh r13, 0x2a(r3)
    bn.beqi r13, 0x0, loc_207887
    bt.movi r14, 0x0
loc_207838:
    bn.extbz r5, r14
    bn.andi r7, r13, 0x1
    bn.beqi r7, 0x0, loc_20787f
    bn.ori r7, r0, 0x7c
    bn.muls r7, r5, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lwz r6, 0x4(r7)
    bn.andi r7, r5, 0x1
    bn.beqi r7, 0x0, loc_2078a1
    bn.movhi_2 r7, 0x1980
    bn.ori r7, r7, 0xc8
    bn.add r10, r6, r7
    bt.mov r11, r15
    bn.movhi_2 r7, 0x1980
    bn.ori r7, r7, 0xd0
    bn.add r12, r6, r7
loc_20786e:
    bt.mov r3, r10
    bn.lbz r4, 0x0(r11)
    bg.jal 0x23ddb9
    bt.addi r11, 0x1
    bt.addi r10, 0x1
    bg.bne r10, r12, loc_20786e
loc_20787f:
    bn.srli r13, r13, 0x1
    bt.addi r14, 0x1
    bn.bnei r13, 0x0, loc_207838
loc_207887:
    bn.lwz r15, 0x0(r1)
    bn.lwz r14, 0x4(r1)
    bn.lwz r13, 0x8(r1)
    bn.lwz r12, 0xc(r1)
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
loc_2078a1:
    bn.movhi_2 r7, 0x1980
    bn.ori r7, r7, 0xc8
    bn.add r10, r6, r7
    bt.mov r11, r15
    bn.movhi_2 r7, 0x1980
    bn.ori r7, r7, 0xd0
    bn.add r12, r6, r7
loc_2078b5:
    bt.mov r3, r10
    bn.lbz r4, 0x0(r11)
    bg.jal 0x23ddb9
    bt.addi r11, 0x1
    bt.addi r10, 0x1
    bg.bne r10, r12, loc_2078b5
    bn.srli r13, r13, 0x1
    bt.addi r14, 0x1
    bg.bnei r13, 0x0, loc_207838
    bt.j loc_207887
