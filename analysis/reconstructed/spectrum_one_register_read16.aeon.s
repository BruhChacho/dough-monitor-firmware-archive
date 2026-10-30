# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23df85,0x23dfb6); Read high byte then low byte through the register byte helper.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r11, r3
    bt.addi r3, 0x1
    bg.jal 0x23dd44
    bt.mov r10, r3
    bt.mov r3, r11
    bg.jal 0x23dd44
    bn.slli r10, r10, 0x8
    bn.or r10, r10, r3
    bn.exthz r3, r10
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
