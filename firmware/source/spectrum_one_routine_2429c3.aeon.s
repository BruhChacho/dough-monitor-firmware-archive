# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2429c3,0x242a8d); byte-exact only; hardware untested.
    bg.addi r1, r1, -0xdc
    bg.sw_0 0xd8(r1), r9
    bg.sw_0 0xd4(r1), r10
    bg.sw_0 0xd0(r1), r11
    bg.sw_0 0xcc(r1), r12
    bg.sw_0 0xc8(r1), r13
    bt.mov r10, r3
    bt.mov r11, r4
    bg.movhi r7, 0x45
    bg.lwz r7, 0x5230(r7)
    bn.beqi r7, 0x1, loc_242a08
loc_2429ea:
    bt.movi r10, 0x0
loc_2429ec:
    bt.mov r3, r10
    bg.lwz r13, 0xc8(r1)
    bg.lwz r12, 0xcc(r1)
    bg.lwz r11, 0xd0(r1)
    bg.lwz r10, 0xd4(r1)
    bg.lwz r9, 0xd8(r1)
    bg.addi r1, r1, 0xdc
    bt.jr r9
loc_242a08:
    bt.mov r3, r1
    bt.movi r4, 0x1
    bg.jal 0x242968
    bn.lwz r7, 0x0(r1)
    bn.bnei r7, 0x1, loc_2429ea
    bg.jal 0x2429b9
    bt.mov r12, r3
    bn.addi r3, r1, 0x28
    bt.mov r4, r12
    bg.jal 0x242968
    bn.lwz r13, 0x38(r1)
    bn.sfeqi r10, 0x10
    bn.bf loc_242a7a
    bn.sfgtui r10, 0x10
    bn.bf loc_242a6d
    bn.addi r7, r10, -0x2
    bn.bgtui r7, 0x1, loc_2429ea
    bn.addi r3, r1, 0x50
    bt.mov r4, r12
    bg.jal 0x242968
    bn.lwz r6, 0x58(r1)
    bn.divu r7, r11, r6
    bn.muls r7, r7, r6
    bn.sub r10, r11, r7
    bn.addi r3, r1, 0x78
    bt.mov r4, r12
    bg.jal 0x242968
    bg.lbz r7, 0x94(r1)
    bn.bleui r7, 0x1, loc_2429ec
    bn.divu r7, r11, r13
    bn.andi r7, r7, 0x1
    bn.slli r7, r7, 0xc
    bn.or r10, r10, r7
    bt.j loc_2429ec
loc_242a6d:
    bn.sfeqi r10, 0x13
    bn.bf loc_242a7a
    bg.sfeqi r10, 0xd8
    bn.bnf loc_2429ea
loc_242a7a:
    bg.addi r3, r1, 0xa0
    bt.mov r4, r12
    bg.jal 0x242968
    bg.lwz r7, 0xa8(r1)
    bn.divu r10, r11, r7
    bt.j loc_2429ec
