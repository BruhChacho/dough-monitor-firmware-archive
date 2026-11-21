# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x206427,0x20649d); byte-exact only; hardware untested.
    bg.addi r1, r1, -0x3dc
    bg.sw_0 0x3d8(r1), r9
    bg.movhi r7, 0x34
    bg.addi r7, r7, 0x1d50
    bg.sw_0 0x3cc(r1), r7
    bg.movhi r6, 0x34
    bg.addi r6, r6, 0x1e90
    bg.sw_0 0x3d0(r1), r6
    bg.movhi r6, 0x34
    bg.addi r6, r6, 0x1fd0
    bg.sw_0 0x3d4(r1), r6
    bg.addi r24, r1, 0x3d0
    bg.addi r23, r1, 0x3d4
    bt.movi r5, 0x0
    bn.addi r3, r1, 0xa
    bt.mov r6, r3
    bt.mov r4, r7
loc_206464:
    bn.lbz r7, 0x0(r4)
    bn.sbz 0x0(r6), r7
    bn.lwz r7, 0x0(r24)
    bt.add r7, r5
    bn.lbz r7, 0x0(r7)
    bg.sbz 0x140(r6), r7
    bn.lwz r7, 0x0(r23)
    bt.add r7, r5
    bn.lbz r7, 0x0(r7)
    bg.sbz 0x280(r6), r7
    bt.addi r5, 0x1
    bt.addi r4, 0x1
    bt.addi r6, 0x1
    bg.sfnei r5, 0x140
    bn.bf loc_206464
    bg.jal 0x27ed45
    bg.lwz r9, 0x3d8(r1)
    bg.addi r1, r1, 0x3dc
    bt.jr r9
