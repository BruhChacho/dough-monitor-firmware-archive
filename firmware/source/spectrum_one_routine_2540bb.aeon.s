# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2540bb,0x254212); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x3c
    bn.sw 0x38(r1), r9
    bn.sw 0x34(r1), r10
    bn.sw 0x30(r1), r11
    bn.sw 0x2c(r1), r12
    bn.sw 0x28(r1), r13
    bn.sw 0x24(r1), r14
    bn.sw 0x20(r1), r15
    bn.sw 0x1c(r1), r16
    bn.sw 0x18(r1), r17
    bt.mov r14, r3
    bt.mov r15, r4
    bt.mov r16, r5
    bt.mov r17, r6
    bn.ori r7, r0, 0xa8
    bn.muls r11, r3, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r11, r5
    bn.lh r6, 0x2a(r11)
    bn.lh r5, 0x2c(r11)
    bn.or r7, r6, r5
    bn.andi r7, r7, 0xa
    bn.sfnei r7, 0x0
    bn.cmovsi_2 r12, r0, 0x1
    bt.movi r7, 0x4
    bn.sbz 0x0(r16), r7
    bn.sh_1 0x0(r17), r0
    bn.sw 0x10(r1), r0
    bn.lbz r10, 0x29(r11)
    bt.addi r10, -0x1
    bn.extbz r10, r10
    bt.mov r3, r12
    bt.movi r4, 0xf
    bg.jal 0x252efc
    bt.mov r13, r3
    bg.bleui r10, 0x1, loc_2541ec
    bt.mov r3, r12
    bn.ori r4, r0, 0x17
    bg.jal 0x252efc
    bt.mov r10, r3
    bt.movi r11, 0x1
    bg.bnei r13, 0x0, loc_2541f9
loc_254135:
    bn.slli r7, r12, 0x2
    bt.add r7, r14
    bn.slli r7, r7, 0x1
    bg.movhi r6, 0x49
    bg.addi r6, r6, -0x58bc
    bt.add r7, r6
    bn.sh_1 0x0(r7), r10
    bt.mov r3, r12
    bt.mov r4, r10
    bn.ori r5, r0, 0x17
    bn.addi r6, r1, 0x8
    bt.movi r7, 0x8
    bg.jal 0x252ed8
    bt.mov r3, r14
    bg.jal 0x2227da
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lbz r7, 0x20(r3)
    bn.andi r7, r7, 0x10
    bt.movi r6, 0x0
    bn.beqi r7, 0x0, loc_25419d
    bn.ori r7, r0, 0xa8
    bn.muls r7, r14, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r7, r5
    bg.lbz r7, 0xa4(r7)
    bn.sfnei r7, 0x0
    bn.cmovsi_2 r7, r0, 0x1
    bt.movi r6, 0x1
    bn.xor r7, r7, r6
    bn.extbz r6, r7
loc_25419d:
    bn.sw 0x10(r1), r6
    bn.sw 0x0(r1), r16
    bt.movi r3, 0x0
    bt.mov r4, r11
    bt.mov r5, r10
    bt.mov r6, r13
    bn.addi r7, r1, 0x17
    bn.addi r8, r1, 0x10
    bg.jal 0x251355
    bn.lbz r6, 0xe(r1)
    bn.lbz r7, 0xf(r1)
    bn.slli r7, r7, 0x8
    bn.or r6, r6, r7
    bn.sh_1 0x0(r17), r6
    bn.bnei r13, 0x0, loc_2541fd
    bt.movi r7, 0x1
    bn.sbz 0x0(r15), r7
loc_2541cc:
    bn.lwz r17, 0x18(r1)
    bn.lwz r16, 0x1c(r1)
    bn.lwz r15, 0x20(r1)
    bn.lwz r14, 0x24(r1)
    bn.lwz r13, 0x28(r1)
    bn.lwz r12, 0x2c(r1)
    bn.lwz r11, 0x30(r1)
    bn.lwz r10, 0x34(r1)
    bn.lwz r9, 0x38(r1)
    bn.addi r1, r1, 0x3c
    bt.jr r9
loc_2541ec:
    bt.mov r3, r12
    bn.ori r4, r0, 0x17
    bg.jal 0x252efc
    bt.mov r10, r3
    bt.movi r13, 0x1
loc_2541f9:
    bt.movi r11, 0x0
    bt.j loc_254135
loc_2541fd:
    bn.beqi r13, 0x1, loc_25420b
    bn.sfeqi r13, 0x2
    bn.cmov_0 r7, r13, r0
    bn.sbz 0x0(r15), r7
    bt.j loc_2541cc
loc_25420b:
    bt.movi r7, 0x3
    bn.sbz 0x0(r15), r7
    bt.j loc_2541cc
