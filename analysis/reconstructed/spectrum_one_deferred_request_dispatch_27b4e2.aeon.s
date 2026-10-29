# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23e4a0,0x23e4a6); Set r3 to 1, then tail-transfer to the existing request service at 0x27b4e2.
# Fixed original addresses; not hardware-validated.
    bt.movi r3, 0x1
    bg.j 0x27b4e2
