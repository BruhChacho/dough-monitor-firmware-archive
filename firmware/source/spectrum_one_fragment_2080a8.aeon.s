# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2080a8,0x20814b); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x1c
    bn.sw 0x18(r1), r9
    bn.sw 0x14(r1), r10
    bn.sw 0x10(r1), r11
    bn.sw 0xc(r1), r12
    bn.sw 0x8(r1), r13
    bn.sw 0x4(r1), r14
    bn.sw 0x0(r1), r15
    bt.mov r14, r4
    bt.mov r13, r5
    bn.ori r7, r0, 0xa8
    bn.muls r3, r3, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r3, r5
    bn.lh r11, 0x2a(r3)
    bn.beqi r11, 0x0, loc_208131
    bt.movi r12, 0x0
    bn.ori r15, r0, 0x7c
    bt.j loc_208107
loc_2080e1:
    bg.movhi r7, 0x2580
    bn.ori r7, r7, 0x2
    bt.add r10, r7
loc_2080ea:
    bt.mov r3, r10
    bt.mov r4, r14
    bt.movi r5, 0x2
    bg.jal 0x23dead
    bt.mov r3, r10
    bt.mov r4, r13
    bn.ori r5, r0, 0x80
    bg.jal 0x23dead
loc_2080ff:
    bn.srli r11, r11, 0x1
    bt.addi r12, 0x1
    bn.beqi r11, 0x0, loc_208131
loc_208107:
    bn.extbz r6, r12
    bn.andi r7, r11, 0x1
    bn.beqi r7, 0x0, loc_2080ff
    bn.muls r7, r6, r15
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lwz r10, 0x4(r7)
    bn.andi r7, r6, 0x1
    bn.bnei r7, 0x0, loc_2080e1
    bg.movhi r5, 0x2580
    bn.ori r5, r5, 0x22
    bt.add r10, r5
    bt.j loc_2080ea
loc_208131:
    bn.lwz r15, 0x0(r1)
    bn.lwz r14, 0x4(r1)
    bn.lwz r13, 0x8(r1)
    bn.lwz r12, 0xc(r1)
    bn.lwz r11, 0x10(r1)
    bn.lwz r10, 0x14(r1)
    bn.lwz r9, 0x18(r1)
    bn.addi r1, r1, 0x1c
    bt.jr r9
