# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20451b,0x204548); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bg.jal 0x20434e
    bg.movhi r7, 0x45
    bg.lwz r6, 0x3b38(r7)
    bn.sw 0x0(r10), r6
    bg.addi r7, r7, 0x3b38
    bn.lwz r7, 0x4(r7)
    bn.sw 0x4(r10), r7
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
