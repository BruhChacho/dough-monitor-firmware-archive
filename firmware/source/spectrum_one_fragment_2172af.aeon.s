# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2172af,0x2173d0); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r3
    bn.beqi r4, 0x0, loc_2172d5
    bn.beqi r3, 0x0, loc_217332
    bg.beqi r3, 0x1, loc_21737c
    bg.beqi r3, 0x2, loc_2173a6
    bg.beqi r3, 0x3, loc_21736a
loc_2172cb:
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_2172d5:
    bn.beqi r3, 0x0, loc_217304
    bg.beqi r3, 0x1, loc_21738e
    bg.beqi r3, 0x2, loc_2173b8
    bn.beqi r3, 0x3, loc_217352
    bg.jal 0x21723d
    bt.movi r7, 0xf
    bn.sra r7, r7, r10
    bn.andi r7, r7, 0x1
    bn.beqi r7, 0x0, loc_2172cb
    bt.mov r3, r10
    bt.movi r4, 0x1
    bt.movi r5, 0x0
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x213cec
loc_217304:
    bg.ori r3, r0, 0x480
    bt.movi r5, 0x4
    bg.jal 0x23dead
    bg.ori r3, r0, 0x481
    bt.movi r4, 0x0
    bt.movi r5, 0x4
    bg.jal 0x23dead
loc_21731a:
    bt.mov r3, r10
    bg.jal 0x21723d
    bt.mov r3, r10
    bt.movi r4, 0x1
    bt.movi r5, 0x0
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x213cec
loc_217332:
    bg.ori r3, r0, 0x480
    bt.movi r4, 0x1
    bt.movi r5, 0x4
    bg.jal 0x23dead
    bg.ori r3, r0, 0x481
loc_217342:
    bt.movi r4, 0x0
    bt.movi r5, 0x4
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x23dead
loc_217352:
    bg.ori r3, r0, 0x48c
    bt.movi r5, 0x4
    bg.jal 0x23dead
    bg.ori r3, r0, 0x48d
    bt.movi r4, 0x0
    bt.movi r5, 0x4
    bg.jal 0x23dead
    bt.j loc_21731a
loc_21736a:
    bg.ori r3, r0, 0x48c
    bt.movi r4, 0x1
    bt.movi r5, 0x4
    bg.jal 0x23dead
    bg.ori r3, r0, 0x48d
    bt.j loc_217342
loc_21737c:
    bg.ori r3, r0, 0x484
    bt.movi r4, 0x1
    bt.movi r5, 0x4
    bg.jal 0x23dead
    bg.ori r3, r0, 0x485
    bt.j loc_217342
loc_21738e:
    bg.ori r3, r0, 0x484
    bt.movi r5, 0x4
    bg.jal 0x23dead
    bg.ori r3, r0, 0x485
    bt.movi r4, 0x0
    bt.movi r5, 0x4
    bg.jal 0x23dead
    bt.j loc_21731a
loc_2173a6:
    bg.ori r3, r0, 0x488
    bt.movi r4, 0x1
    bt.movi r5, 0x4
    bg.jal 0x23dead
    bg.ori r3, r0, 0x489
    bt.j loc_217342
loc_2173b8:
    bg.ori r3, r0, 0x488
    bt.movi r5, 0x4
    bg.jal 0x23dead
    bg.ori r3, r0, 0x489
    bt.movi r4, 0x0
    bt.movi r5, 0x4
    bg.jal 0x23dead
    bt.j loc_21731a
