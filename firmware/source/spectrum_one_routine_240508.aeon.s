# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x240508,0x2405f5); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r13, r3
    bt.movi r10, 0x0
    bt.movi r11, 0x0
    bg.movhi r12, 0x45
loc_240524:
    bn.slli r7, r11, 0x1
    bn.extbz r11, r7
    bg.ori r3, r0, 0x422
    bt.movi r4, 0x1
    bn.ori r5, r0, 0x20
    bg.jal 0x23dead
    bg.jal 0x24229a
    bg.ori r3, r0, 0x422
    bt.movi r4, 0x1
    bn.ori r5, r0, 0x10
    bg.jal 0x23dead
    bg.jal 0x24229a
    bg.lwz r7, 0x3cf0(r12)
    bg.lbz r7, 0x848(r7)
    bn.andi r7, r7, 0x20
    bn.ori r6, r11, 0x1
    bn.sfnei r7, 0x0
    bn.cmov_0 r11, r6, r11
    bg.ori r3, r0, 0x420
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23dead
    bg.ori r3, r0, 0x422
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23dead
    bn.addi r7, r10, 0x1
    bn.extbz r10, r7
    bg.bnei r10, 0x8, loc_240524
    bn.beqi r13, 0x0, loc_2405e6
    bg.ori r3, r0, 0x420
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x20
    bg.jal 0x23dead
    bg.ori r3, r0, 0x422
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x20
    bg.jal 0x23dead
loc_2405a1:
    bg.jal 0x24229a
    bg.ori r3, r0, 0x422
    bt.movi r4, 0x1
    bn.ori r5, r0, 0x10
    bg.jal 0x23dead
    bg.jal 0x24229a
    bg.ori r3, r0, 0x420
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23dead
    bg.ori r3, r0, 0x422
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23dead
    bt.mov r3, r11
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
loc_2405e6:
    bg.ori r3, r0, 0x422
    bt.movi r4, 0x1
    bn.ori r5, r0, 0x20
    bg.jal 0x23dead
    bt.j loc_2405a1
