# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x222ce8,0x222d32); Map metadata state values 2 and 4 to ENGINE state values 5 and 2, otherwise 1.
# Fixed original addresses; not hardware-validated.
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r3, r5
    bn.lwz r7, 0xc(r3)
    bt.movi r6, 0x5
    bn.beqi r7, 0x2, loc_222d06
    bt.movi r6, 0x1
    bg.beqi r7, 0x4, loc_222d1b
loc_222d06:
    bn.ori r7, r0, 0x7c
    bn.muls r7, r4, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.sw 0x8(r7), r6
    bt.jr r9
loc_222d1b:
    bt.movi r6, 0x2
    bn.ori r7, r0, 0x7c
    bn.muls r7, r4, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.sw 0x8(r7), r6
    bt.jr r9
