# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23ea99,0x23eac4); For metadata indices 0..5, require a nonzero halfword at metadata offset 0xac, then return bit 5 of byte offset 0x98.
# Fixed original addresses; not a hardware-validated implementation.
    bg.bgtui r3, 0x5, loc_23eac0
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bg.lhz r7, 0xac(r3)
    bn.beqi r7, 0x0, loc_23eac0
    bg.lbz r7, 0x98(r3)
    bn.srli r7, r7, 0x5
    bn.andi r3, r7, 0x1
    bt.jr r9
loc_23eac0:
    bt.movi r3, 0x0
    bt.jr r9
