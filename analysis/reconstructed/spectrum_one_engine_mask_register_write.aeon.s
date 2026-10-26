# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21d1e5,0x21d2bf); Map engine to metadata key and select paged register bank, then write the supplied 16-bit mask.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r11, r3
    bt.mov r12, r4
    bg.jal 0x222804
    bn.ori r10, r0, 0xb0
    bn.muls r3, r3, r10
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lwz r7, 0x0(r3)
    bg.bleui r7, 0x7, loc_21d243
    bt.mov r3, r11
    bg.jal 0x222804
    bn.muls r3, r3, r10
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lbz r10, 0x0(r3)
loc_21d228:
    bt.mov r3, r11
    bg.jal 0x222804
    bg.bleui r3, 0x5, loc_21d282
loc_21d232:
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
loc_21d243:
    bt.mov r3, r11
    bg.jal 0x222804
    bn.muls r3, r3, r10
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lwz r7, 0x0(r3)
    bg.bleui r7, 0x4, loc_21d2a2
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
    bg.bgtui r3, 0x5, loc_21d232
loc_21d282:
    bn.slli r3, r10, 0x9
    bt.movhi r7, -0xd
    bg.ori r7, r7, 0x382
    bt.add r3, r7
    bt.mov r4, r12
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bg.j 0x23dfb6
loc_21d2a2:
    bt.mov r3, r11
    bg.jal 0x222804
    bn.muls r3, r3, r10
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lbz r7, 0x0(r3)
    bt.addi r7, 0x3
    bn.extbz r10, r7
    bt.j loc_21d228
