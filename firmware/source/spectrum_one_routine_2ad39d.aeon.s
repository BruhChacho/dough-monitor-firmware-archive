# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2ad39d,0x2ad3f0); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x4c
    bn.sw 0x48(r1), r9
    bn.sw 0x44(r1), r10
    bn.sw 0x40(r1), r11
    bn.sw 0x38(r1), r3
    bn.sw 0x3c(r1), r4
    bn.sw 0x30(r1), r5
    bn.sw 0x34(r1), r6
    bn.addi r11, r1, 0x18
    bn.addi r3, r1, 0x38
    bt.mov r4, r11
    bg.jal 0x2ac756
    bn.addi r3, r1, 0x30
    bt.mov r4, r1
    bg.jal 0x2ac756
    bn.lwz r7, 0x18(r1)
    bn.bgtui r7, 0x1, loc_2ad3e0
loc_2ad3d0:
    bt.movi r3, -0x1
loc_2ad3d2:
    bn.lwz r11, 0x40(r1)
    bn.lwz r10, 0x44(r1)
    bn.lwz r9, 0x48(r1)
    bn.addi r1, r1, 0x4c
    bt.jr r9
loc_2ad3e0:
    bn.lwz r7, 0x0(r1)
    bn.bleui r7, 0x1, loc_2ad3d0
    bt.mov r3, r11
    bt.mov r4, r1
    bg.jal 0x2acec8
    bt.j loc_2ad3d2
