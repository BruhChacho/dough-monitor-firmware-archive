# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20ffc6,0x21004f); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bn.bnei r4, 0x0, loc_210000
    bg.movhi r4, 0x45
    bg.lbz r6, 0x43dd(r4)
    bn.andi r7, r6, 0x10
    bn.bnei r7, 0x0, loc_20fff3
    bg.movhi r5, 0x45
    bg.lbz r7, 0x4464(r5)
    bn.beqi r7, 0x0, loc_210028
    bt.addi r7, -0x1
    bg.sbz 0x4464(r5), r7
loc_20fff3:
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_210000:
    bg.movhi r7, 0x45
    bg.sbz 0x4464(r7), r4
    bg.movhi r6, 0x45
    bg.lbz r5, 0x43dd(r6)
    bn.andi r7, r5, 0xef
    bg.sbz 0x43dd(r6), r7
    bt.movi r4, 0x0
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bg.j 0x2119df
loc_210028:
    bn.ori r7, r6, 0x10
    bg.sbz 0x43dd(r4), r7
    bt.movi r11, 0x0
    bt.j loc_210039
loc_210033:
    bt.addi r11, 0x1
    bg.beqi r11, 0x7, loc_20fff3
loc_210039:
    bn.extbz r10, r11
    bt.mov r3, r10
    bg.jal 0x20fe13
    bn.beqi r3, 0x0, loc_210033
    bt.mov r3, r10
    bt.movi r4, 0x1
    bg.jal 0x2119df
    bt.j loc_210033
