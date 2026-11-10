# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2103cb,0x210407); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r10, r4
    bt.mov r11, r5
    bg.jal 0x2100d2
    bn.ori r7, r0, 0x74
    bn.muls r3, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x7e8
    bt.add r3, r7
    bn.lh r7, 0x1e(r3)
    bn.sh_1 0x0(r10), r7
    bn.lh r7, 0x20(r3)
    bn.sh_1 0x0(r11), r7
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
