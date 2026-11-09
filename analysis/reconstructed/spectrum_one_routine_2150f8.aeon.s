# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2150f8,0x215189); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r4
    bg.jal 0x211874
    bn.beqi r10, 0x1, loc_21514b
    bn.bgtui r10, 0x0, loc_21512b
    bt.movhi r6, -0x9
    bg.ori r6, r6, 0x30ca
    bt.add r3, r6
    bg.jal 0x23df85
    bg.ori r6, r0, 0x3fff
    bn.and r7, r3, r6
loc_21511f:
    bt.mov r3, r7
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_21512b:
    bn.beqi r10, 0x2, loc_21516a
    bt.movi r7, 0x0
    bn.bnei r10, 0x3, loc_21511f
    bt.movhi r7, -0x9
    bg.ori r7, r7, 0x3160
    bt.add r3, r7
    bg.jal 0x23df85
    bg.ori r6, r0, 0x3fff
    bn.and r3, r3, r6
    bn.addi r7, r3, 0x1
    bt.j loc_21511f
loc_21514b:
    bt.movhi r7, -0x9
    bg.ori r7, r7, 0x3162
    bt.add r3, r7
    bg.jal 0x23df85
    bg.ori r6, r0, 0x3fff
    bn.and r7, r3, r6
    bt.mov r3, r7
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_21516a:
    bt.movhi r7, -0x9
    bg.ori r7, r7, 0x3164
    bt.add r3, r7
    bg.jal 0x23df85
    bg.ori r6, r0, 0x3fff
    bn.and r7, r3, r6
    bt.mov r3, r7
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
