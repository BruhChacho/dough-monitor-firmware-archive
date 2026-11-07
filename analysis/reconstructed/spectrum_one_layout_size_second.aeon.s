# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x26047c,0x26049f); Return 756/864/972/1080 for selector 0/1/2/3, otherwise zero.
# Fixed original addresses; not a hardware-validated implementation.
    bg.ori r7, r0, 0x360
    bn.beqi r3, 0x1, loc_26049b
    bg.ori r7, r0, 0x2f4
    bn.bleui r3, 0x0, loc_26049b
    bg.ori r7, r0, 0x3cc
    bn.beqi r3, 0x2, loc_26049b
    bn.sfnei r3, 0x3
    bg.ori r7, r0, 0x438
    bn.cmov_0 r7, r0, r7
loc_26049b:
    bt.mov r3, r7
    bt.jr r9
