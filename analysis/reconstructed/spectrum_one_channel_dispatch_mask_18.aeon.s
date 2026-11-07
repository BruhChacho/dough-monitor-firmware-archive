# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21bf85,0x21bfca); Apply selector masked update with mask 0x18.
# Fixed original addresses; not hardware-validated.
    bn.ori r7, r0, 0x7c
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lwz r7, 0x4(r7)
    bn.andi r3, r3, 0x1
    bn.beqi r3, 0x0, loc_21bfb4
    bn.slli r4, r4, 0x3
    bn.movhi_2 r6, 0x280
    bn.ori r6, r6, 0x15
    bn.add r3, r7, r6
    bn.andi r4, r4, 0xf8
    bn.ori r5, r0, 0x18
    bg.j 0x23dfe1
loc_21bfb4:
    bn.slli r4, r4, 0x3
    bn.movhi_2 r6, 0x480
    bn.ori r6, r6, 0x15
    bn.add r3, r7, r6
    bn.andi r4, r4, 0xf8
    bn.ori r5, r0, 0x18
    bg.j 0x23dfe1
