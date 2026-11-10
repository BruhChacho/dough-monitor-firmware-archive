# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2aae3d,0x2aaee6); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r10, r3
    bt.mov r11, r4
    bt.mov r7, r3
    bt.mov r8, r4
    bt.movi r5, 0x1
    bg.movhi r6, 0xffe0
    bn.sub r7, r7, r5
    bn.subb r8, r8, r6
    bn.movhi_2 r6, 0x3f
    bg.ori r6, r6, 0xffff
    bn.sfgtu r8, r6
    bn.bf loc_2aaeba
    bn.sfne r8, r6
    bn.bnf loc_2aaeb7
loc_2aae76:
    bt.mov r3, r11
    bg.jal 0x2acf9e
    bt.movi r5, 0x0
    bg.movhi r6, 0x41f0
    bg.jal 0x2acae4
    bt.mov r12, r3
    bt.mov r13, r4
    bt.mov r3, r10
    bg.jal 0x2acf9e
    bt.mov r5, r3
    bt.mov r6, r4
    bn.blesi r10, -0x1, loc_2aaed6
loc_2aae97:
    bt.mov r3, r12
    bt.mov r4, r13
    bg.jal 0x2aca43
    bg.jal 0x2ad165
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bt.jr r9
loc_2aaeb7:
    bn.bleui r7, 0x6, loc_2aae76
loc_2aaeba:
    bg.ori r6, r0, 0x7ff
    bn.and r7, r10, r6
    bt.movi r8, 0x0
    bn.or r7, r7, r8
    bn.beqi r7, 0x0, loc_2aae76
    bg.addi r5, r0, -0x800
    bn.and r7, r10, r5
    bg.ori r10, r7, 0x800
    bt.j loc_2aae76
loc_2aaed6:
    bt.movi r5, 0x0
    bg.movhi r6, 0x41f0
    bg.jal 0x2aca43
    bt.mov r5, r3
    bt.mov r6, r4
    bt.j loc_2aae97
