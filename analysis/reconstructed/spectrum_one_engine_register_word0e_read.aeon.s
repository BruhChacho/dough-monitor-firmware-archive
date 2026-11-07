# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21d78e,0x21d7b1); Read engine halfword offset 0x0e and mask to 15 bits.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bg.jal 0x21d3b1
    bt.addi r3, 0xe
    bg.jal 0x23df85
    bg.ori r7, r0, 0x7fff
    bn.and r3, r3, r7
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
