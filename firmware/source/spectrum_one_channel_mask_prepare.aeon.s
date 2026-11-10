# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23d3a0,0x23d4fc); Iterate selected engine bits, consult channel metadata, and dispatch register preparation; physical effects unverified.
# Fixed original addresses; not a hardware-validated implementation.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bn.sw 0x14(r1), r10
    bn.sw 0x10(r1), r11
    bn.sw 0xc(r1), r12
    bn.sw 0x8(r1), r13
    bn.sw 0x4(r1), r14
    bn.sw 0x0(r1), r15
    bt.mov r15, r3
    bt.mov r11, r4
    bg.beqi r4, 0x0, loc_23d466
    bt.movi r13, 0x0
    bt.j loc_23d3cd
loc_23d3c4:
    bn.srli r11, r11, 0x1
    bt.addi r13, 0x1
    bg.beqi r11, 0x0, loc_23d466
loc_23d3cd:
    bn.extbz r10, r13
    bn.andi r7, r11, 0x1
    bn.beqi r7, 0x0, loc_23d3c4
    bt.mov r3, r10
    bg.jal 0x222804
    bn.ori r12, r0, 0xb0
    bn.muls r3, r3, r12
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bg.lbz r3, 0x8a(r3)
    bg.bnei r3, 0x0, loc_23d480
loc_23d3f4:
    bn.ori r14, r0, 0x86
loc_23d3f7:
    bt.mov r3, r10
    bg.jal 0x222804
    bn.ori r12, r0, 0xb0
    bn.muls r3, r3, r12
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bg.lbz r3, 0x8a(r3)
    bn.bnei r3, 0x0, loc_23d42e
    bt.mov r3, r10
    bg.jal 0x222804
    bn.muls r3, r3, r12
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bg.lbz r3, 0x8b(r3)
    bn.beqi r3, 0x0, loc_23d44a
loc_23d42e:
    bt.mov r3, r10
    bg.jal 0x222804
    bn.muls r3, r3, r12
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lwz r7, 0x4(r3)
    bn.andi r7, r7, 0x8
    bn.bnei r7, 0x0, loc_23d4a1
loc_23d44a:
    bt.mov r3, r10
    bn.ori r4, r0, 0x86
    bg.jal 0x21d1e5
    bt.mov r3, r15
    bt.mov r4, r10
    bt.mov r5, r14
    bg.jal 0x21d2bf
    bn.srli r11, r11, 0x1
    bt.addi r13, 0x1
    bg.bnei r11, 0x0, loc_23d3cd
loc_23d466:
    bn.lwz r15, 0x0(r1)
    bn.lwz r14, 0x4(r1)
    bn.lwz r13, 0x8(r1)
    bn.lwz r12, 0xc(r1)
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
loc_23d480:
    bt.mov r3, r10
    bg.jal 0x222804
    bn.muls r3, r3, r12
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lwz r7, 0x4(r3)
    bn.andi r7, r7, 0x20
    bt.movi r14, 0x6
    bg.bnei r7, 0x0, loc_23d3f7
    bt.j loc_23d3f4
loc_23d4a1:
    bt.mov r3, r10
    bg.jal 0x222804
    bn.muls r3, r3, r12
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lwz r3, 0x0(r3)
    bt.movi r4, 0x3
    bg.jal 0x20ece9
    bt.mov r3, r10
    bg.jal 0x222804
    bn.muls r3, r3, r12
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lwz r3, 0x0(r3)
    bt.movi r4, 0x2
    bg.jal 0x20ece9
    bt.mov r3, r10
    bg.jal 0x222804
    bn.muls r3, r3, r12
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lwz r3, 0x0(r3)
    bg.jal 0x20e990
    bg.ori r7, r0, 0xfff9
    bn.and r14, r14, r7
    bt.j loc_23d44a
