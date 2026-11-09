# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20ecbe,0x20ece9); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bg.jal 0x20e6c5
    bt.movi r7, 0x0
    bn.bgtui r3, 0x3, loc_20ecdd
    bt.mov r3, r10
    bg.jal 0x20e736
    bg.jal 0x233a44
    bt.mov r7, r3
loc_20ecdd:
    bt.mov r3, r7
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
