# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23e63e,0x23e661); Clear ten callback table entries.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.movi r10, 0x0
loc_23e648:
    bn.extbz r3, r10
    bt.movi r4, 0x0
    bg.jal 0x23e62c
    bt.addi r10, 0x1
    bg.bnei r10, 0xa, loc_23e648
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
