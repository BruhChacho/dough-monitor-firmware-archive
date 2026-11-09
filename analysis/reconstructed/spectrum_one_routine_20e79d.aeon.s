# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20e79d,0x20e7c1); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.jal 0x20e687
    bg.movhi r7, 0x45
    bg.lbz r7, 0x43c7(r7)
    bn.and r3, r3, r7
    bn.sfeqi r3, 0x0
    bn.cmovsi_2 r3, r0, 0x1
    bn.andi r3, r3, 0x1
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
