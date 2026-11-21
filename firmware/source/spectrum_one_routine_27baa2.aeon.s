# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27baa2,0x27bade); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r10, r3
    bg.movhi r11, 0x3d
    bg.lwz r3, -0x47a4(r11)
    bg.addi r4, r0, -0x100
    bg.jal 0x279cc1
    bt.mov r3, r10
    bg.jal 0x27bb79
    bt.mov r10, r3
    bg.lwz r3, -0x47a4(r11)
    bg.jal 0x279cc5
    bt.mov r3, r10
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
