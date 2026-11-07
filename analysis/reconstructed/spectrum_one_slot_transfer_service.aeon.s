# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20d33c,0x20db7b); Receive/transmit ring state machine; execution incomplete because of unresolved stores and peripheral calls.
# Fixed original addresses; not a hardware-validated implementation.
    bn.addi r1, r1, -0x34
    bn.sw 0x30(r1), r9
    bn.sw 0x2c(r1), r10
    bn.sw 0x28(r1), r11
    bn.sw 0x24(r1), r12
    bn.sw 0x20(r1), r13
    bn.sw 0x1c(r1), r14
    bn.sw 0x18(r1), r15
    bn.sw 0x14(r1), r16
    bn.sw 0x10(r1), r17
    bn.sw 0xc(r1), r18
    bn.sw 0x8(r1), r19
    bn.sw 0x4(r1), r20
    bn.sw 0x0(r1), r21
    bt.mov r12, r3
    bg.jal 0x20cbd6
    bg.beqi r3, 0x0, loc_20d445
    bg.movhi r10, 0x45
    bg.lwz r7, 0x3cf0(r10)
    bg.lbz r7, 0x7dd4(r7)
    bn.andi r7, r7, 0xc
    bn.bnei r7, 0x0, loc_20d3db
    bn.andi r3, r3, 0x18
    bg.beqi r3, 0x8, loc_20d471
    bn.sfeqi r3, 0x10
    bn.bf loc_20d6bc
    bt.mov r3, r12
    bg.jal 0x20cc43
    bt.mov r4, r3
    bt.mov r3, r12
    bg.jal 0x20caf8
    bg.movhi r4, 0x45
    bg.addi r4, r4, 0x3b76
    bn.add r7, r12, r4
    bn.sbz 0x0(r7), r0
    bt.mov r3, r12
    bn.lwz r21, 0x0(r1)
    bn.lwz r20, 0x4(r1)
    bn.lwz r19, 0x8(r1)
    bn.lwz r18, 0xc(r1)
    bn.lwz r17, 0x10(r1)
    bn.lwz r16, 0x14(r1)
    bn.lwz r15, 0x18(r1)
    bn.lwz r14, 0x1c(r1)
    bn.lwz r13, 0x20(r1)
    bn.lwz r12, 0x24(r1)
    bn.lwz r11, 0x28(r1)
    bn.lwz r10, 0x2c(r1)
    bn.lwz r9, 0x30(r1)
    bn.addi r1, r1, 0x34
    bg.j 0x20ccf6
loc_20d3db:
    bg.movhi r4, 0x45
    bg.addi r4, r4, 0x3b6e
    bn.add r6, r12, r4
    bt.movi r7, 0x1
    bn.sbz 0x0(r6), r7
    bt.mov r3, r12
    bg.jal 0x20ccf6
    bg.lwz r6, 0x3cf0(r10)
    bg.lbz r7, 0x7dd4(r6)
    bn.extbz r7, r7
    bn.ori r7, r7, 0x3
    bg.sbz 0x7dd4(r6), r7
    bt.mov r3, r12
    bg.jal 0x20c80d
    bt.mov r3, r12
    bg.jal 0x20c895
    bt.mov r3, r12
    bg.jal 0x20cbd6
    bn.andi r3, r3, 0x80
    bn.beqi r3, 0x0, loc_20d424
    bt.mov r3, r12
    bn.ori r4, r0, 0x80
    bg.jal 0x20ca70
loc_20d424:
    bg.lwz r6, 0x3cf0(r10)
    bg.lbz r7, 0x7cf8(r6)
    bn.andi r7, r7, 0x7f
    bg.sbz 0x7cf8(r6), r7
    bg.lwz r6, 0x3cf0(r10)
    bg.lbz r7, 0x7cf8(r6)
    bn.extbz r7, r7
    bn.ori r7, r7, 0x80
    bg.sbz 0x7cf8(r6), r7
loc_20d445:
    bn.lwz r21, 0x0(r1)
    bn.lwz r20, 0x4(r1)
    bn.lwz r19, 0x8(r1)
    bn.lwz r18, 0xc(r1)
    bn.lwz r17, 0x10(r1)
    bn.lwz r16, 0x14(r1)
    bn.lwz r15, 0x18(r1)
    bn.lwz r14, 0x1c(r1)
    bn.lwz r13, 0x20(r1)
    bn.lwz r12, 0x24(r1)
    bn.lwz r11, 0x28(r1)
    bn.lwz r10, 0x2c(r1)
    bn.lwz r9, 0x30(r1)
    bn.addi r1, r1, 0x34
    bt.jr r9
loc_20d471:
    bn.slli r15, r12, 0x1
    bg.movhi r20, 0x48
    bg.addi r4, r20, -0x1080
    bn.add r10, r15, r4
    bn.lh r7, 0x0(r10)
    bn.exthz r7, r7
    bg.movhi r14, 0x48
    bg.addi r5, r14, -0x1050
    bn.add r6, r15, r5
    bn.sh_1 0x0(r6), r7
    bt.mov r3, r12
    bg.jal 0x20c73b
    bn.andi r7, r3, 0xff
    bn.sh_1 0x0(r10), r7
    bg.ori r6, r0, 0xff00
    bn.and r3, r3, r6
    bn.srli r3, r3, 0x8
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0xc40
    bn.add r7, r15, r4
    bn.sh_1 0x0(r7), r3
    bt.mov r3, r12
    bg.jal 0x20c91d
    bg.bnei r3, 0x0, loc_20d96a
    bg.movhi r19, 0x45
    bg.addi r6, r19, 0x3b6e
    bn.add r7, r12, r6
    bn.lbz r7, 0x0(r7)
    bg.beqi r7, 0x1, loc_20d9e1
loc_20d4d3:
    bg.movhi r4, 0x45
    bg.addi r4, r4, 0x3b6e
    bn.add r7, r12, r4
    bn.sbz 0x0(r7), r0
    bt.mov r3, r12
    bg.jal 0x20cbd6
    bn.andi r3, r3, 0x80
    bg.beqi r3, 0x0, loc_20d8a3
    bg.movhi r18, 0x45
    bg.addi r5, r18, 0x414c
    bn.add r14, r12, r5
    bn.sbz 0x0(r14), r0
    bg.movhi r21, 0x45
    bg.addi r6, r21, 0x4154
    bn.add r11, r12, r6
    bn.sbz 0x0(r11), r0
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x1080
    bn.add r16, r15, r7
    bn.lh r6, 0x0(r16)
    bn.exthz r6, r6
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0xc40
    bn.add r13, r15, r4
    bn.lh r7, 0x0(r13)
    bn.exthz r7, r7
    bg.ble r7, r6, loc_20d53d
    bn.lh r7, 0x0(r16)
    bg.addi r7, r7, 0x80
    bn.exthz r7, r7
    bn.sh_1 0x0(r16), r7
loc_20d53d:
    bn.lh r10, 0x0(r13)
    bn.exthz r10, r10
    bt.mov r3, r12
    bt.movi r4, 0x0
    bg.jal 0x20c7a8
    bg.addi r3, r3, 0x4700
    bn.exthz r17, r3
    bt.addi r10, 0x1
    bn.andi r10, r10, 0x7f
    bt.add r10, r17
    bn.exthz r3, r10
    bg.jal 0x20e47e
    bn.andi r3, r3, 0x7f
    bn.sbz 0x0(r11), r3
    bn.lbz r5, 0x0(r11)
    bn.extbz r5, r5
    bn.lh r6, 0x0(r16)
    bn.exthz r6, r6
    bn.lh r7, 0x0(r13)
    bn.exthz r7, r7
    bt.addi r5, 0x1
    bn.sub r6, r6, r7
    bg.beq r5, r6, loc_20dab8
loc_20d581:
    bn.lh r7, 0x0(r13)
    bt.addi r7, 0x1
    bn.exthz r11, r7
    bn.lh r7, 0x0(r16)
    bn.exthz r7, r7
    bg.bgt r11, r7, loc_20d5d0
    bn.slli r13, r12, 0x7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x1480
    bt.add r13, r5
loc_20d5a0:
    bn.lbz r10, 0x0(r14)
    bn.extbz r10, r10
    bn.andi r3, r11, 0x7f
    bt.add r3, r17
    bn.exthz r3, r3
    bg.jal 0x20e47e
    bn.add r7, r13, r10
    bn.sbz 0x0(r7), r3
    bt.addi r10, 0x1
    bn.extbz r10, r10
    bn.sbz 0x0(r14), r10
    bn.addi r7, r11, 0x1
    bn.exthz r11, r7
    bn.lh r7, 0x0(r16)
    bn.exthz r7, r7
    bg.ble r11, r7, loc_20d5a0
loc_20d5d0:
    bg.movhi r5, 0x45
    bg.addi r5, r5, 0x414c
    bn.add r7, r12, r5
    bn.lbz r7, 0x0(r7)
    bn.beqi r7, 0x0, loc_20d608
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x4154
    bn.add r6, r12, r7
    bn.lbz r7, 0x0(r6)
    bn.bnei r7, 0x0, loc_20d608
    bn.slli r7, r12, 0x7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x1480
    bt.add r7, r4
    bn.lbz r7, 0x0(r7)
    bn.andi r7, r7, 0x7f
    bn.sbz 0x0(r6), r7
loc_20d608:
    bg.movhi r6, 0x45
    bg.addi r6, r6, 0x4154
    bn.add r5, r12, r6
    bn.lbz r7, 0x0(r5)
    bn.extbz r7, r7
    bg.movhi r4, 0x45
    bg.addi r4, r4, 0x414c
    bn.add r6, r12, r4
    bn.lbz r6, 0x0(r6)
    bn.extbz r6, r6
    bt.addi r7, 0x2
    bg.beq r7, r6, loc_20da4f
loc_20d630:
    bg.movhi r4, 0x45
    bg.addi r4, r4, 0x3b94
    bn.add r7, r12, r4
    bn.sbz 0x0(r7), r0
    bg.movhi r6, 0x45
    bg.lhz r5, 0x51ec(r6)
    bg.ori r4, r0, 0xfffb
    bn.and r7, r5, r4
    bg.sw_1 0x51ec(r6), r7
loc_20d651:
    bt.mov r3, r12
    bg.jal 0x20c91d
    bg.bnei r3, 0x0, loc_20da30
loc_20d65b:
    bt.mov r3, r12
    bg.jal 0x20c80d
    bt.mov r3, r12
    bg.jal 0x20cbd6
    bn.andi r3, r3, 0x80
    bg.bnei r3, 0x0, loc_20da24
loc_20d66e:
    bg.movhi r7, 0x45
    bg.lbz r7, 0x415d(r7)
    bg.beqi r7, 0x0, loc_20d445
    bg.movhi r6, 0x45
    bg.addi r6, r6, 0x3b94
    bn.add r7, r12, r6
    bn.lbz r7, 0x0(r7)
    bg.bnei r7, 0x5, loc_20d445
    bt.mov r3, r12
    bn.lwz r21, 0x0(r1)
    bn.lwz r20, 0x4(r1)
    bn.lwz r19, 0x8(r1)
    bn.lwz r18, 0xc(r1)
    bn.lwz r17, 0x10(r1)
    bn.lwz r16, 0x14(r1)
    bn.lwz r15, 0x18(r1)
    bn.lwz r14, 0x1c(r1)
    bn.lwz r13, 0x20(r1)
    bn.lwz r12, 0x24(r1)
    bn.lwz r11, 0x28(r1)
    bn.lwz r10, 0x2c(r1)
    bn.lwz r9, 0x30(r1)
    bn.addi r1, r1, 0x34
    bg.j 0x20d2b7
loc_20d6bc:
    bn.slli r15, r12, 0x1
    bg.movhi r20, 0x48
    bg.addi r5, r20, -0x1080
    bn.add r13, r15, r5
    bn.lh r7, 0x0(r13)
    bn.exthz r7, r7
    bg.movhi r14, 0x48
    bg.addi r6, r14, -0x1050
    bn.add r11, r15, r6
    bn.sh_1 0x0(r11), r7
    bt.mov r3, r12
    bg.jal 0x20c73b
    bn.andi r7, r3, 0xff
    bn.sh_1 0x0(r13), r7
    bg.ori r7, r0, 0xff00
    bn.and r3, r3, r7
    bn.srli r3, r3, 0x8
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0xc40
    bn.add r10, r15, r4
    bn.sh_1 0x0(r10), r3
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x1490
    bn.add r16, r15, r5
    bn.lh r7, 0x0(r16)
    bg.beqi r7, 0x0, loc_20d857
    bt.mov r3, r12
    bg.jal 0x20c98a
    bg.bnei r3, 0x0, loc_20d99b
    bg.movhi r19, 0x45
    bg.addi r6, r19, 0x3b6e
    bn.add r7, r12, r6
    bn.lbz r7, 0x0(r7)
    bg.beqi r7, 0x1, loc_20d99b
    bt.mov r3, r12
    bg.jal 0x20cbd6
    bn.andi r3, r3, 0x80
    bg.bnei r3, 0x0, loc_20dac6
    bn.lh r6, 0x0(r13)
    bn.exthz r6, r6
    bn.lh r7, 0x0(r11)
    bn.exthz r7, r7
    bg.ble r7, r6, loc_20d780
loc_20d74d:
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x1080
    bn.add r6, r15, r5
    bn.lh r7, 0x0(r6)
    bg.addi r7, r7, 0x80
    bn.exthz r7, r7
    bn.sh_1 0x0(r6), r7
    bn.lh r6, 0x0(r6)
    bn.exthz r6, r6
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x1050
    bn.add r7, r15, r4
    bn.lh r7, 0x0(r7)
    bn.exthz r7, r7
    bg.bgt r7, r6, loc_20d74d
loc_20d780:
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x1050
    bn.add r7, r15, r5
    bn.lh r7, 0x0(r7)
    bt.addi r7, 0x1
    bn.exthz r11, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x1080
    bn.add r16, r15, r6
    bn.lh r7, 0x0(r16)
    bn.exthz r7, r7
    bg.bgt r11, r7, loc_20d836
    bt.mov r3, r12
    bt.movi r4, 0x1
    bg.jal 0x20c7a8
    bg.addi r3, r3, 0x4700
    bn.exthz r17, r3
    bn.slli r13, r12, 0x7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x1490
    bn.add r10, r15, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x1480
    bt.add r13, r4
    bg.movhi r5, 0x45
    bg.addi r5, r5, 0x3b5a
    bn.add r14, r12, r5
    bt.j loc_20d7ec
loc_20d7dc:
    bn.addi r7, r11, 0x1
    bn.exthz r11, r7
    bn.lh r7, 0x0(r16)
    bn.exthz r7, r7
    bg.bgt r11, r7, loc_20d836
loc_20d7ec:
    bn.lh r7, 0x0(r10)
    bn.exthz r7, r7
    bn.add r6, r13, r7
    bn.lbz r4, 0x0(r6)
    bt.addi r7, 0x1
    bn.exthz r7, r7
    bn.sh_1 0x0(r10), r7
    bn.andi r3, r11, 0x7f
    bt.add r3, r17
    bn.exthz r3, r3
    bn.extbz r4, r4
    bg.jal 0x20e3be
    bn.lh r6, 0x0(r10)
    bn.exthz r6, r6
    bn.lbz r7, 0x0(r14)
    bn.extbz r7, r7
    bg.bgt r7, r6, loc_20d7dc
    bn.sh_1 0x0(r10), r0
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x1080
    bn.add r6, r15, r4
    bn.lh r7, 0x0(r6)
    bn.andi r7, r7, 0x7f
    bn.sh_1 0x0(r6), r7
loc_20d836:
    bt.mov r3, r12
    bg.jal 0x20c98a
    bn.beqi r3, 0x0, loc_20d85d
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x3b6e
    bn.add r6, r12, r7
    bt.movi r7, 0x1
    bn.sbz 0x0(r6), r7
    bt.mov r3, r12
    bg.jal 0x20c895
    bt.j loc_20d85d
loc_20d857:
    bt.mov r3, r12
    bg.jal 0x20c895
loc_20d85d:
    bt.mov r3, r12
    bg.jal 0x20c80d
    bt.mov r3, r12
    bg.jal 0x20cbd6
    bn.andi r3, r3, 0x80
    bg.beqi r3, 0x0, loc_20d445
loc_20d870:
    bt.mov r3, r12
    bn.ori r4, r0, 0x80
    bn.lwz r21, 0x0(r1)
    bn.lwz r20, 0x4(r1)
    bn.lwz r19, 0x8(r1)
    bn.lwz r18, 0xc(r1)
    bn.lwz r17, 0x10(r1)
    bn.lwz r16, 0x14(r1)
    bn.lwz r15, 0x18(r1)
    bn.lwz r14, 0x1c(r1)
    bn.lwz r13, 0x20(r1)
    bn.lwz r12, 0x24(r1)
    bn.lwz r11, 0x28(r1)
    bn.lwz r10, 0x2c(r1)
    bn.lwz r9, 0x30(r1)
    bn.addi r1, r1, 0x34
    bg.j 0x20ca70
loc_20d8a3:
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x1080
    bn.add r7, r15, r5
    bn.lh r6, 0x0(r7)
    bt.j loc_20d8ce
loc_20d8b3:
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x1080
    bn.add r6, r15, r7
    bn.lh r7, 0x0(r6)
    bg.addi r7, r7, 0x80
    bn.exthz r7, r7
    bn.sh_1 0x0(r6), r7
    bn.lh r6, 0x0(r6)
loc_20d8ce:
    bn.exthz r6, r6
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x1050
    bn.add r7, r15, r4
    bn.lh r7, 0x0(r7)
    bn.exthz r7, r7
    bg.ble r6, r7, loc_20d8b3
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x1050
    bn.add r7, r15, r5
    bn.lh r7, 0x0(r7)
    bt.addi r7, 0x1
    bn.exthz r11, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x1080
    bn.add r10, r15, r6
    bn.lh r7, 0x0(r10)
    bn.exthz r7, r7
    bg.bgt r11, r7, loc_20d5d0
    bt.mov r3, r12
    bt.movi r4, 0x0
    bg.jal 0x20c7a8
    bg.addi r3, r3, 0x4700
    bn.exthz r17, r3
    bn.slli r13, r12, 0x7
    bg.movhi r18, 0x45
    bg.addi r7, r18, 0x414c
    bn.add r14, r12, r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x1480
    bt.add r13, r4
    bt.mov r16, r10
loc_20d937:
    bn.lbz r10, 0x0(r14)
    bn.extbz r10, r10
    bn.andi r3, r11, 0x7f
    bt.add r3, r17
    bn.exthz r3, r3
    bg.jal 0x20e47e
    bn.add r7, r13, r10
    bn.sbz 0x0(r7), r3
    bt.addi r10, 0x1
    bn.extbz r10, r10
    bn.sbz 0x0(r14), r10
    bn.addi r7, r11, 0x1
    bn.exthz r11, r7
    bn.lh r7, 0x0(r16)
    bn.exthz r7, r7
    bg.ble r11, r7, loc_20d937
    bn.j loc_20d5d0
loc_20d96a:
    bg.movhi r5, 0x45
    bg.addi r5, r5, 0x3b6e
    bn.add r7, r12, r5
    bt.movi r6, 0x1
    bn.sbz 0x0(r7), r6
    bt.mov r3, r12
    bg.jal 0x20ccf6
    bt.mov r3, r12
    bg.jal 0x20c80d
    bt.mov r3, r12
    bg.jal 0x20c895
    bt.mov r3, r12
    bg.jal 0x20cbd6
    bn.andi r3, r3, 0x80
    bg.beqi r3, 0x0, loc_20d445
    bt.j loc_20d870
loc_20d99b:
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x3b6e
    bn.add r6, r12, r7
    bt.movi r7, 0x1
    bn.sbz 0x0(r6), r7
    bt.mov r3, r12
    bg.jal 0x20c80d
    bt.mov r3, r12
    bn.lwz r21, 0x0(r1)
    bn.lwz r20, 0x4(r1)
    bn.lwz r19, 0x8(r1)
    bn.lwz r18, 0xc(r1)
    bn.lwz r17, 0x10(r1)
    bn.lwz r16, 0x14(r1)
    bn.lwz r15, 0x18(r1)
    bn.lwz r14, 0x1c(r1)
    bn.lwz r13, 0x20(r1)
    bn.lwz r12, 0x24(r1)
    bn.lwz r11, 0x28(r1)
    bn.lwz r10, 0x2c(r1)
    bn.lwz r9, 0x30(r1)
    bn.addi r1, r1, 0x34
    bg.j 0x20c895
loc_20d9e1:
    bt.mov r3, r12
    bg.jal 0x20cbd6
    bn.andi r3, r3, 0x80
    bg.bnei r3, 0x0, loc_20d4d3
    bt.mov r3, r12
    bg.jal 0x20ccf6
    bt.mov r3, r12
    bn.lwz r21, 0x0(r1)
    bn.lwz r20, 0x4(r1)
    bn.lwz r19, 0x8(r1)
    bn.lwz r18, 0xc(r1)
    bn.lwz r17, 0x10(r1)
    bn.lwz r16, 0x14(r1)
    bn.lwz r15, 0x18(r1)
    bn.lwz r14, 0x1c(r1)
    bn.lwz r13, 0x20(r1)
    bn.lwz r12, 0x24(r1)
    bn.lwz r11, 0x28(r1)
    bn.lwz r10, 0x2c(r1)
    bn.lwz r9, 0x30(r1)
    bn.addi r1, r1, 0x34
    bg.j 0x20c80d
loc_20da24:
    bt.mov r3, r12
    bn.ori r4, r0, 0x80
    bg.jal 0x20ca70
    bn.j loc_20d66e
loc_20da30:
    bg.movhi r5, 0x45
    bg.addi r5, r5, 0x3b6e
    bn.add r6, r12, r5
    bt.movi r7, 0x1
    bn.sbz 0x0(r6), r7
    bt.mov r3, r12
    bg.jal 0x20ccf6
    bt.mov r3, r12
    bg.jal 0x20c895
    bn.j loc_20d65b
loc_20da4f:
    bn.lbz r7, 0x0(r5)
    bg.beqi r7, 0x0, loc_20d630
    bt.mov r3, r12
    bg.jal 0x20c9fa
    bg.bnei r3, 0x0, loc_20d630
    bg.movhi r6, 0x45
    bg.lhz r5, 0x51ec(r6)
    bn.ori r7, r5, 0x4
    bg.sw_1 0x51ec(r6), r7
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x3b94
    bn.add r6, r12, r7
    bt.movi r7, 0x5
    bn.sbz 0x0(r6), r7
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x1080
    bn.add r6, r15, r4
    bn.lh r7, 0x0(r6)
    bn.andi r7, r7, 0x7f
    bn.sh_1 0x0(r6), r7
    bt.mov r3, r12
    bg.jal 0x20c711
    bg.movhi r5, 0x45
    bg.addi r5, r5, 0x3b7e
    bn.add r7, r12, r5
    bn.sbz 0x0(r7), r3
    bg.movhi r6, 0x45
    bg.addi r6, r6, 0x3b8a
    bn.add r7, r12, r6
    bn.sbz 0x0(r7), r12
    bn.j loc_20d651
loc_20dab8:
    bn.lh r7, 0x0(r16)
    bt.addi r7, 0x1
    bn.exthz r7, r7
    bn.sh_1 0x0(r16), r7
    bn.j loc_20d581
loc_20dac6:
    bn.lh r6, 0x0(r13)
    bn.exthz r6, r6
    bn.lh r7, 0x0(r10)
    bn.exthz r7, r7
    bg.ble r7, r6, loc_20dae3
    bn.lh r7, 0x0(r13)
    bg.addi r7, r7, 0x80
    bn.exthz r7, r7
    bn.sh_1 0x0(r13), r7
loc_20dae3:
    bn.lh r7, 0x0(r10)
    bn.exthz r11, r7
    bn.lh r7, 0x0(r13)
    bn.exthz r7, r7
    bg.bgt r11, r7, loc_20d836
    bt.mov r3, r12
    bt.movi r4, 0x1
    bg.jal 0x20c7a8
    bg.addi r3, r3, 0x4700
    bn.exthz r17, r3
    bn.slli r14, r12, 0x7
    bt.mov r10, r16
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x1480
    bt.add r14, r4
    bg.movhi r5, 0x45
    bg.addi r5, r5, 0x3b5a
    bn.add r16, r12, r5
    bt.j loc_20db2e
loc_20db1e:
    bn.addi r7, r11, 0x1
    bn.exthz r11, r7
    bn.lh r7, 0x0(r13)
    bn.exthz r7, r7
    bg.bgt r11, r7, loc_20d836
loc_20db2e:
    bn.lh r7, 0x0(r10)
    bn.exthz r7, r7
    bn.add r6, r14, r7
    bn.lbz r4, 0x0(r6)
    bt.addi r7, 0x1
    bn.exthz r7, r7
    bn.sh_1 0x0(r10), r7
    bn.andi r3, r11, 0x7f
    bt.add r3, r17
    bn.exthz r3, r3
    bn.extbz r4, r4
    bg.jal 0x20e3be
    bn.lh r6, 0x0(r10)
    bn.exthz r6, r6
    bn.lbz r7, 0x0(r16)
    bn.extbz r7, r7
    bg.bgt r7, r6, loc_20db1e
    bn.sh_1 0x0(r10), r0
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x1080
    bn.add r6, r15, r7
    bn.lh r7, 0x0(r6)
    bn.andi r7, r7, 0x7f
    bn.sh_1 0x0(r6), r7
    bn.j loc_20d836
