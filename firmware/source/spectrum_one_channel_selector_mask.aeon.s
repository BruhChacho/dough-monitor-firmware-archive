# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20e687,0x20e6c5); Table-dispatched selector:0->0x80,1..7->1<<(index-1),larger uint32->0; physical channel meaning unknown.
# Fixed original addresses; not a hardware-validated implementation.
    bt.movi r7, 0x0
    bg.bgtui r3, 0x7, loc_20e6a2
    bn.slli r7, r3, 0x2
    bg.movhi r6, 0x2b
    bg.addi r6, r6, -0xee0
    bt.add r7, r6
    bn.lwz r7, 0x0(r7)
    bt.jr r7
    bn.ori r7, r0, 0x80
loc_20e6a2:
    bt.mov r3, r7
    bt.jr r9
    bn.ori r7, r0, 0x40
    bt.j loc_20e6a2
    bn.ori r7, r0, 0x20
    bt.j loc_20e6a2
    bn.ori r7, r0, 0x10
    bt.j loc_20e6a2
    bt.movi r7, 0x8
    bt.j loc_20e6a2
    bt.movi r7, 0x4
    bt.j loc_20e6a2
    bt.movi r7, 0x2
    bt.j loc_20e6a2
    bt.movi r7, 0x1
    bt.j loc_20e6a2
