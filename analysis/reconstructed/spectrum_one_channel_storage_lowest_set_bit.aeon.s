# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2402c4,0x2402de); Return zero for zero input, otherwise return the index of the lowest set bit; the storage configuration caller's zero case remains ambiguous.
# Fixed original addresses; not hardware-validated.
    bt.movi r6, 0x0
    bn.bnei r3, 0x0, loc_2402d4
    bt.j loc_2402da
loc_2402cb:
    bn.srli r3, r3, 0x1
    bn.addi r7, r6, 0x1
    bn.extbz r6, r7
loc_2402d4:
    bn.andi r7, r3, 0x1
    bn.beqi r7, 0x0, loc_2402cb
loc_2402da:
    bt.mov r3, r6
    bt.jr r9
