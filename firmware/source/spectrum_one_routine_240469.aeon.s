# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x240469,0x2404a4); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bn.ori r7, r0, 0xe8
    bn.muls r3, r3, r7
    bt.addi r3, -0x1
    bn.exthz r10, r3
    bg.ori r7, r0, 0xffff
    bn.sfeq r10, r7
    bn.bf loc_24049a
loc_240486:
    bg.jal 0x24229a
    bn.addi r7, r10, -0x1
    bn.exthz r10, r7
    bg.ori r7, r0, 0xffff
    bn.sfne r10, r7
    bn.bf loc_240486
loc_24049a:
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
