# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x211d3e,0x211d66); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.ori r7, r0, 0x900
    bn.muls r3, r3, r7
    bt.movhi r7, -0xa
    bg.ori r7, r7, 0x440
    bt.add r3, r7
    bg.jal 0x23dd44
    bn.ori r7, r0, 0x1b
    bn.muls r3, r3, r7
    bn.exthz r3, r3
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
