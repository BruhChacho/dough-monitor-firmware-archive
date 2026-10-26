# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20c7a8,0x20c80d); Mode-dependent buffer offsets for slots 0,1,2,3,7; other IDs return 0xb900.
# Fixed original addresses; not a hardware-validated implementation.
    bg.beqi r3, 0x7, loc_20c7dd
    bn.beqi r3, 0x0, loc_20c7cc
    bn.beqi r3, 0x1, loc_20c7fb
    bn.beqi r3, 0x2, loc_20c7eb
    bg.ori r7, r0, 0xb900
    bn.bnei r3, 0x3, loc_20c7d9
    bn.sfeqi r4, 0x0
    bg.ori r6, r0, 0x200
    bg.ori r7, r0, 0x480
    bn.cmov_0 r7, r6, r7
    bt.j loc_20c7d9
loc_20c7cc:
    bn.sfeqi r4, 0x0
    bn.ori r6, r0, 0x80
    bg.ori r7, r0, 0x300
    bn.cmov_0 r7, r6, r7
loc_20c7d9:
    bt.mov r3, r7
    bt.jr r9
loc_20c7dd:
    bn.sfeqi r4, 0x0
    bg.ori r7, r0, 0x280
    bn.cmov_0 r7, r0, r7
    bt.mov r3, r7
    bt.jr r9
loc_20c7eb:
    bn.sfeqi r4, 0x0
    bg.ori r6, r0, 0x180
    bg.ori r7, r0, 0x400
    bn.cmov_0 r7, r6, r7
    bt.j loc_20c7d9
loc_20c7fb:
    bn.sfeqi r4, 0x0
    bg.ori r6, r0, 0x100
    bg.ori r7, r0, 0x380
    bn.cmov_0 r7, r6, r7
    bt.mov r3, r7
    bt.jr r9
