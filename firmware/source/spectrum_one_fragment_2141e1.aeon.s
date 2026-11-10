# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2141e1,0x214326); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r4
    bn.beqi r3, 0x1, loc_21423c
    bn.bleui r3, 0x0, loc_214203
    bg.beqi r3, 0x2, loc_2142c7
    bg.beqi r3, 0x3, loc_21429b
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_214203:
    bn.ff1 r4, r4
    bt.addi r4, -0x1
    bg.ori r3, r0, 0x1720
    bn.srli r4, r4, 0x1f
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bn.beqi r10, 0x0, loc_214275
    bg.ori r3, r0, 0x1720
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bt.movi r4, 0x0
loc_214227:
    bt.movhi r3, -0x9
    bg.ori r3, r3, 0x2b7
loc_21422d:
    bn.ori r5, r0, 0x10
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x23dfe1
loc_21423c:
    bn.ff1 r4, r4
    bt.addi r4, -0x1
    bg.ori r3, r0, 0x1722
    bn.srli r4, r4, 0x1f
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bn.beqi r10, 0x0, loc_214288
    bg.ori r3, r0, 0x1722
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bt.movi r4, 0x0
loc_214260:
    bt.movhi r3, -0x9
    bg.ori r3, r3, 0x4b7
    bn.ori r5, r0, 0x10
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x23dfe1
loc_214275:
    bg.ori r3, r0, 0x1720
    bn.ori r4, r0, 0x10
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bn.ori r4, r0, 0x10
    bt.j loc_214227
loc_214288:
    bg.ori r3, r0, 0x1722
    bn.ori r4, r0, 0x10
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bn.ori r4, r0, 0x10
    bt.j loc_214260
loc_21429b:
    bn.ff1 r4, r4
    bt.addi r4, -0x1
    bg.ori r3, r0, 0x1726
    bn.srli r4, r4, 0x1f
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bn.beqi r10, 0x0, loc_214313
    bg.ori r3, r0, 0x1726
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bt.movi r4, 0x0
loc_2142bf:
    bt.movhi r3, -0x9
    bg.ori r3, r3, 0x8b7
    bt.j loc_21422d
loc_2142c7:
    bn.ff1 r4, r4
    bt.addi r4, -0x1
    bg.ori r3, r0, 0x1724
    bn.srli r4, r4, 0x1f
    bt.movi r5, 0x1
    bg.jal 0x23dfe1
    bn.beqi r10, 0x0, loc_214300
    bg.ori r3, r0, 0x1724
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bt.movi r4, 0x0
loc_2142eb:
    bt.movhi r3, -0x9
    bg.ori r3, r3, 0x6b7
    bn.ori r5, r0, 0x10
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x23dfe1
loc_214300:
    bg.ori r3, r0, 0x1724
    bn.ori r4, r0, 0x10
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bn.ori r4, r0, 0x10
    bt.j loc_2142eb
loc_214313:
    bg.ori r3, r0, 0x1726
    bn.ori r4, r0, 0x10
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bn.ori r4, r0, 0x10
    bt.j loc_2142bf
