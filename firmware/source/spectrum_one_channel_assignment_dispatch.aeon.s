# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x220c76,0x220cb4); Prepare dispatch arguments, call helpers, then tail-dispatch to 0x226bb5.
# Fixed original addresses; not hardware-validated.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r10, r4
    bn.ori r11, r0, 0x20
    bg.beqi r4, 0x4, loc_220c93
    bn.andi r7, r4, 0x1
    bn.sfeqi r7, 0x0
    bn.cmovi r11, 0x2, 0x4
loc_220c93:
    bt.mov r4, r10
    bg.jal 0x21ddcf
    bt.movi r3, 0x1
    bt.mov r4, r10
    bg.jal 0x220a8b
    bt.mov r3, r11
    bt.mov r4, r10
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x226bb5
