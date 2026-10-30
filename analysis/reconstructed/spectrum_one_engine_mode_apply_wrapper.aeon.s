# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23d349,0x23d36a); Invoke the engine-mode routine for indices 0 through 12.
# Fixed original addresses; not hardware-validated.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.movi r10, 0x0
loc_23d353:
    bn.extbz r3, r10
    bg.jal 0x222634
    bt.addi r10, 0x1
    bg.bnei r10, 0xd, loc_23d353
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
