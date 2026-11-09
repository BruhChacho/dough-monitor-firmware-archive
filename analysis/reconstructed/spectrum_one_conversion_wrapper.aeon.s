# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2ac268,0x2ac288); Save four arguments, call the float conversion leaf and restore the return path.
# Fixed original addresses; not hardware-validated.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0x0(r1), r3
    bn.sw 0x4(r1), r4
    bn.sw 0x8(r1), r5
    bn.sw 0xc(r1), r6
    bt.mov r3, r1
    bg.jal 0x2aba8f
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
