# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x210820,0x210885); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r10, r4
    bg.jal 0x2100d2
    bt.mov r11, r3
    bt.movi r6, 0x0
loc_210835:
    bn.add r7, r10, r6
    bn.sbz 0x0(r7), r0
    bt.addi r6, 0x1
    bn.sfnei r6, 0x1c
    bn.bf loc_210835
    bt.mov r3, r11
    bt.mov r4, r10
    bg.jal 0x212891
    bn.ori r7, r0, 0x74
    bn.muls r3, r11, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x7e8
    bt.add r3, r5
    bn.lh r6, 0x66(r3)
    bg.ori r5, r0, 0x1000
    bn.and r7, r6, r5
    bt.movi r5, 0x0
    bn.beqi r7, 0x0, loc_210876
    bg.addi r5, r0, -0x1001
    bn.and r7, r6, r5
    bn.sh_2 0x66(r3), r7
    bt.movi r5, 0x1
loc_210876:
    bt.mov r3, r5
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
