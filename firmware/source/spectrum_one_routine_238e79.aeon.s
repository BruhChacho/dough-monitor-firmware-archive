# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x238e79,0x238edd); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.bgtui r3, 0x9, loc_238e94
    bn.slli r7, r3, 0x2
    bg.movhi r5, 0x2b
    bg.addi r5, r5, -0x154
    bt.add r7, r5
    bn.lwz r7, 0x0(r7)
    bt.jr r7
loc_238e94:
    bt.movi r3, 0x0
loc_238e96:
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
    bt.mov r3, r6
    bg.jal 0x2388c2
    bn.ori r3, r0, 0x10
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
    bt.movi r6, 0x1
    bg.movhi r7, 0x45
    bg.sbz 0x508c(r7), r6
    bn.ori r3, r0, 0x10
    bt.j loc_238e96
    bt.mov r3, r6
    bg.jal 0x238d07
    bn.ori r3, r0, 0x10
    bt.j loc_238e96
    bt.mov r3, r6
    bg.jal 0x238de2
    bn.ori r3, r0, 0x10
    bt.j loc_238e96
    bt.mov r3, r6
    bg.jal 0x238858
    bn.ori r3, r0, 0x10
    bt.j loc_238e96
