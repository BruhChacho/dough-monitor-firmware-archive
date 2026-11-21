# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2aad6a,0x2aadc0); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r10, r3
    bt.mov r11, r4
    bt.movi r5, 0x0
    bg.movhi r6, 0x41e0
    bg.jal 0x2ad39d
    bn.blesi r3, -0x1, loc_2aadab
    bt.mov r3, r10
    bt.mov r4, r11
    bt.movi r5, 0x0
    bg.movhi r6, 0x41e0
    bg.jal 0x2aca8e
    bg.jal 0x2ad216
    bg.movhi r7, 0x8000
    bt.add r3, r7
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_2aadab:
    bt.mov r3, r10
    bt.mov r4, r11
    bg.jal 0x2ad216
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
