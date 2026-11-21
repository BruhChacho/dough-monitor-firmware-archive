# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27ea3a,0x27ea4c); byte-exact only; hardware untested.
    bn.slli r3, r3, 0x1
    bg.movhi r7, 0x3d
    bg.addi r7, r7, -0x39f8
    bt.add r3, r7
    bn.sh_1 0x0(r3), r4
    bt.jr r9
