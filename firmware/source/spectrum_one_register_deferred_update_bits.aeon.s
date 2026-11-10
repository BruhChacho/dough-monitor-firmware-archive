# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23e5ed,0x23e62c); Read byte, set or clear selected bits, then submit a deferred masked write.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r12, r3
    bt.mov r10, r4
    bt.mov r11, r5
    bg.jal 0x23dd44
    bn.or r7, r3, r11
    bn.extbz r4, r7
    bn.bnei r10, 0x0, loc_23e617
    bn.nand r7, r11, r11
    bn.and r7, r3, r7
    bn.extbz r4, r7
loc_23e617:
    bt.mov r3, r12
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bg.j 0x23e5d1
