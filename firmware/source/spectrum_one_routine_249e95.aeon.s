# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x249e95,0x249ec2); byte-exact only; hardware untested.
    bt.mov r7, r3
    bg.movhi r6, 0x45
    bg.lbz r5, 0x6268(r6)
    bg.ble r5, r3, loc_249ebd
    bg.addi r6, r6, 0x6268
    bn.lbz r3, 0x1(r6)
    bg.ble r3, r4, loc_249ebd
    bn.muls r7, r7, r3
    bn.lwz r6, 0x4(r6)
    bt.add r7, r6
    bt.add r7, r4
    bn.lbz r3, 0x0(r7)
    bt.jr r9
loc_249ebd:
    bn.ori r3, r0, 0xff
    bt.jr r9
