# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20fe64,0x20fe85); Store two state values and OR flag0x4543dd with2; wide-store semantics conditional.
# Fixed original addresses; not a hardware-validated implementation.
    bg.movhi r7, 0x45
    bg.sh 0x43dc(r7), r3
    bg.movhi r7, 0x45
    bg.sw_1 0x43e0(r7), r4
    bg.movhi r6, 0x45
    bg.lbz r5, 0x43dd(r6)
    bn.ori r7, r5, 0x2
    bg.sbz 0x43dd(r6), r7
    bt.jr r9
