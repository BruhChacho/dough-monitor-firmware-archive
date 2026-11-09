# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21e948,0x21e9ba); byte-exact only; hardware untested.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bn.ori r7, r0, 0xb0
    bn.muls r10, r3, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r10, r7
    bn.lwz r6, 0x4(r10)
    bn.andi r7, r6, 0xe
    bn.bnei r7, 0x0, loc_21e995
loc_21e969:
    bn.andi r7, r6, 0x20
    bt.movi r3, 0x1
    bn.bnei r7, 0x0, loc_21e97b
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_21e97b:
    bn.lwz r3, 0x0(r10)
    bg.jal 0x20e8b1
    bn.ff1 r3, r3
    bn.sub r3, r0, r3
    bn.srli r3, r3, 0x1f
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_21e995:
    bn.lwz r3, 0x0(r10)
    bg.jal 0x20ecbe
    bn.bnei r3, 0x0, loc_21e9ab
loc_21e99f:
    bt.movi r3, 0x0
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
loc_21e9ab:
    bn.lwz r3, 0x0(r10)
    bg.jal 0x20ec93
    bn.beqi r3, 0x0, loc_21e99f
    bn.lwz r6, 0x4(r10)
    bt.j loc_21e969
