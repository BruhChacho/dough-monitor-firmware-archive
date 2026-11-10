# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x213cec,0x213d34); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r10, r4
    bt.mov r11, r5
    bg.jal 0x211893
    bn.beqi r10, 0x0, loc_213d1d
    bn.sfeqi r11, 0x0
    bg.addi r3, r3, 0x1818
    bn.cmovi r4, 0x8, 0xc
    bt.movi r5, 0xc
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x23dfe1
loc_213d1d:
    bg.addi r3, r3, 0x1818
    bt.movi r4, 0x0
    bt.movi r5, 0xc
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x23dfe1
