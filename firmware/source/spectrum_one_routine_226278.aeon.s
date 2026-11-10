# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x226278,0x2262ce); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x4950
    bt.add r3, r5
    bn.lwz r6, 0x4(r3)
    bn.andi r7, r6, 0xe
    bn.bnei r7, 0x0, loc_22629c
    bn.andi r7, r6, 0x20
    bn.beqi r7, 0x0, loc_2262ad
loc_22629c:
    bn.lwz r3, 0x0(r3)
    bg.jal 0x20e7c1
    bn.extbz r3, r3
loc_2262a6:
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_2262ad:
    bg.ori r5, r0, 0x8000
    bn.and r7, r6, r5
    bn.beqi r7, 0x0, loc_2262c0
    bt.movi r3, 0x4
loc_2262b9:
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_2262c0:
    bt.movhi r5, 0x1
    bn.and r7, r6, r5
    bt.movi r3, 0x1
    bn.beqi r7, 0x0, loc_2262a6
    bt.movi r3, 0x4
    bt.j loc_2262b9
