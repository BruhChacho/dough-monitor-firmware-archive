# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20c711,0x20c73b); Return first matching channel-table index for slot+1; sentinel 6 when absent.
# Fixed original addresses; not a hardware-validated implementation.
    bn.addi r4, r3, 0x1
    bt.movi r5, 0x0
    bt.movi r3, 0x0
    bg.movhi r7, 0x3b
    bg.addi r6, r7, 0x4950
loc_20c720:
    bn.lbz r7, 0x0(r6)
    bg.beq r4, r7, loc_20c739
    bn.addi r7, r5, 0x1
    bn.extbz r5, r7
    bt.addi r3, 0x1
    bg.addi r6, r6, 0xb0
    bg.bnei r5, 0x6, loc_20c720
    bt.movi r3, 0x6
loc_20c739:
    bt.jr r9
