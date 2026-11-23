# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x253749,0x253793); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bn.beqi r4, 0x0, loc_253763
    bn.beqi r4, 0x1, loc_25377b
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_253763:
    bt.movi r4, 0x4
    bt.movi r5, 0x0
    bg.jal 0x252c92
    bt.mov r4, r3
    bt.mov r3, r10
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x253649
loc_25377b:
    bt.movi r4, 0x4
    bt.movi r5, 0x1
    bg.jal 0x252c92
    bt.mov r4, r3
    bt.mov r3, r10
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x253649
