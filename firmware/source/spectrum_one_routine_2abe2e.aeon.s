# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2abe2e,0x2abf74); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x44
    bn.sw 0x40(r1), r9
    bn.sw 0x3c(r1), r10
    bn.sw 0x38(r1), r11
    bn.sw 0x34(r1), r3
    bn.sw 0x30(r1), r4
    bn.addi r10, r1, 0x20
    bn.addi r3, r1, 0x34
    bt.mov r4, r10
    bg.jal 0x2abba0
    bn.addi r11, r1, 0x10
    bn.addi r3, r1, 0x30
    bt.mov r4, r11
    bg.jal 0x2abba0
    bn.lwz r7, 0x20(r1)
    bn.bleui r7, 0x1, loc_2abe95
    bn.lwz r6, 0x10(r1)
    bn.bleui r6, 0x1, loc_2abe6f
    bg.beqi r7, 0x4, loc_2abe92
    bg.bnei r6, 0x4, loc_2abec2
    bn.beqi r7, 0x2, loc_2abeb8
loc_2abe6f:
    bn.lwz r7, 0x24(r1)
    bn.lwz r6, 0x14(r1)
    bn.sfeq r7, r6
    bn.cmovsi_2 r7, r0, 0x1
    bn.sw 0x14(r1), r7
    bt.mov r3, r11
    bg.jal 0x2aba8f
    bn.lwz r11, 0x38(r1)
    bn.lwz r10, 0x3c(r1)
    bn.lwz r9, 0x40(r1)
    bn.addi r1, r1, 0x44
    bt.jr r9
loc_2abe92:
    bn.beqi r6, 0x2, loc_2abeb8
loc_2abe95:
    bn.lwz r7, 0x24(r1)
    bn.lwz r6, 0x14(r1)
    bn.sfeq r7, r6
    bn.cmovsi_2 r7, r0, 0x1
    bn.sw 0x24(r1), r7
    bt.mov r3, r10
loc_2abea6:
    bg.jal 0x2aba8f
    bn.lwz r11, 0x38(r1)
    bn.lwz r10, 0x3c(r1)
    bn.lwz r9, 0x40(r1)
    bn.addi r1, r1, 0x44
    bt.jr r9
loc_2abeb8:
    bg.movhi r7, 0x34
    bg.addi r3, r7, -0x4a00
    bt.j loc_2abea6
loc_2abec2:
    bn.beqi r7, 0x2, loc_2abe95
    bn.beqi r6, 0x2, loc_2abe6f
    bn.lwz r3, 0x2c(r1)
    bt.movi r4, 0x0
    bn.lwz r5, 0x1c(r1)
    bt.movi r6, 0x0
    bg.jal 0x2aacb9
    bt.mov r5, r4
    bn.lwz r6, 0x28(r1)
    bt.addi r6, 0x2
    bn.lwz r7, 0x18(r1)
    bt.add r7, r6
    bn.sw 0x8(r1), r7
    bn.sw 0x4(r1), r0
    bn.lwz r6, 0x24(r1)
    bn.lwz r7, 0x14(r1)
    bg.beq r6, r7, loc_2abef7
    bt.movi r7, 0x1
    bn.sw 0x4(r1), r7
loc_2abef7:
    bn.bgtsi r5, -0x1, loc_2abf18
    bn.lwz r6, 0x8(r1)
loc_2abefd:
    bn.andi r7, r5, 0x1
    bn.beqi r7, 0x0, loc_2abf0d
    bn.srli r7, r3, 0x1
    bg.movhi r4, 0x8000
    bn.or r3, r7, r4
loc_2abf0d:
    bn.srli r5, r5, 0x1
    bt.addi r6, 0x1
    bn.blesi r5, -0x1, loc_2abefd
    bn.sw 0x8(r1), r6
loc_2abf18:
    bg.movhi r6, 0x3fff
    bg.ori r6, r6, 0xffff
    bn.sfgtu r5, r6
    bn.bf loc_2abf4b
    bn.lwz r6, 0x8(r1)
loc_2abf29:
    bn.slli r5, r5, 0x1
    bn.ori r7, r5, 0x1
    bn.sflesi r3, -0x1
    bn.cmov_0 r5, r7, r5
    bn.slli r3, r3, 0x1
    bt.addi r6, -0x1
    bg.movhi r7, 0x3fff
    bg.ori r7, r7, 0xffff
    bn.sfleu r5, r7
    bn.bf loc_2abf29
    bn.sw 0x8(r1), r6
loc_2abf4b:
    bn.andi r7, r5, 0x7f
    bn.sfnei r7, 0x40
    bn.bnf loc_2abf60
loc_2abf54:
    bn.sw 0xc(r1), r5
    bt.movi r7, 0x3
    bn.sw 0x0(r1), r7
    bt.mov r3, r1
    bt.j loc_2abea6
loc_2abf60:
    bn.andi r7, r5, 0x80
    bn.bnei r7, 0x0, loc_2abf54
    bn.beqi r3, 0x0, loc_2abf54
    bn.addi r7, r5, 0x40
    bn.addi r4, r0, -0x80
    bn.and r5, r7, r4
    bt.j loc_2abf54
