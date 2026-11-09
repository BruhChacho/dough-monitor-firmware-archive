# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2262ce,0x2263a5); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x18
    bn.sw 0x14(r1), r9
    bn.sw 0x10(r1), r10
    bn.sw 0xc(r1), r11
    bn.sw 0x8(r1), r12
    bn.sw 0x4(r1), r13
    bn.sw 0x0(r1), r14
    bt.mov r13, r3
    bt.mov r10, r4
    bn.ori r7, r0, 0xa8
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.lh r11, 0xc(r7)
    bg.jal 0x2227da
    bt.mov r14, r3
    bt.mov r12, r10
    bg.beqi r10, 0x0, loc_22639b
loc_226306:
    bg.sfgti r11, 0x1400
    bn.bnf loc_226349
loc_22630d:
    bt.movi r3, 0x1
    bn.beqi r10, 0x0, loc_226329
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bt.jr r9
loc_226329:
    bt.mov r3, r13
    bg.jal 0x2250c5
    bn.andi r3, r3, 0x1
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bt.jr r9
loc_226349:
    bg.jal 0x2229b7
    bn.bgtui r3, 0x2, loc_226382
    bn.bgtui r12, 0x1, loc_22630d
    bt.mov r3, r14
    bg.jal 0x226278
    bg.bnei r3, 0x4, loc_226382
    bn.ori r7, r0, 0xb0
    bn.muls r7, r14, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bn.lwz r3, 0x4(r7)
    bg.ori r6, r0, 0x8000
    bn.and r7, r3, r6
    bn.bnei r7, 0x0, loc_226382
    bt.movhi r6, 0x1
    bn.and r7, r3, r6
    bn.beqi r7, 0x0, loc_22630d
loc_226382:
    bt.movi r3, 0x0
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bt.jr r9
loc_22639b:
    bt.mov r3, r13
    bg.jal 0x222898
    bt.mov r12, r3
    bt.j loc_226306
