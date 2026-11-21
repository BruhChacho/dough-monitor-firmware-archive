# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x249ec2,0x249f45); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bg.movhi r6, 0x45
    bg.addi r6, r6, 0x6350
    bn.add r7, r4, r6
    bn.sbz 0x0(r7), r3
    bn.addi r7, r3, 0x2
    bn.extbz r7, r7
    bn.bleui r7, 0x1, loc_249f07
    bt.movi r7, 0xc
    bn.muls r7, r4, r7
    bg.movhi r6, 0x45
    bg.lwz r6, 0x6270(r6)
    bt.add r7, r6
    bn.lwz r5, 0x4(r7)
    bn.lbz r6, 0x8(r7)
    bn.lbz r4, 0x9(r7)
loc_249ef3:
    bn.sbz 0x6(r1), r3
    bn.sbz 0x5(r1), r4
    bn.sbz 0x4(r1), r6
    bn.lwz r24, 0x4(r1)
    bt.mov r3, r5
    bt.mov r4, r24
    bt.addi r1, 0x8
    bt.jr r9
loc_249f07:
    bg.sfeqi r3, 0xfe
    bn.bf loc_249f2a
    bt.movi r3, 0x0
    bt.movi r4, 0x0
    bt.movi r6, 0x0
    bt.movi r5, 0x0
    bn.sbz 0x6(r1), r3
    bn.sbz 0x5(r1), r4
    bn.sbz 0x4(r1), r6
    bn.lwz r24, 0x4(r1)
    bt.mov r3, r5
    bt.mov r4, r24
    bt.addi r1, 0x8
    bt.jr r9
loc_249f2a:
    bt.movi r7, 0xc
    bn.muls r7, r4, r7
    bg.movhi r6, 0x45
    bg.lwz r6, 0x6270(r6)
    bt.add r7, r6
    bn.lwz r5, 0x0(r7)
    bn.lbz r4, 0x9(r7)
    bt.movi r3, 0x0
    bt.movi r6, 0x1
    bt.j loc_249ef3
