# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27f10b,0x27f21e); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x5c
    bn.sw 0x58(r1), r9
    bn.sw 0x54(r1), r10
    bn.sw 0x50(r1), r11
    bn.sw 0x4c(r1), r12
    bn.sw 0x48(r1), r13
    bn.sw 0x44(r1), r14
    bn.sw 0x40(r1), r15
    bt.mov r11, r3
    bt.mov r12, r4
    bt.mov r14, r5
    bn.slli r13, r4, 0x5
    bn.bnei r6, 0x0, loc_27f186
loc_27f12f:
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x7f48
    bn.add r6, r13, r7
    bn.lwz r7, 0x0(r6)
    bn.sw 0x0(r11), r7
    bn.lwz r7, 0x4(r6)
    bn.sw 0x4(r11), r7
    bn.lwz r7, 0x8(r6)
    bn.sw 0x8(r11), r7
    bn.lwz r7, 0xc(r6)
    bn.sw 0xc(r11), r7
    bn.lwz r7, 0x10(r6)
    bn.sw 0x10(r11), r7
    bn.lwz r7, 0x14(r6)
    bn.sw 0x14(r11), r7
    bn.lwz r7, 0x18(r6)
    bn.sw 0x18(r11), r7
    bn.lwz r7, 0x1c(r6)
    bn.sw 0x1c(r11), r7
    bt.mov r3, r11
    bn.lwz r15, 0x40(r1)
    bn.lwz r14, 0x44(r1)
    bn.lwz r13, 0x48(r1)
    bn.lwz r12, 0x4c(r1)
    bn.lwz r11, 0x50(r1)
    bn.lwz r10, 0x54(r1)
    bn.lwz r9, 0x58(r1)
    bn.addi r1, r1, 0x5c
    bt.jr r9
loc_27f186:
    bt.mov r3, r4
    bt.mov r4, r5
    bg.jal 0x27d992
    bn.addi r15, r1, 0x20
    bn.ori r4, r0, 0x87
    bn.ori r5, r0, 0x20
    bt.mov r6, r15
    bg.jal 0x20ef9b
    bn.bnei r3, 0x0, loc_27f1cd
    bg.movhi r6, 0x45
    bg.lbz r7, 0x7f46(r6)
    bt.addi r7, 0x1
    bn.extbz r7, r7
    bg.sbz 0x7f46(r6), r7
    bn.slli r13, r12, 0x5
    bg.bleui r7, 0x1, loc_27f12f
    bg.sbz 0x7f46(r6), r0
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x7f48
    bn.add r3, r13, r7
    bg.jal 0x27f0b6
    bt.j loc_27f12f
loc_27f1cd:
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x7f48
    bn.add r10, r13, r7
    bt.mov r3, r1
    bt.mov r4, r12
    bt.mov r5, r14
    bt.mov r6, r15
    bg.jal 0x27e66d
    bn.lwz r7, 0x0(r1)
    bn.sw 0x0(r10), r7
    bn.lwz r7, 0x4(r1)
    bn.sw 0x4(r10), r7
    bn.lwz r7, 0x8(r1)
    bn.sw 0x8(r10), r7
    bn.lwz r7, 0xc(r1)
    bn.sw 0xc(r10), r7
    bn.lwz r7, 0x10(r1)
    bn.sw 0x10(r10), r7
    bn.lwz r7, 0x14(r1)
    bn.sw 0x14(r10), r7
    bn.lwz r7, 0x18(r1)
    bn.sw 0x18(r10), r7
    bn.lwz r7, 0x1c(r1)
    bn.sw 0x1c(r10), r7
    bg.movhi r7, 0x45
    bg.sbz 0x7f46(r7), r0
    bt.j loc_27f12f
