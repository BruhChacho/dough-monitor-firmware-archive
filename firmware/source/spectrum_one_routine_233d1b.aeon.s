# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x233d1b,0x233de1); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bn.sw 0x14(r1), r10
    bn.sw 0x10(r1), r11
    bt.mov r11, r3
    bg.movhi r7, 0x45
    bg.lbz r7, 0x485e(r7)
    bn.bnei r7, 0x0, loc_233d8e
    bg.bgtui r4, 0x6, loc_233d70
    bn.ori r7, r0, 0x84
    bn.muls r7, r4, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0xe8
    bt.add r7, r6
    bn.lwz r6, 0x4(r7)
    bn.sw 0x0(r3), r6
    bn.lwz r6, 0x8(r7)
    bn.sw 0x4(r3), r6
    bn.lwz r6, 0xc(r7)
    bn.sw 0x8(r3), r6
    bn.lwz r7, 0x10(r7)
    bn.sw 0xc(r3), r7
    bt.mov r3, r11
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
loc_233d70:
    bn.sw 0xc(r3), r0
    bt.movi r7, 0xf
    bn.sw 0x8(r3), r7
    bn.sw 0x4(r3), r0
    bn.sw 0x0(r3), r0
    bt.mov r3, r11
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
loc_233d8e:
    bn.ori r10, r0, 0x84
    bn.muls r10, r4, r10
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0xe8
    bt.add r10, r6
    bt.mov r3, r1
    bg.jal 0x211f33
    bn.lwz r6, 0x0(r1)
    bn.sw 0x4(r10), r6
    bn.lwz r7, 0x4(r1)
    bn.sw 0x8(r10), r7
    bn.lwz r7, 0x8(r1)
    bn.sw 0xc(r10), r7
    bn.lwz r7, 0xc(r1)
    bn.sw 0x10(r10), r7
    bn.sw 0x0(r11), r6
    bn.lwz r7, 0x8(r10)
    bn.sw 0x4(r11), r7
    bn.lwz r7, 0xc(r10)
    bn.sw 0x8(r11), r7
    bn.lwz r7, 0x10(r10)
    bn.sw 0xc(r11), r7
    bt.mov r3, r11
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
