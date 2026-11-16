# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23890a,0x238928); byte-exact only; hardware untested.
    bt.mov r6, r3
    bt.movi r3, 0x0
loc_23890e:
    bg.movhi r5, 0x3b
    bg.addi r5, r5, 0x427b
    bn.add r7, r3, r5
    bn.lbz r7, 0x0(r7)
    bg.beq r6, r7, loc_238926
    bt.addi r3, 0x1
    bg.bnei r3, 0x6, loc_23890e
loc_238926:
    bt.jr r9
