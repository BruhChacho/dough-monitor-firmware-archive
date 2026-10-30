# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23e50c,0x23e58a); Split a word into aligned mask/value requests to unresolved service0x27b707.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r10, r3
    bt.mov r11, r4
    bn.andi r7, r3, 0x1
    bn.beqi r7, 0x0, loc_23e562
    bn.slli r4, r4, 0x8
    bg.ori r7, r0, 0xff00
    bn.and r4, r4, r7
    bg.ori r5, r0, 0xff00
    bt.movi r6, 0x0
    bg.jal 0x27b707
    bn.srli r4, r11, 0x8
    bn.addi r3, r10, 0x1
    bn.exthz r4, r4
    bg.ori r5, r0, 0xffff
    bt.movi r6, 0x0
    bg.jal 0x27b707
    bn.addi r3, r10, 0x3
    bn.srli r4, r11, 0x18
    bn.ori r5, r0, 0xff
    bt.movi r6, 0x0
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x27b707
loc_23e562:
    bn.exthz r4, r4
    bg.ori r5, r0, 0xffff
    bt.movi r6, 0x0
    bg.jal 0x27b707
    bn.addi r3, r10, 0x2
    bn.srli r4, r11, 0x10
    bg.ori r5, r0, 0xffff
    bt.movi r6, 0x0
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x27b707
