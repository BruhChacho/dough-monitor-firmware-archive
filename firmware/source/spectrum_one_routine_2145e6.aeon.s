# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2145e6,0x2146a3); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x14
    bn.sw 0x10(r1), r9
    bn.sw 0xc(r1), r10
    bn.sw 0x8(r1), r11
    bn.sw 0x4(r1), r12
    bn.sw 0x0(r1), r13
    bt.mov r11, r4
    bt.mov r12, r5
    bg.ori r7, r0, 0x900
    bn.muls r10, r3, r7
    bt.movhi r7, -0xa
    bg.ori r7, r7, 0x4ed
    bn.add r13, r10, r7
    bt.mov r3, r13
    bn.ori r4, r0, 0x10
    bn.ori r5, r0, 0x10
    bg.jal 0x23dfe1
    bt.movhi r7, -0xa
    bg.ori r7, r7, 0x4ea
    bn.add r3, r10, r7
    bn.extbz r4, r11
    bg.jal 0x23ddb9
    bn.srli r4, r11, 0x8
    bt.movhi r7, -0xa
    bg.ori r7, r7, 0x4eb
    bn.add r3, r10, r7
    bn.extbz r4, r4
    bg.jal 0x23ddb9
    bn.srli r11, r11, 0x10
    bt.movhi r7, -0xa
    bg.ori r7, r7, 0x4ec
    bn.add r3, r10, r7
    bn.andi r4, r11, 0xf
    bg.jal 0x23ddb9
    bt.movhi r7, -0xa
    bg.ori r7, r7, 0x4ef
    bn.add r3, r10, r7
    bt.mov r4, r12
    bg.jal 0x23ddb9
    bt.mov r3, r13
    bn.ori r4, r0, 0x80
    bn.ori r5, r0, 0x80
    bg.jal 0x23dfe1
    bt.movi r10, 0x5
loc_21466b:
    bt.movi r3, 0x4
    bg.jal 0x24211b
    bt.mov r3, r13
    bg.jal 0x23dd44
    bn.andi r3, r3, 0x20
    bn.beqi r3, 0x0, loc_214686
    bn.addi r7, r10, -0x1
    bn.extbz r10, r7
    bn.bnei r10, 0x0, loc_21466b
loc_214686:
    bt.mov r3, r13
    bt.movi r4, 0x0
    bn.ori r5, r0, 0x10
    bn.lwz r13, 0x0(r1)
    bn.lwz r12, 0x4(r1)
    bn.lwz r11, 0x8(r1)
    bn.lwz r10, 0xc(r1)
    bn.lwz r9, 0x10(r1)
    bn.addi r1, r1, 0x14
    bg.j 0x23dfe1
