# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x25256d,0x2528dd); byte-exact only; hardware untested.
    bg.addi r1, r1, -0x1f0
    bg.sw_0 0x1ec(r1), r9
    bg.sw_0 0x1e8(r1), r10
    bg.sw_0 0x1e4(r1), r11
    bg.sw_0 0x1e0(r1), r12
    bg.sw_0 0x1dc(r1), r13
    bg.sw_0 0x1d8(r1), r14
    bg.sw_0 0x1d4(r1), r15
    bg.sw_0 0x1d0(r1), r16
    bt.mov r10, r3
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
    bg.beqi r12, 0x1, loc_2527b7
    bg.beqi r12, 0x2, loc_2527fc
    bg.sfgti r10, 0xa00
    bn.bf loc_25276d
    bg.movhi r7, 0x32
    bg.addi r7, r7, -0x3488
    bg.sw_0 0xec(r1), r7
    bg.movhi r7, 0x32
    bg.addi r7, r7, 0x5e03
    bg.sw_0 0x1a4(r1), r7
loc_2525d8:
    bg.movhi r7, 0x2f
    bg.addi r5, r7, -0x205e
loc_2525e0:
    bg.movhi r7, 0x32
    bg.addi r7, r7, 0x5dd4
    bg.sw_0 0x1a8(r1), r7
    bn.ori r13, r0, 0x41
    bg.sbz 0xe8(r1), r13
    bn.addi r7, r0, -0x64
    bg.sbz 0xe9(r1), r7
    bg.movhi r7, 0x31
    bg.addi r7, r7, -0x2980
    bg.sw_0 0xf0(r1), r7
    bg.movhi r7, 0x2f
    bg.addi r7, r7, -0x1dc0
    bg.sw_0 0xf4(r1), r7
    bt.movi r7, 0x2
    bg.sbz 0xf8(r1), r7
    bt.movi r6, 0x3
    bg.sbz 0xf9(r1), r6
    bg.sbz 0xfa(r1), r6
    bg.sbz 0xfb(r1), r6
    bt.movi r7, 0x1
    bg.sbz 0xfc(r1), r7
    bg.movhi r7, 0x32
    bg.addi r7, r7, 0x424c
    bg.sw_0 0x100(r1), r7
    bg.movhi r7, 0x32
    bg.addi r7, r7, 0x427e
    bg.sw_0 0x104(r1), r7
    bg.movhi r7, 0x32
    bg.addi r7, r7, 0x42c9
    bg.sw_0 0x108(r1), r7
    bg.movhi r7, 0x32
    bg.addi r7, r7, 0x4314
    bg.sw_0 0x10c(r1), r7
    bg.movhi r7, 0x32
    bg.addi r7, r7, 0x435f
    bg.sw_0 0x110(r1), r7
    bg.movhi r7, 0x32
    bg.addi r7, r7, 0x424e
    bg.sw_0 0x114(r1), r7
    bg.movhi r7, 0x32
    bg.addi r7, r7, 0x4281
    bg.sw_0 0x118(r1), r7
    bg.movhi r7, 0x32
    bg.addi r7, r7, 0x42cc
    bg.sw_0 0x11c(r1), r7
    bg.movhi r7, 0x32
    bg.addi r7, r7, 0x4317
    bg.sw_0 0x120(r1), r7
    bg.movhi r7, 0x32
    bg.addi r7, r7, 0x4360
    bg.sw_0 0x124(r1), r7
    bt.movi r11, 0x4
    bg.sbz 0x128(r1), r11
    bg.sbz 0x133(r1), r6
    bg.movhi r7, 0x32
    bg.addi r7, r7, 0x436c
    bg.sw_0 0x14c(r1), r7
    bg.movhi r7, 0x32
    bg.addi r7, r7, 0x4376
    bg.sw_0 0x178(r1), r7
    bt.movi r7, 0xd
    bg.sbz 0x129(r1), r7
    bt.movi r7, 0x7
    bg.sbz 0x134(r1), r7
    bg.movhi r7, 0x32
    bg.addi r7, r7, 0x436f
    bg.sw_0 0x150(r1), r7
    bg.movhi r7, 0x32
    bg.addi r7, r7, 0x4682
    bg.sw_0 0x17c(r1), r7
    bg.sw_0 0x1b4(r1), r5
    bt.mov r3, r14
    bg.jal 0x24a00b
    bg.beqi r16, 0x0, loc_252796
loc_2526f8:
    bt.mov r3, r1
    bt.mov r4, r14
    bn.ori r5, r0, 0xe8
    bg.jal 0x2aab1e
    bn.sbz 0x0(r1), r13
    bn.sbz 0x1(r1), r11
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x6a7c
    bn.sw 0x8(r1), r7
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x6a6c
    bn.sw 0xc(r1), r7
    bn.beqi r12, 0x1, loc_25279c
    bg.beqi r12, 0x2, loc_252824
    bg.sfgti r10, 0xa00
    bn.bf loc_2527e8
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x6db8
    bn.sw 0x4(r1), r7
loc_252738:
    bt.mov r3, r1
    bg.jal 0x24ab9f
    bn.bnei r16, 0x0, loc_252745
    bg.jal 0x24b454
loc_252745:
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
loc_25276d:
    bg.sfgti r10, 0xf00
    bn.bnf loc_252867
    bg.movhi r7, 0x31
    bg.addi r7, r7, -0x2230
    bg.sw_0 0xec(r1), r7
    bg.movhi r7, 0x32
    bg.addi r7, r7, 0x5d9d
    bg.sw_0 0x1a4(r1), r7
loc_25278c:
    bg.movhi r7, 0x2f
    bg.addi r5, r7, -0x1f6e
    bt.j loc_2525e0
loc_252796:
    bg.jal 0x24a967
    bt.j loc_2526f8
loc_25279c:
    bg.sfgti r10, 0xa00
    bn.bnf loc_25285a
    bg.sfgti r10, 0xf00
    bn.bf loc_252738
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x6bb0
    bn.sw 0x4(r1), r7
    bt.j loc_252738
loc_2527b7:
    bg.sfgti r10, 0xa00
    bn.bnf loc_25283f
    bg.sfgti r10, 0xf00
    bn.bf loc_2528a9
    bg.movhi r7, 0x31
    bg.addi r7, r7, 0x7c40
    bg.sw_0 0xec(r1), r7
    bg.movhi r7, 0x32
    bg.addi r7, r7, 0x5de1
    bg.sw_0 0x1a4(r1), r7
loc_2527dd:
    bg.movhi r7, 0x2f
    bg.addi r5, r7, -0x1fe6
    bn.j loc_2525e0
loc_2527e8:
    bg.sfgti r10, 0xf00
    bn.bf loc_252738
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x6aac
    bn.sw 0x4(r1), r7
    bt.j loc_252738
loc_2527fc:
    bg.sfgti r10, 0xa00
    bn.bnf loc_25288e
    bg.sfgti r10, 0xf00
    bn.bf loc_2528c3
    bg.movhi r7, 0x32
    bg.addi r7, r7, -0x5c24
    bg.sw_0 0xec(r1), r7
    bg.movhi r7, 0x32
    bg.addi r7, r7, 0x5df2
    bg.sw_0 0x1a4(r1), r7
    bt.j loc_2527dd
loc_252824:
    bg.sfgti r10, 0xa00
    bn.bnf loc_252881
    bg.sfgti r10, 0xf00
    bn.bf loc_252738
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x6cb4
    bn.sw 0x4(r1), r7
    bt.j loc_252738
loc_25283f:
    bg.movhi r7, 0x32
    bg.addi r7, r7, -0xcec
    bg.sw_0 0xec(r1), r7
    bg.movhi r7, 0x32
    bg.addi r7, r7, 0x5e14
    bg.sw_0 0x1a4(r1), r7
    bn.j loc_2525d8
loc_25285a:
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x6ebc
    bn.sw 0x4(r1), r7
    bt.j loc_252738
loc_252867:
    bg.movhi r7, 0x31
    bg.addi r7, r7, 0x54a4
    bg.sw_0 0xec(r1), r7
    bg.movhi r7, 0x32
    bg.addi r7, r7, 0x5dd0
    bg.sw_0 0x1a4(r1), r7
    bt.j loc_2527dd
loc_252881:
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x6fc0
    bn.sw 0x4(r1), r7
    bt.j loc_252738
loc_25288e:
    bg.movhi r7, 0x32
    bg.addi r7, r7, 0x1ab0
    bg.sw_0 0xec(r1), r7
    bg.movhi r7, 0x32
    bg.addi r7, r7, 0x5e25
    bg.sw_0 0x1a4(r1), r7
    bn.j loc_2525d8
loc_2528a9:
    bg.movhi r7, 0x31
    bg.addi r7, r7, 0x56c
    bg.sw_0 0xec(r1), r7
    bg.movhi r7, 0x32
    bg.addi r7, r7, 0x5dae
    bg.sw_0 0x1a4(r1), r7
    bt.j loc_25278c
loc_2528c3:
    bg.movhi r7, 0x31
    bg.addi r7, r7, 0x2d08
    bg.sw_0 0xec(r1), r7
    bg.movhi r7, 0x32
    bg.addi r7, r7, 0x5dbf
    bg.sw_0 0x1a4(r1), r7
    bt.j loc_25278c
