# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x225b47,0x225be9); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r11, r3
    bt.mov r13, r4
    bt.mov r10, r5
    bn.ori r7, r0, 0x7c
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lwz r12, 0x4(r7)
    bg.jal 0x222804
    bt.movi r4, 0x0
    bn.beqi r10, 0x0, loc_225ba5
    bn.ori r7, r0, 0xb0
    bn.muls r7, r3, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bn.lbz r7, 0x20(r7)
    bn.andi r7, r7, 0x10
    bn.sfeqi r7, 0x0
    bn.cmovi r7, 0x1, 0x2
    bn.divs r7, r13, r7
    bg.ori r6, r0, 0x1fff
    bn.and r7, r7, r6
    bg.ori r4, r7, 0x8000
loc_225ba5:
    bn.andi r7, r11, 0x1
    bn.beqi r7, 0x0, loc_225bca
    bn.movhi_2 r7, 0x280
    bn.ori r7, r7, 0x6e
    bn.add r3, r12, r7
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bg.j 0x23dfb6
loc_225bca:
    bn.movhi_2 r6, 0x480
    bn.ori r6, r6, 0x6e
    bn.add r3, r12, r6
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bg.j 0x23dfb6
