# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20e3be,0x20e43a); Indirect byte write with busy polling and masked-update dependency; store semantics unresolved.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r11, r3
    bt.mov r12, r4
    bg.ori r10, r0, 0xffff
    bt.j loc_20e3df
loc_20e3d6:
    bn.addi r7, r10, -0x1
    bn.exthz r10, r7
    bn.beqi r10, 0x0, loc_20e3ed
loc_20e3df:
    bg.ori r3, r0, 0x3c06
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x20
    bn.bnei r3, 0x0, loc_20e3d6
loc_20e3ed:
    bg.addi r4, r11, -0x4000
    bg.ori r3, r0, 0x3c02
    bn.exthz r4, r4
    bg.jal 0x23dfb6
    bg.ori r3, r0, 0x3c00
    bt.mov r4, r12
    bg.jal 0x23ddb9
    bg.ori r3, r0, 0x3c06
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dead
loc_20e412:
    bg.ori r3, r0, 0x3c06
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x20
    bn.beqi r3, 0x0, loc_20e429
    bn.addi r7, r10, -0x1
    bn.exthz r10, r7
    bn.bnei r10, 0x0, loc_20e412
loc_20e429:
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
