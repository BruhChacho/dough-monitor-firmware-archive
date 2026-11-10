# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2abf74,0x2ac06b); byte-exact only; hardware untested.
    bn.addi r1, r1, -0x34
    bn.sw 0x30(r1), r9
    bn.sw 0x2c(r1), r10
    bn.sw 0x28(r1), r11
    bn.sw 0x24(r1), r3
    bn.sw 0x20(r1), r4
    bn.addi r11, r1, 0x10
    bn.addi r3, r1, 0x24
    bt.mov r4, r11
    bg.jal 0x2abba0
    bn.addi r3, r1, 0x20
    bt.mov r4, r1
    bg.jal 0x2abba0
    bn.lwz r5, 0x10(r1)
    bt.mov r3, r11
    bn.bleui r5, 0x1, loc_2abfca
    bn.lwz r4, 0x0(r1)
    bt.mov r3, r1
    bn.bleui r4, 0x1, loc_2abfca
    bn.lwz r7, 0x14(r1)
    bn.lwz r6, 0x4(r1)
    bn.xor r7, r7, r6
    bn.sw 0x14(r1), r7
    bg.beqi r5, 0x4, loc_2abfdc
    bn.beqi r5, 0x2, loc_2abfdc
    bg.bnei r4, 0x4, loc_2abffc
    bn.sw 0x1c(r1), r0
    bn.sw 0x18(r1), r0
    bt.mov r3, r11
loc_2abfca:
    bg.jal 0x2aba8f
    bn.lwz r11, 0x28(r1)
    bn.lwz r10, 0x2c(r1)
    bn.lwz r9, 0x30(r1)
    bn.addi r1, r1, 0x34
    bt.jr r9
loc_2abfdc:
    bt.mov r3, r11
    bg.bne r4, r5, loc_2abfca
    bg.movhi r7, 0x34
    bg.addi r3, r7, -0x4a00
    bg.jal 0x2aba8f
    bn.lwz r11, 0x28(r1)
    bn.lwz r10, 0x2c(r1)
    bn.lwz r9, 0x30(r1)
    bn.addi r1, r1, 0x34
    bt.jr r9
loc_2abffc:
    bn.beqi r4, 0x2, loc_2ac04e
    bn.lwz r6, 0x18(r1)
    bn.lwz r7, 0x8(r1)
    bn.sub r6, r6, r7
    bn.sw 0x18(r1), r6
    bn.lwz r5, 0x1c(r1)
    bn.lwz r4, 0xc(r1)
    bg.ble r4, r5, loc_2ac01e
    bn.slli r5, r5, 0x1
    bn.addi r7, r6, -0x1
    bn.sw 0x18(r1), r7
loc_2ac01e:
    bg.movhi r6, 0x4000
    bt.movi r23, 0x0
    bt.movi r7, 0x0
loc_2ac026:
    bg.bgt r4, r5, loc_2ac030
    bn.or r23, r23, r6
    bn.sub r5, r5, r4
loc_2ac030:
    bn.srli r6, r6, 0x1
    bn.slli r5, r5, 0x1
    bt.addi r7, 0x1
    bn.sfnei r7, 0x1f
    bn.bf loc_2ac026
    bn.andi r7, r23, 0x7f
    bn.sfnei r7, 0x40
    bn.bnf loc_2ac057
loc_2ac047:
    bn.sw 0x1c(r1), r23
    bt.mov r3, r11
    bt.j loc_2abfca
loc_2ac04e:
    bt.movi r7, 0x4
    bn.sw 0x10(r1), r7
    bt.mov r3, r11
    bt.j loc_2abfca
loc_2ac057:
    bn.andi r7, r23, 0x80
    bn.bnei r7, 0x0, loc_2ac047
    bn.beqi r5, 0x0, loc_2ac047
    bn.addi r7, r23, 0x40
    bn.addi r6, r0, -0x80
    bn.and r23, r7, r6
    bt.j loc_2ac047
