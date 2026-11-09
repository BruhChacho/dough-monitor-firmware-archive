# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x222b35,0x222b65); byte-exact only; hardware untested.
    bt.mov r4, r3
    bt.movi r6, 0x0
    bt.movi r3, 0x0
    bg.movhi r7, 0x48
    bg.addi r5, r7, -0x539
loc_222b43:
    bn.sra r7, r4, r3
    bn.andi r7, r7, 0x1
    bn.beqi r7, 0x0, loc_222b52
    bn.lbz r7, 0x0(r5)
    bn.beqi r7, 0x0, loc_222b63
loc_222b52:
    bn.addi r7, r6, 0x1
    bn.extbz r6, r7
    bt.addi r3, 0x1
    bn.addi r5, r5, 0x7c
    bg.bnei r6, 0xd, loc_222b43
    bt.movi r3, 0xd
loc_222b63:
    bt.jr r9
