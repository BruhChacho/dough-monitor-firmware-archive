# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2063ed,0x206417); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.movhi r7, 0x3b
    bg.lwz r7, 0x5f38(r7)
    bn.lbz r3, 0x5a(r7)
    bg.jal 0x27e9b2
    bt.movi r7, 0x0
    bn.bnei r3, 0x0, loc_20640e
    bg.movhi r7, 0x45
    bg.lbz r7, 0x3f86(r7)
loc_20640e:
    bt.mov r3, r7
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
