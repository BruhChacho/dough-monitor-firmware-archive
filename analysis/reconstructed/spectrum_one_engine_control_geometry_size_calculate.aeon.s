# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21d913,0x21d977); Derive a 16-bit size from engine register offset 0x50 and metadata bytes at offsets 0x88/0x89.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r10, r3
    bg.jal 0x21d3b1
    bt.mov r11, r3
    bt.mov r3, r10
    bg.jal 0x222804
    bt.mov r12, r3
    bn.addi r3, r11, 0x50
    bg.jal 0x23df85
    bg.ori r7, r0, 0x1fff
    bn.and r3, r3, r7
    bt.addi r3, 0x1
    bn.ori r6, r0, 0xb0
    bn.muls r6, r12, r6
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r6, r7
    bg.lbz r7, 0x88(r6)
    bt.addi r7, 0x1
    bg.lbz r6, 0x89(r6)
    bn.muls r7, r7, r6
    bn.muls r3, r3, r7
    bt.addi r3, -0x1
    bn.exthz r3, r3
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
