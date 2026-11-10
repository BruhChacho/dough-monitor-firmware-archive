# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x222f55,0x222f8e); byte-exact only; hardware untested.
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lbz r3, 0x5(r3)
    bn.srli r7, r3, 0x7
    bn.bnei r7, 0x0, loc_222f7a
    bt.movi r3, 0x4
    bn.beqi r4, 0x1, loc_222f7c
    bn.beqi r4, 0x2, loc_222f86
    bg.beqi r4, 0x4, loc_222f7e
loc_222f7a:
    bt.movi r3, 0x7
loc_222f7c:
    bt.jr r9
loc_222f7e:
    bn.sfeqi r5, 0x0
    bn.cmovi r3, 0x1, 0x6
    bt.jr r9
loc_222f86:
    bn.sfeqi r5, 0x0
    bn.cmovsi_2 r3, r0, 0x5
    bt.jr r9
