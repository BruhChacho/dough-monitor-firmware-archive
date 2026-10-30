# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21d2bf,0x21d3b1); Map engine to metadata key and mask-update selected 16-bit paged register; zero argument sets bits, nonzero clears.
# Fixed original addresses; not a hardware-validated implementation.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r12, r3
    bt.mov r11, r4
    bt.mov r13, r5
    bt.mov r3, r4
    bg.jal 0x222804
    bn.ori r10, r0, 0xb0
    bn.muls r3, r3, r10
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lwz r7, 0x0(r3)
    bg.bleui r7, 0x7, loc_21d341
    bt.mov r3, r11
    bg.jal 0x222804
    bn.muls r3, r3, r10
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lbz r10, 0x0(r3)
loc_21d30a:
    bt.mov r3, r11
    bg.jal 0x222804
    bg.bgtui r3, 0x5, loc_21d380
loc_21d314:
    bn.sfeqi r12, 0x0
    bn.slli r3, r10, 0x9
    bt.movhi r7, -0xd
    bg.ori r7, r7, 0x380
    bt.add r3, r7
    bg.ori r4, r0, 0xffff
    bn.cmov_0 r4, r4, r0
    bt.mov r5, r13
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bg.j 0x23e152
loc_21d341:
    bt.mov r3, r11
    bg.jal 0x222804
    bn.muls r3, r3, r10
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lwz r7, 0x0(r3)
    bg.bleui r7, 0x4, loc_21d394
    bt.mov r3, r11
    bg.jal 0x222804
    bn.muls r3, r3, r10
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lbz r7, 0x0(r3)
    bt.addi r7, -0x5
    bn.extbz r10, r7
    bt.mov r3, r11
    bg.jal 0x222804
    bg.bleui r3, 0x5, loc_21d314
loc_21d380:
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
loc_21d394:
    bt.mov r3, r11
    bg.jal 0x222804
    bn.muls r3, r3, r10
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lbz r7, 0x0(r3)
    bt.addi r7, 0x3
    bn.extbz r10, r7
    bt.j loc_21d30a
