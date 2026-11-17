# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2a9469,0x2a9488); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bt.mov r7, r3
    bt.mov r5, r4
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x4c90
    bt.mov r4, r7
    bg.jal 0x2a9310
    bt.mov r3, r1
    bg.jal 0x2a9434
loc_2a9486:
    bt.j loc_2a9486
