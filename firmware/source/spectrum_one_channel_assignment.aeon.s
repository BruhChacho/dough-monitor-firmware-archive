# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x22701c,0x227145); Assign a channel from metadata and ENGINE records; helper and dispatch behavior remains unresolved.
# Fixed original addresses; not hardware-validated.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r11, r3
    bt.mov r12, r4
    bg.beqi r3, 0x6, loc_227090
    bn.ori r7, r0, 0xb0
    bn.muls r10, r3, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r10, r5
    bn.lbz r6, 0x10(r10)
    bg.beqi r6, 0x4, loc_2270a4
    bt.movi r7, 0x1
    bn.sll r7, r7, r4
    bn.lh r6, 0x12(r10)
    bn.or r7, r7, r6
    bn.sh_2 0x12(r10), r7
loc_22705b:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r12, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.sbz 0x1d(r7), r11
    bt.mov r3, r11
    bt.mov r4, r12
    bg.jal 0x222ce8
    bt.mov r3, r11
    bt.mov r4, r12
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bg.j 0x220c76
loc_227090:
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
loc_2270a4:
    bn.sbz 0x10(r10), r4
    bt.movi r13, 0x1
    bn.sll r7, r13, r4
    bn.sh_2 0x12(r10), r7
    bn.sbz 0x1c(r10), r13
    bt.mov r3, r4
    bg.jal 0x2227ef
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r3, r7
    bg.lbz r3, 0x81(r3)
    bn.beqi r3, 0x0, loc_227134
    bn.sw 0xc(r10), r0
loc_2270d2:
    bn.ori r7, r0, 0xb0
    bn.muls r7, r11, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r7, r5
    bn.sbz 0x70(r7), r0
    bg.bgtui r12, 0x3, loc_22705b
    bg.movhi r7, 0x45
    bg.lbz r7, 0x508c(r7)
    bg.beqi r7, 0x0, loc_22705b
    bn.ori r7, r0, 0x18
    bn.muls r7, r11, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4288
    bt.add r7, r6
    bt.movi r6, 0x1
    bn.sbz 0x0(r7), r6
    bn.sbz 0x1(r7), r6
    bn.sbz 0x11(r7), r0
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4281
    bn.add r6, r11, r5
    bn.lbz r6, 0x0(r6)
    bn.sw 0x4(r7), r6
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x427b
    bn.add r6, r11, r5
    bn.lbz r6, 0x0(r6)
    bn.sw 0x8(r7), r6
    bt.j loc_22705b
loc_227134:
    bn.sw 0xc(r10), r13
    bt.movi r3, 0x1
    bn.lwz r4, 0x0(r10)
    bn.lwz r5, 0x4(r10)
    bg.jal 0x20f1ef
    bt.j loc_2270d2
