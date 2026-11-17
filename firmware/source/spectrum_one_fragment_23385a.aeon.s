# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23385a,0x233879); byte-exact only; hardware untested.
    bn.ori r7, r0, 0x84
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, 0xe8
    bt.add r7, r6
    bn.lwz r7, 0x0(r7)
    bg.beqi r7, 0x4, loc_233875
    bt.movi r3, 0xa
    bt.jr r9
loc_233875:
    bg.j 0x211deb
