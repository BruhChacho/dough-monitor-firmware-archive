# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21d3b1,0x21d430); Map metadata index 0..5 to a uint32 metadata key; key 0..8 returns a logical base value, otherwise zero.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.jal 0x222804
    bg.bgtui r3, 0x5, loc_21d3d5
    bn.ori r7, r0, 0xb0
    bn.muls r7, r3, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r7, r6
    bn.lwz r3, 0x0(r7)
    bg.bleui r3, 0x8, loc_21d3de
loc_21d3d5:
    bt.movi r3, 0x0
loc_21d3d7:
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_21d3de:
    bn.slli r7, r3, 0x2
    bg.movhi r6, 0x2b
    bg.addi r6, r6, -0xaac
    bt.add r7, r6
    bn.lwz r7, 0x0(r7)
    bt.jr r7
    bt.movhi r7, -0xd
    bg.ori r3, r7, 0xa00
    bt.j loc_21d3d7
    bt.movhi r7, -0xd
    bg.ori r3, r7, 0x1200
    bt.j loc_21d3d7
    bt.movhi r7, -0xd
    bg.ori r3, r7, 0x600
    bt.j loc_21d3d7
    bt.movhi r7, -0xd
    bg.ori r3, r7, 0x400
    bt.j loc_21d3d7
    bt.movhi r7, -0xd
    bg.ori r3, r7, 0x200
    bt.j loc_21d3d7
    bt.movhi r7, -0xd
    bg.ori r3, r7, 0x1000
    bt.j loc_21d3d7
    bt.movhi r7, -0xd
    bg.ori r3, r7, 0xe00
    bt.j loc_21d3d7
    bt.movhi r7, -0xd
    bg.ori r3, r7, 0xc00
    bt.j loc_21d3d7
