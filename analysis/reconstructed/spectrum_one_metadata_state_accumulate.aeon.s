# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20f1ef,0x20f401); Accumulate flag-selected channel bits in global state and dispatch common services; both enable and disable paths call services.
# Fixed original addresses; not a hardware-validated implementation.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r12, r3
    bt.mov r10, r5
    bt.mov r3, r4
    bg.jal 0x20e687
    bg.movhi r11, 0x45
    bg.movhi r13, 0x45
    bg.lbz r5, 0x43bc(r11)
    bn.bnei r5, 0x0, loc_20f27c
    bn.andi r7, r10, 0x1
    bg.bnei r7, 0x0, loc_20f3ef
    bn.andi r7, r10, 0x2
    bg.bnei r7, 0x0, loc_20f3d9
loc_20f228:
    bn.andi r7, r10, 0x4
    bg.bnei r7, 0x0, loc_20f3c3
loc_20f22f:
    bn.andi r7, r10, 0x8
    bg.bnei r7, 0x0, loc_20f3a5
loc_20f236:
    bg.ori r6, r0, 0x400
    bn.and r7, r10, r6
    bg.movhi r13, 0x45
    bg.bnei r7, 0x0, loc_20f37b
loc_20f245:
    bn.andi r7, r10, 0x10
    bg.bnei r7, 0x0, loc_20f365
loc_20f24c:
    bn.andi r7, r10, 0x20
    bg.bnei r7, 0x0, loc_20f34b
loc_20f253:
    bg.ori r6, r0, 0x100
    bn.and r7, r10, r6
    bg.bnei r7, 0x0, loc_20f331
loc_20f25e:
    bg.ori r6, r0, 0x200
    bn.and r7, r10, r6
    bg.bnei r7, 0x0, loc_20f319
loc_20f269:
    bt.movhi r6, 0x4
    bn.and r7, r10, r6
    bg.bnei r7, 0x0, loc_20f2ff
loc_20f272:
    bg.ori r6, r0, 0x6000
    bn.and r7, r10, r6
    bn.bnei r7, 0x0, loc_20f2f0
loc_20f27c:
    bn.beqi r12, 0x0, loc_20f2de
    bg.addi r6, r11, 0x43bc
    bn.lbz r5, 0xc(r6)
    bn.or r7, r3, r5
    bn.sbz 0xc(r6), r7
loc_20f28c:
    bg.jal 0x20e76c
    bg.addi r10, r11, 0x43bc
    bn.lbz r3, 0x3(r10)
    bn.lbz r4, 0x6(r10)
    bn.lbz r5, 0x4(r10)
    bn.lbz r6, 0x5(r10)
    bn.lbz r7, 0xa(r10)
    bn.lbz r8, 0xc(r10)
    bg.jal 0x23417c
    bg.lbz r3, 0x43d0(r13)
    bg.jal 0x2341c8
    bn.lbz r3, 0x8(r10)
    bn.lbz r4, 0xb(r10)
    bn.lbz r5, 0x7(r10)
    bn.lbz r6, 0xc(r10)
    bg.jal 0x2112a0
    bn.lbz r3, 0xa(r10)
    bn.lbz r4, 0xc(r10)
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bg.j 0x20ff1b
loc_20f2de:
    bg.addi r6, r11, 0x43bc
    bn.nand r7, r3, r3
    bn.lbz r5, 0xc(r6)
    bn.and r7, r5, r7
    bn.sbz 0xc(r6), r7
    bt.j loc_20f28c
loc_20f2f0:
    bg.addi r6, r11, 0x43bc
    bn.lbz r5, 0xb(r6)
    bn.or r7, r3, r5
    bn.sbz 0xb(r6), r7
    bt.j loc_20f27c
loc_20f2ff:
    bg.addi r6, r11, 0x43bc
    bn.lbz r5, 0xd(r6)
    bn.or r7, r3, r5
    bn.sbz 0xd(r6), r7
    bg.ori r6, r0, 0x6000
    bn.and r7, r10, r6
    bg.beqi r7, 0x0, loc_20f27c
    bt.j loc_20f2f0
loc_20f319:
    bg.addi r6, r11, 0x43bc
    bn.lbz r5, 0x9(r6)
    bn.or r7, r3, r5
    bn.sbz 0x9(r6), r7
    bt.movhi r6, 0x4
    bn.and r7, r10, r6
    bg.beqi r7, 0x0, loc_20f272
    bt.j loc_20f2ff
loc_20f331:
    bg.addi r6, r11, 0x43bc
    bn.lbz r5, 0x8(r6)
    bn.or r7, r3, r5
    bn.sbz 0x8(r6), r7
    bg.ori r6, r0, 0x200
    bn.and r7, r10, r6
    bg.beqi r7, 0x0, loc_20f269
    bt.j loc_20f319
loc_20f34b:
    bg.addi r6, r11, 0x43bc
    bn.lbz r5, 0x7(r6)
    bn.or r7, r3, r5
    bn.sbz 0x7(r6), r7
    bg.ori r6, r0, 0x100
    bn.and r7, r10, r6
    bg.beqi r7, 0x0, loc_20f25e
    bt.j loc_20f331
loc_20f365:
    bg.addi r6, r11, 0x43bc
    bn.lbz r5, 0xa(r6)
    bn.or r7, r3, r5
    bn.sbz 0xa(r6), r7
    bn.andi r7, r10, 0x20
    bg.beqi r7, 0x0, loc_20f253
    bt.j loc_20f34b
loc_20f37b:
    bg.addi r7, r11, 0x43bc
    bn.lbz r5, 0x5(r7)
    bn.or r6, r3, r5
    bn.sbz 0x5(r7), r6
    bt.movhi r6, 0x2
    bn.and r7, r10, r6
    bg.beqi r7, 0x0, loc_20f245
    bg.lbz r5, 0x43d0(r13)
    bn.or r7, r3, r5
    bg.sbz 0x43d0(r13), r7
    bn.andi r7, r10, 0x10
    bg.beqi r7, 0x0, loc_20f24c
    bt.j loc_20f365
loc_20f3a5:
    bg.addi r6, r11, 0x43bc
    bn.lbz r5, 0x4(r6)
    bn.or r7, r3, r5
    bn.sbz 0x4(r6), r7
    bg.ori r6, r0, 0x400
    bn.and r7, r10, r6
    bg.movhi r13, 0x45
    bg.beqi r7, 0x0, loc_20f245
    bt.j loc_20f37b
loc_20f3c3:
    bg.addi r6, r11, 0x43bc
    bn.lbz r5, 0x6(r6)
    bn.or r7, r3, r5
    bn.sbz 0x6(r6), r7
    bn.andi r7, r10, 0x8
    bg.beqi r7, 0x0, loc_20f236
    bt.j loc_20f3a5
loc_20f3d9:
    bg.addi r6, r11, 0x43bc
    bn.lbz r5, 0x3(r6)
    bn.or r7, r3, r5
    bn.sbz 0x3(r6), r7
    bn.andi r7, r10, 0x4
    bg.beqi r7, 0x0, loc_20f22f
    bt.j loc_20f3c3
loc_20f3ef:
    bg.addi r6, r11, 0x43bc
    bt.movi r7, 0x1
    bn.sbz 0x1(r6), r7
    bn.andi r7, r10, 0x2
    bg.beqi r7, 0x0, loc_20f228
    bt.j loc_20f3d9
