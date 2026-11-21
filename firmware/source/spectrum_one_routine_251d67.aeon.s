# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x251d67,0x25256d); byte-exact only; hardware untested.
    bg.addi r1, r1, -0x1f0
    bg.sw_0 0x1ec(r1), r9
    bg.sw_0 0x1e8(r1), r10
    bg.sw_0 0x1e4(r1), r11
    bg.sw_0 0x1e0(r1), r12
    bg.sw_0 0x1dc(r1), r13
    bg.sw_0 0x1d8(r1), r14
    bg.sw_0 0x1d4(r1), r15
    bg.sw_0 0x1d0(r1), r16
    bt.mov r11, r3
    bt.mov r12, r4
    bt.mov r16, r5
    bg.addi r14, r1, 0xe8
    bt.mov r3, r14
    bt.movi r4, 0x0
    bn.ori r5, r0, 0xe8
    bg.jal 0x2a941f
    bt.mov r3, r1
    bt.movi r4, 0x0
    bn.ori r5, r0, 0xe8
    bg.jal 0x2a941f
    bg.beqi r12, 0x1, loc_252170
    bg.beqi r12, 0x2, loc_252215
    bg.sfleui r11, 0xa00
    bn.bnf loc_2520c5
    bg.movhi r7, 0x2d
    bg.addi r7, r7, 0xb1c
    bg.sw_0 0xec(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x20a2
    bg.sw_0 0x1a4(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2098
    bg.sw_0 0x1a8(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x208a
    bg.sw_0 0x1b0(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2086
    bg.sw_0 0x1b4(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2084
    bg.sw_0 0x1b8(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2082
    bg.sw_0 0x1bc(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2080
    bg.sw_0 0x1c0(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x207e
    bg.sw_0 0x1c4(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x207c
    bg.sw_0 0x1c8(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x208b
loc_251e3a:
    bg.sw_0 0x1ac(r1), r7
    bn.ori r13, r0, 0x41
    bg.sbz 0xe8(r1), r13
    bn.addi r7, r0, -0x57
    bg.sbz 0xe9(r1), r7
    bg.movhi r7, 0x2d
    bg.addi r7, r7, 0x330
    bg.sw_0 0xf0(r1), r7
    bg.movhi r7, 0x2b
    bg.addi r7, r7, 0x2f4
    bg.sw_0 0xf4(r1), r7
    bt.movi r6, 0x2
    bg.sbz 0xf8(r1), r6
    bt.movi r4, 0x3
    bg.sbz 0xf9(r1), r4
    bg.sbz 0xfa(r1), r4
    bg.sbz 0xfb(r1), r4
    bt.movi r23, 0x1
    bg.sbz 0xfc(r1), r23
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x72b3
    bg.sw_0 0x100(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x7281
    bg.sw_0 0x104(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x7236
    bg.sw_0 0x108(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x71eb
    bg.sw_0 0x10c(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x71a0
    bg.sw_0 0x110(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x72b1
    bg.sw_0 0x114(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x727e
    bg.sw_0 0x118(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x7233
    bg.sw_0 0x11c(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x71e8
    bg.sw_0 0x120(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x719f
    bg.sw_0 0x124(r1), r7
    bn.ori r7, r0, 0x1c
    bg.sbz 0x128(r1), r7
    bt.movi r10, 0x4
    bg.sbz 0x133(r1), r10
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x7193
    bg.sw_0 0x14c(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x7160
    bg.sw_0 0x178(r1), r7
    bt.movi r7, 0xd
    bg.sbz 0x129(r1), r7
    bt.movi r5, 0x7
    bg.sbz 0x134(r1), r5
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x718f
    bg.sw_0 0x150(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x54f0
    bg.sw_0 0x17c(r1), r7
    bg.sbz 0x12b(r1), r10
    bg.sbz 0x136(r1), r5
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x7185
    bg.sw_0 0x158(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x36fa
    bg.sw_0 0x184(r1), r7
    bg.sbz 0x12c(r1), r6
    bg.sbz 0x137(r1), r10
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x717e
    bg.sw_0 0x15c(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2fde
    bg.sw_0 0x188(r1), r7
    bg.sbz 0x12d(r1), r6
    bg.sbz 0x138(r1), r23
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x717a
    bg.sw_0 0x160(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2dd6
    bg.sw_0 0x18c(r1), r7
    bg.sbz 0x12f(r1), r6
    bg.sbz 0x13a(r1), r10
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x7171
    bg.sw_0 0x168(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2944
    bg.sw_0 0x194(r1), r7
    bg.sbz 0x12e(r1), r6
    bt.movi r7, 0x8
    bg.sbz 0x139(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x7179
    bg.sw_0 0x164(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2d54
    bg.sw_0 0x190(r1), r7
    bg.sbz 0x130(r1), r6
    bt.movi r7, 0x6
    bg.sbz 0x13b(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x716d
    bg.sw_0 0x16c(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x273c
    bg.sw_0 0x198(r1), r7
    bg.sbz 0x131(r1), r6
    bg.sbz 0x13c(r1), r5
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x7167
    bg.sw_0 0x170(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2430
    bg.sw_0 0x19c(r1), r7
    bt.movi r7, 0x9
    bg.sbz 0x12a(r1), r7
    bg.sbz 0x135(r1), r4
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x7188
    bg.sw_0 0x154(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x3dd5
    bg.sw_0 0x180(r1), r7
    bt.mov r3, r14
    bg.jal 0x2488ff
    bg.beqi r16, 0x0, loc_25214f
loc_25204f:
    bt.mov r3, r1
    bt.mov r4, r14
    bn.ori r5, r0, 0xe8
    bg.jal 0x2aab1e
    bn.sbz 0x0(r1), r13
    bn.sbz 0x1(r1), r10
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x6090
    bn.sw 0x8(r1), r7
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x5a58
    bn.sw 0xc(r1), r7
    bg.beqi r12, 0x1, loc_252155
    bg.beqi r12, 0x2, loc_2522a6
    bg.sfgti r11, 0xa00
    bn.bf loc_252201
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x63cc
    bn.sw 0x4(r1), r7
loc_252090:
    bt.mov r3, r1
    bg.jal 0x249493
    bn.bnei r16, 0x0, loc_25209d
    bg.jal 0x249d48
loc_25209d:
    bt.movi r3, 0x1
    bg.lwz r16, 0x1d0(r1)
    bg.lwz r15, 0x1d4(r1)
    bg.lwz r14, 0x1d8(r1)
    bg.lwz r13, 0x1dc(r1)
    bg.lwz r12, 0x1e0(r1)
    bg.lwz r11, 0x1e4(r1)
    bg.lwz r10, 0x1e8(r1)
    bg.lwz r9, 0x1ec(r1)
    bg.addi r1, r1, 0x1f0
    bt.jr r9
loc_2520c5:
    bg.sfleui r11, 0xf00
    bn.bnf loc_252353
    bg.movhi r7, 0x2e
    bg.addi r7, r7, -0x7429
    bg.sw_0 0xec(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x202a
    bg.sw_0 0x1a4(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2020
    bg.sw_0 0x1a8(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2012
    bg.sw_0 0x1b0(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x200e
    bg.sw_0 0x1b4(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x200c
    bg.sw_0 0x1b8(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x200a
    bg.sw_0 0x1bc(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2008
    bg.sw_0 0x1c0(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2006
    bg.sw_0 0x1c4(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2004
    bg.sw_0 0x1c8(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2013
    bn.j loc_251e3a
loc_25214f:
    bg.jal 0x24925b
    bt.j loc_25204f
loc_252155:
    bg.sfgti r11, 0xa00
    bn.bnf loc_252345
    bg.sfgti r11, 0xf00
    bn.bf loc_252090
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x61c4
    bn.sw 0x4(r1), r7
    bt.j loc_252090
loc_252170:
    bg.sfleui r11, 0xa00
    bn.bf loc_2522c2
    bg.sfleui r11, 0xf00
    bn.bf loc_252467
    bg.movhi r7, 0x2e
    bg.addi r7, r7, 0x377b
    bg.sw_0 0xec(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1f8a
    bg.sw_0 0x1a4(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1f80
    bg.sw_0 0x1a8(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1f72
    bg.sw_0 0x1b0(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1f6e
    bg.sw_0 0x1b4(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1f6c
    bg.sw_0 0x1b8(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1f6a
    bg.sw_0 0x1bc(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1f68
    bg.sw_0 0x1c0(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1f66
    bg.sw_0 0x1c4(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1f64
    bg.sw_0 0x1c8(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1f73
    bn.j loc_251e3a
loc_252201:
    bg.sfgti r11, 0xf00
    bn.bf loc_252090
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x60c0
    bn.sw 0x4(r1), r7
    bt.j loc_252090
loc_252215:
    bg.sfleui r11, 0xa00
    bn.bf loc_2523d6
    bg.sfleui r11, 0xf00
    bn.bf loc_2524ea
    bg.movhi r7, 0x2e
    bg.addi r7, r7, 0x6264
    bg.sw_0 0xec(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1f62
    bg.sw_0 0x1a4(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1f58
    bg.sw_0 0x1a8(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1f4a
    bg.sw_0 0x1b0(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1f46
    bg.sw_0 0x1b4(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1f44
    bg.sw_0 0x1b8(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1f42
    bg.sw_0 0x1bc(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1f40
    bg.sw_0 0x1c0(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1f3e
    bg.sw_0 0x1c4(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1f3c
    bg.sw_0 0x1c8(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1f4b
    bn.j loc_251e3a
loc_2522a6:
    bg.sfgti r11, 0xa00
    bn.bnf loc_252459
    bg.sfgti r11, 0xf00
    bn.bf loc_252090
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x62c8
    bn.sw 0x4(r1), r7
    bn.j loc_252090
loc_2522c2:
    bg.movhi r7, 0x2d
    bg.addi r7, r7, 0x3605
    bg.sw_0 0xec(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x207a
    bg.sw_0 0x1a4(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2070
    bg.sw_0 0x1a8(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2062
    bg.sw_0 0x1b0(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x205e
    bg.sw_0 0x1b4(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x205c
    bg.sw_0 0x1b8(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x205a
    bg.sw_0 0x1bc(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2058
    bg.sw_0 0x1c0(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2056
    bg.sw_0 0x1c4(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2054
    bg.sw_0 0x1c8(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2063
    bn.j loc_251e3a
loc_252345:
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x64d0
    bn.sw 0x4(r1), r7
    bn.j loc_252090
loc_252353:
    bg.movhi r7, 0x2e
    bg.addi r7, r7, 0xc92
    bg.sw_0 0xec(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1fb2
    bg.sw_0 0x1a4(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1fa8
    bg.sw_0 0x1a8(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1f9a
    bg.sw_0 0x1b0(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1f96
    bg.sw_0 0x1b4(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1f94
    bg.sw_0 0x1b8(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1f92
    bg.sw_0 0x1bc(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1f90
    bg.sw_0 0x1c0(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1f8e
    bg.sw_0 0x1c4(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1f8c
    bg.sw_0 0x1c8(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1f9b
    bn.j loc_251e3a
loc_2523d6:
    bg.movhi r7, 0x2d
    bg.addi r7, r7, 0x60ee
    bg.sw_0 0xec(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2052
    bg.sw_0 0x1a4(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2048
    bg.sw_0 0x1a8(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x203a
    bg.sw_0 0x1b0(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2036
    bg.sw_0 0x1b4(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2034
    bg.sw_0 0x1b8(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2032
    bg.sw_0 0x1bc(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2030
    bg.sw_0 0x1c0(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x202e
    bg.sw_0 0x1c4(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x202c
    bg.sw_0 0x1c8(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x203b
    bn.j loc_251e3a
loc_252459:
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x65d4
    bn.sw 0x4(r1), r7
    bn.j loc_252090
loc_252467:
    bg.movhi r7, 0x2e
    bg.addi r7, r7, -0x4940
    bg.sw_0 0xec(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x2002
    bg.sw_0 0x1a4(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1ff8
    bg.sw_0 0x1a8(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1fea
    bg.sw_0 0x1b0(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1fe6
    bg.sw_0 0x1b4(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1fe4
    bg.sw_0 0x1b8(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1fe2
    bg.sw_0 0x1bc(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1fe0
    bg.sw_0 0x1c0(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1fde
    bg.sw_0 0x1c4(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1fdc
    bg.sw_0 0x1c8(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1feb
    bn.j loc_251e3a
loc_2524ea:
    bg.movhi r7, 0x2e
    bg.addi r7, r7, -0x1e57
    bg.sw_0 0xec(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1fda
    bg.sw_0 0x1a4(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1fd0
    bg.sw_0 0x1a8(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1fc2
    bg.sw_0 0x1b0(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1fbe
    bg.sw_0 0x1b4(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1fbc
    bg.sw_0 0x1b8(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1fba
    bg.sw_0 0x1bc(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1fb8
    bg.sw_0 0x1c0(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1fb6
    bg.sw_0 0x1c4(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1fb4
    bg.sw_0 0x1c8(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1fc3
    bn.j loc_251e3a
