# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x251355,0x251d67); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x24
    bn.sw 0x20(r1), r9
    bn.sw 0x1c(r1), r10
    bn.sw 0x18(r1), r11
    bn.sw 0x14(r1), r12
    bn.sw 0x10(r1), r13
    bn.sw 0xc(r1), r14
    bn.sw 0x8(r1), r15
    bn.sw 0x4(r1), r16
    bn.sw 0x0(r1), r17
    bt.mov r17, r3
    bt.mov r11, r5
    bt.mov r12, r6
    bt.mov r13, r7
    bt.mov r14, r8
    bn.lwz r16, 0x24(r1)
    bg.movhi r15, 0x45
    bg.sh 0x7640(r15), r0
    bt.movi r7, 0x4
    bn.sbz 0x0(r16), r7
    bn.bnei r3, 0x0, loc_2513bb
    bn.bnei r5, 0x0, loc_2513bb
    bn.ori r7, r0, 0x10
    bn.sbz 0x0(r13), r7
loc_251399:
    bt.movi r3, 0x1
    bn.lwz r17, 0x0(r1)
    bn.lwz r16, 0x4(r1)
    bn.lwz r15, 0x8(r1)
    bn.lwz r14, 0xc(r1)
    bn.lwz r13, 0x10(r1)
    bn.lwz r12, 0x14(r1)
    bn.lwz r11, 0x18(r1)
    bn.lwz r10, 0x1c(r1)
    bn.lwz r9, 0x20(r1)
    bn.addi r1, r1, 0x24
    bt.jr r9
loc_2513bb:
    bg.bnei r4, 0x0, loc_25143f
    bn.ff1 r7, r17
    bt.addi r7, -0x1
    bn.srli r10, r7, 0x1f
    bt.mov r3, r10
    bn.ori r4, r0, 0x2a
    bg.jal 0x2476b9
    bg.beq r11, r3, loc_2514ec
    bt.mov r3, r10
    bn.ori r4, r0, 0x2b
    bg.jal 0x2476b9
    bg.movhi r10, 0x45
    bg.beq r11, r3, loc_251531
loc_2513e5:
    bg.beqi r12, 0x1, loc_251516
loc_2513e9:
    bg.beqi r12, 0x2, loc_251584
    bn.ori r7, r0, 0x18
    bn.sbz 0x0(r13), r7
    bg.lhz r7, 0x7644(r10)
    bn.andi r7, r7, 0x20
    bg.bnei r7, 0x0, loc_2515b5
loc_2513fe:
    bg.movhi r7, 0x3b
    bg.lwz r3, 0x7430(r7)
    bg.movhi r7, 0x2a80
    bn.ori r7, r7, 0x4
    bt.add r3, r7
    bg.jal 0x23df85
loc_251413:
    bn.bnei r17, 0x1, loc_251399
    bg.movhi r7, 0x49
    bg.lbz r7, -0x58cb(r7)
    bg.beqi r7, 0x0, loc_251399
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bg.bnei r7, 0x0, loc_2515a7
loc_251431:
    bn.lbz r7, 0x0(r16)
    bn.sfgtui r7, 0x5
    bn.cmovsi_2 r7, r7, 0x6
    bn.sbz 0x0(r16), r7
    bt.j loc_251399
loc_25143f:
    bn.ff1 r7, r17
    bt.addi r7, -0x1
    bn.srli r10, r7, 0x1f
    bt.mov r3, r10
    bt.movi r4, 0x0
    bg.jal 0x2476b9
    bg.beq r11, r3, loc_2514b8
    bt.mov r3, r10
    bt.movi r4, 0x1
    bg.jal 0x2476b9
    bg.beq r11, r3, loc_251555
    bt.mov r3, r10
    bn.ori r4, r0, 0x14
    bg.jal 0x2476b9
    bg.beq r11, r3, loc_251555
    bt.mov r3, r10
    bt.movi r4, 0x4
    bg.jal 0x2476b9
    bg.beq r11, r3, loc_2515c3
    bt.mov r3, r10
    bt.movi r4, 0x2
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_251605
    bn.ori r7, r0, 0x18
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x3
    bn.sw 0x0(r14), r7
    bn.ori r7, r0, 0x3c
    bg.sh 0x7640(r15), r7
    bt.movi r7, 0x8
    bn.sbz 0x0(r16), r7
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_251413
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x4094
    bg.jal 0x2a93a3
    bt.j loc_251413
loc_2514b8:
    bn.ori r7, r0, 0x14
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x3
    bn.sw 0x0(r14), r7
    bn.ori r7, r0, 0x3c
    bg.sh 0x7640(r15), r7
    bt.movi r7, 0x8
    bn.sbz 0x0(r16), r7
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_251413
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x40e9
    bg.jal 0x2a93a3
    bt.j loc_251413
loc_2514ec:
    bn.ori r7, r0, 0x18
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x1
    bn.sw 0x0(r14), r7
    bg.movhi r10, 0x45
    bg.lhz r7, 0x7644(r10)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_2513e5
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3da7
    bg.jal 0x2a93a3
    bg.bnei r12, 0x1, loc_2513e9
loc_251516:
    bn.ori r7, r0, 0x20
    bn.sbz 0x0(r13), r7
    bn.sw 0x0(r14), r12
    bg.lhz r7, 0x7644(r10)
    bn.andi r7, r7, 0x20
    bg.bnei r7, 0x0, loc_2515f7
loc_25152a:
    bt.movi r7, 0x4
    bn.sbz 0x0(r16), r7
    bt.j loc_2513fe
loc_251531:
    bn.ori r7, r0, 0x1e
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x1
    bn.sw 0x0(r14), r7
    bg.lhz r7, 0x7644(r10)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_2513e5
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3d8d
    bg.jal 0x2a93a3
    bt.j loc_2513e5
loc_251555:
    bn.ori r7, r0, 0x14
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x3
    bn.sw 0x0(r14), r7
    bn.ori r7, r0, 0x3c
    bg.sh 0x7640(r15), r7
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_251413
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x40cc
    bg.jal 0x2a93a3
    bt.j loc_251413
loc_251584:
    bn.ori r7, r0, 0x18
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x1
    bn.sw 0x0(r14), r7
    bg.lhz r7, 0x7644(r10)
    bn.andi r7, r7, 0x20
    bn.beqi r7, 0x0, loc_25152a
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3d58
    bg.jal 0x2a93a3
    bt.j loc_25152a
loc_2515a7:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3d24
    bg.jal 0x2a93a3
    bt.j loc_251431
loc_2515b5:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3d3f
    bg.jal 0x2a93a3
    bt.j loc_2513fe
loc_2515c3:
    bn.ori r7, r0, 0x18
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x3
    bn.sw 0x0(r14), r7
    bn.ori r7, r0, 0x3c
    bg.sh 0x7640(r15), r7
    bt.movi r7, 0x8
    bn.sbz 0x0(r16), r7
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_251413
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x40b0
    bg.jal 0x2a93a3
    bt.j loc_251413
loc_2515f7:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3d72
    bg.jal 0x2a93a3
    bt.j loc_25152a
loc_251605:
    bt.mov r3, r10
    bn.ori r4, r0, 0x15
    bg.jal 0x2476b9
    bg.beq r11, r3, loc_2516c0
    bt.mov r3, r10
    bn.ori r4, r0, 0x16
    bg.jal 0x2476b9
    bg.beq r11, r3, loc_2516c8
    bt.mov r3, r10
    bt.movi r4, 0x3
    bg.jal 0x2476b9
    bg.beq r11, r3, loc_2516c8
    bt.mov r3, r10
    bn.ori r4, r0, 0x18
    bg.jal 0x2476b9
    bg.beq r11, r3, loc_2516fd
    bt.mov r3, r10
    bn.ori r4, r0, 0x17
    bg.jal 0x2476b9
    bg.beq r11, r3, loc_2516fd
    bt.mov r3, r10
    bn.ori r4, r0, 0x1f
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_251732
    bn.ori r7, r0, 0x18
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x3
    bn.sw 0x0(r14), r7
    bt.movi r7, 0xe
    bn.sbz 0x0(r16), r7
    bn.ori r7, r0, 0x7d
    bg.sh 0x7640(r15), r7
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_251413
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x4033
    bg.jal 0x2a93a3
    bn.j loc_251413
loc_251687:
    bt.mov r3, r10
    bn.ori r4, r0, 0x2e
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_251bfb
    bn.ori r7, r0, 0x18
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x1
    bn.sw 0x0(r14), r7
    bn.ori r7, r0, 0x7d
    bg.sh 0x7640(r15), r7
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bn.beqi r7, 0x0, loc_2516c0
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3e0c
    bg.jal 0x2a93a3
loc_2516c0:
    bt.movi r7, 0x8
    bn.sbz 0x0(r16), r7
    bn.j loc_251413
loc_2516c8:
    bn.ori r7, r0, 0x18
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x3
    bn.sw 0x0(r14), r7
    bt.movi r7, 0x8
    bn.sbz 0x0(r16), r7
    bn.ori r7, r0, 0x7d
    bg.sh 0x7640(r15), r7
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_251413
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x4075
    bg.jal 0x2a93a3
    bn.j loc_251413
loc_2516fd:
    bn.ori r7, r0, 0x18
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x3
    bn.sw 0x0(r14), r7
    bt.movi r7, 0xe
    bn.sbz 0x0(r16), r7
    bn.ori r7, r0, 0x7d
    bg.sh 0x7640(r15), r7
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_251413
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x4056
    bg.jal 0x2a93a3
    bn.j loc_251413
loc_251732:
    bt.mov r3, r10
    bn.ori r4, r0, 0x1e
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_251774
    bn.ori r7, r0, 0x18
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x3
    bn.sw 0x0(r14), r7
    bt.movi r7, 0xc
    bn.sbz 0x0(r16), r7
    bn.ori r7, r0, 0x7d
    bg.sh 0x7640(r15), r7
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_251413
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x4010
    bg.jal 0x2a93a3
    bn.j loc_251413
loc_251774:
    bt.mov r3, r10
    bn.ori r4, r0, 0x20
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_2517b7
    bn.ori r7, r0, 0x18
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x3
    bn.sw 0x0(r14), r7
    bn.ori r7, r0, 0x10
    bn.sbz 0x0(r16), r7
    bn.ori r7, r0, 0x7d
    bg.sh 0x7640(r15), r7
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_251413
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3fed
    bg.jal 0x2a93a3
    bn.j loc_251413
loc_2517b7:
    bt.mov r3, r10
    bn.ori r4, r0, 0x37
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_2517fa
    bn.ori r7, r0, 0x18
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x3
    bn.sw 0x0(r14), r7
    bn.ori r7, r0, 0x10
    bn.sbz 0x0(r16), r7
    bn.ori r7, r0, 0x7d
    bg.sh 0x7640(r15), r7
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_251413
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3fca
    bg.jal 0x2a93a3
    bn.j loc_251413
loc_2517fa:
    bt.mov r3, r10
    bn.ori r4, r0, 0x1d
    bg.jal 0x2476b9
    bg.beq r11, r3, loc_2516c8
    bt.mov r3, r10
    bn.ori r4, r0, 0x21
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_251849
    bn.ori r7, r0, 0x18
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x3
    bn.sw 0x0(r14), r7
    bt.movi r7, 0x8
    bn.sbz 0x0(r16), r7
    bn.ori r7, r0, 0x3c
    bg.sh 0x7640(r15), r7
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_251413
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3fa7
    bg.jal 0x2a93a3
    bn.j loc_251413
loc_251849:
    bt.mov r3, r10
    bn.ori r4, r0, 0x23
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_25188b
    bn.ori r7, r0, 0x18
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x3
    bn.sw 0x0(r14), r7
    bt.movi r7, 0x8
    bn.sbz 0x0(r16), r7
    bn.ori r7, r0, 0x3c
    bg.sh 0x7640(r15), r7
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_251413
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3f80
    bg.jal 0x2a93a3
    bn.j loc_251413
loc_25188b:
    bt.mov r3, r10
    bn.ori r4, r0, 0x22
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_2518cd
    bn.ori r7, r0, 0x14
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x3
    bn.sw 0x0(r14), r7
    bt.movi r7, 0x8
    bn.sbz 0x0(r16), r7
    bn.ori r7, r0, 0x3c
    bg.sh 0x7640(r15), r7
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_251413
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3f55
    bg.jal 0x2a93a3
    bn.j loc_251413
loc_2518cd:
    bt.mov r3, r10
    bn.ori r4, r0, 0x24
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_25190f
    bn.ori r7, r0, 0x14
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x3
    bn.sw 0x0(r14), r7
    bt.movi r7, 0x8
    bn.sbz 0x0(r16), r7
    bn.ori r7, r0, 0x3c
    bg.sh 0x7640(r15), r7
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_251413
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3f2e
    bg.jal 0x2a93a3
    bn.j loc_251413
loc_25190f:
    bt.mov r3, r10
    bn.ori r4, r0, 0x36
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_251951
    bn.ori r7, r0, 0x18
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x3
    bn.sw 0x0(r14), r7
    bt.movi r7, 0x8
    bn.sbz 0x0(r16), r7
    bn.ori r7, r0, 0x7d
    bg.sh 0x7640(r15), r7
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_251413
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3f03
    bg.jal 0x2a93a3
    bn.j loc_251413
loc_251951:
    bt.mov r3, r10
    bt.movi r4, 0x5
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_251992
    bn.ori r7, r0, 0x18
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x3
    bn.sw 0x0(r14), r7
    bn.ori r7, r0, 0x3c
    bg.sh 0x7640(r15), r7
    bt.movi r7, 0x4
    bn.sbz 0x0(r16), r7
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_251413
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3ee1
    bg.jal 0x2a93a3
    bn.j loc_251413
loc_251992:
    bt.mov r3, r10
    bt.movi r4, 0x6
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_2519d3
    bn.ori r7, r0, 0x14
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x3
    bn.sw 0x0(r14), r7
    bn.ori r7, r0, 0x3c
    bg.sh 0x7640(r15), r7
    bt.movi r7, 0x8
    bn.sbz 0x0(r16), r7
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_251413
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3ec6
    bg.jal 0x2a93a3
    bn.j loc_251413
loc_2519d3:
    bt.mov r3, r10
    bt.movi r4, 0x7
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_251a0f
    bn.ori r7, r0, 0x14
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x3
    bn.sw 0x0(r14), r7
    bn.ori r7, r0, 0x3c
    bg.sh 0x7640(r15), r7
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_251413
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3eab
    bg.jal 0x2a93a3
    bn.j loc_251413
loc_251a0f:
    bt.mov r3, r10
    bt.movi r4, 0x8
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_251a50
    bn.ori r7, r0, 0x10
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x4
    bn.sw 0x0(r14), r7
    bn.ori r7, r0, 0x3c
    bg.sh 0x7640(r15), r7
    bt.movi r7, 0x8
    bn.sbz 0x0(r16), r7
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_251413
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3e90
    bg.jal 0x2a93a3
    bn.j loc_251413
loc_251a50:
    bt.mov r3, r10
    bt.movi r4, 0x9
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_251a8c
    bn.ori r7, r0, 0x10
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x4
    bn.sw 0x0(r14), r7
    bn.ori r7, r0, 0x3c
    bg.sh 0x7640(r15), r7
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_251413
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3e7d
    bg.jal 0x2a93a3
    bn.j loc_251413
loc_251a8c:
    bt.mov r3, r10
    bt.movi r4, 0xa
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_251ac8
    bn.ori r7, r0, 0x10
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x1
    bn.sw 0x0(r14), r7
    bn.ori r7, r0, 0x28
    bg.sh 0x7640(r15), r7
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_251413
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3e6a
    bg.jal 0x2a93a3
    bn.j loc_251413
loc_251ac8:
    bt.mov r3, r10
    bt.movi r4, 0xb
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_251b04
    bn.ori r7, r0, 0x14
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x1
    bn.sw 0x0(r14), r7
    bn.ori r7, r0, 0x28
    bg.sh 0x7640(r15), r7
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_251413
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3e54
    bg.jal 0x2a93a3
    bn.j loc_251413
loc_251b04:
    bt.mov r3, r10
    bt.movi r4, 0xd
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_251b44
    bn.ori r7, r0, 0x14
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x1
    bn.sw 0x0(r14), r7
    bn.ori r7, r0, 0x28
    bg.sh 0x7640(r15), r7
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bn.beqi r7, 0x0, loc_251b3c
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3e3d
    bg.jal 0x2a93a3
loc_251b3c:
    bt.movi r7, 0x4
    bn.sbz 0x0(r16), r7
    bn.j loc_251413
loc_251b44:
    bt.mov r3, r10
    bt.movi r4, 0xc
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_251b7e
    bn.ori r7, r0, 0x18
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x1
    bn.sw 0x0(r14), r7
    bn.ori r7, r0, 0x28
    bg.sh 0x7640(r15), r7
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bn.beqi r7, 0x0, loc_251b3c
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3e25
    bg.jal 0x2a93a3
    bt.j loc_251b3c
loc_251b7e:
    bt.mov r3, r10
    bt.movi r4, 0xf
    bg.jal 0x2476b9
    bg.beq r11, r3, loc_251b96
    bt.mov r3, r10
    bt.movi r4, 0xe
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_251baa
loc_251b96:
    bt.movi r7, 0xc
    bn.sbz 0x0(r13), r7
    bn.ori r7, r0, 0x3c
    bg.sh 0x7640(r15), r7
    bt.movi r7, 0x3
    bn.sw 0x0(r14), r7
    bn.j loc_251413
loc_251baa:
    bt.mov r3, r10
    bn.ori r4, r0, 0x10
    bg.jal 0x2476b9
    bg.beq r11, r3, loc_251bc4
    bt.mov r3, r10
    bn.ori r4, r0, 0x11
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_251bd9
loc_251bc4:
    bn.ori r7, r0, 0x10
    bn.sbz 0x0(r13), r7
    bn.ori r7, r0, 0x3c
    bg.sh 0x7640(r15), r7
    bt.movi r7, 0x2
    bn.sw 0x0(r14), r7
    bn.j loc_251413
loc_251bd9:
    bt.mov r3, r10
    bn.ori r4, r0, 0x12
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_251687
    bn.ori r7, r0, 0x10
    bn.sbz 0x0(r13), r7
    bn.ori r7, r0, 0x28
    bg.sh 0x7640(r15), r7
    bt.movi r7, 0x2
    bn.sw 0x0(r14), r7
    bn.j loc_251413
loc_251bfb:
    bt.mov r3, r10
    bn.ori r4, r0, 0x2f
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_251c38
    bn.ori r7, r0, 0x18
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x1
    bn.sw 0x0(r14), r7
    bn.ori r7, r0, 0x7d
    bg.sh 0x7640(r15), r7
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_251413
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3dec
    bg.jal 0x2a93a3
    bn.j loc_251413
loc_251c38:
    bt.mov r3, r10
    bn.ori r4, r0, 0x30
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_251c75
    bn.ori r7, r0, 0x18
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x1
    bn.sw 0x0(r14), r7
    bn.ori r7, r0, 0x7d
    bg.sh 0x7640(r15), r7
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_251413
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3dcc
    bg.jal 0x2a93a3
    bn.j loc_251413
loc_251c75:
    bt.mov r3, r10
    bn.ori r4, r0, 0x31
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_251cb1
    bn.ori r7, r0, 0x18
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x1
    bn.sw 0x0(r14), r7
    bn.ori r7, r0, 0x7d
    bg.sh 0x7640(r15), r7
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_251b3c
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3dcc
    bg.jal 0x2a93a3
    bt.j loc_251b3c
loc_251cb1:
    bt.mov r3, r10
    bn.ori r4, r0, 0x32
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_251cd8
    bn.ori r7, r0, 0x18
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x1
    bn.sw 0x0(r14), r7
    bn.ori r7, r0, 0x7d
    bg.sh 0x7640(r15), r7
    bt.movi r7, 0x6
    bn.sbz 0x0(r16), r7
    bn.j loc_251413
loc_251cd8:
    bt.mov r3, r10
    bn.ori r4, r0, 0x34
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_251cfa
    bn.ori r7, r0, 0x18
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x1
    bn.sw 0x0(r14), r7
    bn.ori r7, r0, 0x7d
    bg.sh 0x7640(r15), r7
    bn.j loc_2516c0
loc_251cfa:
    bt.mov r3, r10
    bn.ori r4, r0, 0x33
    bg.jal 0x2476b9
    bg.bne r11, r3, loc_251d21
    bn.ori r7, r0, 0x18
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x1
    bn.sw 0x0(r14), r7
    bn.ori r7, r0, 0x7d
    bg.sh 0x7640(r15), r7
    bt.movi r7, 0xc
    bn.sbz 0x0(r16), r7
    bn.j loc_251413
loc_251d21:
    bt.mov r3, r10
    bn.ori r4, r0, 0x35
    bg.jal 0x2476b9
    bg.beq r11, r3, loc_251d4c
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x20
    bg.beqi r7, 0x0, loc_251413
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3dac
    bg.jal 0x2a93a3
    bn.j loc_251413
loc_251d4c:
    bn.ori r7, r0, 0x18
    bn.sbz 0x0(r13), r7
    bt.movi r7, 0x1
    bn.sw 0x0(r14), r7
    bn.ori r7, r0, 0x7d
    bg.sh 0x7640(r15), r7
    bn.ori r7, r0, 0x10
    bn.sbz 0x0(r16), r7
    bn.j loc_251413
