# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2229f8,0x222aa2); Assign the selected channel rectangle using the requested engine and record.
# Fixed original addresses; not hardware-validated.
    bn.ori r7, r0, 0xa8
    bn.muls r6, r4, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r6, r5
    bn.lh r5, 0x2a(r6)
    bn.bnei r5, 0x0, loc_222a89
    bt.movi r7, 0x1
    bn.sll r7, r7, r3
    bn.sh_2 0x2a(r6), r7
loc_222a16:
    bn.ori r7, r0, 0x7c
    bn.muls r6, r3, r7
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x564
    bt.add r6, r7
    bn.sbz 0x10(r6), r4
    bt.movi r7, 0x1
    bn.sw 0x8(r6), r7
    bn.ori r7, r0, 0xa8
    bn.muls r4, r4, r7
    bg.movhi r5, 0x48
    bg.addi r5, r5, 0x21ec
    bt.add r4, r5
    bn.lwz r7, 0x18(r4)
    bn.sw 0x4c(r6), r7
    bn.lwz r7, 0x1c(r4)
    bn.sw 0x50(r6), r7
    bn.lbz r7, 0x29(r4)
    bn.sbz 0xe(r6), r7
    bn.lh r5, 0x18(r4)
    bg.sfleui r5, 0x77f
    bn.bf loc_222a66
    bn.lh r5, 0x4c(r6)
    bg.addi r7, r5, -0x780
    bn.sh_1 0x4c(r6), r7
loc_222a64:
    bt.jr r9
loc_222a66:
    bn.lh r7, 0x1c(r4)
    bt.add r7, r5
    bg.sflesi r7, 0x780
    bn.bf loc_222a64
    bn.andi r7, r3, 0x2
    bn.beqi r7, 0x0, loc_222a96
    bn.sh_1 0x4c(r6), r0
    bn.lh r7, 0x50(r6)
    bt.add r5, r7
    bg.addi r7, r5, -0x780
    bn.sh_1 0x50(r6), r7
    bt.jr r9
loc_222a89:
    bt.movi r7, 0x1
    bn.sll r7, r7, r3
    bn.or r7, r5, r7
    bn.sh_2 0x2a(r6), r7
    bt.j loc_222a16
loc_222a96:
    bg.ori r7, r0, 0x780
    bn.sub r7, r7, r5
    bn.sh_1 0x50(r6), r7
    bt.jr r9
