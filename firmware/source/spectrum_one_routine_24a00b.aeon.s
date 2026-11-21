# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x24a00b,0x24a028); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bt.mov r4, r3
    bg.movhi r3, 0x45
    bg.addi r3, r3, 0x6268
    bn.ori r5, r0, 0xe8
    bg.jal 0x2aab1e
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
