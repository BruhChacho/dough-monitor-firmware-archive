# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27bf84,0x27bfa1); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bn.movhi_2 r3, 0x1f90
    bg.ori r3, r3, 0x2f04
    bg.jal 0x27bb79
    bn.srli r3, r3, 0xf
    bn.andi r3, r3, 0x1
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
