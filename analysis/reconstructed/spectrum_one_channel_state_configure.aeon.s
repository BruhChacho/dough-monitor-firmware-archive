# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2340cd,0x23417c); Publish six argument bytes and write four per-channel state words selected by low mask bits.
# Fixed original addresses; not a hardware-validated implementation.
    bn.addi r1, r1, -0x20
    bn.sw 0x1c(r1), r9
    bn.sw 0x18(r1), r10
    bn.sw 0x14(r1), r11
    bn.sw 0x10(r1), r12
    bn.sw 0xc(r1), r13
    bn.sw 0x8(r1), r14
    bn.sw 0x4(r1), r15
    bn.sw 0x0(r1), r16
    bt.mov r13, r8
    bg.movhi r23, 0x45
    bg.sbz 0x3bd6(r23), r3
    bg.movhi r23, 0x45
    bg.sbz 0x3bd5(r23), r4
    bg.movhi r4, 0x45
    bg.sbz 0x3bcd(r4), r5
    bg.movhi r16, 0x45
    bg.sbz 0x3bce(r16), r6
    bg.movhi r6, 0x45
    bg.sbz 0x3bcc(r6), r7
    bg.movhi r7, 0x45
    bg.sbz 0x3bd4(r7), r8
    bt.movi r12, 0x0
    bt.movi r10, 0x0
    bt.movi r15, 0x1
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0xe8
    bn.addi r11, r7, 0x14
    bt.movi r14, 0x4
loc_23412d:
    bn.sra r7, r13, r10
    bn.andi r7, r7, 0x1
    bn.beqi r7, 0x0, loc_23416f
    bn.sw 0x0(r11), r15
    bg.lbz r7, 0x3bce(r16)
    bn.sra r7, r7, r10
    bn.andi r7, r7, 0x1
    bn.bnei r7, 0x0, loc_234174
loc_234146:
    bt.addi r12, 0x1
    bg.addi r11, r11, 0x84
    bt.addi r10, 0x1
    bg.bnei r10, 0x4, loc_23412d
    bn.lwz r16, 0x0(r1)
    bn.lwz r15, 0x4(r1)
    bn.lwz r14, 0x8(r1)
    bn.lwz r13, 0xc(r1)
    bn.lwz r12, 0x10(r1)
    bn.lwz r11, 0x14(r1)
    bn.lwz r10, 0x18(r1)
    bn.lwz r9, 0x1c(r1)
    bn.addi r1, r1, 0x20
    bt.jr r9
loc_23416f:
    bn.sw 0x0(r11), r14
    bt.j loc_234146
loc_234174:
    bt.mov r3, r12
    bg.jal 0x2118d2
    bt.j loc_234146
