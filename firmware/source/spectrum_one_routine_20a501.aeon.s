# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20a501,0x20a58e); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bn.ori r7, r0, 0x58
    bn.muls r11, r3, r7
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x3fc4
    bt.add r11, r7
    bn.lh r12, 0xc(r11)
    bn.lbz r10, 0xa(r11)
    bn.slli r10, r10, 0x3
    bn.exths r10, r10
    bt.mov r3, r12
    bg.jal 0x20a473
    bn.muls r3, r3, r10
    bn.srai r3, r3, 0xa
    bn.sh_1 0x30(r11), r3
    bt.mov r3, r12
    bg.jal 0x20a473
    bn.muls r3, r10, r3
    bn.srai r3, r3, 0xa
    bn.sh_1 0x20(r11), r3
    bt.mov r3, r12
    bg.jal 0x20a4ba
    bn.muls r3, r10, r3
    bn.srai r3, r3, 0xa
    bn.sh_1 0x2c(r11), r3
    bt.mov r3, r12
    bg.jal 0x20a4ba
    bn.sub r3, r0, r3
    bn.muls r10, r10, r3
    bn.srai r10, r10, 0xa
    bn.sh_1 0x24(r11), r10
    bg.addi r7, r0, 0x400
    bn.sh_1 0x28(r11), r7
    bn.sh_2 0x2e(r11), r0
    bn.sh_2 0x2a(r11), r0
    bn.sh_2 0x26(r11), r0
    bn.sh_2 0x22(r11), r0
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
