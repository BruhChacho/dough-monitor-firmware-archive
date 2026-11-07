# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20cd13,0x20cd4a); XOR slot bytes with seed 0x3e; caller must bound length.
# Fixed original addresses; not a hardware-validated implementation.
    bt.mov r7, r3
    bn.ori r3, r0, 0x3e
    bn.beqi r4, 0x0, loc_20cd48
    bn.ori r5, r0, 0x3e
    bt.movi r6, 0x0
    bn.slli r3, r7, 0x7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x1480
    bt.add r3, r7
loc_20cd2d:
    bn.extbz r7, r6
    bt.add r7, r3
    bn.lbz r7, 0x0(r7)
    bn.extbz r7, r7
    bn.xor r5, r7, r5
    bn.addi r7, r4, -0x1
    bn.extbz r4, r7
    bt.addi r6, 0x1
    bn.bnei r4, 0x0, loc_20cd2d
    bt.mov r3, r5
loc_20cd48:
    bt.jr r9
