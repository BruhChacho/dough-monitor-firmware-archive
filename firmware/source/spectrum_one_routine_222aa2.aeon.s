# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x222aa2,0x222ace); byte-exact only; hardware untested.
    bn.andi r7, r3, 0x1
    bn.beqi r7, 0x0, loc_222aca
    bn.ori r7, r0, 0x7c
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.lwz r7, -0x74(r7)
    bn.bnei r7, 0x0, loc_222ac6
loc_222abe:
    bn.addi r7, r3, -0x1
    bn.extbz r3, r7
    bt.jr r9
loc_222ac6:
    bg.beqi r7, 0x7, loc_222abe
loc_222aca:
    bt.movi r3, 0x4
    bt.jr r9
