# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x260faa,0x261417); byte-exact only; hardware untested.
    bg.addi r1, r1, -0x2a4
    bg.sw_0 0x2a0(r1), r9
    bg.sw_0 0x29c(r1), r10
    bg.sw_0 0x298(r1), r11
    bg.sw_0 0x294(r1), r12
    bg.sw_0 0x290(r1), r13
    bg.sw_0 0x28c(r1), r14
    bg.sw_0 0x288(r1), r15
    bt.mov r12, r3
    bt.mov r10, r4
    bt.mov r11, r5
    bg.addi r15, r1, 0xec
    bt.mov r3, r15
    bt.movi r4, 0x0
    bn.ori r5, r0, 0xe4
    bg.jal 0x2a941f
    bg.movhi r13, 0x3b
    bn.beqi r12, 0x0, loc_261033
    bt.movi r13, 0x1
    bg.sbz 0xf9(r1), r13
    bg.sbz 0xfa(r1), r13
    bg.addi r14, r0, 0x2710
    bg.sw_1 0xfc(r1), r14
    bt.mov r3, r10
    bt.mov r4, r11
    bg.jal 0x2aad6a
    bg.sh 0xfc(r1), r3
    bg.sbz 0x18f(r1), r13
    bg.sbz 0x190(r1), r0
    bg.sbz 0x191(r1), r0
    bg.sbz 0x192(r1), r0
    bn.ori r7, r0, 0x10
    bg.sbz 0x194(r1), r7
    bg.sbz 0x193(r1), r13
    bg.sbz 0x1b1(r1), r0
    bg.sbz 0x1ca(r1), r13
    bg.beqi r12, 0x7, loc_261103
    bg.movhi r13, 0x3b
    bg.beqi r12, 0xb, loc_26119b
loc_261033:
    bg.lwz r7, 0x5f38(r13)
    bn.lbz r3, 0x5a(r7)
    bg.addi r4, r1, 0x1f0
    bg.jal 0x27fbbf
    bt.movi r7, 0x1
    bg.sbz 0x169(r1), r7
    bg.lhz r7, 0x168(r1)
    bg.movhi r6, 0x3f7d
    bn.or r7, r7, r6
    bg.sw_0 0x168(r1), r7
    bg.ori r7, r0, 0x3f35
    bg.movhi r6, 0x8106
    bn.or r7, r7, r6
    bg.sw_0 0x16c(r1), r7
    bg.ori r7, r0, 0x3e95
    bn.movhi_2 r6, 0x147b
    bn.or r7, r7, r6
    bg.sw_0 0x170(r1), r7
    bg.ori r7, r0, 0x3e2e
    bn.movhi_2 r6, 0x831
    bn.or r7, r7, r6
    bg.sw_0 0x174(r1), r7
    bg.ori r7, r0, 0x3f4c
    bg.movhi r6, 0x24dd
    bn.or r7, r7, r6
    bg.sw_0 0x178(r1), r7
    bg.ori r7, r0, 0x3e06
    bg.movhi r6, 0x6a7f
    bn.or r7, r7, r6
    bg.sw_0 0x17c(r1), r7
    bg.ori r7, r0, 0x3d3c
    bn.movhi_2 r6, 0x1a37
    bn.or r7, r7, r6
    bg.sw_0 0x180(r1), r7
    bg.ori r7, r0, 0x3ea0
    bg.movhi r6, 0x72b0
    bn.or r7, r7, r6
    bg.sw_0 0x184(r1), r7
    bg.lwz r7, 0x188(r1)
    bg.movhi r6, 0xffff
    bn.and r7, r7, r6
    bg.ori r7, r7, 0x3ea8
    bg.sw_0 0x188(r1), r7
    bt.mov r3, r1
    bt.mov r4, r15
    bn.ori r5, r0, 0xe4
    bg.jal 0x2aab1e
    bt.mov r3, r1
    bg.jal 0x27e866
    bg.lwz r15, 0x288(r1)
    bg.lwz r14, 0x28c(r1)
    bg.lwz r13, 0x290(r1)
    bg.lwz r12, 0x294(r1)
    bg.lwz r11, 0x298(r1)
    bg.lwz r10, 0x29c(r1)
    bg.lwz r9, 0x2a0(r1)
    bg.addi r1, r1, 0x2a4
    bt.jr r9
loc_261103:
    bg.sbz 0x169(r1), r13
    bg.lhz r7, 0x168(r1)
    bg.movhi r6, 0xb8bb
    bn.or r7, r7, r6
    bg.sw_0 0x168(r1), r7
    bg.ori r7, r0, 0x3f2d
    bg.movhi r6, 0xa29c
    bn.or r7, r7, r6
    bg.sw_0 0x16c(r1), r7
    bg.ori r7, r0, 0x3ea3
    bg.movhi r6, 0xae14
    bn.or r7, r7, r6
    bg.sw_0 0x170(r1), r7
    bg.ori r7, r0, 0x3e87
    bg.movhi r6, 0xaa65
    bn.or r7, r7, r6
    bg.sw_0 0x174(r1), r7
    bg.ori r7, r0, 0x3f30
    bg.movhi r6, 0x999a
    bn.or r7, r7, r6
    bg.sw_0 0x178(r1), r7
    bg.ori r7, r0, 0x3e19
    bg.movhi r6, 0xc28f
    bn.or r7, r7, r6
    bg.sw_0 0x17c(r1), r7
    bg.ori r7, r0, 0x3d75
    bn.movhi_2 r6, 0x1a37
    bn.or r7, r7, r6
    bg.sw_0 0x180(r1), r7
    bg.ori r7, r0, 0x3ea0
    bg.movhi r6, 0x72b0
    bn.or r7, r7, r6
    bg.sw_0 0x184(r1), r7
    bg.lwz r7, 0x188(r1)
    bg.movhi r6, 0xffff
    bn.and r7, r7, r6
    bg.ori r7, r7, 0x3ea8
    bg.sw_0 0x188(r1), r7
    bg.sbz 0x18f(r1), r0
    bg.movhi r13, 0x3b
    bt.j loc_261033
loc_26119b:
    bg.lwz r7, 0x5f38(r13)
    bn.lbz r3, 0x5a(r7)
    bg.addi r4, r1, 0x1d0
    bg.jal 0x27fbbf
    bg.sw_1 0x210(r1), r0
    bn.ori r30, r0, 0x32
    bg.sh 0x210(r1), r30
    bn.ori r29, r0, 0x64
    bg.sw_1 0x214(r1), r29
    bn.ori r28, r0, 0x96
    bg.sh 0x214(r1), r28
    bn.ori r27, r0, 0xc8
    bg.sw_1 0x218(r1), r27
    bn.ori r26, r0, 0xfa
    bg.sh 0x218(r1), r26
    bg.addi r25, r0, 0x12c
    bg.sw_1 0x21c(r1), r25
    bg.addi r24, r0, 0x1c2
    bg.sh 0x21c(r1), r24
    bg.addi r7, r0, 0x2ee
    bg.sw_1 0x220(r1), r7
    bg.addi r7, r0, 0x352
    bg.sh 0x220(r1), r7
    bg.addi r7, r0, 0x3e8
    bg.sw_1 0x224(r1), r7
    bg.sh 0x224(r1), r14
    bg.sw_1 0x258(r1), r0
    bg.sh 0x258(r1), r30
    bg.sw_1 0x25c(r1), r29
    bg.sh 0x25c(r1), r28
    bg.sw_1 0x260(r1), r27
    bg.sh 0x260(r1), r26
    bg.sw_1 0x264(r1), r25
    bg.addi r4, r0, 0x154
    bg.sh 0x264(r1), r4
    bg.addi r5, r0, 0x181
    bg.sw_1 0x268(r1), r5
    bg.addi r6, r0, 0x186
    bg.sh 0x268(r1), r6
    bg.addi r7, r0, 0x195
    bg.sw_1 0x26c(r1), r7
    bg.sh 0x26c(r1), r24
    bg.sw_1 0x240(r1), r0
    bg.sh 0x240(r1), r30
    bg.sw_1 0x244(r1), r29
    bg.sh 0x244(r1), r28
    bg.sw_1 0x248(r1), r27
    bg.sh 0x248(r1), r26
    bg.sw_1 0x24c(r1), r25
    bg.sh 0x24c(r1), r24
    bg.sw_1 0x250(r1), r24
    bg.sh 0x250(r1), r24
    bg.sw_1 0x254(r1), r24
    bg.sh 0x254(r1), r24
    bg.sw_1 0x270(r1), r0
    bg.sh 0x270(r1), r30
    bg.sw_1 0x274(r1), r29
    bg.sh 0x274(r1), r28
    bg.sw_1 0x278(r1), r27
    bg.sh 0x278(r1), r26
    bg.sw_1 0x27c(r1), r25
    bg.sh 0x27c(r1), r4
    bg.sw_1 0x280(r1), r5
    bg.sh 0x280(r1), r6
    bg.sw_1 0x284(r1), r7
    bg.sh 0x284(r1), r24
    bg.lhz r23, 0x1ea(r1)
    bg.sfgtsi r23, 0x1f3
    bn.bnf loc_2613a7
    bg.sw_1 0x228(r1), r0
    bg.sh 0x228(r1), r30
    bg.sw_1 0x22c(r1), r29
    bg.sh 0x22c(r1), r28
    bg.sw_1 0x230(r1), r27
    bg.sh 0x230(r1), r26
    bg.sw_1 0x234(r1), r25
    bg.addi r7, r0, 0x15e
    bg.sh 0x234(r1), r7
    bg.addi r7, r0, 0x1a4
    bg.sw_1 0x238(r1), r7
    bg.addi r7, r0, 0x1ae
    bg.sh 0x238(r1), r7
    bg.sw_1 0x23c(r1), r24
    bg.sh 0x23c(r1), r24
    bg.sfgti r23, 0x3e7
    bn.bf loc_2613c7
    bg.addi r25, r23, -0x1c2
    bt.movi r5, 0x0
    bg.addi r4, r1, 0x258
    bg.addi r24, r1, 0x240
    bg.addi r28, r1, 0x228
    bg.addi r27, r1, 0x210
    bg.ori r26, r0, 0x226
    bg.addi r29, r0, 0x1c2
loc_261309:
    bn.add r7, r24, r5
    bn.lh r6, 0x0(r7)
    bn.add r7, r28, r5
    bn.lh r7, 0x0(r7)
    bn.sub r7, r7, r6
    bn.muls r7, r25, r7
    bn.divs r7, r7, r26
    bt.add r6, r7
    bn.sh_1 0x0(r4), r6
    bn.add r7, r27, r5
    bn.lh r7, 0x0(r7)
    bg.ble r7, r23, loc_261330
    bn.sh_1 0x0(r4), r29
loc_261330:
    bt.addi r5, 0x2
    bt.addi r4, 0x2
    bn.sfnei r5, 0x18
    bn.bf loc_261309
loc_26133a:
    bt.movi r7, 0x1
    bg.sbz 0xf9(r1), r7
    bg.sbz 0xfa(r1), r0
    bg.lwz r7, 0x210(r1)
    bg.sw_0 0x100(r1), r7
    bg.lwz r7, 0x214(r1)
    bg.sw_0 0x104(r1), r7
    bg.lwz r7, 0x218(r1)
    bg.sw_0 0x108(r1), r7
    bg.lwz r7, 0x21c(r1)
    bg.sw_0 0x10c(r1), r7
    bg.lwz r7, 0x220(r1)
    bg.sw_0 0x110(r1), r7
    bg.lwz r7, 0x224(r1)
    bg.sw_0 0x114(r1), r7
    bg.lwz r7, 0x258(r1)
    bg.sw_0 0x118(r1), r7
    bg.lwz r7, 0x25c(r1)
    bg.sw_0 0x11c(r1), r7
    bg.lwz r7, 0x260(r1)
    bg.sw_0 0x120(r1), r7
    bg.lwz r7, 0x264(r1)
    bg.sw_0 0x124(r1), r7
    bg.lwz r7, 0x268(r1)
    bg.sw_0 0x128(r1), r7
    bg.lwz r7, 0x26c(r1)
    bg.sw_0 0x12c(r1), r7
    bn.j loc_261033
loc_2613a7:
    bt.movi r5, 0x0
    bg.addi r25, r1, 0x258
    bg.addi r24, r1, 0x240
loc_2613b1:
    bn.add r7, r25, r5
    bn.add r6, r24, r5
    bn.lh r6, 0x0(r6)
    bn.sh_1 0x0(r7), r6
    bt.addi r5, 0x2
    bn.sfnei r5, 0x18
    bn.bf loc_2613b1
    bt.j loc_26133a
loc_2613c7:
    bg.sfgti r23, 0x2710
    bn.bf loc_26133a
    bg.addi r24, r23, -0x3e8
    bt.movi r4, 0x0
    bg.addi r25, r1, 0x258
    bg.addi r28, r1, 0x228
    bg.addi r27, r1, 0x270
    bg.ori r26, r0, 0x2328
loc_2613e4:
    bn.add r7, r28, r4
    bn.lh r6, 0x0(r7)
    bn.add r5, r25, r4
    bn.add r7, r27, r4
    bn.lh r7, 0x0(r7)
    bn.sub r7, r7, r6
    bn.muls r7, r24, r7
    bn.divs r7, r7, r26
    bt.add r6, r7
    bn.sh_1 0x0(r5), r6
    bt.addi r4, 0x2
    bn.sfnei r4, 0x18
    bn.bf loc_2613e4
    bg.sw_1 0x224(r1), r23
    bg.addi r7, r0, 0x1c2
    bg.sw_1 0x26c(r1), r7
    bt.j loc_26133a
