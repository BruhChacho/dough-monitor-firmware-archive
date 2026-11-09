# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2a9646,0x2a96b2); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x18
    bn.sw 0x14(r1), r9
    bn.sw 0x10(r1), r10
    bn.sw 0xc(r1), r11
    bn.sw 0x8(r1), r12
    bn.sw 0x4(r1), r13
    bn.sw 0x0(r1), r14
    bt.mov r12, r3
    bt.movi r11, 0x0
    bg.movhi r14, 0x34
    bg.movhi r13, 0x34
    bg.movhi r7, 0x48
    bg.addi r10, r7, -0x2618
loc_2a966f:
    bn.beqi r11, 0x2, loc_2a9698
    bn.lwz r7, 0x0(r10)
    bn.beqi r7, 0x0, loc_2a96ad
loc_2a9678:
    bt.addi r11, 0x1
    bt.addi r10, 0x4
    bn.bnei r11, 0x3, loc_2a966f
loc_2a967f:
    bt.mov r3, r11
    bn.lwz r14, 0x0(r1)
    bn.lwz r13, 0x4(r1)
    bn.lwz r12, 0x8(r1)
    bn.lwz r11, 0xc(r1)
    bn.lwz r10, 0x10(r1)
    bn.lwz r9, 0x14(r1)
    bn.addi r1, r1, 0x18
    bt.jr r9
loc_2a9698:
    bg.addi r3, r14, -0x755
    bn.ori r4, r0, 0x9a
    bg.addi r5, r13, -0x1e1f
    bg.jal 0x2a9469
    bn.lwz r7, 0x0(r10)
    bn.bnei r7, 0x0, loc_2a9678
loc_2a96ad:
    bn.sw 0x0(r10), r12
    bt.j loc_2a967f
