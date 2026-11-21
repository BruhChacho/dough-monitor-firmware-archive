# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x24f822,0x24f834); byte-exact only; hardware untested.
    bn.slli r3, r3, 0x1
    bg.movhi r7, 0x45
    bg.addi r7, r7, 0x765c
    bt.add r3, r7
    bn.sh_1 0x0(r3), r4
    bt.jr r9
