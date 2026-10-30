# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x260459,0x26047c); Return 1344/1536/1728/1920 for selector 0/1/2/3, otherwise zero.
# Fixed original addresses; not a hardware-validated implementation.
    bg.ori r7, r0, 0x600
    bn.beqi r3, 0x1, loc_260478
    bg.ori r7, r0, 0x540
    bn.bleui r3, 0x0, loc_260478
    bg.ori r7, r0, 0x6c0
    bn.beqi r3, 0x2, loc_260478
    bn.sfnei r3, 0x3
    bg.ori r7, r0, 0x780
    bn.cmov_0 r7, r0, r7
loc_260478:
    bt.mov r3, r7
    bt.jr r9
