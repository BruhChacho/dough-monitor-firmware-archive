# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x222d32,0x222d5f); byte-exact only; hardware untested.
    bt.movi r5, 0x0
    bt.movi r3, 0x0
    bg.movhi r7, 0x3b
    bg.addi r6, r7, 0x4954
loc_222d3e:
    bn.lwz r7, 0x0(r6)
    bg.ori r4, r0, 0x1000
    bn.and r7, r7, r4
    bn.bnei r7, 0x0, loc_222d5d
    bn.addi r7, r5, 0x1
    bn.extbz r5, r7
    bt.addi r3, 0x1
    bg.addi r6, r6, 0xb0
    bg.bnei r5, 0x6, loc_222d3e
    bt.movi r3, 0x6
loc_222d5d:
    bt.jr r9
