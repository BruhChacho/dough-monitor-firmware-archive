# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x2040d2,0x204144); Copy three 320-byte source planes into RAM and store their XOR checksum.
# Fixed addresses; CALL execution remains an explicit model hypothesis.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.movhi r7, 0x34
    bg.addi r6, r7, 0x144
    bg.lwz r24, 0x144(r7)
    bt.movi r5, 0x0
    bg.movhi r3, 0x48
    bg.addi r4, r3, -0x1ea4
    bn.lwz r23, 0x4(r6)
    bn.lwz r6, 0x8(r6)
copy_byte:
    bn.add r7, r24, r5
    bn.lbz r7, 0x0(r7)
    bn.sbz 0x0(r4), r7
    bn.add r7, r23, r5
    bn.lbz r7, 0x0(r7)
    bg.sbz 0x140(r4), r7
    bn.add r7, r6, r5
    bn.lbz r7, 0x0(r7)
    bg.sbz 0x280(r4), r7
    bt.addi r5, 0x1
    bt.addi r4, 0x1
    bg.sfnei r5, 0x140
    bn.bf copy_byte
    bg.addi r3, r3, -0x1ea4
    bg.ori r4, r0, 0x3c0
    bg.jal 0x204080
    bn.exthz r3, r3
    bg.movhi r7, 0x48
    bg.addi r7, r7, -0x1eac
    bg.sbz 0x3c8(r7), r3
    bn.srli r3, r3, 0x8
    bg.sbz 0x3c9(r7), r3
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
