# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x25430b,0x25437d); byte-exact only; hardware untested.
    bg.addi r1, r1, -0x84
    bg.sw_0 0x80(r1), r9
    bg.movhi r7, 0x3b
    bg.lwz r4, 0x7468(r7)
    bn.sbz 0x0(r1), r0
    bg.ori r7, r0, 0x74a
    bn.sw 0xc(r1), r7
    bn.ori r7, r0, 0x10
    bn.sbz 0x10(r1), r7
    bg.addi r6, r0, 0xf00
    bn.sh_2 0x12(r1), r6
    bg.addi r7, r0, 0x870
    bn.sh_1 0x14(r1), r7
    bn.sh_1 0x18(r1), r6
    bg.addi r7, r0, 0x8ef
    bn.sh_2 0x16(r1), r7
    bn.sbz 0x1a(r1), r0
    bn.sbz 0x1b(r1), r0
    bn.sbz 0x1c(r1), r0
    bt.movi r6, 0x1
    bg.movhi r7, 0x45
    bg.sbz 0x7490(r7), r6
    bn.beqi r3, 0x0, loc_25436b
    bt.movi r3, 0x0
    bt.mov r5, r1
    bg.jal 0x253c6f
    bg.lwz r9, 0x80(r1)
    bg.addi r1, r1, 0x84
    bt.jr r9
loc_25436b:
    bt.movi r3, 0x1
    bt.mov r5, r1
    bg.jal 0x253c6f
    bg.lwz r9, 0x80(r1)
    bg.addi r1, r1, 0x84
    bt.jr r9
