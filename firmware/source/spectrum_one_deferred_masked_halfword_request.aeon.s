# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23e4a6,0x23e4f4); Prepare a masked halfword request, then tail-transfer to the request service.
# Fixed original addresses; not hardware-validated.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r10, r3
    bt.mov r11, r4
    bt.mov r12, r5
    bn.andi r7, r3, 0x1
    bn.beqi r7, 0x0, loc_23e4df
    bn.slli r4, r4, 0x8
    bn.slli r5, r5, 0x8
    bg.ori r7, r0, 0xff00
    bn.and r4, r4, r7
    bn.and r5, r5, r7
    bt.movi r6, 0x0
    bg.jal 0x27b707
    bn.addi r3, r10, 0x1
    bn.srli r4, r11, 0x8
    bn.srli r5, r12, 0x8
loc_23e4df:
    bt.movi r6, 0x0
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bg.j 0x27b707
