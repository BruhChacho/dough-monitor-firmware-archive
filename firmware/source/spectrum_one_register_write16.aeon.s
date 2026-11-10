# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23dfb6,0x23dfe1); Write low byte then tail-call byte writer for the high byte.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r11, r3
    bt.mov r10, r4
    bn.extbz r4, r4
    bg.jal 0x23ddb9
    bn.addi r3, r11, 0x1
    bn.srli r4, r10, 0x8
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x23ddb9
