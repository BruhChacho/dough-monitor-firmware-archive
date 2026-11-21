# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2acec8,0x2acf5b); byte-exact only; hardware untested.
    bn.lwz r7, 0x0(r3)
    bn.bleui r7, 0x1, loc_2acee2
    bn.lwz r6, 0x0(r4)
    bn.bleui r6, 0x1, loc_2acee2
    bg.bnei r7, 0x4, loc_2acee6
    bg.beqi r6, 0x4, loc_2acf01
loc_2acedc:
    bn.lwz r7, 0x4(r3)
    bn.bnei r7, 0x0, loc_2acefd
loc_2acee2:
    bt.movi r3, 0x1
loc_2acee4:
    bt.jr r9
loc_2acee6:
    bg.beqi r6, 0x4, loc_2acf48
    bn.beqi r7, 0x2, loc_2acf0c
    bn.beqi r6, 0x2, loc_2acedc
    bn.lwz r6, 0x4(r3)
    bn.lwz r7, 0x4(r4)
    bg.beq r6, r7, loc_2acf13
loc_2acefa:
    bn.beqi r6, 0x0, loc_2acee2
loc_2acefd:
    bt.movi r3, -0x1
    bt.jr r9
loc_2acf01:
    bn.lwz r6, 0x4(r4)
    bn.lwz r7, 0x4(r3)
    bn.sub r3, r6, r7
    bt.jr r9
loc_2acf0c:
    bn.bnei r6, 0x2, loc_2acf48
loc_2acf0f:
    bt.movi r3, 0x0
    bt.jr r9
loc_2acf13:
    bn.lwz r5, 0x8(r3)
    bn.lwz r7, 0x8(r4)
    bg.bgts r5, r7, loc_2acefa
    bg.bgts r7, r5, loc_2acf41
    bn.lwz r7, 0x10(r3)
    bn.lwz r8, 0x14(r3)
    bn.lwz r5, 0x14(r4)
    bn.lwz r4, 0x10(r4)
    bg.bgt r8, r5, loc_2acefa
    bg.beq r8, r5, loc_2acf52
loc_2acf35:
    bg.bgt r5, r8, loc_2acf41
    bg.bne r5, r8, loc_2acf0f
    bg.ble r4, r7, loc_2acf0f
loc_2acf41:
    bn.beqi r6, 0x0, loc_2acefd
    bt.movi r3, 0x1
    bt.j loc_2acee4
loc_2acf48:
    bn.lwz r7, 0x4(r4)
    bn.beqi r7, 0x0, loc_2acefd
    bt.movi r3, 0x1
    bt.j loc_2acee4
loc_2acf52:
    bg.ble r7, r4, loc_2acf35
    bn.beqi r6, 0x0, loc_2acee2
    bt.j loc_2acefd
