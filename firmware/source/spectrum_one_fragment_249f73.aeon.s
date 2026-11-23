# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x249f73,0x24a00b); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bn.sw 0x14(r1), r10
    bn.sw 0x10(r1), r11
    bt.mov r11, r5
    bt.mov r10, r6
    bg.jal 0x249ec2
    bn.sw 0x0(r1), r3
    bn.sw 0x4(r1), r4
    bn.sw 0x8(r1), r3
    bn.sw 0xc(r1), r4
    bn.lbz r4, 0xe(r1)
    bn.lbz r5, 0xc(r1)
    bg.ble r5, r4, loc_249ff1
    bn.lbz r6, 0x1(r3)
    bn.lbz r7, 0x0(r3)
    bn.slli r7, r7, 0x8
    bt.add r6, r7
    bn.add r7, r3, r4
    bn.lbz r7, 0x3(r7)
    bn.sbz 0x0(r11), r7
    bn.beqi r10, 0x0, loc_249ff1
    bg.ori r7, r0, 0xffff
    bn.sfeq r6, r7
    bn.bf loc_249ff1
    bn.addi r24, r5, 0x3
    bn.add r7, r3, r5
    bn.addi r5, r7, 0x3
    bt.add r7, r4
    bn.addi r3, r7, 0x6
    bt.movi r4, 0x1
loc_249fce:
    bn.lbz r7, 0x0(r5)
    bn.slli r7, r7, 0x8
    bn.lbz r6, 0x1(r5)
    bn.add r23, r7, r6
    bn.add r6, r11, r4
    bn.lbz r7, 0x0(r3)
    bn.sbz 0x0(r6), r7
    bn.addi r7, r4, 0x1
    bn.exthz r4, r7
    bt.add r5, r24
    bt.add r3, r24
    bg.ble r4, r10, loc_249fff
loc_249ff1:
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
loc_249fff:
    bg.ori r7, r0, 0xffff
    bn.sfne r23, r7
    bn.bf loc_249fce
    bt.j loc_249ff1
