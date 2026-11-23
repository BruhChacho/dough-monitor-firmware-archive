# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20aade,0x20ab2e); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bn.ori r7, r0, 0x58
    bn.muls r7, r3, r7
    bg.movhi r6, 0x45
    bg.addi r6, r6, 0x3fc4
    bt.add r7, r6
    bn.lbz r6, 0x53(r7)
    bn.bnei r6, 0x0, loc_20ab1c
    bn.lbz r7, 0x52(r7)
    bn.bnei r7, 0x0, loc_20ab10
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x20a79a
loc_20ab10:
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x20a58e
loc_20ab1c:
    bg.jal 0x20a58e
    bt.mov r3, r10
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x20a79a
