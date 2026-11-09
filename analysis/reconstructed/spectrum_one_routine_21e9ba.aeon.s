# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21e9ba,0x21e9f9); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r10, r3
    bg.jal 0x21d3b1
    bt.mov r11, r3
    bt.mov r3, r10
    bg.jal 0x222804
    bg.jal 0x21e948
    bt.movi r7, 0x0
    bn.beqi r3, 0x0, loc_21e9ea
    bn.addi r3, r11, 0x3e
    bg.jal 0x23df85
    bg.ori r6, r0, 0x1fff
    bn.and r7, r3, r6
loc_21e9ea:
    bt.mov r3, r7
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
