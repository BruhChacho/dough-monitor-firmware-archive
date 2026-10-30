# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23ea1e,0x23ea6e); Write a metadata state value and apply it to selected engine records at word offset 0x08.
# Fixed original addresses; not a hardware-validated implementation.
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r3, r5
    bn.lh r6, 0x12(r3)
    bn.sw 0xc(r3), r4
    bt.movi r23, 0x5
    bn.beqi r4, 0x2, loc_23ea3f
    bt.movi r23, 0x1
    bg.beqi r4, 0x4, loc_23ea6a
loc_23ea3f:
    bn.beqi r6, 0x0, loc_23ea68
    bt.movi r4, 0x0
    bn.ori r24, r0, 0x7c
loc_23ea47:
    bn.extbz r5, r4
    bn.andi r7, r6, 0x1
    bn.beqi r7, 0x0, loc_23ea60
    bn.muls r7, r5, r24
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.sw 0x8(r7), r23
loc_23ea60:
    bn.srli r6, r6, 0x1
    bt.addi r4, 0x1
    bn.bnei r6, 0x0, loc_23ea47
loc_23ea68:
    bt.jr r9
loc_23ea6a:
    bt.movi r23, 0x2
    bt.j loc_23ea3f
