# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21be98,0x21bece); Apply selector masked update with mask 0x02.
# Fixed original addresses; not hardware-validated.
    bn.ori r7, r0, 0x7c
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lwz r7, 0x4(r7)
    bn.andi r3, r3, 0x1
    bn.sfeqi r4, 0x0
    bg.movhi r6, 0x4c80
    bn.bnei r3, 0x0, loc_21bebf
    bn.sfeqi r4, 0x0
    bg.movhi r6, 0x6580
loc_21bebf:
    bn.ori r6, r6, 0x16
    bn.add r3, r7, r6
    bn.cmovsi_2 r4, r0, 0x2
    bt.movi r5, 0x2
    bg.j 0x23dfe1
