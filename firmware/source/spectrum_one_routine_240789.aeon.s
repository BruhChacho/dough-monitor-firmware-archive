# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x240789,0x2407da); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r12, r4
    bn.addi r11, r3, -0x1
    bt.movi r10, 0x0
    bn.blesi r11, 0x0, loc_2407b7
loc_2407a1:
    bt.movi r3, 0x1
    bg.jal 0x240508
    bn.add r7, r12, r10
    bn.sbz 0x0(r7), r3
    bn.addi r7, r10, 0x1
    bn.extbz r10, r7
    bg.bgts r11, r10, loc_2407a1
loc_2407b7:
    bt.movi r3, 0x0
    bg.jal 0x240508
    bn.add r7, r12, r10
    bn.sbz 0x0(r7), r3
    bg.jal 0x240725
    bt.movi r3, 0x1
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
