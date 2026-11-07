# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21bece,0x21bf19); Apply selector masked update with mask 0x01.
# Fixed original addresses; not hardware-validated.
    bn.ori r7, r0, 0x7c
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lwz r7, 0x4(r7)
    bn.andi r3, r3, 0x1
    bn.beqi r3, 0x0, loc_21bf00
    bn.ff1 r4, r4
    bn.sub r4, r0, r4
    bg.movhi r6, 0x4c80
    bn.ori r6, r6, 0x16
    bn.add r3, r7, r6
    bn.srli r4, r4, 0x1f
    bt.movi r5, 0x1
    bg.j 0x23dfe1
loc_21bf00:
    bn.ff1 r4, r4
    bn.sub r4, r0, r4
    bg.movhi r6, 0x6580
    bn.ori r6, r6, 0x16
    bn.add r3, r7, r6
    bn.srli r4, r4, 0x1f
    bt.movi r5, 0x1
    bg.j 0x23dfe1
