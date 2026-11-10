# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x222f8e,0x222fca); byte-exact only; hardware untested.
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lbz r3, 0x5(r3)
    bn.srli r7, r3, 0x7
    bt.movi r3, 0x1
    bn.bnei r7, 0x0, loc_222fc0
    bn.beqi r4, 0x2, loc_222fc2
    bt.movi r3, 0x4
    bg.bnei r4, 0x4, loc_222fc0
    bn.ff1 r7, r5
    bn.sub r7, r0, r7
    bn.srli r7, r7, 0x1f
    bt.movi r6, 0x1
    bn.xor r3, r7, r6
loc_222fc0:
    bt.jr r9
loc_222fc2:
    bn.sfeqi r5, 0x0
    bn.cmovi r3, 0x3, 0x2
    bt.jr r9
