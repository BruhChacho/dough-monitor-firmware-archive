# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2271a9,0x2272cf); Update channel metadata flags using the metadata index and channel record.
# Fixed original addresses; not hardware-validated.
    bn.addi r1, r1, -0x18
    bn.sw 0x14(r1), r9
    bn.sw 0x10(r1), r10
    bn.sw 0xc(r1), r11
    bn.sw 0x8(r1), r12
    bn.sw 0x4(r1), r13
    bn.sw 0x0(r1), r14
    bt.mov r13, r3
    bg.jal 0x2227da
    bt.mov r10, r3
    bn.ori r7, r0, 0xb0
    bn.muls r4, r3, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r4, r5
    bg.lwz r12, 0x80(r4)
    bn.ff1 r7, r12
    bn.sub r7, r0, r7
    bn.srli r11, r7, 0x1f
    bn.ori r7, r0, 0xa8
    bn.muls r7, r13, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bg.lbz r7, 0x94(r7)
    bn.beqi r7, 0x0, loc_2271fd
    bn.bnei r11, 0x0, loc_227216
loc_2271fd:
    bt.movi r3, 0x1
loc_2271ff:
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bt.jr r9
loc_227216:
    bn.lbz r4, 0x7c(r4)
    bt.movi r14, 0x1
    bt.movi r6, 0x1
    bg.beq r3, r4, loc_22722c
    bt.mov r3, r13
    bg.jal 0x227145
    bn.andi r14, r3, 0x1
    bt.mov r6, r14
loc_22722c:
    bn.beqi r11, 0x0, loc_22725b
    bn.beqi r6, 0x0, loc_22725b
    bn.ori r7, r0, 0xb0
    bn.muls r7, r10, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r7, r5
    bn.lbz r4, 0x7d(r7)
    bg.beq r10, r4, loc_22725b
    bt.mov r3, r13
    bg.jal 0x227145
    bn.and r14, r14, r3
    bn.ff1 r7, r14
    bn.sub r7, r0, r7
    bn.srli r6, r7, 0x1f
loc_22725b:
    bn.bgtui r12, 0x1, loc_227288
loc_22725e:
    bn.beqi r6, 0x0, loc_2272b6
    bn.bleui r12, 0x2, loc_2272b6
    bn.ori r7, r0, 0xb0
    bn.muls r7, r10, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bn.lbz r4, 0x7f(r7)
    bt.mov r3, r14
    bg.beq r10, r4, loc_2271ff
    bt.mov r3, r13
    bg.jal 0x227145
    bn.and r3, r14, r3
    bt.j loc_2271ff
loc_227288:
    bn.beqi r6, 0x0, loc_2272b6
    bn.ori r7, r0, 0xb0
    bn.muls r7, r10, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r7, r5
    bn.lbz r4, 0x7e(r7)
    bg.beq r10, r4, loc_22725e
    bt.mov r3, r13
    bg.jal 0x227145
    bn.and r14, r14, r3
    bn.ff1 r7, r14
    bn.sub r7, r0, r7
    bn.srli r6, r7, 0x1f
    bt.j loc_22725e
loc_2272b6:
    bt.mov r3, r14
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bt.jr r9
