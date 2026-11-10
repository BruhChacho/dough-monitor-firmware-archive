# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21d749,0x21d76c); Read engine register offset 0x43 and return bit 3.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bg.jal 0x21d3b1
    bn.addi r3, r3, 0x43
    bg.jal 0x23dd44
    bn.srli r3, r3, 0x3
    bn.andi r3, r3, 0x1
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
