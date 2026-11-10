# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2146c9,0x2149cc); byte-exact only; hardware untested.
    bt.addi r1, -0x10
    bn.sw 0xc(r1), r9
    bn.sw 0x8(r1), r10
    bn.sw 0x4(r1), r11
    bn.sw 0x0(r1), r12
    bn.exthz r10, r4
    bn.srli r11, r4, 0x10
    bn.beqi r3, 0x1, loc_21472c
    bn.bleui r3, 0x0, loc_2146fc
    bg.beqi r3, 0x2, loc_214811
    bg.beqi r3, 0x3, loc_2147f4
loc_2146eb:
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bt.jr r9
loc_2146fc:
    bn.bnei r10, 0x0, loc_21475c
loc_2146ff:
    bn.beqi r11, 0x0, loc_2146eb
loc_214702:
    bt.movhi r10, -0x9
    bg.ori r3, r10, 0x21e
    bn.extbz r4, r11
    bt.movi r5, 0x3
    bg.jal 0x23dfe1
    bg.ori r3, r10, 0x21e
loc_214715:
    bt.movi r4, 0x0
    bt.movi r5, 0x3
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bg.j 0x23dfe1
loc_21472c:
    bn.bnei r10, 0x0, loc_2147a8
loc_21472f:
    bn.beqi r11, 0x0, loc_2146eb
loc_214732:
    bt.movhi r10, -0x9
    bg.ori r3, r10, 0x41e
    bn.extbz r4, r11
    bt.movi r5, 0x3
    bg.jal 0x23dfe1
    bg.ori r3, r10, 0x41e
    bt.movi r4, 0x0
    bt.movi r5, 0x3
    bn.lwz r12, 0x0(r1)
    bn.lwz r11, 0x4(r1)
    bn.lwz r10, 0x8(r1)
    bn.lwz r9, 0xc(r1)
    bn.addi r1, r1, 0x10
    bg.j 0x23dfe1
loc_21475c:
    bt.movhi r12, -0x9
    bg.ori r3, r12, 0x21c
    bt.mov r4, r10
    bg.jal 0x23dfb6
    bg.ori r3, r12, 0x21c
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bn.andi r7, r10, 0x4
    bg.bnei r7, 0x0, loc_2148f0
loc_214779:
    bn.andi r7, r10, 0x10
    bg.bnei r7, 0x0, loc_2148da
loc_214780:
    bn.andi r7, r10, 0x20
    bg.bnei r7, 0x0, loc_2148c4
loc_214787:
    bn.andi r7, r10, 0x40
    bg.beqi r7, 0x0, loc_2146ff
    bg.ori r3, r12, 0x107c
    bt.movi r4, 0x8
    bg.jal 0x23dfb6
    bg.ori r3, r12, 0x107c
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bg.beqi r11, 0x0, loc_2146eb
    bt.j loc_214702
loc_2147a8:
    bt.movhi r12, -0x9
    bg.ori r3, r12, 0x41c
    bt.mov r4, r10
    bg.jal 0x23dfb6
    bg.ori r3, r12, 0x41c
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bn.andi r7, r10, 0x4
    bg.bnei r7, 0x0, loc_21491c
loc_2147c5:
    bn.andi r7, r10, 0x10
    bg.bnei r7, 0x0, loc_214906
loc_2147cc:
    bn.andi r7, r10, 0x20
    bg.bnei r7, 0x0, loc_214932
loc_2147d3:
    bn.andi r7, r10, 0x40
    bg.beqi r7, 0x0, loc_21472f
    bg.ori r3, r12, 0x137c
    bt.movi r4, 0x8
    bg.jal 0x23dfb6
    bg.ori r3, r12, 0x137c
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bg.beqi r11, 0x0, loc_2146eb
    bt.j loc_214732
loc_2147f4:
    bg.bnei r10, 0x0, loc_214878
loc_2147f8:
    bg.beqi r11, 0x0, loc_2146eb
loc_2147fc:
    bt.movhi r10, -0x9
    bg.ori r3, r10, 0x81e
    bn.extbz r4, r11
    bt.movi r5, 0x3
    bg.jal 0x23dfe1
    bg.ori r3, r10, 0x81e
    bt.j loc_214715
loc_214811:
    bn.bnei r10, 0x0, loc_21482d
loc_214814:
    bg.beqi r11, 0x0, loc_2146eb
loc_214818:
    bt.movhi r10, -0x9
    bg.ori r3, r10, 0x61e
    bn.extbz r4, r11
    bt.movi r5, 0x3
    bg.jal 0x23dfe1
    bg.ori r3, r10, 0x61e
    bt.j loc_214715
loc_21482d:
    bt.movhi r12, -0x9
    bg.ori r3, r12, 0x61c
    bt.mov r4, r10
    bg.jal 0x23dfb6
    bg.ori r3, r12, 0x61c
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bn.andi r7, r10, 0x4
    bg.bnei r7, 0x0, loc_214974
loc_21484a:
    bn.andi r7, r10, 0x10
    bg.bnei r7, 0x0, loc_21495e
loc_214851:
    bn.andi r7, r10, 0x20
    bg.bnei r7, 0x0, loc_214948
loc_214858:
    bn.andi r7, r10, 0x40
    bn.beqi r7, 0x0, loc_214814
    bg.ori r3, r12, 0x187c
    bt.movi r4, 0x8
    bg.jal 0x23dfb6
    bg.ori r3, r12, 0x187c
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bg.beqi r11, 0x0, loc_2146eb
    bt.j loc_214818
loc_214878:
    bt.movhi r12, -0x9
    bg.ori r3, r12, 0x81c
    bt.mov r4, r10
    bg.jal 0x23dfb6
    bg.ori r3, r12, 0x81c
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bn.andi r7, r10, 0x4
    bg.bnei r7, 0x0, loc_2149b6
loc_214895:
    bn.andi r7, r10, 0x10
    bg.bnei r7, 0x0, loc_2149a0
loc_21489c:
    bn.andi r7, r10, 0x20
    bg.bnei r7, 0x0, loc_21498a
loc_2148a3:
    bn.andi r7, r10, 0x40
    bg.beqi r7, 0x0, loc_2147f8
    bg.ori r3, r12, 0x1b7c
    bt.movi r4, 0x8
    bg.jal 0x23dfb6
    bg.ori r3, r12, 0x1b7c
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bg.beqi r11, 0x0, loc_2146eb
    bt.j loc_2147fc
loc_2148c4:
    bg.ori r3, r12, 0x3968
    bt.movi r4, 0x8
    bg.jal 0x23dfb6
    bg.ori r3, r12, 0x3968
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bt.j loc_214787
loc_2148da:
    bg.ori r3, r12, 0x107c
    bt.movi r4, 0x4
    bg.jal 0x23dfb6
    bg.ori r3, r12, 0x107c
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bt.j loc_214780
loc_2148f0:
    bg.ori r3, r12, 0x107c
    bt.movi r4, 0x1
    bg.jal 0x23dfb6
    bg.ori r3, r12, 0x107c
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bt.j loc_214779
loc_214906:
    bg.ori r3, r12, 0x137c
    bt.movi r4, 0x4
    bg.jal 0x23dfb6
    bg.ori r3, r12, 0x137c
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bt.j loc_2147cc
loc_21491c:
    bg.ori r3, r12, 0x137c
    bt.movi r4, 0x1
    bg.jal 0x23dfb6
    bg.ori r3, r12, 0x137c
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bt.j loc_2147c5
loc_214932:
    bg.ori r3, r12, 0x3968
    bt.movi r4, 0x8
    bg.jal 0x23dfb6
    bg.ori r3, r12, 0x3968
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bt.j loc_2147d3
loc_214948:
    bg.ori r3, r12, 0x3968
    bt.movi r4, 0x8
    bg.jal 0x23dfb6
    bg.ori r3, r12, 0x3968
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bt.j loc_214858
loc_21495e:
    bg.ori r3, r12, 0x187c
    bt.movi r4, 0x4
    bg.jal 0x23dfb6
    bg.ori r3, r12, 0x187c
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bt.j loc_214851
loc_214974:
    bg.ori r3, r12, 0x187c
    bt.movi r4, 0x1
    bg.jal 0x23dfb6
    bg.ori r3, r12, 0x187c
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bt.j loc_21484a
loc_21498a:
    bg.ori r3, r12, 0x3968
    bt.movi r4, 0x8
    bg.jal 0x23dfb6
    bg.ori r3, r12, 0x3968
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bt.j loc_2148a3
loc_2149a0:
    bg.ori r3, r12, 0x1b7c
    bt.movi r4, 0x4
    bg.jal 0x23dfb6
    bg.ori r3, r12, 0x1b7c
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bt.j loc_21489c
loc_2149b6:
    bg.ori r3, r12, 0x1b7c
    bt.movi r4, 0x1
    bg.jal 0x23dfb6
    bg.ori r3, r12, 0x1b7c
    bt.movi r4, 0x0
    bg.jal 0x23dfb6
    bt.j loc_214895
