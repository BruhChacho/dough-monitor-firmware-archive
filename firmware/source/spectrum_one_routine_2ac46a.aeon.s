# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2ac46a,0x2ac4b7); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x34
    bn.sw 0x30(r1), r9
    bn.sw 0x2c(r1), r10
    bn.sw 0x28(r1), r11
    bn.sw 0x24(r1), r3
    bn.sw 0x20(r1), r4
    bn.addi r11, r1, 0x10
    bn.addi r3, r1, 0x24
    bt.mov r4, r11
    bg.jal 0x2abba0
    bn.addi r3, r1, 0x20
    bt.mov r4, r1
    bg.jal 0x2abba0
    bn.lwz r7, 0x10(r1)
    bn.bgtui r7, 0x1, loc_2ac4a7
loc_2ac497:
    bt.movi r3, -0x1
loc_2ac499:
    bn.lwz r11, 0x28(r1)
    bn.lwz r10, 0x2c(r1)
    bn.lwz r9, 0x30(r1)
    bn.addi r1, r1, 0x34
    bt.jr r9
loc_2ac4a7:
    bn.lwz r7, 0x0(r1)
    bn.bleui r7, 0x1, loc_2ac497
    bt.mov r3, r11
    bt.mov r4, r1
    bg.jal 0x2ac06b
    bt.j loc_2ac499
