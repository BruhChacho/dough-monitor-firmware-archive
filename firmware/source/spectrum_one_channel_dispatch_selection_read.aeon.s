# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21be27,0x21be98); Read the engine selector byte and return bits 2..6; unsupported engine indices return 0x1f.
# Fixed original addresses; not hardware-validated.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bn.beqi r3, 0x1, loc_21be66
    bn.bgtui r3, 0x0, loc_21be4b
    bt.movhi r3, -0x10
    bg.ori r3, r3, 0x1f8e
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x7c
    bn.srli r7, r3, 0x2
loc_21be42:
    bt.mov r3, r7
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_21be4b:
    bn.beqi r3, 0x2, loc_21be7f
    bn.ori r7, r0, 0x1f
    bn.bnei r3, 0x3, loc_21be42
    bt.movhi r3, -0x10
    bg.ori r3, r3, 0x1f8f
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x7c
    bn.srli r7, r3, 0x2
    bt.j loc_21be42
loc_21be66:
    bt.movhi r3, -0x10
    bg.ori r3, r3, 0x1f8d
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x7c
    bn.srli r7, r3, 0x2
    bt.mov r3, r7
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
loc_21be7f:
    bt.movhi r3, -0x10
    bg.ori r3, r3, 0x1f90
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x7c
    bn.srli r7, r3, 0x2
    bt.mov r3, r7
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
