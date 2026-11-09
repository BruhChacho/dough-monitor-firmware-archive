# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x21fac9,0x21fb2b); byte-exact only; hardware untested.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bg.jal 0x2227da
    bg.jal 0x222819
    bg.jal 0x21d3b1
    bn.addi r11, r3, 0x76
    bg.ori r10, r0, 0x258
    bt.j loc_21faf2
loc_21fae9:
    bn.addi r7, r10, -0x1
    bn.exthz r10, r7
    bn.beqi r10, 0x0, loc_21fb1a
loc_21faf2:
    bt.mov r3, r11
    bg.jal 0x23e18c
    bn.beqi r3, 0x0, loc_21fae9
    bn.srli r7, r3, 0x1
    bn.movhi_2 r6, 0x727
    bg.ori r6, r6, 0xe00
    bt.add r7, r6
    bn.divu r7, r7, r3
    bn.exthz r3, r7
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
loc_21fb1a:
    bg.ori r3, r0, 0xffff
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
