# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23a0b1,0x23a0de); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r10, r3
    bt.mov r11, r4
    bg.jal 0x2082c3
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x50cc
    bt.add r10, r7
    bn.sbz 0x0(r10), r11
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
