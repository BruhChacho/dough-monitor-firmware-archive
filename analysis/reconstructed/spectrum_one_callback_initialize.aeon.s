# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2614a9,0x26154e); Call external configuration helper, clear callbacks, install seven entries and enable callback gating.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bg.movhi r7, 0x3b
    bg.lwz r7, 0x5f38(r7)
    bn.lbz r3, 0x59(r7)
    bn.lbz r4, 0x60(r7)
    bg.jal 0x260824
    bg.jal 0x23e63e
    bt.movi r3, 0x0
    bg.movhi r4, 0x26
    bg.addi r4, r4, 0x21f0
    bg.jal 0x23e62c
    bt.movi r3, 0x1
    bg.movhi r4, 0x26
    bg.addi r4, r4, 0x23d2
    bg.jal 0x23e62c
    bt.movi r3, 0x2
    bg.movhi r4, 0x26
    bg.addi r4, r4, 0x1abd
    bg.jal 0x23e62c
    bt.movi r3, 0x3
    bg.movhi r4, 0x26
    bg.addi r4, r4, 0x1560
    bg.jal 0x23e62c
    bt.movi r3, 0x4
    bg.movhi r4, 0x26
    bg.addi r4, r4, 0x62f
    bg.jal 0x23e62c
    bt.movi r3, 0x5
    bg.movhi r4, 0x26
    bg.addi r4, r4, 0x154e
    bg.jal 0x23e62c
    bt.movi r3, 0x9
    bg.movhi r4, 0x26
    bg.addi r4, r4, 0x673
    bg.jal 0x23e62c
    bt.movi r6, 0x1
    bg.movhi r7, 0x45
    bg.sbz 0x51e1(r7), r6
    bt.movi r10, 0x0
loc_261535:
    bn.extbz r3, r10
    bt.movi r4, 0x0
    bg.jal 0x23e709
    bt.addi r10, 0x1
    bg.bnei r10, 0x4, loc_261535
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
