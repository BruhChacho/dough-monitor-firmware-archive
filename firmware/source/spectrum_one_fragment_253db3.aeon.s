# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x253db3,0x253de2); byte-exact only; hardware untested.
    bn.beqi r4, 0x0, loc_253dcd
    bn.slli r7, r3, 0x1
    bg.movhi r6, 0x49
    bg.addi r6, r6, -0x58ac
    bt.add r7, r6
    bt.movi r6, 0x3
    bn.sh_1 0x0(r7), r6
    bn.sh_1 0x8(r7), r6
    bt.jr r9
loc_253dcd:
    bn.slli r7, r3, 0x1
    bg.movhi r6, 0x49
    bg.addi r6, r6, -0x58ac
    bt.add r7, r6
    bn.sh_1 0x0(r7), r0
    bn.sh_1 0x8(r7), r0
    bt.jr r9
