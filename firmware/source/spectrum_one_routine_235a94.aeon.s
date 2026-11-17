# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x235a94,0x235aaf); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.movhi r3, 0x2e90
    bg.ori r3, r3, 0x2f3f
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x1
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
