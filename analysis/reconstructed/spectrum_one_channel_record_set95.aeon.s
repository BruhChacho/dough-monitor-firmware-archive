# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23e734,0x23e74a); Write low byte r4 to channel record offset 0x95.
# Fixed original addresses; not a hardware-validated implementation.
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r3, r7
    bg.sbz 0x95(r3), r4
    bt.jr r9
