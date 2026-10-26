# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20cd4a,0x20cd94); Poll slot state with up to twenty calls to an unresolved delay helper, then clear it.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bn.ori r10, r0, 0x14
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x3b76
    bn.add r11, r3, r7
    bt.j loc_20cd6e
loc_20cd65:
    bn.addi r7, r10, -0x1
    bn.extbz r10, r7
    bn.beqi r10, 0x0, loc_20cd84
loc_20cd6e:
    bn.lbz r7, 0x0(r11)
    bg.bnei r7, 0x6, loc_20cd65
    bt.movi r3, 0x1
    bg.jal 0x2420bb
    bn.addi r7, r10, -0x1
    bn.extbz r10, r7
    bn.bnei r10, 0x0, loc_20cd6e
loc_20cd84:
    bn.sbz 0x0(r11), r0
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
