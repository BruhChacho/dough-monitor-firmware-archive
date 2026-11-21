# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x207f4b,0x2080a8); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bn.sw 0x14(r1), r10
    bn.sw 0x10(r1), r11
    bn.sw 0xc(r1), r12
    bn.sw 0x8(r1), r13
    bn.sw 0x4(r1), r14
    bn.sw 0x0(r1), r15
    bt.mov r15, r4
    bt.mov r14, r5
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r3, r5
    bn.lh r12, 0x2a(r3)
    bg.beqi r12, 0x0, loc_20808e
    bt.movi r13, 0x0
    bt.j loc_208015
loc_207f82:
    bn.movhi_2 r7, 0x1980
    bn.ori r7, r7, 0x20
    bn.add r3, r10, r7
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bn.movhi_2 r5, 0x1980
    bn.ori r5, r5, 0x21
    bn.add r3, r10, r5
    bt.movi r4, 0x3
    bt.movi r5, 0x3
    bg.jal 0x23dfe1
    bn.movhi_2 r7, 0x1980
    bn.ori r7, r7, 0xaa
    bn.add r3, r10, r7
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bn.movhi_2 r5, 0x1980
    bn.ori r5, r5, 0x27
    bn.add r11, r10, r5
    bt.mov r3, r11
    bt.mov r4, r15
    bg.jal 0x23ddb9
    bg.beqi r14, 0x0, loc_208080
loc_207fca:
    bt.mov r3, r11
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x40
    bg.jal 0x23dfe1
loc_207fd5:
    bn.movhi_2 r7, 0x1980
    bn.ori r7, r7, 0x30
    bn.add r3, r10, r7
    bg.jal 0x23dd44
    bt.mov r4, r3
    bn.movhi_2 r5, 0x1980
    bn.ori r5, r5, 0x50
    bn.add r3, r10, r5
    bg.jal 0x23ddb9
    bn.movhi_2 r7, 0x1980
    bn.ori r7, r7, 0x31
    bn.add r3, r10, r7
    bg.jal 0x23dd44
    bt.mov r4, r3
    bn.movhi_2 r5, 0x1980
    bn.ori r5, r5, 0x51
    bn.add r3, r10, r5
    bg.jal 0x23ddb9
loc_20800d:
    bn.srli r12, r12, 0x1
    bt.addi r13, 0x1
    bn.beqi r12, 0x0, loc_20808e
loc_208015:
    bn.extbz r6, r13
    bn.andi r7, r12, 0x1
    bn.beqi r7, 0x0, loc_20800d
    bn.ori r7, r0, 0x7c
    bn.muls r7, r6, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lwz r10, 0x4(r7)
    bn.andi r7, r6, 0x1
    bg.bnei r7, 0x0, loc_207f82
    bn.movhi_2 r7, 0x1980
    bn.ori r7, r7, 0x28
    bn.add r3, r10, r7
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bn.movhi_2 r5, 0x1980
    bn.ori r5, r5, 0x29
    bn.add r3, r10, r5
    bt.movi r4, 0x3
    bt.movi r5, 0x3
    bg.jal 0x23dfe1
    bn.movhi_2 r7, 0x1980
    bn.ori r7, r7, 0xda
    bn.add r3, r10, r7
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bn.movhi_2 r5, 0x1980
    bn.ori r5, r5, 0x2f
    bn.add r11, r10, r5
    bt.mov r3, r11
    bt.mov r4, r15
    bg.jal 0x23ddb9
    bg.bnei r14, 0x0, loc_207fca
loc_208080:
    bt.mov r3, r11
    bn.ori r4, r0, 0x40
    bn.ori r5, r0, 0x40
    bg.jal 0x23dfe1
    bt.j loc_207fd5
loc_20808e:
    bn.lwz r15, 0x0(r1)
    bn.lwz r14, 0x4(r1)
    bn.lwz r13, 0x8(r1)
    bn.lwz r12, 0xc(r1)
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
