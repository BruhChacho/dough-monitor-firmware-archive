# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20e178,0x20e1ef); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bg.bgtui r3, 0x5, loc_20e196
    bn.slli r7, r3, 0x2
    bg.movhi r6, 0x2b
    bg.addi r6, r6, -0xef8
    bt.add r7, r6
    bn.lwz r7, 0x0(r7)
    bt.jr r7
loc_20e196:
    bn.addi r7, r3, -0x4
    bn.extbz r7, r7
    bt.movi r10, 0x0
    bn.bleui r7, 0x1, loc_20e1c1
loc_20e1a1:
    bg.ori r3, r0, 0x405
    bt.movi r4, 0x0
    bt.movi r5, 0x8
    bg.jal 0x23dfe1
    bg.ori r3, r0, 0xae4
    bt.mov r4, r10
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x23ddb9
    bt.movi r10, 0xa
loc_20e1c1:
    bg.ori r3, r0, 0x405
    bt.movi r4, 0x8
    bt.movi r5, 0x8
    bg.jal 0x23dfe1
    bg.ori r3, r0, 0xae4
    bt.mov r4, r10
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x23ddb9
    bt.movi r10, 0x1
    bt.j loc_20e1a1
    bt.movi r10, 0xb
    bt.j loc_20e1c1
    bt.movi r10, 0x3
    bt.j loc_20e1a1
    bt.movi r10, 0x2
    bt.j loc_20e1a1
