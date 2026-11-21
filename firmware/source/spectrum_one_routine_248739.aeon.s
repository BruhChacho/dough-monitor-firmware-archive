# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x248739,0x248789); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bn.beqi r3, 0x0, loc_248764
    bg.movhi r7, 0x3b
    bg.lwz r3, 0x7430(r7)
    bn.movhi_2 r7, 0x80
    bn.ori r7, r7, 0x6c
    bt.add r3, r7
    bg.jal 0x23dfb6
    bg.movhi r7, 0x45
    bg.sbz 0x524e(r7), r0
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_248764:
    bg.movhi r7, 0x3b
    bg.lwz r3, 0x7430(r7)
    bn.movhi_2 r7, 0x80
    bn.ori r7, r7, 0x6e
    bt.add r3, r7
    bg.jal 0x23dfb6
    bt.movi r6, 0x1
    bg.movhi r7, 0x45
    bg.sbz 0x524e(r7), r6
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
