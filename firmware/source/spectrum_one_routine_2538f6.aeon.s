# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2538f6,0x253c6f); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r11, r3
    bt.mov r10, r4
    bg.movhi r12, 0x45
    bt.mov r13, r12
    bg.lhz r7, 0x7644(r12)
    bn.andi r7, r7, 0x8
    bn.bnei r7, 0x0, loc_253983
loc_25391c:
    bn.bnei r11, 0x0, loc_253962
    bn.beqi r10, 0x0, loc_253991
    bg.beqi r10, 0xa, loc_253a09
    bg.beqi r10, 0x1, loc_253a43
    bg.beqi r10, 0x2, loc_253a99
    bg.beqi r10, 0x3, loc_253aab
    bg.beqi r10, 0x4, loc_253a55
    bg.beqi r10, 0x5, loc_253afa
    bg.beqi r10, 0x6, loc_253b3e
    bg.beqi r10, 0x7, loc_253b82
    bg.beqi r10, 0x8, loc_253bab
    bg.beqi r10, 0x9, loc_253be3
    bn.sfnei r10, 0x14
    bn.bf loc_25396f
    bg.lhz r7, 0x7644(r13)
    bn.andi r7, r7, 0x8
    bg.bnei r7, 0x0, loc_253c52
loc_25395b:
    bt.movi r3, 0x0
    bn.ori r4, r0, 0x1c
    bt.j loc_2539a9
loc_253962:
    bn.beqi r11, 0x1, loc_2539dd
    bg.lhz r7, 0x7644(r12)
    bn.andi r7, r7, 0x8
    bn.bnei r7, 0x0, loc_2539bf
loc_25396f:
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
loc_253983:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x357c
    bg.jal 0x2a9310
    bt.j loc_25391c
loc_253991:
    bg.lhz r7, 0x7644(r12)
    bn.andi r7, r7, 0x8
    bn.bnei r7, 0x0, loc_2539fb
loc_25399b:
    bt.movi r3, 0x0
    bt.movi r4, 0x0
    bt.movi r5, 0x0
loc_2539a1:
    bg.jal 0x252c92
    bt.mov r4, r3
    bt.movi r3, 0x0
loc_2539a9:
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bg.j 0x253793
loc_2539bf:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x358e
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bg.j 0x2a93a3
loc_2539dd:
    bn.bnei r10, 0x0, loc_253a1c
    bg.lhz r7, 0x7644(r12)
    bn.andi r7, r7, 0x8
    bg.bnei r7, 0x0, loc_253ad4
loc_2539eb:
    bt.movi r3, 0x1
    bt.movi r4, 0x0
    bt.movi r5, 0x0
    bg.jal 0x252c92
    bt.mov r4, r3
    bt.movi r3, 0x1
    bt.j loc_2539a9
loc_2539fb:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3705
    bg.jal 0x2a93a3
    bt.j loc_25399b
loc_253a09:
    bg.lhz r7, 0x7644(r12)
    bn.andi r7, r7, 0x8
    bg.bnei r7, 0x0, loc_253ac6
loc_253a14:
    bt.movi r3, 0x0
    bt.movi r4, 0x0
    bt.movi r5, 0x7
    bt.j loc_2539a1
loc_253a1c:
    bg.beqi r10, 0xa, loc_253ae2
    bg.beqi r10, 0x7, loc_253a7e
    bg.beqi r10, 0x8, loc_253b23
    bg.beqi r10, 0x9, loc_253b67
    bn.sfnei r10, 0x14
    bn.bf loc_25396f
    bg.lhz r7, 0x7644(r12)
    bn.andi r7, r7, 0x8
    bg.bnei r7, 0x0, loc_253c1a
loc_253a3d:
    bt.movi r3, 0x1
    bt.movi r4, 0x4
    bt.j loc_2539a9
loc_253a43:
    bg.lhz r7, 0x7644(r12)
    bn.andi r7, r7, 0x8
    bn.bnei r7, 0x0, loc_253a70
loc_253a4d:
    bt.movi r3, 0x0
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bt.j loc_2539a1
loc_253a55:
    bg.lhz r7, 0x7644(r12)
    bn.andi r7, r7, 0x8
    bg.bnei r7, 0x0, loc_253b9d
loc_253a60:
    bt.movi r3, 0x0
    bt.movi r4, 0x0
    bt.movi r5, 0x4
    bg.jal 0x252c92
    bt.mov r4, r3
    bt.movi r3, 0x0
    bt.j loc_2539a9
loc_253a70:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x356a
    bg.jal 0x2a93a3
    bt.j loc_253a4d
loc_253a7e:
    bg.lhz r7, 0x7644(r12)
    bn.andi r7, r7, 0x8
    bg.bnei r7, 0x0, loc_253bc7
loc_253a89:
    bt.movi r3, 0x1
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x252c92
    bt.mov r4, r3
    bt.movi r3, 0x1
    bt.j loc_2539a9
loc_253a99:
    bg.lhz r7, 0x7644(r12)
    bn.andi r7, r7, 0x8
    bn.bnei r7, 0x0, loc_253b15
loc_253aa3:
    bt.movi r3, 0x0
    bt.movi r4, 0x0
    bt.movi r5, 0x2
    bt.j loc_2539a1
loc_253aab:
    bg.lhz r7, 0x7644(r12)
    bn.andi r7, r7, 0x8
    bg.bnei r7, 0x0, loc_253b59
loc_253ab6:
    bt.movi r3, 0x0
    bt.movi r4, 0x0
    bt.movi r5, 0x3
    bg.jal 0x252c92
    bt.mov r4, r3
    bt.movi r3, 0x0
    bt.j loc_2539a9
loc_253ac6:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3701
    bg.jal 0x2a93a3
    bt.j loc_253a14
loc_253ad4:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3705
    bg.jal 0x2a93a3
    bt.j loc_2539eb
loc_253ae2:
    bg.lhz r7, 0x7644(r12)
    bn.andi r7, r7, 0x8
    bn.beqi r7, 0x0, loc_253a89
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3701
    bg.jal 0x2a93a3
    bt.j loc_253a89
loc_253afa:
    bg.lhz r7, 0x7644(r12)
    bn.andi r7, r7, 0x8
    bg.bnei r7, 0x0, loc_253bd5
loc_253b05:
    bt.movi r3, 0x0
    bt.movi r4, 0x0
    bt.movi r5, 0x5
    bg.jal 0x252c92
    bt.mov r4, r3
    bt.movi r3, 0x0
    bt.j loc_2539a9
loc_253b15:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x355e
    bg.jal 0x2a93a3
    bt.j loc_253aa3
loc_253b23:
    bg.lhz r7, 0x7644(r12)
    bn.andi r7, r7, 0x8
    bg.bnei r7, 0x0, loc_253bfe
loc_253b2e:
    bt.movi r3, 0x1
    bt.movi r4, 0x0
    bt.movi r5, 0x2
    bg.jal 0x252c92
    bt.mov r4, r3
    bt.movi r3, 0x1
    bt.j loc_2539a9
loc_253b3e:
    bg.lhz r7, 0x7644(r12)
    bn.andi r7, r7, 0x8
    bg.bnei r7, 0x0, loc_253c0c
loc_253b49:
    bt.movi r3, 0x0
    bt.movi r4, 0x0
    bt.movi r5, 0x6
    bg.jal 0x252c92
    bt.mov r4, r3
    bt.movi r3, 0x0
    bt.j loc_2539a9
loc_253b59:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3553
    bg.jal 0x2a93a3
    bt.j loc_253ab6
loc_253b67:
    bg.lhz r7, 0x7644(r12)
    bn.andi r7, r7, 0x8
    bg.bnei r7, 0x0, loc_253c28
loc_253b72:
    bt.movi r3, 0x1
    bt.movi r4, 0x0
    bt.movi r5, 0x3
    bg.jal 0x252c92
    bt.mov r4, r3
    bt.movi r3, 0x1
    bt.j loc_2539a9
loc_253b82:
    bg.lhz r7, 0x7644(r13)
    bn.andi r7, r7, 0x8
    bg.bnei r7, 0x0, loc_253c36
loc_253b8d:
    bt.movi r3, 0x0
    bt.movi r4, 0x0
    bt.movi r5, 0x7
    bg.jal 0x252c92
    bt.mov r4, r3
    bt.movi r3, 0x0
    bt.j loc_2539a9
loc_253b9d:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3548
    bg.jal 0x2a93a3
    bt.j loc_253a60
loc_253bab:
    bg.lhz r7, 0x7644(r13)
    bn.andi r7, r7, 0x8
    bg.bnei r7, 0x0, loc_253c44
loc_253bb6:
    bt.movi r3, 0x0
    bt.movi r4, 0x0
    bt.movi r5, 0x8
    bg.jal 0x252c92
    bt.mov r4, r3
    bt.movi r3, 0x0
    bn.j loc_2539a9
loc_253bc7:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x36fc
    bg.jal 0x2a93a3
    bt.j loc_253a89
loc_253bd5:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3542
    bg.jal 0x2a93a3
    bt.j loc_253b05
loc_253be3:
    bg.lhz r7, 0x7644(r13)
    bn.andi r7, r7, 0x8
    bn.bnei r7, 0x0, loc_253c61
loc_253bed:
    bt.movi r3, 0x0
    bt.movi r4, 0x0
    bt.movi r5, 0x9
    bg.jal 0x252c92
    bt.mov r4, r3
    bt.movi r3, 0x0
    bn.j loc_2539a9
loc_253bfe:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x36f8
    bg.jal 0x2a93a3
    bt.j loc_253b2e
loc_253c0c:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x353c
    bg.jal 0x2a93a3
    bt.j loc_253b49
loc_253c1a:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x36ef
    bg.jal 0x2a93a3
    bt.j loc_253a3d
loc_253c28:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x36f4
    bg.jal 0x2a93a3
    bt.j loc_253b72
loc_253c36:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x36fc
    bg.jal 0x2a93a3
    bt.j loc_253b8d
loc_253c44:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x36f8
    bg.jal 0x2a93a3
    bt.j loc_253bb6
loc_253c52:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x36ef
    bg.jal 0x2a93a3
    bn.j loc_25395b
loc_253c61:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x36f4
    bg.jal 0x2a93a3
    bt.j loc_253bed
