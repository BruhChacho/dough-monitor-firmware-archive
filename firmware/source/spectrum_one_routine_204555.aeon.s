# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x204555,0x204581); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bg.jal 0x2042cc
    bg.jal 0x20444d
    bt.mov r3, r10
    bg.movhi r4, 0x48
    bg.addi r4, r4, -0x1eac
    bg.ori r5, r0, 0x3ca
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x2aab1e
