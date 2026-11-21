# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20434e,0x2043a6); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bg.movhi r11, 0x45
    bg.addi r10, r11, 0x3b38
    bg.jal 0x2042f4
    bt.mov r4, r10
    bt.movi r5, 0x8
    bg.jal 0x2461d6
    bt.mov r3, r10
    bt.movi r4, 0x4
    bg.jal 0x204080
    bn.lh_0 r7, 0x4(r10)
    bn.exths r3, r3
    bg.beq r7, r3, loc_204399
loc_20437f:
    bn.addi r7, r0, -0x80
    bg.sbz 0x3b38(r11), r7
    bn.sbz 0x1(r10), r7
    bn.sbz 0x2(r10), r7
loc_20438c:
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_204399:
    bt.mov r3, r10
    bt.movi r4, 0x4
    bg.jal 0x20409a
    bn.bnei r3, 0x0, loc_20437f
    bt.j loc_20438c
