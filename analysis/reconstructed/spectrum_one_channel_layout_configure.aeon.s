# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x260824,0x260c02); Select one of six rectangle layouts, clear four channel records, configure active records and call external apply routine.
# Fixed original addresses; not a hardware-validated implementation.
    bn.addi r1, r1, -0x18
    bn.sw 0x14(r1), r9
    bn.sw 0x10(r1), r10
    bn.sw 0xc(r1), r11
    bn.sw 0x8(r1), r12
    bt.mov r10, r4
    bn.sh_1 0x0(r1), r0
    bn.sh_2 0x2(r1), r0
    bg.addi r7, r0, 0xf00
    bn.sh_1 0x4(r1), r7
    bg.addi r7, r0, 0x870
    bn.sh_2 0x6(r1), r7
    bg.bgtui r3, 0x5, loc_2608e5
    bn.slli r7, r3, 0x2
    bg.movhi r5, 0x33
    bg.addi r5, r5, -0x7e98
    bt.add r7, r5
    bn.lwz r7, 0x0(r7)
    bt.jr r7
    bt.movi r3, 0x0
    bg.jal 0x23e8a2
    bt.movi r3, 0x1
    bg.jal 0x23e8a2
    bt.movi r3, 0x2
    bg.jal 0x23e8a2
    bt.movi r3, 0x3
    bg.jal 0x23e8a2
    bg.movhi r7, 0x3c
    bg.addi r5, r7, 0x5d30
    bg.lwz r6, 0x5d30(r7)
    bn.sw 0x0(r1), r6
    bn.lwz r7, 0x4(r5)
    bn.sw 0x4(r1), r7
    bg.movhi r11, 0x3b
    bg.lwz r5, 0x5f38(r11)
    bt.movi r3, 0x0
    bn.lbz r4, 0x5b(r5)
    bt.movi r5, 0x0
    bg.jal 0x23e7f6
    bg.movhi r7, 0x3c
    bg.addi r7, r7, 0x5d10
    bn.lwz r6, 0x28(r7)
    bn.sw 0x0(r1), r6
    bn.lwz r7, 0x2c(r7)
    bn.sw 0x4(r1), r7
    bg.beqi r10, 0x1, loc_260b5d
    bg.bleui r10, 0x0, loc_260b26
    bg.beqi r10, 0x2, loc_260b94
    bg.beqi r10, 0x3, loc_260bcb
loc_2608c3:
    bn.lh r6, 0x0(r1)
    bg.ori r5, r0, 0xfffc
    bn.and r7, r6, r5
    bn.sh_1 0x0(r1), r7
    bg.lwz r7, 0x5f38(r11)
    bt.movi r3, 0x1
    bn.lbz r4, 0x5c(r7)
    bt.movi r5, 0x0
    bn.lwz r6, 0x0(r1)
    bn.lwz r7, 0x4(r1)
    bg.jal 0x23e7f6
loc_2608e5:
    bg.jal 0x23fad0
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bt.jr r9
    bt.movi r3, 0x0
    bg.jal 0x23e8a2
    bt.movi r3, 0x1
    bg.jal 0x23e8a2
    bt.movi r3, 0x2
    bg.jal 0x23e8a2
    bt.movi r3, 0x3
    bg.jal 0x23e8a2
    bg.movhi r7, 0x3b
    bg.lwz r7, 0x5f38(r7)
    bt.movi r3, 0x0
    bn.lbz r4, 0x5b(r7)
    bt.movi r5, 0x0
    bn.lwz r6, 0x0(r1)
    bn.lwz r7, 0x4(r1)
    bg.jal 0x23e7f6
    bt.movi r3, 0x0
    bt.movi r4, 0x1
    bg.jal 0x23e734
    bt.j loc_2608e5
    bt.movi r3, 0x0
    bg.jal 0x23e8a2
    bt.movi r3, 0x1
    bg.jal 0x23e8a2
    bt.movi r3, 0x2
    bg.jal 0x23e8a2
    bt.movi r3, 0x3
    bg.jal 0x23e8a2
    bg.movhi r7, 0x3c
    bg.addi r5, r7, 0x5db0
    bg.lwz r6, 0x5db0(r7)
    bn.sw 0x0(r1), r6
    bn.lwz r7, 0x4(r5)
    bn.sw 0x4(r1), r7
    bg.movhi r11, 0x3b
    bg.lwz r5, 0x5f38(r11)
    bt.movi r3, 0x0
    bn.lbz r4, 0x5b(r5)
    bt.movi r5, 0x0
    bg.jal 0x23e7f6
    bg.movhi r10, 0x3c
    bg.addi r10, r10, 0x5d10
    bg.lwz r6, 0xa8(r10)
    bn.sw 0x0(r1), r6
    bg.lwz r7, 0xac(r10)
    bn.sw 0x4(r1), r7
    bg.lwz r5, 0x5f38(r11)
    bt.movi r3, 0x1
    bn.lbz r4, 0x5c(r5)
    bt.movi r5, 0x0
    bg.jal 0x23e7f6
    bg.lwz r6, 0xb0(r10)
    bn.sw 0x0(r1), r6
    bg.lwz r7, 0xb4(r10)
    bn.sw 0x4(r1), r7
    bg.lwz r5, 0x5f38(r11)
    bt.movi r3, 0x2
    bn.lbz r4, 0x5d(r5)
    bt.movi r5, 0x0
    bg.jal 0x23e7f6
    bg.lwz r6, 0xb8(r10)
    bn.sw 0x0(r1), r6
    bg.lwz r7, 0xbc(r10)
    bn.sw 0x4(r1), r7
    bg.lwz r5, 0x5f38(r11)
    bt.movi r3, 0x3
    bn.lbz r4, 0x5e(r5)
    bt.movi r5, 0x0
    bg.jal 0x23e7f6
    bt.j loc_2608e5
    bt.movi r3, 0x0
    bg.jal 0x23e8a2
    bt.movi r3, 0x1
    bg.jal 0x23e8a2
    bt.movi r3, 0x2
    bg.jal 0x23e8a2
    bt.movi r3, 0x3
    bg.jal 0x23e8a2
    bg.movhi r7, 0x3c
    bg.addi r5, r7, 0x5d90
    bg.lwz r6, 0x5d90(r7)
    bn.sw 0x0(r1), r6
    bn.lwz r7, 0x4(r5)
    bn.sw 0x4(r1), r7
    bg.movhi r11, 0x3b
    bg.lwz r5, 0x5f38(r11)
    bt.movi r3, 0x0
    bn.lbz r4, 0x5b(r5)
    bt.movi r5, 0x0
    bg.jal 0x23e7f6
    bg.movhi r10, 0x3c
    bg.addi r10, r10, 0x5d10
    bg.lwz r6, 0x88(r10)
    bn.sw 0x0(r1), r6
    bg.lwz r7, 0x8c(r10)
    bn.sw 0x4(r1), r7
    bg.lwz r5, 0x5f38(r11)
    bt.movi r3, 0x1
    bn.lbz r4, 0x5c(r5)
    bt.movi r5, 0x0
    bg.jal 0x23e7f6
    bg.lwz r6, 0x90(r10)
    bn.sw 0x0(r1), r6
    bg.lwz r7, 0x94(r10)
    bn.sw 0x4(r1), r7
    bt.movi r3, 0x2
    bg.movhi r5, 0x48
    bg.lbz r4, 0x256d(r5)
    bt.movi r5, 0x0
    bg.jal 0x23e7f6
    bt.j loc_2608e5
    bt.movi r3, 0x0
    bg.jal 0x23e8a2
    bt.movi r3, 0x1
    bg.jal 0x23e8a2
    bt.movi r3, 0x2
    bg.jal 0x23e8a2
    bt.movi r3, 0x3
    bg.jal 0x23e8a2
    bg.movhi r7, 0x3c
    bg.addi r5, r7, 0x5d70
    bg.lwz r6, 0x5d70(r7)
    bn.sw 0x0(r1), r6
    bn.lwz r7, 0x4(r5)
    bn.sw 0x4(r1), r7
    bg.movhi r10, 0x3b
    bg.lwz r5, 0x5f38(r10)
    bt.movi r3, 0x0
    bn.lbz r4, 0x5b(r5)
    bt.movi r5, 0x0
    bg.jal 0x23e7f6
    bg.movhi r7, 0x3c
    bg.addi r7, r7, 0x5d10
    bn.lwz r6, 0x68(r7)
    bn.sw 0x0(r1), r6
    bn.lwz r7, 0x6c(r7)
loc_260aac:
    bn.sw 0x4(r1), r7
    bg.lwz r5, 0x5f38(r10)
    bt.movi r3, 0x1
    bn.lbz r4, 0x5c(r5)
    bt.movi r5, 0x0
    bg.jal 0x23e7f6
    bg.jal 0x23fad0
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bt.jr r9
    bt.movi r3, 0x0
    bg.jal 0x23e8a2
    bt.movi r3, 0x1
    bg.jal 0x23e8a2
    bt.movi r3, 0x2
    bg.jal 0x23e8a2
    bt.movi r3, 0x3
    bg.jal 0x23e8a2
    bg.movhi r7, 0x3c
    bg.addi r5, r7, 0x5d50
    bg.lwz r6, 0x5d50(r7)
    bn.sw 0x0(r1), r6
    bn.lwz r7, 0x4(r5)
    bn.sw 0x4(r1), r7
    bg.movhi r10, 0x3b
    bg.lwz r5, 0x5f38(r10)
    bt.movi r3, 0x0
    bn.lbz r4, 0x5b(r5)
    bt.movi r5, 0x0
    bg.jal 0x23e7f6
    bg.movhi r7, 0x3c
    bg.addi r7, r7, 0x5d10
    bn.lwz r6, 0x48(r7)
    bn.sw 0x0(r1), r6
    bn.lwz r7, 0x4c(r7)
    bt.j loc_260aac
loc_260b26:
    bg.lwz r6, 0x5f38(r11)
    bn.lbz r5, 0x68(r6)
    bn.lbz r7, 0x69(r6)
    bn.slli r7, r7, 0x8
    bn.or r7, r7, r5
    bn.sh_1 0x0(r1), r7
    bn.lbz r5, 0x6a(r6)
    bn.lbz r7, 0x6b(r6)
    bn.slli r7, r7, 0x8
    bn.or r7, r7, r5
    bn.sh_2 0x2(r1), r7
    bt.movi r3, 0x0
    bg.jal 0x260459
    bn.sh_1 0x4(r1), r3
    bt.movi r3, 0x0
    bg.jal 0x26047c
    bn.sh_2 0x6(r1), r3
    bn.j loc_2608c3
loc_260b5d:
    bg.lwz r6, 0x5f38(r11)
    bn.lbz r5, 0x68(r6)
    bn.lbz r7, 0x69(r6)
    bn.slli r7, r7, 0x8
    bn.or r7, r7, r5
    bn.sh_1 0x0(r1), r7
    bn.lbz r5, 0x6a(r6)
    bn.lbz r7, 0x6b(r6)
    bn.slli r7, r7, 0x8
    bn.or r7, r7, r5
    bn.sh_2 0x2(r1), r7
    bt.movi r3, 0x1
    bg.jal 0x260459
    bn.sh_1 0x4(r1), r3
    bt.movi r3, 0x1
    bg.jal 0x26047c
    bn.sh_2 0x6(r1), r3
    bn.j loc_2608c3
loc_260b94:
    bg.lwz r6, 0x5f38(r11)
    bn.lbz r5, 0x68(r6)
    bn.lbz r7, 0x69(r6)
    bn.slli r7, r7, 0x8
    bn.or r7, r7, r5
    bn.sh_1 0x0(r1), r7
    bn.lbz r5, 0x6a(r6)
    bn.lbz r7, 0x6b(r6)
    bn.slli r7, r7, 0x8
    bn.or r7, r7, r5
    bn.sh_2 0x2(r1), r7
    bt.movi r3, 0x2
    bg.jal 0x260459
    bn.sh_1 0x4(r1), r3
    bt.movi r3, 0x2
    bg.jal 0x26047c
    bn.sh_2 0x6(r1), r3
    bn.j loc_2608c3
loc_260bcb:
    bg.lwz r6, 0x5f38(r11)
    bn.lbz r5, 0x68(r6)
    bn.lbz r7, 0x69(r6)
    bn.slli r7, r7, 0x8
    bn.or r7, r7, r5
    bn.sh_1 0x0(r1), r7
    bn.lbz r5, 0x6a(r6)
    bn.lbz r7, 0x6b(r6)
    bn.slli r7, r7, 0x8
    bn.or r7, r7, r5
    bn.sh_2 0x2(r1), r7
    bt.movi r3, 0x3
    bg.jal 0x260459
    bn.sh_1 0x4(r1), r3
    bt.movi r3, 0x3
    bg.jal 0x26047c
    bn.sh_2 0x6(r1), r3
    bn.j loc_2608c3
