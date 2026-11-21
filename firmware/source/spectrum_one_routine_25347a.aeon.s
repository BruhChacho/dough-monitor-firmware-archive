# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x25347a,0x2535c7); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bt.mov r10, r4
    bg.movhi r7, 0x45
    bg.lbz r7, 0x7492(r7)
    bn.beqi r7, 0x0, loc_2534ed
    bn.beqi r3, 0x0, loc_2534fe
    bn.bnei r3, 0x1, loc_2534ed
    bg.movhi r11, 0x45
    bg.lhz r7, 0x7644(r11)
    bn.andi r7, r7, 0x1
    bg.bnei r7, 0x0, loc_253582
loc_2534aa:
    bg.movhi r7, 0x45
    bg.addi r12, r7, 0x765c
    bn.lh r7, 0x2(r12)
    bg.addi r3, r7, 0x80
    bn.exthz r3, r3
    bn.ori r4, r0, 0xff
    bt.mov r5, r10
    bg.jal 0x24a822
    bg.lhz r7, 0x7644(r11)
    bn.andi r7, r7, 0x1
    bg.bnei r7, 0x0, loc_253574
loc_2534d0:
    bn.lh r12, 0x2(r12)
    bg.addi r3, r12, 0x80
    bn.exthz r3, r3
    bn.ori r4, r0, 0xff
    bt.mov r5, r10
    bg.jal 0x24b30f
    bg.lhz r7, 0x7644(r11)
    bn.andi r7, r7, 0x1
    bn.bnei r7, 0x0, loc_253559
loc_2534ed:
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
loc_2534fe:
    bn.ori r4, r0, 0x8e
    bg.jal 0x252efc
    bt.mov r4, r3
    bt.movi r3, 0x0
    bn.ori r5, r0, 0x8e
    bg.jal 0x252e20
    bg.movhi r11, 0x45
    bg.lhz r7, 0x7644(r11)
    bn.andi r7, r7, 0x1
    bg.movhi r12, 0x45
    bn.bnei r7, 0x0, loc_253590
loc_253522:
    bg.lhz r3, 0x765c(r12)
    bn.ori r4, r0, 0xff
    bt.mov r5, r10
    bg.jal 0x249116
    bg.lhz r7, 0x7644(r11)
    bn.andi r7, r7, 0x1
    bg.bnei r7, 0x0, loc_2535b9
loc_25353a:
    bg.movhi r7, 0x45
    bg.lhz r3, 0x765c(r7)
    bn.ori r4, r0, 0xff
    bt.mov r5, r10
    bg.jal 0x249c03
    bg.movhi r7, 0x45
    bg.lhz r7, 0x7644(r7)
    bn.andi r7, r7, 0x1
    bn.beqi r7, 0x0, loc_2534ed
loc_253559:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x377b
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bg.j 0x2a93a3
loc_253574:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3769
    bg.jal 0x2a93a3
    bt.j loc_2534d0
loc_253582:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3773
    bg.jal 0x2a93a3
    bt.j loc_2534aa
loc_253590:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x37a4
    bg.lhz r4, 0x765c(r12)
    bg.jal 0x2a9310
    bg.lhz r7, 0x7644(r11)
    bn.andi r7, r7, 0x1
    bg.beqi r7, 0x0, loc_253522
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3786
    bg.jal 0x2a93a3
    bt.j loc_253522
loc_2535b9:
    bg.movhi r3, 0x34
    bg.addi r3, r3, -0x3765
    bg.jal 0x2a93a3
    bt.j loc_25353a
