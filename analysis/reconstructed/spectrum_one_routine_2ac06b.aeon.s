# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2ac06b,0x2ac0e3); byte-exact only; hardware untested.
    bn.lwz r7, 0x0(r3)
    bn.bleui r7, 0x1, loc_2ac085
    bn.lwz r6, 0x0(r4)
    bn.bleui r6, 0x1, loc_2ac085
    bg.bnei r7, 0x4, loc_2ac089
    bg.beqi r6, 0x4, loc_2ac0a4
loc_2ac07f:
    bn.lwz r7, 0x4(r3)
    bn.bnei r7, 0x0, loc_2ac0a0
loc_2ac085:
    bt.movi r3, 0x1
loc_2ac087:
    bt.jr r9
loc_2ac089:
    bg.beqi r6, 0x4, loc_2ac0d9
    bn.beqi r7, 0x2, loc_2ac0af
    bn.beqi r6, 0x2, loc_2ac07f
    bn.lwz r6, 0x4(r3)
    bn.lwz r7, 0x4(r4)
    bg.beq r6, r7, loc_2ac0b6
loc_2ac09d:
    bn.beqi r6, 0x0, loc_2ac085
loc_2ac0a0:
    bt.movi r3, -0x1
    bt.jr r9
loc_2ac0a4:
    bn.lwz r6, 0x4(r4)
    bn.lwz r7, 0x4(r3)
    bn.sub r3, r6, r7
    bt.jr r9
loc_2ac0af:
    bn.bnei r6, 0x2, loc_2ac0d9
loc_2ac0b2:
    bt.movi r3, 0x0
    bt.jr r9
loc_2ac0b6:
    bn.lwz r5, 0x8(r3)
    bn.lwz r7, 0x8(r4)
    bg.bgts r5, r7, loc_2ac09d
    bg.bgts r7, r5, loc_2ac0d2
    bn.lwz r3, 0xc(r3)
    bn.lwz r4, 0xc(r4)
    bg.bgt r3, r4, loc_2ac09d
    bg.ble r4, r3, loc_2ac0b2
loc_2ac0d2:
    bn.beqi r6, 0x0, loc_2ac0a0
    bt.movi r3, 0x1
    bt.j loc_2ac087
loc_2ac0d9:
    bn.lwz r7, 0x4(r4)
    bn.beqi r7, 0x0, loc_2ac0a0
    bt.movi r3, 0x1
    bt.j loc_2ac087
