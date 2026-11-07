# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21ddcf,0x21de65); Route a channel key from metadata to the selector; tail target is 0x23ddb9.
# Fixed original addresses; not hardware-validated.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r10, r4
    bn.ori r7, r0, 0xb0
    bn.muls r3, r3, r7
    bg.movhi r7, 0x3b
    bg.addi r7, r7, 0x4950
    bt.add r3, r7
    bn.lwz r3, 0x0(r3)
    bn.extbz r11, r3
    bg.bgtui r3, 0x7, loc_21de00
    bn.addi r7, r3, 0x3
    bn.extbz r11, r7
    bg.bgtui r3, 0x4, loc_21de3e
loc_21de00:
    bt.mov r3, r11
    bt.mov r4, r10
    bg.jal 0x21bfca
    bn.beqi r10, 0x1, loc_21de27
    bt.movhi r3, -0x10
    bg.ori r3, r3, 0x2e03
    bn.bleui r10, 0x0, loc_21de2d
    bn.beqi r10, 0x2, loc_21de4e
    bn.beqi r10, 0x3, loc_21de46
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_21de27:
    bt.movhi r3, -0x10
    bg.ori r3, r3, 0x2e02
loc_21de2d:
    bt.mov r4, r11
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x23ddb9
loc_21de3e:
    bn.addi r7, r3, -0x5
    bn.extbz r11, r7
    bt.j loc_21de00
loc_21de46:
    bt.movhi r3, -0x10
    bg.ori r3, r3, 0x2e04
    bt.j loc_21de2d
loc_21de4e:
    bt.movhi r3, -0x10
    bg.ori r3, r3, 0x2e05
    bt.mov r4, r11
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x23ddb9
