# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23e58a,0x23e5d1); Prepare a deferred halfword request, then tail-transfer to the request service.
# Fixed original addresses; not hardware-validated.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r10, r3
    bt.mov r11, r4
    bn.andi r7, r3, 0x1
    bg.ori r5, r0, 0xffff
    bn.beqi r7, 0x0, loc_23e5c0
    bn.slli r4, r4, 0x8
    bg.ori r7, r0, 0xff00
    bn.and r4, r4, r7
    bg.ori r5, r0, 0xff00
    bt.movi r6, 0x0
    bg.jal 0x27b707
    bn.addi r3, r10, 0x1
    bn.srli r4, r11, 0x8
    bn.ori r5, r0, 0xff
loc_23e5c0:
    bt.movi r6, 0x0
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x27b707
