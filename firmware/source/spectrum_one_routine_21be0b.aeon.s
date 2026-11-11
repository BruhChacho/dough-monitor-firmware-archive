# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21be0b,0x21be27); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bt.movhi r3, -0xe
    bg.ori r3, r3, 0x2266
    bg.jal 0x23dd44
    bn.srli r3, r3, 0x3
    bn.andi r3, r3, 0x1
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
