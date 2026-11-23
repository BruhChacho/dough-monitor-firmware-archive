# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20f0d1,0x20f12a); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r10, r3
    bg.jal 0x20e736
    bt.mov r11, r3
    bt.mov r3, r10
    bg.jal 0x20e6c5
    bt.movi r7, 0x1
    bg.bgtui r3, 0x4, loc_20f10a
    bn.slli r7, r3, 0x2
    bg.movhi r6, 0x2b
    bg.addi r6, r6, -0xe8c
    bt.add r7, r6
    bn.lwz r7, 0x0(r7)
    bt.jr r7
    bt.mov r3, r11
    bg.jal 0x2104c0
    bt.mov r7, r3
loc_20f10a:
    bt.mov r3, r7
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
    bt.mov r3, r11
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x233856
