# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2aad27,0x2aad6a); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bg.movhi r4, 0x4f00
    bg.jal 0x2ac46a
    bn.blesi r3, -0x1, loc_2aad5a
    bt.mov r3, r10
    bg.movhi r4, 0x4f00
    bg.jal 0x2abdde
    bg.jal 0x2ac317
    bg.movhi r7, 0x8000
    bt.add r3, r7
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_2aad5a:
    bt.mov r3, r10
    bg.jal 0x2ac317
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
