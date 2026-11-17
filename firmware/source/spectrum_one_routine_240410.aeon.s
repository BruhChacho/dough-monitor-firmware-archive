# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x240410,0x240469); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.movi r10, 0x0
    bg.movhi r11, 0x45
loc_240421:
    bg.jal 0x24229a
    bg.lwz r6, 0x3cf0(r11)
    bg.lbz r7, 0x848(r6)
    bn.andi r7, r7, 0x20
    bn.beqi r7, 0x0, loc_24045a
    bn.addi r7, r10, 0x1
    bn.extbz r10, r7
    bg.bnei r10, 0x5, loc_240421
    bg.lbz r7, 0x848(r6)
    bn.extbz r7, r7
    bn.srli r7, r7, 0x5
    bn.nand r7, r7, r7
    bn.andi r3, r7, 0x1
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_24045a:
    bt.movi r3, 0x1
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
