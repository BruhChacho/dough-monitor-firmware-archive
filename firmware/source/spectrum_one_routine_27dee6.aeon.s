# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27dee6,0x27df12); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.jal 0x2ac120
    bg.movhi r4, 0x38d1
    bg.ori r4, r4, 0xb717
    bg.jal 0x2abe2e
    bg.jal 0x2ac288
    bg.movhi r7, 0x3d
    bg.sw_0 -0x4770(r7), r3
    bg.sw_0 -0x476c(r7), r4
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
