# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x222843,0x222898); Update channel overlap flags 0x35 and 0x36.
# Fixed original addresses; not hardware-validated.
    bn.ori r7, r0, 0xa8
    bn.muls r6, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r6, r7
    bn.lh r5, 0x18(r6)
    bg.sfgti r5, 0x77f
    bn.bf loc_22286a
    bn.lh r4, 0x1c(r6)
    bn.add r7, r5, r4
    bg.sflesi r7, 0x780
    bn.bnf loc_222882
loc_22286a:
    bn.ori r7, r0, 0xa8
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0x21ec
    bt.add r7, r6
    bn.sbz 0x35(r7), r0
    bn.sbz 0x36(r7), r0
    bt.jr r9
loc_222882:
    bt.movi r7, 0x1
    bn.sbz 0x35(r6), r7
    bn.srli r7, r4, 0x1
    bt.add r7, r5
    bg.sfeqi r7, 0x780
    bn.cmov_1 r7, r1, r0
    bn.sbz 0x36(r6), r7
    bt.jr r9
