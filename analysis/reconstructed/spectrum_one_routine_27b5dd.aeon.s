# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27b5dd,0x27b707); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bn.sw 0x14(r1), r10
    bn.sw 0x10(r1), r11
    bn.sw 0xc(r1), r12
    bn.sw 0x8(r1), r13
    bn.sw 0x4(r1), r14
    bn.sw 0x0(r1), r15
    bt.mov r13, r3
    bt.mov r14, r4
    bt.mov r10, r5
    bt.mov r3, r5
    bg.jal 0x27adde
    bg.movhi r15, 0x48
    bg.addi r6, r15, -0x2370
    bn.sw 0x10(r6), r3
    bt.movi r11, 0x0
    bt.movi r12, 0x0
    bn.beqi r3, 0x0, loc_27b64b
    bg.movhi r7, 0x48
    bg.lbz r7, -0x2350(r7)
    bg.bnei r7, 0x0, loc_27b6d3
    bn.srli r7, r10, 0x18
    bn.sbz 0x18(r6), r7
    bt.mov r5, r7
    bn.movhi_2 r4, 0x7f
    bg.ori r4, r4, 0xff00
    bn.and r7, r10, r4
    bt.movi r8, 0x0
    bn.srli r4, r7, 0x10
    bn.slli r8, r8, 0x10
    bn.or r8, r4, r8
    bn.slli r7, r7, 0x10
    bg.addi r4, r0, -0x8000
    bn.or r8, r8, r4
    bn.or r11, r5, r7
    bt.mov r12, r8
loc_27b64b:
    bg.jal 0x27ad9a
    bn.beqi r3, 0x0, loc_27b68d
    bg.addi r7, r15, -0x2370
    bn.lwz r6, 0x10(r7)
    bn.sw 0x14(r7), r6
    bn.lbz r6, 0x18(r7)
    bn.sbz 0x19(r7), r6
    bn.or r7, r11, r12
    bg.bnei r7, 0x0, loc_27b6fd
loc_27b669:
    bt.mov r3, r13
    bt.mov r4, r14
    bg.jal 0x27a971
    bt.movi r3, 0x1
loc_27b673:
    bn.lwz r15, 0x0(r1)
    bn.lwz r14, 0x4(r1)
    bn.lwz r13, 0x8(r1)
    bn.lwz r12, 0xc(r1)
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
loc_27b68d:
    bg.addi r10, r15, -0x2370
    bn.lh r7, 0xc(r10)
    bn.slli r7, r7, 0x2
    bt.addi r7, -0x1
    bt.movi r3, 0x0
    bg.lhz r15, -0x2370(r15)
    bg.bles r7, r15, loc_27b673
    bn.or r7, r11, r12
    bn.beqi r7, 0x0, loc_27b669
    bn.lwz r6, 0x14(r10)
    bn.lwz r7, 0x10(r10)
    bg.bne r6, r7, loc_27b6bd
    bn.lbz r7, 0x18(r10)
    bn.lbz r6, 0x19(r10)
    bg.beq r7, r6, loc_27b669
loc_27b6bd:
    bt.mov r3, r11
    bt.mov r4, r12
    bg.jal 0x27a971
    bn.lwz r7, 0x10(r10)
    bn.sw 0x14(r10), r7
    bn.lbz r7, 0x18(r10)
    bn.sbz 0x19(r10), r7
    bt.j loc_27b669
loc_27b6d3:
    bt.mov r3, r10
    bg.jal 0x27ade2
    bg.ori r4, r0, 0xffff
    bn.and r7, r13, r4
    bg.addi r6, r0, -0x100
    bn.and r8, r14, r6
    bt.movi r4, 0x0
    bn.srli r6, r3, 0x10
    bn.slli r4, r4, 0x10
    bn.or r4, r6, r4
    bn.slli r3, r3, 0x10
    bn.or r13, r7, r3
    bn.or r14, r8, r4
    bt.j loc_27b64b
loc_27b6fd:
    bt.mov r3, r11
    bt.mov r4, r12
    bg.jal 0x27a971
    bt.j loc_27b669
