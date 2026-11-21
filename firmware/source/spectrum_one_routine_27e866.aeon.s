# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27e866,0x27e89d); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r4, r3
    bg.movhi r10, 0x49
    bg.addi r10, r10, -0x2704
    bt.mov r3, r10
    bn.ori r5, r0, 0xe4
    bg.jal 0x2aab1e
    bg.movhi r7, 0x45
    bg.sw_0 0x79c8(r7), r10
    bt.movi r6, 0x1
    bg.movhi r7, 0x45
    bg.sbz 0x79d0(r7), r6
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
