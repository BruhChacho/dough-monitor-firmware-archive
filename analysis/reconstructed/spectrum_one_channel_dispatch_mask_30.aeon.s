# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21bf19,0x21bf85); Apply selector masked update with mask 0x30.
# Fixed original addresses; not hardware-validated.
    bn.ori r7, r0, 0x7c
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lwz r6, 0x4(r7)
    bn.beqi r4, 0x0, loc_21bf47
    bn.andi r7, r3, 0x1
    bn.beqi r7, 0x0, loc_21bf73
    bn.movhi_2 r7, 0x280
    bn.ori r7, r7, 0x1e
    bn.add r3, r6, r7
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x30
    bg.j 0x23dfe1
loc_21bf47:
    bn.andi r7, r3, 0x1
    bn.beqi r7, 0x0, loc_21bf60
    bn.movhi_2 r7, 0x280
    bn.ori r7, r7, 0x1e
    bn.add r3, r6, r7
    bn.ori r4, r0, 0x20
    bn.ori r5, r0, 0x30
    bg.j 0x23dfe1
loc_21bf60:
    bn.movhi_2 r7, 0x480
    bn.ori r7, r7, 0x1e
    bn.add r3, r6, r7
    bn.ori r4, r0, 0x20
    bn.ori r5, r0, 0x30
    bg.j 0x23dfe1
loc_21bf73:
    bn.movhi_2 r7, 0x480
    bn.ori r7, r7, 0x1e
    bn.add r3, r6, r7
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x30
    bg.j 0x23dfe1
