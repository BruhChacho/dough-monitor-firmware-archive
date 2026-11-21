# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23e760,0x23e783); byte-exact only; hardware untested.
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r3, r7
    bn.lwz r7, 0x4c(r3)
    bn.sfnei r7, 0x0
    bn.cmovsi_2 r3, r0, 0x1
    bt.movi r7, 0x1
    bn.xor r3, r3, r7
    bn.andi r3, r3, 0x1
    bt.jr r9
