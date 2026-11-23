# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20ab72,0x20abaa); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bn.ori r7, r0, 0x58
    bn.muls r7, r3, r7
    bg.movhi r6, 0x45
    bg.addi r6, r6, 0x3fc4
    bt.add r7, r6
    bn.slli r4, r4, 0x3
    bn.sh_1 0x0(r7), r4
    bg.jal 0x2096f0
    bt.mov r3, r10
    bg.jal 0x20aade
    bt.mov r3, r10
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x20a156
