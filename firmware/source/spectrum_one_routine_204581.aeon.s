# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x204581,0x20462e); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r11, r3
    bg.movhi r12, 0x48
    bg.addi r10, r12, -0x1ed8
    bg.jal 0x2042dd
    bt.mov r4, r10
    bn.ori r5, r0, 0x2c
    bg.jal 0x2461d6
    bt.mov r3, r10
    bn.ori r4, r0, 0x28
    bg.jal 0x204080
    bn.exths r3, r3
    bn.lwz r7, 0x28(r10)
    bg.beq r3, r7, loc_2045cc
loc_2045b9:
    bt.movi r3, 0x0
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
loc_2045cc:
    bt.mov r3, r10
    bn.ori r4, r0, 0x28
    bg.jal 0x20409a
    bn.bnei r3, 0x0, loc_2045b9
    bg.lwz r7, -0x1ed8(r12)
    bn.sw 0x0(r11), r7
    bn.lwz r7, 0x4(r10)
    bn.sw 0x4(r11), r7
    bn.lwz r7, 0x8(r10)
    bn.sw 0x8(r11), r7
    bn.lwz r7, 0xc(r10)
    bn.sw 0xc(r11), r7
    bn.lwz r7, 0x10(r10)
    bn.sw 0x10(r11), r7
    bn.lwz r7, 0x14(r10)
    bn.sw 0x14(r11), r7
    bn.lwz r7, 0x18(r10)
    bn.sw 0x18(r11), r7
    bn.lwz r7, 0x1c(r10)
    bn.sw 0x1c(r11), r7
    bn.lwz r7, 0x20(r10)
    bn.sw 0x20(r11), r7
    bn.lwz r7, 0x24(r10)
    bn.sw 0x24(r11), r7
    bn.lwz r7, 0x28(r10)
    bn.sw 0x28(r11), r7
    bt.movi r3, 0x1
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
