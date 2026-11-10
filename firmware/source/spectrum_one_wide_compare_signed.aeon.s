# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2aad0b,0x2aad27); Compare signed high words, then unsigned low words, returning 0, 1, or 2 for less, equal, or greater.
# Fixed original addresses; not hardware-validated.
    bg.bgts r6, r4, loc_2aad23
    bg.bgts r4, r6, loc_2aad1f
    bt.mov r7, r3
    bg.bgt r5, r3, loc_2aad23
    bt.movi r3, 0x1
    bg.ble r7, r5, loc_2aad21
loc_2aad1f:
    bt.movi r3, 0x2
loc_2aad21:
    bt.jr r9
loc_2aad23:
    bt.movi r3, 0x0
    bt.jr r9
