# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21dcee,0x21dd76); Dispatch a selected metadata key through nine absolute targets; valid cases tail through 0x23ddb9.
# Fixed original addresses; not hardware-validated.
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
    bg.bgtui r3, 0x8, loc_21dd25
    bn.slli r7, r3, 0x2
    bg.movhi r6, 0x2b
    bg.addi r6, r6, -0xa48
    bt.add r7, r6
    bn.lwz r7, 0x0(r7)
    bt.jr r7
loc_21dd25:
    bt.movi r3, 0x0
loc_21dd27:
    bn.extbz r4, r10
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bg.j 0x23ddb9
loc_21dd36:
    bt.movhi r7, -0xd
    bg.ori r3, r7, 0xb04
    bt.j loc_21dd27
loc_21dd3e:
    bt.movhi r7, -0xd
    bg.ori r3, r7, 0x1304
    bt.j loc_21dd27
loc_21dd46:
    bt.movhi r7, -0xd
    bg.ori r3, r7, 0x704
    bt.j loc_21dd27
loc_21dd4e:
    bt.movhi r7, -0xd
    bg.ori r3, r7, 0x504
    bt.j loc_21dd27
loc_21dd56:
    bt.movhi r7, -0xd
    bg.ori r3, r7, 0x304
    bt.j loc_21dd27
loc_21dd5e:
    bt.movhi r7, -0xd
    bg.ori r3, r7, 0x1104
    bt.j loc_21dd27
loc_21dd66:
    bt.movhi r7, -0xd
    bg.ori r3, r7, 0xf04
    bt.j loc_21dd27
loc_21dd6e:
    bt.movhi r7, -0xd
    bg.ori r3, r7, 0xd04
    bt.j loc_21dd27
