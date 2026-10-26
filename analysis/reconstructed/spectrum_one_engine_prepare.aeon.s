# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x204000,0x204059); Reject engine indices >3; otherwise external setup and conditional state handling.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r11, r3
    bn.bleui r3, 0x3, loc_20401d
loc_204010:
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_20401d:
    bg.jal 0x21ffb3
    bn.ori r7, r0, 0x7c
    bn.muls r10, r11, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r10, r7
    bn.lbz r7, 0xd(r10)
    bg.beqi r7, 0x9, loc_204040
    bt.movi r3, 0x0
    bt.mov r4, r11
    bg.jal 0x21d86d
loc_204040:
    bn.lwz r7, 0x8(r10)
    bn.bnei r7, 0x0, loc_204010
    bt.mov r3, r11
    bt.movi r4, 0x1
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x22d986
