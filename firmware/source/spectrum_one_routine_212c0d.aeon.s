# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x212c0d,0x212ca6); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bn.sw 0x14(r1), r10
    bn.sw 0x10(r1), r11
    bn.sw 0xc(r1), r12
    bn.sw 0x8(r1), r13
    bn.sw 0x4(r1), r14
    bn.sw 0x0(r1), r15
    bt.mov r11, r4
    bn.slli r10, r3, 0x8
    bt.movhi r7, -0xa
    bg.ori r7, r7, 0x2710
    bn.add r14, r10, r7
    bt.mov r3, r14
    bg.jal 0x23dd44
    bt.mov r15, r3
    bt.mov r3, r14
    bt.movi r4, 0x3
    bt.movi r5, 0xf
    bg.jal 0x23dfe1
    bt.movhi r7, -0xa
    bg.ori r7, r7, 0x271c
    bn.add r13, r10, r7
    bt.movhi r7, -0xa
    bg.ori r7, r7, 0x2720
    bn.add r12, r10, r7
    bt.movhi r7, -0xa
    bg.ori r7, r7, 0x273c
    bt.add r10, r7
    bt.j loc_212c6c
loc_212c61:
    bn.sbz 0x0(r11), r0
    bt.addi r12, 0x1
    bt.addi r11, 0x1
    bg.beq r12, r10, loc_212c86
loc_212c6c:
    bt.mov r3, r13
    bg.jal 0x23dd44
    bn.bnei r3, 0x0, loc_212c61
    bt.mov r3, r12
    bg.jal 0x23dd44
    bn.sbz 0x0(r11), r3
    bt.addi r12, 0x1
    bt.addi r11, 0x1
    bg.bne r12, r10, loc_212c6c
loc_212c86:
    bt.mov r3, r14
    bt.mov r4, r15
    bn.lwz r15, 0x0(r1)
    bn.lwz r14, 0x4(r1)
    bn.lwz r13, 0x8(r1)
    bn.lwz r12, 0xc(r1)
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bg.j 0x23ddb9
