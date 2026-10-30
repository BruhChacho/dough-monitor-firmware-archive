# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2aab1e,0x2aab77); Forward copy using aligned words and byte remainder; overlap is not handled as memmove.
# Fixed original addresses; not a hardware-validated implementation.
    bt.mov r6, r3
    bg.bleui r5, 0xf, loc_2aab2d
    bn.or r7, r4, r3
    bn.andi r7, r7, 0x3
    bn.beqi r7, 0x0, loc_2aab42
loc_2aab2d:
    bn.beqi r5, 0x0, loc_2aab40
    bt.add r5, r6
loc_2aab32:
    bn.lbz r7, 0x0(r4)
    bn.sbz 0x0(r6), r7
    bt.addi r6, 0x1
    bt.addi r4, 0x1
    bg.bne r5, r6, loc_2aab32
loc_2aab40:
    bt.jr r9
loc_2aab42:
    bn.lwz r7, 0x0(r4)
    bn.sw 0x0(r6), r7
    bn.lwz r7, 0x4(r4)
    bn.sw 0x4(r6), r7
    bn.lwz r7, 0x8(r4)
    bn.sw 0x8(r6), r7
    bn.lwz r7, 0xc(r4)
    bn.sw 0xc(r6), r7
    bn.addi r6, r6, 0x10
    bn.addi r4, r4, 0x10
    bt.addi r5, -0x10
    bg.bgtui r5, 0xf, loc_2aab42
loc_2aab66:
    bn.bleui r5, 0x3, loc_2aab2d
    bn.lwz r7, 0x0(r4)
    bn.sw 0x0(r6), r7
    bt.addi r6, 0x4
    bt.addi r4, 0x4
    bt.addi r5, -0x4
    bt.j loc_2aab66
