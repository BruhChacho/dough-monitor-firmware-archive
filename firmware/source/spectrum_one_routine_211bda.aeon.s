# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x211bda,0x211c05); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.ori r7, r0, 0x900
    bn.muls r3, r3, r7
    bt.movhi r7, -0xa
    bg.ori r7, r7, 0x496
    bt.add r3, r7
    bg.jal 0x23dd44
    bn.extbs r3, r3
    bn.sfgtsi r3, -0x1
    bn.cmovsi_2 r3, r0, 0x1
    bn.andi r3, r3, 0x1
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
