# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2162d2,0x216315); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bg.jal 0x211817
    bt.movhi r7, -0x9
    bg.ori r7, r7, 0x264
    bn.add r10, r3, r7
    bt.mov r3, r10
    bg.jal 0x23df85
    bg.ori r7, r0, 0x8888
    bn.and r3, r3, r7
    bt.movi r7, 0x0
    bn.beqi r3, 0x0, loc_216309
    bt.mov r3, r10
    bg.ori r4, r0, 0x4444
    bg.ori r5, r0, 0x4444
    bg.jal 0x23e152
    bt.movi r7, 0x1
loc_216309:
    bt.mov r3, r7
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
