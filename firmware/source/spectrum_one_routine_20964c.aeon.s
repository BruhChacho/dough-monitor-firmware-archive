# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20964c,0x2096db); byte-exact only; hardware untested.
    bn.ori r7, r0, 0x58
    bn.muls r3, r3, r7
    bg.movhi r5, 0x45
    bg.addi r5, r5, 0x3fc4
    bt.add r3, r5
    bn.lbz r6, 0x53(r3)
    bn.beqi r6, 0x0, loc_20968b
    bn.lh r7, 0x0(r3)
    bn.lh r5, 0x4(r3)
    bn.muls r6, r7, r5
    bn.srli r6, r6, 0xa
    bn.sh_1 0x4c(r3), r6
    bn.lh r5, 0x6(r3)
    bn.muls r6, r7, r5
    bn.srli r6, r6, 0xa
    bn.sh_2 0x4e(r3), r6
    bn.lh r6, 0x8(r3)
    bn.muls r7, r7, r6
    bn.srli r7, r7, 0xa
    bn.sh_1 0x50(r3), r7
    bt.jr r9
loc_20968b:
    bn.lh r6, 0x0(r3)
    bn.lh r5, 0x4(r3)
    bn.muls r7, r6, r5
    bn.srli r7, r7, 0xa
    bn.sh_1 0x4c(r3), r7
    bn.lh r5, 0x6(r3)
    bn.muls r7, r6, r5
    bn.srli r7, r7, 0xa
    bn.sh_2 0x4e(r3), r7
    bn.lh r7, 0x8(r3)
    bn.muls r6, r6, r7
    bn.srli r6, r6, 0xa
    bn.sh_1 0x50(r3), r6
    bn.lh_0 r7, 0x4c(r3)
    bn.lh r6, 0x2(r3)
    bn.muls r7, r7, r6
    bn.srli r7, r7, 0xa
    bn.sh_1 0x4c(r3), r7
    bn.lh_0 r7, 0x4e(r3)
    bn.muls r7, r7, r6
    bn.srli r7, r7, 0xa
    bn.sh_2 0x4e(r3), r7
    bn.lh_0 r7, 0x50(r3)
    bn.muls r7, r7, r6
    bn.srli r7, r7, 0xa
    bn.sh_1 0x50(r3), r7
    bt.jr r9
