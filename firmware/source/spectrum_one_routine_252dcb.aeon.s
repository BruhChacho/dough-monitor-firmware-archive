# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x252dcb,0x252e20); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bn.slli r7, r3, 0x2
    bg.movhi r5, 0x45
    bg.addi r5, r5, 0x7660
    bt.add r7, r5
    bn.sw 0x0(r7), r4
    bn.extbz r4, r4
    bg.jal 0x24f842
    bt.mov r4, r3
    bn.slli r7, r10, 0x1
    bg.movhi r5, 0x45
    bg.addi r5, r5, 0x765c
    bn.add r6, r7, r5
    bn.sh_1 0x0(r6), r3
    bg.movhi r6, 0x45
    bg.addi r6, r6, 0x3c88
    bt.add r7, r6
    bn.sh_1 0x0(r7), r3
    bn.ff1 r10, r10
    bt.addi r10, -0x1
    bn.srli r3, r10, 0x1f
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x248739
