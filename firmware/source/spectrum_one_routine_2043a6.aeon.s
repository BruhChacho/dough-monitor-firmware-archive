# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2043a6,0x20444d); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r10, r3
    bt.mov r13, r4
    bg.movhi r11, 0x48
    bg.addi r11, r11, -0x1f40
    bg.jal 0x204243
    bt.mov r4, r11
    bn.ori r5, r0, 0x50
    bg.jal 0x2461d6
    bt.movi r7, 0x6
    bn.muls r12, r10, r7
    bg.movhi r11, 0x48
    bg.addi r11, r11, -0x1f40
    bt.add r12, r11
    bt.mov r3, r12
    bt.movi r4, 0x6
    bg.jal 0x204080
    bn.slli r10, r10, 0x2
    bt.add r10, r11
    bn.lbz r6, 0x30(r10)
    bn.lbz r7, 0x31(r10)
    bn.slli r7, r7, 0x8
    bn.or r7, r7, r6
    bn.lbz r6, 0x32(r10)
    bn.slli r6, r6, 0x10
    bn.or r6, r6, r7
    bn.lbz r7, 0x33(r10)
    bn.slli r7, r7, 0x18
    bn.or r7, r7, r6
    bt.movi r6, 0x0
    bg.bne r3, r7, loc_204437
    bn.lbz r7, 0x0(r12)
    bn.sbz 0x0(r13), r7
    bn.lbz r7, 0x1(r12)
    bn.sbz 0x1(r13), r7
    bn.lbz r7, 0x2(r12)
    bn.sbz 0x2(r13), r7
    bn.lbz r7, 0x3(r12)
    bn.sbz 0x3(r13), r7
    bn.lbz r7, 0x4(r12)
    bn.sbz 0x4(r13), r7
    bn.lbz r7, 0x5(r12)
    bn.sbz 0x5(r13), r7
    bt.movi r6, 0x1
loc_204437:
    bt.mov r3, r6
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
