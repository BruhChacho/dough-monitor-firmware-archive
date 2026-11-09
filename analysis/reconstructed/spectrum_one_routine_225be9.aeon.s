# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x225be9,0x225db7); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r11, r3
    bt.mov r10, r4
    bn.ori r7, r0, 0x7c
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lwz r12, 0x4(r7)
    bg.movhi r7, 0x2080
    bn.ori r7, r7, 0x2
    bn.add r3, r12, r7
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bn.beqi r10, 0x0, loc_225c8f
    bn.andi r7, r11, 0x1
    bg.bnei r7, 0x0, loc_225d63
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0x88
    bn.add r3, r12, r7
    bt.movi r4, 0x0
    bg.ori r5, r0, 0x800
    bg.jal 0x23e152
    bn.movhi_2 r6, 0x1280
    bn.ori r6, r6, 0x8e
    bn.add r3, r12, r6
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bg.movhi r7, 0x5880
    bn.ori r7, r7, 0x2
    bn.add r3, r12, r7
    bt.movi r4, 0x0
    bt.movi r5, 0x2
    bg.jal 0x23dfe1
    bg.movhi r6, 0x5880
    bn.ori r6, r6, 0x34
    bn.add r3, r12, r6
    bt.movi r4, 0x7
    bg.jal 0x23dfb6
    bg.movhi r7, 0x5880
    bn.ori r7, r7, 0x36
    bn.add r3, r12, r7
    bt.movi r4, 0xc
loc_225c7c:
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bg.j 0x23dfb6
loc_225c8f:
    bn.andi r7, r11, 0x1
    bn.beqi r7, 0x0, loc_225cfc
    bn.movhi_2 r6, 0x1280
    bn.ori r6, r6, 0x8
    bn.add r3, r12, r6
    bg.ori r4, r0, 0x800
    bg.ori r5, r0, 0x800
    bg.jal 0x23e152
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0xe
    bn.add r3, r12, r7
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bg.movhi r6, 0x5780
    bn.ori r6, r6, 0x2
    bn.add r3, r12, r6
    bt.movi r4, 0x2
    bt.movi r5, 0x2
    bg.jal 0x23dfe1
    bg.movhi r7, 0x5780
    bn.ori r7, r7, 0x34
    bn.add r3, r12, r7
    bt.movi r4, 0x1
    bg.jal 0x23dfb6
    bg.movhi r6, 0x5780
    bn.ori r6, r6, 0x36
    bn.add r3, r12, r6
    bt.movi r4, 0x5
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bg.j 0x23dfb6
loc_225cfc:
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0x88
    bn.add r3, r12, r7
    bg.ori r4, r0, 0x800
    bg.ori r5, r0, 0x800
    bg.jal 0x23e152
    bn.movhi_2 r6, 0x1280
    bn.ori r6, r6, 0x8e
    bn.add r3, r12, r6
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bg.movhi r7, 0x5880
    bn.ori r7, r7, 0x2
    bn.add r3, r12, r7
    bt.movi r4, 0x2
    bt.movi r5, 0x2
    bg.jal 0x23dfe1
    bg.movhi r6, 0x5880
    bn.ori r6, r6, 0x34
    bn.add r3, r12, r6
    bt.movi r4, 0x1
    bg.jal 0x23dfb6
    bg.movhi r7, 0x5880
    bn.ori r7, r7, 0x36
    bn.add r3, r12, r7
    bt.movi r4, 0x5
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bg.j 0x23dfb6
loc_225d63:
    bn.movhi_2 r6, 0x1280
    bn.ori r6, r6, 0x8
    bn.add r3, r12, r6
    bt.movi r4, 0x0
    bg.ori r5, r0, 0x800
    bg.jal 0x23e152
    bn.movhi_2 r7, 0x1280
    bn.ori r7, r7, 0xe
    bn.add r3, r12, r7
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bg.movhi r6, 0x5780
    bn.ori r6, r6, 0x2
    bn.add r3, r12, r6
    bt.movi r4, 0x0
    bt.movi r5, 0x2
    bg.jal 0x23dfe1
    bg.movhi r7, 0x5780
    bn.ori r7, r7, 0x34
    bn.add r3, r12, r7
    bt.movi r4, 0x7
    bg.jal 0x23dfb6
    bg.movhi r6, 0x5780
    bn.ori r6, r6, 0x36
    bn.add r3, r12, r6
    bt.movi r4, 0xc
    bt.j loc_225c7c
