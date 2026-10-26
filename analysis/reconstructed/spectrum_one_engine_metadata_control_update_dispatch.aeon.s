# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21d977,0x21da5e); Dispatch metadata values 0..8 through a second table to masked control-register updates; unsupported values return without update.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.mov r10, r4
    bg.jal 0x222804
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r6, 0x3b
    bg.addi r6, r6, 0x4950
    bt.add r3, r6
    bn.lwz r3, 0x0(r3)
    bg.bgtui r3, 0x8, loc_21d9ae
    bn.slli r7, r3, 0x2
    bg.movhi r6, 0x2b
    bg.addi r6, r6, -0xa88
    bt.add r7, r6
    bn.lwz r7, 0x0(r7)
    bt.jr r7
loc_21d9ae:
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
    bt.movhi r3, -0x10
    bg.ori r3, r3, 0x1f83
    bt.mov r4, r10
    bn.ori r5, r0, 0x10
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x23dead
    bt.movhi r3, -0x10
    bg.ori r3, r3, 0x1f84
loc_21d9d5:
    bt.mov r4, r10
    bt.movi r5, 0x1
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x23dead
    bt.movhi r3, -0x10
    bg.ori r3, r3, 0x1f83
    bt.mov r4, r10
    bt.movi r5, 0x4
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x23dead
    bt.movhi r3, -0x10
    bg.ori r3, r3, 0x1f83
    bt.mov r4, r10
    bt.movi r5, 0x2
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x23dead
    bt.movhi r3, -0x10
    bg.ori r3, r3, 0x1f83
    bt.j loc_21d9d5
    bt.movhi r3, -0x10
    bg.ori r3, r3, 0x1f83
    bt.mov r4, r10
    bn.ori r5, r0, 0x80
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x23dead
    bt.movhi r3, -0x10
    bg.ori r3, r3, 0x1f83
    bt.mov r4, r10
    bn.ori r5, r0, 0x40
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x23dead
    bt.movhi r3, -0x10
    bg.ori r3, r3, 0x1f83
    bt.mov r4, r10
    bn.ori r5, r0, 0x20
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x23dead
