# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x242105,0x24211b); Clear periodic flag and initialize reload counter to 1000; physical units unknown.
# Fixed original addresses; not a hardware-validated implementation.
    bg.movhi r7, 0x45
    bg.sbz 0x51e2(r7), r0
    bg.addi r6, r0, 0x3e8
    bg.movhi r7, 0x3b
    bg.sw_1 0x4948(r7), r6
    bt.jr r9
