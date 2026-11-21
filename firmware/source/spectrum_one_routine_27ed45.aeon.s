# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27ed45,0x27ed70); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bt.mov r4, r3
    bn.beqi r3, 0x0, loc_27ed69
    bg.movhi r3, 0x45
    bg.addi r3, r3, 0x79d6
    bg.ori r5, r0, 0x3c0
    bg.jal 0x2aab1e
    bt.movi r6, 0x1
    bg.movhi r7, 0x45
    bg.sbz 0x79d5(r7), r6
loc_27ed69:
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
