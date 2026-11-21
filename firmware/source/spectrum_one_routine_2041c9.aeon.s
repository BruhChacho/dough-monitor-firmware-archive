# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2041c9,0x204224); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.movi r6, 0x0
    bg.movhi r7, 0x48
    bg.addi r10, r7, -0x1ae2
    bt.mov r7, r10
loc_2041dd:
    bn.sbz 0x2(r7), r0
    bn.sbz 0x3(r7), r0
    bt.addi r6, 0x1
    bt.addi r7, 0x2
    bg.bnei r6, 0x9, loc_2041dd
    bn.sbz 0x2(r10), r0
    bt.movi r7, 0x4
    bn.sbz 0x3(r10), r7
    bn.sbz 0xa(r10), r0
    bn.sbz 0xb(r10), r7
    bn.sbz 0x12(r10), r0
    bn.sbz 0x13(r10), r7
    bg.movhi r3, 0x48
    bg.addi r3, r3, -0x1ae0
    bn.ori r4, r0, 0x12
    bg.jal 0x204080
    bn.exthz r3, r3
    bn.sbz 0x14(r10), r3
    bn.srli r3, r3, 0x8
    bn.sbz 0x15(r10), r3
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
