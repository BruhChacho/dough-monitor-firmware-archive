# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x227145,0x2271a9); Allocate and mark channel metadata ownership, then call the channel helper.
# Fixed original addresses; not hardware-validated.
    bt.addi r1, -0xc
    bn.sw 0x8(r1), r9
    bn.sw 0x4(r1), r10
    bn.sw 0x0(r1), r11
    bt.mov r10, r3
    bt.mov r11, r4
    bg.jal 0x222b65
    bt.mov r4, r3
    bt.movi r3, 0x0
    bg.bgtui r4, 0xc, loc_22719c
    bn.ori r6, r0, 0xa8
    bn.muls r6, r10, r6
    bg.movhi r7, 0x48
    bg.addi r7, r7, 0x21ec
    bt.add r6, r7
    bt.movi r5, 0x1
    bn.sll r7, r5, r4
    bn.lh r23, 0x2c(r6)
    bn.or r7, r7, r23
    bn.sh_1 0x2c(r6), r7
    bn.ori r7, r0, 0x7c
    bn.muls r7, r4, r7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x564
    bt.add r7, r6
    bn.sbz 0x10(r7), r10
    bn.sw 0x8(r7), r5
    bt.mov r3, r11
    bg.jal 0x22701c
    bt.movi r3, 0x1
loc_22719c:
    bn.lwz r11, 0x0(r1)
    bn.lwz r10, 0x4(r1)
    bn.lwz r9, 0x8(r1)
    bt.addi r1, 0xc
    bt.jr r9
