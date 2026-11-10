# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21d814,0x21d86d); Read engine register offset 0x41 and return its sign bit; parity paths implement the same test.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bg.jal 0x21d3b1
    bn.andi r10, r10, 0x1
    bn.beqi r10, 0x0, loc_21d843
    bn.addi r3, r3, 0x41
    bg.jal 0x23dd44
    bt.movi r7, 0x0
    bn.extbs r3, r3
    bn.blesi r3, -0x1, loc_21d85f
    bt.mov r3, r7
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_21d843:
    bn.addi r3, r3, 0x41
    bg.jal 0x23dd44
    bn.extbs r3, r3
    bn.sfgtsi r3, -0x1
    bn.cmovsi_2 r7, r0, 0x1
    bt.mov r3, r7
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_21d85f:
    bt.movi r7, 0x1
    bt.mov r3, r7
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
