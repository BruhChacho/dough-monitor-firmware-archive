# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20f12a,0x20f1a0); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x20
    bn.sw 0x1c(r1), r9
    bn.sw 0x18(r1), r10
    bn.sw 0x14(r1), r11
    bn.sw 0x10(r1), r12
    bt.mov r11, r3
    bt.mov r10, r4
    bn.sw 0x0(r3), r0
    bn.sw 0x4(r3), r0
    bt.movi r7, 0xf
    bn.sw 0x8(r3), r7
    bn.sw 0xc(r3), r0
    bt.mov r3, r4
    bg.jal 0x20e736
    bt.mov r12, r3
    bt.mov r3, r10
    bg.jal 0x20e6c5
    bn.bleui r3, 0x1, loc_20f167
    bn.bgtui r3, 0x3, loc_20f17a
    bt.mov r3, r11
    bt.mov r4, r12
    bg.jal 0x233de1
loc_20f167:
    bt.mov r3, r11
    bn.lwz r12, 0x10(r1)
    bn.lwz r11, 0x14(r1)
    bn.lwz r10, 0x18(r1)
    bn.lwz r9, 0x1c(r1)
    bn.addi r1, r1, 0x20
    bt.jr r9
loc_20f17a:
    bg.bnei r3, 0x4, loc_20f167
    bt.mov r3, r1
    bt.mov r4, r12
    bg.jal 0x21047e
    bn.lwz r7, 0x0(r1)
    bn.sw 0x0(r11), r7
    bn.lwz r7, 0x4(r1)
    bn.sw 0x4(r11), r7
    bn.lwz r7, 0x8(r1)
    bn.sw 0x8(r11), r7
    bn.lwz r7, 0xc(r1)
    bn.sw 0xc(r11), r7
    bt.j loc_20f167
