# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2402ab,0x2402c4); Return the highest set bit index, or zero for zero input.
# Fixed original addresses; not hardware-validated.
    bt.movi r7, 0x0
    bn.beqi r3, 0x0, loc_2402c0
loc_2402b0:
    bn.srli r3, r3, 0x1
    bt.addi r7, 0x1
    bn.extbz r7, r7
    bn.bnei r3, 0x0, loc_2402b0
    bt.addi r7, -0x1
    bn.extbz r7, r7
loc_2402c0:
    bt.mov r3, r7
    bt.jr r9
