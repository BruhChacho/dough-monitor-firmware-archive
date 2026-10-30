# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x222634,0x222679); Set global mode parameters, invoke the mode routine, and update engine state.
# Fixed original addresses; not hardware-validated.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bg.ori r3, r0, 0x13a0
    bg.jal 0x21bd00
    bg.ori r3, r0, 0x8ef
    bg.jal 0x21bd0a
    bt.movi r3, 0x0
    bt.mov r4, r10
    bg.jal 0x2213d0
    bn.ori r7, r0, 0x7c
    bn.muls r10, r10, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r10, r6
    bn.lbz r6, 0xf(r10)
    bn.ori r7, r6, 0x1
    bn.sbz 0xf(r10), r7
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
