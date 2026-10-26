# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x213b64,0x213bbb); Store enable byte and update two masked register fields; register meaning and ISA assumptions unresolved.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r10, r4
    bg.movhi r6, 0x45
    bg.addi r6, r6, 0x3ba4
    bn.add r7, r3, r6
    bn.sbz 0x0(r7), r4
    bg.jal 0x211855
    bt.mov r11, r3
    bn.sfnei r10, 0x0
    bt.movhi r7, -0x9
    bg.ori r7, r7, 0x1074
    bt.add r3, r7
    bn.cmov_1 r4, r4, r0
    bt.movi r5, 0x4
    bg.jal 0x23dfe1
    bn.ff1 r10, r10
    bt.addi r10, -0x1
    bt.movhi r6, -0x9
    bg.ori r6, r6, 0x1075
    bn.add r3, r11, r6
    bn.srli r4, r10, 0x1f
    bt.movi r5, 0x3
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x23dfe1
