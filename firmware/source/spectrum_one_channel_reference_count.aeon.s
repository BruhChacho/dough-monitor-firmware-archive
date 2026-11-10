# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23ee2c,0x23eee9); Count matching active channels and return the resulting count.
# Fixed original addresses; not a hardware-validated implementation.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r12, r3
    bt.movi r13, 0x0
    bt.movi r10, 0x0
    bg.movhi r7, 0x48
    bg.addi r11, r7, 0x21f0
loc_23ee4c:
    bn.extbz r3, r10
    bn.lwz r7, 0x0(r11)
    bn.bnei r7, 0x0, loc_23ee75
loc_23ee55:
    bt.addi r10, 0x1
    bg.addi r11, r11, 0xa8
    bg.bnei r10, 0x4, loc_23ee4c
    bt.mov r3, r13
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
loc_23ee75:
    bg.jal 0x2227da
    bg.beq r3, r12, loc_23eee1
    bg.lbz r5, 0x90(r11)
    bn.beqi r5, 0x0, loc_23ee55
    bn.ori r5, r0, 0xb0
    bn.muls r7, r3, r5
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bg.lwz r6, 0x80(r7)
    bn.beqi r6, 0x0, loc_23ee55
    bn.muls r7, r12, r5
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r7, r5
    bg.lwz r7, 0x80(r7)
    bn.beqi r7, 0x0, loc_23ee55
    bt.movi r4, 0x3
    bg.beqi r6, 0x4, loc_23eeb8
    bn.extbz r4, r6
loc_23eeb8:
    bt.movi r5, 0x0
    bt.movi r6, 0x0
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bt.j loc_23eed7
loc_23eece:
    bt.addi r5, 0x1
    bn.extbz r6, r5
    bg.bgt r6, r4, loc_23ee55
loc_23eed7:
    bn.add r7, r3, r6
    bn.lbz r7, 0x7c(r7)
    bg.bne r12, r7, loc_23eece
loc_23eee1:
    bn.addi r7, r13, 0x1
    bn.extbz r13, r7
    bt.j loc_23ee55
