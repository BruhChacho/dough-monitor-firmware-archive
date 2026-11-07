# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21125a,0x2112a0); Conditionally publish two bytes, then update selected register bits through two helpers.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r23, r3
    bt.mov r3, r5
    bt.mov r10, r6
    bg.movhi r7, 0x45
    bg.lbz r7, 0x446c(r7)
    bn.andi r7, r7, 0x1
    bn.bnei r7, 0x0, loc_211286
    bg.movhi r7, 0x45
    bg.sbz 0x4468(r7), r23
    bg.movhi r7, 0x45
    bg.sbz 0x446d(r7), r4
loc_211286:
    bg.movhi r4, 0x45
    bg.addi r4, r4, 0x446a
    bg.jal 0x212e18
    bt.mov r3, r10
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x212d95
