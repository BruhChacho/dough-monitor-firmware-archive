# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x211018,0x21108e); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bg.jal 0x2100d2
    bt.mov r12, r3
    bn.ori r7, r0, 0x74
    bn.muls r7, r3, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x7e8
    bt.add r7, r6
    bn.lbz r7, 0x3c(r7)
    bn.bnei r7, 0x0, loc_211055
loc_211042:
    bt.movi r3, 0x0
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
loc_211055:
    bg.jal 0x211ca1
    bt.mov r11, r3
    bn.ori r10, r0, 0x1e
    bt.j loc_211069
loc_211060:
    bn.addi r7, r10, -0x1
    bn.extbz r10, r7
    bn.beqi r10, 0x0, loc_21107b
loc_211069:
    bt.movi r3, 0x1
    bg.jal 0x2420bb
    bt.mov r3, r12
    bg.jal 0x211ca1
    bg.beq r11, r3, loc_211060
    bt.j loc_211042
loc_21107b:
    bt.movi r3, 0x1
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
