# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x210786,0x210810); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r10, r4
    bg.jal 0x2100d2
    bt.mov r11, r3
    bt.movi r6, 0x0
loc_21079b:
    bn.add r7, r6, r10
    bn.sbz 0x0(r7), r0
    bt.addi r6, 0x1
    bn.sfnei r6, 0x1c
    bn.bf loc_21079b
    bt.mov r3, r11
    bg.jal 0x2121d2
    bn.beqi r3, 0x1, loc_2107f4
loc_2107b2:
    bt.mov r3, r11
    bt.mov r4, r10
    bg.jal 0x2127f8
    bn.ori r7, r0, 0x74
    bn.muls r3, r11, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x7e8
    bt.add r3, r6
    bn.lh r6, 0x66(r3)
    bg.ori r5, r0, 0x2000
    bn.and r7, r6, r5
    bt.movi r5, 0x0
    bn.beqi r7, 0x0, loc_2107e5
    bg.addi r5, r0, -0x2001
    bn.and r7, r6, r5
    bn.sh_2 0x66(r3), r7
    bt.movi r5, 0x1
loc_2107e5:
    bt.mov r3, r5
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_2107f4:
    bn.ori r7, r0, 0x74
    bn.muls r7, r11, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x7e8
    bt.add r7, r5
    bn.lh r5, 0x66(r7)
    bg.ori r6, r5, 0x2000
    bn.sh_2 0x66(r7), r6
    bt.j loc_2107b2
