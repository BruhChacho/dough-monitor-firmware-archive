# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x247335,0x247369); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.movi r11, 0x0
loc_247342:
    bn.extbz r10, r11
    bt.mov r3, r10
    bg.jal 0x23e7b3
    bn.bnei r3, 0x0, loc_247361
loc_24734e:
    bt.addi r11, 0x1
    bg.bnei r11, 0x4, loc_247342
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_247361:
    bt.mov r3, r10
    bg.jal 0x23a181
    bt.j loc_24734e
