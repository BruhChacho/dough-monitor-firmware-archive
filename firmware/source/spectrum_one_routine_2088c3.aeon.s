# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2088c3,0x208b0d); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x40
    bn.sw 0x3c(r1), r9
    bn.sw 0x38(r1), r10
    bn.sw 0x34(r1), r11
    bn.sw 0x30(r1), r12
    bn.sw 0x2c(r1), r13
    bn.sw 0x28(r1), r14
    bn.sw 0x24(r1), r15
    bn.sw 0x20(r1), r16
    bn.sw 0x1c(r1), r17
    bn.sw 0x18(r1), r18
    bn.sw 0x14(r1), r19
    bn.sw 0x10(r1), r20
    bt.mov r10, r3
    bt.mov r13, r5
    bg.jal 0x2227da
    bn.ori r7, r0, 0xb0
    bn.muls r7, r3, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r7, r5
    bt.mov r3, r1
    bn.lwz r4, 0x0(r7)
    bg.jal 0x20f12a
    bn.lwz r19, 0x4(r1)
    bt.movi r20, 0x0
    bn.ori r7, r0, 0xa8
    bn.muls r7, r10, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lwz r7, 0x4c(r7)
    bt.movi r3, 0x1
    bg.beqi r7, 0x0, loc_208b07
loc_208929:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r10, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bn.lh r12, 0x2c(r7)
    bg.beqi r12, 0x0, loc_2089e0
    bt.movi r14, 0x0
    bn.extbz r16, r3
    bn.extbz r15, r19
    bt.mov r17, r16
    bt.mov r18, r15
loc_20894c:
    bn.extbz r6, r14
    bn.andi r7, r12, 0x1
    bg.beqi r7, 0x0, loc_2089d7
    bn.ori r7, r0, 0x7c
    bn.muls r7, r6, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lwz r10, 0x4(r7)
    bn.andi r7, r6, 0x1
    bg.beqi r7, 0x0, loc_208a09
    bn.movhi_2 r6, 0x280
    bn.ori r6, r6, 0x80
    bn.add r3, r10, r6
    bg.beqi r13, 0x0, loc_208aac
    bt.movi r4, 0x8
    bt.movi r5, 0x8
    bg.jal 0x23dfe1
    bn.movhi_2 r7, 0x280
    bn.ori r7, r7, 0x56
    bn.add r11, r10, r7
    bn.ori r4, r0, 0x10
loc_208991:
    bt.mov r3, r11
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bg.beqi r20, 0x0, loc_208a7b
    bn.sfeqi r13, 0x0
    bt.mov r3, r11
    bg.ori r4, r0, 0x608
    bn.cmov_0 r4, r0, r4
    bg.ori r5, r0, 0xe608
    bg.jal 0x23e152
loc_2089b2:
    bn.movhi_2 r5, 0x280
    bn.ori r5, r5, 0x5a
    bt.add r10, r5
    bt.movi r11, 0x0
loc_2089bc:
    bt.mov r3, r16
    bt.mov r4, r15
    bn.extbz r5, r11
    bg.jal 0x206f72
    bt.mov r4, r3
    bt.mov r3, r10
    bg.jal 0x23dfb6
    bt.addi r11, 0x1
    bt.addi r10, 0x2
    bg.bnei r11, 0x9, loc_2089bc
loc_2089d7:
    bn.srli r12, r12, 0x1
    bt.addi r14, 0x1
    bg.bnei r12, 0x0, loc_20894c
loc_2089e0:
    bn.lwz r20, 0x10(r1)
    bn.lwz r19, 0x14(r1)
    bn.lwz r18, 0x18(r1)
    bn.lwz r17, 0x1c(r1)
    bn.lwz r16, 0x20(r1)
    bn.lwz r15, 0x24(r1)
    bn.lwz r14, 0x28(r1)
    bn.lwz r13, 0x2c(r1)
    bn.lwz r12, 0x30(r1)
    bn.lwz r11, 0x34(r1)
    bn.lwz r10, 0x38(r1)
    bn.lwz r9, 0x3c(r1)
    bn.addi r1, r1, 0x40
    bt.jr r9
loc_208a09:
    bn.movhi_2 r6, 0x480
    bn.ori r6, r6, 0x80
    bn.add r3, r10, r6
    bg.beqi r13, 0x0, loc_208af2
    bt.movi r4, 0x8
    bt.movi r5, 0x8
    bg.jal 0x23dfe1
    bn.movhi_2 r7, 0x480
    bn.ori r7, r7, 0x56
    bn.add r11, r10, r7
    bn.ori r4, r0, 0x10
loc_208a2a:
    bt.mov r3, r11
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bg.beqi r20, 0x0, loc_208ac1
    bn.sfeqi r13, 0x0
    bt.mov r3, r11
    bg.ori r4, r0, 0x608
    bn.cmov_0 r4, r0, r4
    bg.ori r5, r0, 0xe608
    bg.jal 0x23e152
loc_208a4b:
    bn.movhi_2 r5, 0x480
    bn.ori r5, r5, 0x5a
    bt.add r10, r5
    bt.movi r11, 0x0
loc_208a55:
    bt.mov r3, r17
    bt.mov r4, r18
    bn.extbz r5, r11
    bg.jal 0x206f72
    bt.mov r4, r3
    bt.mov r3, r10
    bg.jal 0x23dfb6
    bt.addi r11, 0x1
    bt.addi r10, 0x2
    bg.bnei r11, 0x9, loc_208a55
    bn.srli r12, r12, 0x1
    bt.addi r14, 0x1
    bg.bnei r12, 0x0, loc_20894c
    bt.j loc_2089e0
loc_208a7b:
    bn.sfnei r13, 0x0
    bt.mov r3, r11
    bg.ori r4, r0, 0x6000
    bn.cmov_0 r4, r4, r0
    bg.ori r5, r0, 0xe608
    bg.jal 0x23e152
    bn.beqi r19, 0x2, loc_208a96
    bg.bnei r19, 0x0, loc_2089b2
loc_208a96:
    bn.sfeqi r13, 0x0
    bt.mov r3, r11
    bg.ori r4, r0, 0xe000
    bn.cmov_0 r4, r0, r4
    bg.ori r5, r0, 0xe608
    bg.jal 0x23e152
    bt.j loc_2089b2
loc_208aac:
    bt.movi r4, 0x0
    bt.movi r5, 0x8
    bg.jal 0x23dfe1
    bn.movhi_2 r6, 0x280
    bn.ori r6, r6, 0x56
    bn.add r11, r10, r6
    bt.movi r4, 0x0
    bt.j loc_208991
loc_208ac1:
    bn.sfnei r13, 0x0
    bt.mov r3, r11
    bg.ori r4, r0, 0x6000
    bn.cmov_0 r4, r4, r0
    bg.ori r5, r0, 0xe608
    bg.jal 0x23e152
    bn.beqi r19, 0x2, loc_208adc
    bg.bnei r19, 0x0, loc_208a4b
loc_208adc:
    bn.sfeqi r13, 0x0
    bt.mov r3, r11
    bg.ori r4, r0, 0xe000
    bn.cmov_0 r4, r0, r4
    bg.ori r5, r0, 0xe608
    bg.jal 0x23e152
    bt.j loc_208a4b
loc_208af2:
    bt.movi r4, 0x0
    bt.movi r5, 0x8
    bg.jal 0x23dfe1
    bn.movhi_2 r7, 0x480
    bn.ori r7, r7, 0x56
    bn.add r11, r10, r7
    bt.movi r4, 0x0
    bt.j loc_208a2a
loc_208b07:
    bt.movi r20, 0x1
    bt.movi r3, 0x3
    bt.j loc_208929
