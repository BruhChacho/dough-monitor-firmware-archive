# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x211855,0x211874); Map indices 1/2/3 to 0x300/0x800/0xb00, all other uint32 values to0.
# Fixed original addresses; not a hardware-validated implementation.
    bg.ori r7, r0, 0x800
    bn.beqi r3, 0x2, loc_211868
    bg.ori r7, r0, 0xb00
    bn.beqi r3, 0x3, loc_211868
    bt.movi r7, 0x0
    bn.beqi r3, 0x1, loc_21186c
loc_211868:
    bt.mov r3, r7
    bt.jr r9
loc_21186c:
    bg.ori r7, r0, 0x300
    bt.mov r3, r7
    bt.jr r9
