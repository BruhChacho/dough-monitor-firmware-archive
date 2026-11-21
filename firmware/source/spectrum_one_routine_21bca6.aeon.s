# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21bca6,0x21bcec); byte-exact only; hardware untested.
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r3, r7
    bn.lh r7, 0x2a(r3)
    bn.andi r7, r7, 0x2
    bt.movi r6, 0x0
    bn.beqi r7, 0x0, loc_21bcda
    bg.movhi r7, 0x48
    bg.lbz r6, -0x4db(r7)
    bg.beqi r6, 0x9, loc_21bcde
    bt.movi r7, 0x5
    bn.xor r7, r6, r7
    bn.ff1 r7, r7
    bt.addi r7, -0x1
    bn.srli r6, r7, 0x1f
loc_21bcda:
    bt.mov r3, r6
    bt.jr r9
loc_21bcde:
    bn.lh r7, 0x1e(r3)
    bg.sfnei r7, 0x870
    bn.cmovsi_2 r6, r0, 0x1
    bt.mov r3, r6
    bt.jr r9
