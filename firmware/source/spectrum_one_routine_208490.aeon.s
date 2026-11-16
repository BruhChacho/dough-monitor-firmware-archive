# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x208490,0x208537); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r13, r4
    bt.movi r12, 0x1
    bt.movi r11, 0x0
loc_2084a8:
    bn.addi r7, r11, 0x1
    bn.extbz r11, r7
    bn.andi r7, r12, 0x1
    bn.beqi r7, 0x0, loc_2084f7
    bn.ori r7, r0, 0x7c
    bn.muls r7, r11, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lwz r10, 0x4(r7)
    bt.mov r3, r10
    bn.ori r4, r0, 0x24
    bg.jal 0x23ddb9
    bn.bnei r13, 0x0, loc_208511
    bg.movhi r7, 0x2480
    bn.ori r7, r7, 0x60
    bn.add r3, r10, r7
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bg.jal 0x23dead
    bg.movhi r6, 0x2480
    bn.ori r6, r6, 0x61
    bn.add r3, r10, r6
    bt.movi r4, 0x0
    bt.movi r5, 0x4
    bg.jal 0x23dead
loc_2084f7:
    bn.srli r12, r12, 0x1
    bn.bnei r11, 0x1, loc_2084a8
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
loc_208511:
    bg.movhi r7, 0x2480
    bn.ori r7, r7, 0x60
    bn.add r3, r10, r7
    bt.movi r4, 0x1
    bt.movi r5, 0x1
    bg.jal 0x23dead
    bg.movhi r6, 0x2480
    bn.ori r6, r6, 0x61
    bn.add r3, r10, r6
    bt.movi r4, 0x1
    bt.movi r5, 0x4
    bg.jal 0x23dead
    bt.j loc_2084f7
