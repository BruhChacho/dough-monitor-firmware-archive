# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20649d,0x206b6b); byte-exact only; hardware untested.
    bg.addi r1, r1, -0x48c
    bg.sw_0 0x488(r1), r9
    bg.sw_0 0x484(r1), r10
    bg.sw_0 0x480(r1), r11
    bg.sw_0 0x47c(r1), r12
    bg.sw_0 0x478(r1), r13
    bg.sw_0 0x474(r1), r14
    bg.sw_0 0x470(r1), r15
    bg.sw_0 0x46c(r1), r16
    bg.sw_0 0x468(r1), r17
    bg.sw_0 0x464(r1), r18
    bg.sw_0 0x460(r1), r19
    bg.sw_0 0x45c(r1), r20
    bg.sw_0 0x458(r1), r21
    bg.movhi r6, 0x45
    bg.lbz r7, 0x3f89(r6)
    bn.beqi r7, 0x0, loc_20652a
    bg.movhi r11, 0x34
    bg.beqi r3, 0x5, loc_20652a
loc_2064e8:
    bg.lwz r3, 0x2128(r11)
    bg.lwz r4, 0x212c(r11)
    bg.lwz r21, 0x458(r1)
    bg.lwz r20, 0x45c(r1)
    bg.lwz r19, 0x460(r1)
    bg.lwz r18, 0x464(r1)
    bg.lwz r17, 0x468(r1)
    bg.lwz r16, 0x46c(r1)
    bg.lwz r15, 0x470(r1)
    bg.lwz r14, 0x474(r1)
    bg.lwz r13, 0x478(r1)
    bg.lwz r12, 0x47c(r1)
    bg.lwz r11, 0x480(r1)
    bg.lwz r10, 0x484(r1)
    bg.lwz r9, 0x488(r1)
    bg.addi r1, r1, 0x48c
    bt.jr r9
loc_20652a:
    bt.movi r7, 0x1
    bg.sbz 0x3f89(r6), r7
    bg.addi r3, r1, 0x424
    bg.jal 0x204581
    bg.beqi r3, 0x0, loc_206a0c
    bg.lwz r3, 0x428(r1)
    bg.jal 0x2acf9e
    bt.mov r10, r3
    bt.mov r11, r4
    bg.lwz r7, 0x428(r1)
    bg.blesi r7, -0x1, loc_206aee
loc_206550:
    bt.mov r3, r10
    bt.mov r4, r11
    bt.movi r5, 0x0
    bg.movhi r6, 0x411e
    bg.ori r6, r6, 0x8480
    bg.jal 0x2ad39d
    bg.blesi r3, -0x1, loc_206910
    bt.mov r3, r10
    bt.mov r4, r11
    bt.movi r5, 0x0
    bg.movhi r6, 0x416c
    bg.ori r6, r6, 0x9c38
    bg.jal 0x2ad2df
    bg.bgtsi r3, 0x0, loc_206910
    bg.lwz r3, 0x424(r1)
    bg.jal 0x2acf9e
    bt.mov r12, r3
    bt.mov r13, r4
    bg.lwz r7, 0x424(r1)
    bg.blesi r7, -0x1, loc_206aff
loc_206590:
    bt.mov r3, r12
    bt.mov r4, r13
    bt.movi r5, 0x0
    bg.movhi r6, 0x3ff0
    bg.jal 0x2ad39d
    bg.blesi r3, -0x1, loc_206910
    bt.mov r3, r12
    bt.mov r4, r13
    bt.movi r5, 0x0
    bg.movhi r6, 0x40e8
    bg.ori r6, r6, 0x6a00
    bg.jal 0x2ad2df
    bg.bgtsi r3, 0x0, loc_206910
    bg.lwz r3, 0x42c(r1)
    bg.jal 0x2acf9e
    bt.mov r14, r3
    bt.mov r15, r4
    bg.lwz r7, 0x42c(r1)
    bg.blesi r7, -0x1, loc_206b10
loc_2065cc:
    bt.mov r3, r14
    bt.mov r4, r15
    bt.movi r5, 0x0
    bg.movhi r6, 0x3ff0
    bg.jal 0x2ad39d
    bg.blesi r3, -0x1, loc_206910
    bt.mov r3, r14
    bt.mov r4, r15
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2ad2df
    bg.bgtsi r3, 0x0, loc_206910
    bg.lwz r3, 0x430(r1)
    bg.jal 0x2acf9e
    bt.mov r16, r3
    bt.mov r17, r4
    bg.lwz r7, 0x430(r1)
    bg.blesi r7, -0x1, loc_206b21
loc_206608:
    bt.mov r3, r16
    bt.mov r4, r17
    bt.movi r5, 0x0
    bg.movhi r6, 0x3ff0
    bg.jal 0x2ad39d
    bg.blesi r3, -0x1, loc_206910
    bt.mov r3, r16
    bt.mov r4, r17
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2ad2df
    bg.bgtsi r3, 0x0, loc_206910
    bg.lwz r3, 0x434(r1)
    bg.jal 0x2acf9e
    bn.sw 0x38(r1), r3
    bn.sw 0x3c(r1), r4
    bg.lwz r7, 0x434(r1)
    bg.blesi r7, -0x1, loc_206b32
loc_206646:
    bn.lwz r3, 0x38(r1)
    bn.lwz r4, 0x3c(r1)
    bt.movi r5, 0x0
    bg.movhi r6, 0x3ff0
    bg.jal 0x2ad39d
    bg.blesi r3, -0x1, loc_206910
    bn.lwz r3, 0x38(r1)
    bn.lwz r4, 0x3c(r1)
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2ad2df
    bg.bgtsi r3, 0x0, loc_206910
    bg.lwz r3, 0x438(r1)
    bg.jal 0x2acf9e
    bn.sw 0x40(r1), r3
    bn.sw 0x44(r1), r4
    bg.lwz r7, 0x438(r1)
    bg.blesi r7, -0x1, loc_206b45
loc_206688:
    bn.lwz r3, 0x40(r1)
    bn.lwz r4, 0x44(r1)
    bt.movi r5, 0x0
    bg.movhi r6, 0x3ff0
    bg.jal 0x2ad39d
    bg.blesi r3, -0x1, loc_206910
    bn.lwz r3, 0x40(r1)
    bn.lwz r4, 0x44(r1)
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2ad2df
    bg.bgtsi r3, 0x0, loc_206910
    bg.lwz r3, 0x43c(r1)
    bg.jal 0x2acf9e
    bn.sw 0x48(r1), r3
    bn.sw 0x4c(r1), r4
    bg.lwz r7, 0x43c(r1)
    bg.blesi r7, -0x1, loc_206b58
loc_2066ca:
    bn.lwz r3, 0x48(r1)
    bn.lwz r4, 0x4c(r1)
    bt.movi r5, 0x0
    bg.movhi r6, 0x3ff0
    bg.jal 0x2ad39d
    bg.blesi r3, -0x1, loc_206910
    bn.lwz r3, 0x48(r1)
    bn.lwz r4, 0x4c(r1)
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2ad2df
    bg.bgtsi r3, 0x0, loc_206910
    bg.lwz r3, 0x440(r1)
    bg.jal 0x2acf9e
    bn.sw 0x50(r1), r3
    bn.sw 0x54(r1), r4
    bg.lwz r7, 0x440(r1)
    bn.bgtsi r7, -0x1, loc_20671b
    bt.movi r5, 0x0
    bg.movhi r6, 0x41f0
    bg.jal 0x2aca43
    bn.sw 0x50(r1), r3
    bn.sw 0x54(r1), r4
loc_20671b:
    bn.lwz r3, 0x50(r1)
    bn.lwz r4, 0x54(r1)
    bt.movi r5, 0x0
    bg.movhi r6, 0x3ff0
    bg.jal 0x2ad39d
    bg.blesi r3, -0x1, loc_206910
    bn.lwz r3, 0x50(r1)
    bn.lwz r4, 0x54(r1)
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2ad2df
    bg.bgtsi r3, 0x0, loc_206910
    bg.lwz r3, 0x444(r1)
    bg.jal 0x2acf9e
    bt.mov r20, r3
    bt.mov r21, r4
    bg.lwz r7, 0x444(r1)
    bn.bgtsi r7, -0x1, loc_206768
    bt.movi r5, 0x0
    bg.movhi r6, 0x41f0
    bg.jal 0x2aca43
    bt.mov r20, r3
    bt.mov r21, r4
loc_206768:
    bt.mov r3, r20
    bt.mov r4, r21
    bt.movi r5, 0x0
    bg.movhi r6, 0x3ff0
    bg.jal 0x2ad39d
    bg.blesi r3, -0x1, loc_206910
    bt.mov r3, r20
    bt.mov r4, r21
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2ad2df
    bg.bgtsi r3, 0x0, loc_206910
    bg.lwz r3, 0x448(r1)
    bg.jal 0x2acf9e
    bt.mov r18, r3
    bt.mov r19, r4
    bg.lwz r7, 0x448(r1)
    bn.bgtsi r7, -0x1, loc_2067b1
    bt.movi r5, 0x0
    bg.movhi r6, 0x41f0
    bg.jal 0x2aca43
    bt.mov r18, r3
    bt.mov r19, r4
loc_2067b1:
    bt.mov r3, r18
    bt.mov r4, r19
    bt.movi r5, 0x0
    bg.movhi r6, 0x3ff0
    bg.jal 0x2ad39d
    bg.blesi r3, -0x1, loc_206910
    bt.mov r3, r18
    bt.mov r4, r19
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2ad2df
    bg.bgtsi r3, 0x0, loc_206910
    bt.mov r3, r10
    bt.mov r4, r11
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2acd5b
    bt.mov r10, r3
    bt.mov r11, r4
    bt.mov r3, r12
    bt.mov r4, r13
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2acd5b
    bt.mov r12, r3
    bt.mov r13, r4
    bt.mov r3, r14
    bt.mov r4, r15
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2acd5b
    bt.mov r14, r3
    bt.mov r15, r4
    bt.mov r3, r16
    bt.mov r4, r17
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2acd5b
    bn.sw 0x0(r1), r3
    bn.sw 0x4(r1), r4
    bn.lwz r3, 0x38(r1)
    bn.lwz r4, 0x3c(r1)
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2acd5b
    bn.sw 0x8(r1), r3
    bn.sw 0xc(r1), r4
    bn.lwz r3, 0x40(r1)
    bn.lwz r4, 0x44(r1)
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2acd5b
    bn.sw 0x10(r1), r3
    bn.sw 0x14(r1), r4
    bn.lwz r3, 0x48(r1)
    bn.lwz r4, 0x4c(r1)
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2acd5b
    bn.sw 0x18(r1), r3
    bn.sw 0x1c(r1), r4
    bn.lwz r3, 0x50(r1)
    bn.lwz r4, 0x54(r1)
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2acd5b
    bn.sw 0x20(r1), r3
    bn.sw 0x24(r1), r4
    bt.mov r3, r20
    bt.mov r4, r21
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2acd5b
    bn.sw 0x28(r1), r3
    bn.sw 0x2c(r1), r4
    bt.mov r3, r18
    bt.mov r4, r19
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2acd5b
    bn.sw 0x30(r1), r3
    bn.sw 0x34(r1), r4
    bt.mov r3, r10
    bt.mov r4, r11
    bt.mov r5, r12
    bt.mov r6, r13
    bt.mov r7, r14
    bt.mov r8, r15
    bg.jal 0x27fc15
    bg.movhi r11, 0x34
    bg.lwz r3, 0x428(r1)
    bg.jal 0x2acf9e
    bg.lwz r7, 0x428(r1)
    bn.bgtsi r7, -0x1, loc_2068f8
    bt.movi r5, 0x0
    bg.movhi r6, 0x41f0
    bg.jal 0x2aca43
loc_2068f8:
    bt.movi r5, 0x0
    bg.movhi r6, 0x40c3
    bg.ori r6, r6, 0x8800
    bg.jal 0x2acd5b
    bg.sw_0 0x2128(r11), r3
    bg.sw_0 0x212c(r11), r4
    bt.j loc_2069eb
loc_206910:
    bn.movhi_2 r7, 0x9d4
    bg.ori r7, r7, 0x9518
    bg.movhi r8, 0x3fd4
    bg.ori r8, r8, 0x2268
    bn.sw 0x0(r1), r7
    bn.sw 0x4(r1), r8
    bn.movhi_2 r7, 0x1758
    bg.ori r7, r7, 0xe219
    bg.movhi r8, 0x3fd0
    bg.ori r8, r8, 0xd1b7
    bn.sw 0x8(r1), r7
    bn.sw 0xc(r1), r8
    bg.movhi r7, 0x8b43
    bg.ori r7, r7, 0x9581
    bg.movhi r8, 0x3fe5
    bg.ori r8, r8, 0xe76c
    bn.sw 0x10(r1), r7
    bn.sw 0x14(r1), r8
    bn.movhi_2 r7, 0x902
    bg.ori r7, r7, 0xde01
    bg.movhi r8, 0x3fc3
    bg.ori r8, r8, 0x1f8a
    bn.sw 0x18(r1), r7
    bn.sw 0x1c(r1), r8
    bg.movhi r7, 0xd97f
    bg.ori r7, r7, 0x62b7
    bg.movhi r8, 0x3fa8
    bg.ori r8, r8, 0x793d
    bn.sw 0x20(r1), r7
    bn.sw 0x24(r1), r8
    bg.movhi r7, 0xc84b
    bg.ori r7, r7, 0x5dcc
    bg.movhi r8, 0x3fd3
    bg.ori r8, r8, 0x3d07
    bn.sw 0x28(r1), r7
    bn.sw 0x2c(r1), r8
    bg.movhi r7, 0xf34d
    bg.ori r7, r7, 0x6a16
    bg.movhi r8, 0x3fd4
    bg.ori r8, r8, 0x538e
    bn.sw 0x30(r1), r7
    bn.sw 0x34(r1), r8
    bt.movi r3, 0x0
    bg.movhi r4, 0x4089
    bg.ori r4, r4, 0x2800
    bg.movhi r5, 0x32ca
    bg.ori r5, r5, 0x57a8
    bg.movhi r6, 0x3fe6
    bg.ori r6, r6, 0xb1c4
    bg.movhi r7, 0x2824
    bg.ori r7, r7, 0xb78
    bg.movhi r8, 0x3fe5
    bg.ori r8, r8, 0x8c7e
    bg.jal 0x27fc15
    bg.movhi r11, 0x34
    bt.movi r7, 0x0
    bg.movhi r8, 0x4089
    bg.ori r8, r8, 0x2800
    bg.sw_0 0x2128(r11), r7
    bg.sw_0 0x212c(r11), r8
loc_2069eb:
    bn.addi r3, r1, 0x5a
    bg.jal 0x204555
    bn.addi r3, r1, 0x62
    bg.jal 0x27ed45
    bg.addi r10, r1, 0x450
    bt.mov r3, r10
    bg.jal 0x20451b
    bt.mov r3, r10
    bg.jal 0x27ed1b
    bn.j loc_2064e8
loc_206a0c:
    bn.movhi_2 r7, 0x9d4
    bg.ori r7, r7, 0x9518
    bg.movhi r8, 0x3fd4
    bg.ori r8, r8, 0x2268
    bn.sw 0x0(r1), r7
    bn.sw 0x4(r1), r8
    bn.movhi_2 r7, 0x1758
    bg.ori r7, r7, 0xe219
    bg.movhi r8, 0x3fd0
    bg.ori r8, r8, 0xd1b7
    bn.sw 0x8(r1), r7
    bn.sw 0xc(r1), r8
    bg.movhi r7, 0x8b43
    bg.ori r7, r7, 0x9581
    bg.movhi r8, 0x3fe5
    bg.ori r8, r8, 0xe76c
    bn.sw 0x10(r1), r7
    bn.sw 0x14(r1), r8
    bn.movhi_2 r7, 0x902
    bg.ori r7, r7, 0xde01
    bg.movhi r8, 0x3fc3
    bg.ori r8, r8, 0x1f8a
    bn.sw 0x18(r1), r7
    bn.sw 0x1c(r1), r8
    bg.movhi r7, 0xd97f
    bg.ori r7, r7, 0x62b7
    bg.movhi r8, 0x3fa8
    bg.ori r8, r8, 0x793d
    bn.sw 0x20(r1), r7
    bn.sw 0x24(r1), r8
    bg.movhi r7, 0xc84b
    bg.ori r7, r7, 0x5dcc
    bg.movhi r8, 0x3fd3
    bg.ori r8, r8, 0x3d07
    bn.sw 0x28(r1), r7
    bn.sw 0x2c(r1), r8
    bg.movhi r7, 0xf34d
    bg.ori r7, r7, 0x6a16
    bg.movhi r8, 0x3fd4
    bg.ori r8, r8, 0x538e
    bn.sw 0x30(r1), r7
    bn.sw 0x34(r1), r8
    bt.movi r3, 0x0
    bg.movhi r4, 0x4089
    bg.ori r4, r4, 0x2800
    bg.movhi r5, 0x32ca
    bg.ori r5, r5, 0x57a8
    bg.movhi r6, 0x3fe6
    bg.ori r6, r6, 0xb1c4
    bg.movhi r7, 0x2824
    bg.ori r7, r7, 0xb78
    bg.movhi r8, 0x3fe5
    bg.ori r8, r8, 0x8c7e
    bg.jal 0x27fc15
    bg.movhi r11, 0x34
    bt.movi r7, 0x0
    bg.movhi r8, 0x4089
    bg.ori r8, r8, 0x2800
    bg.sw_0 0x2128(r11), r7
    bg.sw_0 0x212c(r11), r8
    bg.jal 0x206427
    bn.j loc_2064e8
loc_206aee:
    bt.movi r5, 0x0
    bg.movhi r6, 0x41f0
    bg.jal 0x2aca43
    bt.mov r10, r3
    bt.mov r11, r4
    bn.j loc_206550
loc_206aff:
    bt.movi r5, 0x0
    bg.movhi r6, 0x41f0
    bg.jal 0x2aca43
    bt.mov r12, r3
    bt.mov r13, r4
    bn.j loc_206590
loc_206b10:
    bt.movi r5, 0x0
    bg.movhi r6, 0x41f0
    bg.jal 0x2aca43
    bt.mov r14, r3
    bt.mov r15, r4
    bn.j loc_2065cc
loc_206b21:
    bt.movi r5, 0x0
    bg.movhi r6, 0x41f0
    bg.jal 0x2aca43
    bt.mov r16, r3
    bt.mov r17, r4
    bn.j loc_206608
loc_206b32:
    bt.movi r5, 0x0
    bg.movhi r6, 0x41f0
    bg.jal 0x2aca43
    bn.sw 0x38(r1), r3
    bn.sw 0x3c(r1), r4
    bn.j loc_206646
loc_206b45:
    bt.movi r5, 0x0
    bg.movhi r6, 0x41f0
    bg.jal 0x2aca43
    bn.sw 0x40(r1), r3
    bn.sw 0x44(r1), r4
    bn.j loc_206688
loc_206b58:
    bt.movi r5, 0x0
    bg.movhi r6, 0x41f0
    bg.jal 0x2aca43
    bn.sw 0x48(r1), r3
    bn.sw 0x4c(r1), r4
    bn.j loc_2066ca
