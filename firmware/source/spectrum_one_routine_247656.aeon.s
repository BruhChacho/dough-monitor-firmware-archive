# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x247656,0x247687); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.movhi r7, 0x45
    bg.sbz 0x5238(r7), r0
    bg.movhi r7, 0x45
    bg.sbz 0x523a(r7), r0
    bg.movhi r7, 0x45
    bg.sbz 0x5239(r7), r0
    bg.ori r3, r0, 0x400
    bg.jal 0x2475db
    bn.ori r3, r0, 0xff
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bg.j 0x247620
