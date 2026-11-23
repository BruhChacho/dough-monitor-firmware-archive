# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x209ccb,0x209d5b); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r10, r3
    bt.mov r13, r4
    bt.movi r3, 0x0
    bg.jal 0x222b8a
    bt.mov r3, r10
    bg.jal 0x23e79e
    bt.mov r10, r3
    bn.beqi r3, 0x0, loc_209d47
    bt.movi r12, 0x0
    bt.j loc_209d01
loc_209cf6:
    bn.srli r7, r10, 0x1
    bn.exthz r10, r7
    bt.addi r12, 0x1
    bn.beqi r10, 0x0, loc_209d47
loc_209d01:
    bn.extbz r11, r12
    bn.andi r7, r10, 0x1
    bn.beqi r7, 0x0, loc_209cf6
    bt.mov r3, r11
    bg.jal 0x222b8a
    bn.sfeqi r13, 0x0
    bn.ori r4, r0, 0x20
    bn.cmov_0 r4, r0, r4
    bn.andi r7, r11, 0x1
    bg.movhi r5, 0x2580
    bn.ori r5, r5, 0x22
    bn.add r6, r3, r5
    bn.sfeqi r7, 0x0
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x2
    bt.add r3, r7
    bn.cmov_0 r3, r6, r3
    bn.ori r5, r0, 0x20
    bg.jal 0x23dfe1
    bn.srli r7, r10, 0x1
    bn.exthz r10, r7
    bt.addi r12, 0x1
    bn.bnei r10, 0x0, loc_209d01
loc_209d47:
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
