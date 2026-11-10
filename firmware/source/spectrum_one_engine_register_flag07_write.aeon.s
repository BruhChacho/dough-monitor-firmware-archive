# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21d86d,0x21d89d); Write 0x80 or zero to engine register offset 0x07 according to the first argument.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r11, r3
    bt.mov r3, r4
    bg.jal 0x21d3b1
    bn.sfeqi r11, 0x0
    bt.addi r3, 0x7
    bn.ori r4, r0, 0x80
    bn.cmov_0 r4, r0, r4
    bn.ori r5, r0, 0x80
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x23dfe1
