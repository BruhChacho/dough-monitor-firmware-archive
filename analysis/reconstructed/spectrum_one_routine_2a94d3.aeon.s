# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2a94d3,0x2a94eb); byte-exact only; hardware untested.
    bn.sfnei r3, 0x0
    bn.cmovsi_2 r3, r3, 0x1
    bn.slli r4, r4, 0x2
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x3714
    bt.add r4, r7
    bn.sw 0x0(r4), r3
    bt.jr r9
