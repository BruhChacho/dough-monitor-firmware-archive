# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x212e18,0x212e89); Set bit0 in selected registers and accumulate corresponding low bits at an argument pointer.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r10, r3
    bt.mov r11, r4
    bn.andi r7, r3, 0x10
    bn.bnei r7, 0x0, loc_212e72
loc_212e2d:
    bn.andi r7, r10, 0x20
    bn.bnei r7, 0x0, loc_212e5b
loc_212e33:
    bn.andi r7, r10, 0x40
    bn.beqi r7, 0x0, loc_212e4e
    bg.ori r3, r0, 0x13c4
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bn.lbz r6, 0x0(r11)
    bn.ori r7, r6, 0x4
    bn.sbz 0x0(r11), r7
loc_212e4e:
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_212e5b:
    bg.ori r3, r0, 0x12c4
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bn.lbz r6, 0x0(r11)
    bn.ori r7, r6, 0x2
    bn.sbz 0x0(r11), r7
    bt.j loc_212e33
loc_212e72:
    bg.ori r3, r0, 0x11c4
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bn.lbz r6, 0x0(r11)
    bn.ori r7, r6, 0x1
    bn.sbz 0x0(r11), r7
    bt.j loc_212e2d
