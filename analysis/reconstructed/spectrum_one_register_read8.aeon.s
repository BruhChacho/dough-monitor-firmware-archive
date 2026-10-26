# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23dd44,0x23ddb9); Logical register byte read; optional page-selection write.
# Fixed original addresses; not a hardware-validated implementation.
    bn.movhi_2 r6, 0x7f
    bg.ori r6, r6, 0xff00
    bn.and r5, r3, r6
    bt.movi r6, 0x0
    bn.beqi r5, 0x0, loc_23dd7f
    bn.movhi_2 r6, 0x80
    bn.and r7, r3, r6
    bn.bnei r7, 0x0, loc_23dd83
    bn.movhi_2 r6, 0x7f
    bg.ori r6, r6, 0xffff
    bn.and r7, r3, r6
    bn.slli r7, r7, 0x1
    bn.andi r6, r3, 0x1
    bn.sub r7, r7, r6
    bg.movhi r6, 0x45
    bg.lwz r6, 0x3cf0(r6)
    bt.add r7, r6
    bn.lbz r7, 0x0(r7)
    bn.extbz r6, r7
loc_23dd7f:
    bt.mov r3, r6
    bt.jr r9
loc_23dd83:
    bn.slli r6, r5, 0x1
    bg.movhi r5, 0x45
    bg.lwz r7, 0x3cf0(r5)
    bt.add r6, r7
    bn.srli r7, r3, 0x18
    bn.sbz 0x0(r6), r7
    bn.movhi_2 r6, 0x7f
    bg.ori r6, r6, 0xffff
    bn.and r7, r3, r6
    bn.slli r7, r7, 0x1
    bn.andi r6, r3, 0x1
    bn.sub r7, r7, r6
    bg.lwz r6, 0x3cf0(r5)
    bt.add r7, r6
    bn.lbz r7, 0x0(r7)
    bn.extbz r6, r7
    bt.mov r3, r6
    bt.jr r9
