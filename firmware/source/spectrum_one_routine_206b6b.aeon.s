# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x206b6b,0x206c78); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x34
    bn.sw 0x30(r1), r9
    bn.sw 0x2c(r1), r10
    bn.sw 0x28(r1), r11
    bn.sw 0x24(r1), r12
    bn.sw 0x20(r1), r13
    bt.mov r11, r3
    bg.jal 0x27ea14
    bt.mov r3, r11
    bg.jal 0x2250c5
    bn.ori r10, r0, 0xa8
    bn.muls r10, r11, r10
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r10, r7
    bt.mov r3, r11
    bn.lh r4, 0x2c(r10)
    bg.jal 0x27ea28
    bt.mov r3, r11
    bn.lh r4, 0x2a(r10)
    bg.jal 0x27ea3a
    bt.mov r3, r11
    bg.jal 0x2250c5
    bn.extbz r4, r3
    bt.mov r3, r11
    bg.jal 0x27ea4c
    bt.mov r3, r11
    bg.jal 0x2227da
    bt.mov r4, r3
    bt.mov r3, r11
    bg.jal 0x27ea5b
    bt.mov r3, r11
    bg.jal 0x2227da
    bg.jal 0x222819
    bt.mov r4, r3
    bt.mov r3, r11
    bg.jal 0x27ea6a
    bt.mov r3, r11
    bg.jal 0x2227da
    bn.ori r13, r0, 0xb0
    bn.muls r7, r3, r13
    bg.movhi r12, 0x3b
    bg.addi r12, r12, 0x4950
    bt.add r7, r12
    bt.mov r3, r11
    bn.lbz r4, 0x0(r7)
    bg.jal 0x27d974
    bt.mov r3, r11
    bt.movi r4, 0x0
    bg.jal 0x27ea79
    bt.movi r3, 0x0
    bg.jal 0x27d9a1
    bt.mov r3, r11
    bg.jal 0x2227da
    bg.jal 0x222819
    bg.jal 0x21d7b1
    bt.mov r10, r3
    bt.mov r3, r11
    bg.jal 0x223126
    bt.mov r4, r3
    bt.mov r3, r11
    bt.mov r5, r10
    bg.jal 0x27fa53
    bn.movhi_2 r3, 0xca
    bg.ori r3, r3, 0xb000
    bn.movhi_2 r4, 0x64
    bn.movhi_2 r5, 0x216
    bg.ori r5, r5, 0x4000
    bn.movhi_2 r6, 0x40
    bg.jal 0x27e9c4
    bt.movi r3, 0x1
    bg.jal 0x27ea1e
    bt.mov r3, r11
    bg.jal 0x2227da
    bn.muls r3, r3, r13
    bt.add r3, r12
    bn.lwz r4, 0x4(r3)
    bt.mov r3, r11
    bn.andi r4, r4, 0x20
    bg.jal 0x27d965
    bt.mov r3, r1
    bt.mov r4, r11
    bg.jal 0x27f31c
    bn.lwz r13, 0x20(r1)
    bn.lwz r12, 0x24(r1)
    bn.lwz r11, 0x28(r1)
    bn.lwz r10, 0x2c(r1)
    bn.lwz r9, 0x30(r1)
    bn.addi r1, r1, 0x34
    bt.jr r9
