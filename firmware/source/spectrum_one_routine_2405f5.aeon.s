# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2405f5,0x2406df); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r10, r3
    bt.movi r11, 0x0
    bt.j loc_24065f
loc_240606:
    bg.ori r3, r0, 0x420
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x20
    bg.jal 0x23dead
    bg.ori r3, r0, 0x422
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x20
    bg.jal 0x23dead
loc_240620:
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
    bn.addi r7, r11, 0x1
    bn.extbz r11, r7
    bg.beqi r11, 0x8, loc_240674
    bn.slli r7, r10, 0x1
    bn.extbz r10, r7
loc_24065f:
    bn.extbs r7, r10
    bn.bgtsi r7, -0x1, loc_240606
    bg.ori r3, r0, 0x422
    bt.movi r4, 0x1
    bn.ori r5, r0, 0x20
    bg.jal 0x23dead
    bt.j loc_240620
loc_240674:
    bg.ori r3, r0, 0x422
    bt.movi r4, 0x1
    bn.ori r5, r0, 0x20
    bg.jal 0x23dead
    bg.jal 0x240410
    bt.mov r10, r3
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
    bg.jal 0x24229a
    bg.ori r3, r0, 0x420
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x20
    bg.jal 0x23dead
    bg.ori r3, r0, 0x422
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x20
    bg.jal 0x23dead
    bt.mov r3, r10
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
