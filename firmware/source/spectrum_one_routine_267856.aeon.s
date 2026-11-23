# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x267856,0x26787a); byte-exact only; hardware untested.
    bg.movhi r7, 0x3b
    bg.lwz r7, 0x5f38(r7)
    bn.lbz r7, 0x49(r7)
    bn.slli r7, r7, 0x8
    bg.ori r6, r0, 0x200
    bn.and r7, r7, r6
    bn.beqi r7, 0x0, loc_267874
    bt.movi r3, 0x1
    bg.j 0x23a13d
loc_267874:
    bt.movi r3, 0x0
    bg.j 0x23a13d
