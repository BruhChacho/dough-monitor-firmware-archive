# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x222df1,0x222e7d); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r3, r6
    bn.lh r10, 0x2c(r3)
    bn.beqi r10, 0x0, loc_222e67
    bt.movi r11, 0x0
    bn.ori r13, r0, 0xb0
    bt.j loc_222e28
loc_222e20:
    bn.srli r10, r10, 0x1
    bt.addi r11, 0x1
    bn.beqi r10, 0x0, loc_222e67
loc_222e28:
    bn.extbz r12, r11
    bn.andi r7, r10, 0x1
    bn.beqi r7, 0x0, loc_222e20
    bt.mov r3, r12
    bg.jal 0x222804
    bn.muls r3, r3, r13
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lwz r7, 0x4(r3)
    bg.ori r6, r0, 0x1000
    bn.and r7, r7, r6
    bn.beqi r7, 0x0, loc_222e20
    bt.mov r3, r12
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
loc_222e67:
    bt.movi r3, 0x4
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
