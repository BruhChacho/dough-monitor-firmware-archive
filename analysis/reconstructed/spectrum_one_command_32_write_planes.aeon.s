# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x205c6e,0x205cdf); Command 0x32 body: write supplied bytes through plane bounds helper; return XOR of all supplied bytes in response halfword.
# Fixed addresses; CALL execution remains an explicit model hypothesis.
# Entered only through 0x205bd8: r11=slot<<7, r14=response, saved frame active.
# Byte 4: plane & 3; byte 5: count; bytes 6/7: big-endian offset.
# No count <= 120 guard is present in this fragment. Upstream constraints unknown.
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x1480
    bn.add r4, r11, r6
    bn.lbz r7, 0x3(r4)
    bn.lbz r7, 0x4(r4)
    bn.extbz r3, r7
    bn.lbz r7, 0x5(r4)
    bn.extbz r23, r7
    bn.lbz r7, 0x6(r4)
    bn.extbz r5, r7
    bn.lbz r7, 0x7(r4)
    bn.extbz r6, r7
    bt.movi r7, 0x0
    bn.beqi r23, 0x0, response
    bn.andi r16, r3, 0x3
    bn.slli r7, r5, 0x8
    bt.add r7, r6
    bn.exthz r15, r7
    bt.movi r12, 0x0
    bt.movi r10, 0x0
    bn.addi r7, r23, -0x1
    bt.mov r11, r4
    bn.exthz r7, r7
    bn.addi r13, r7, 0x1
write_loop:
    bn.exthz r4, r10
    bn.addi r6, r4, 0x8
    bt.add r6, r11
    bn.lbz r7, 0x0(r6)
    bn.extbz r7, r7
    bn.xor r12, r7, r12
    bn.lbz r5, 0x0(r6)
    bt.mov r3, r16
    bt.add r4, r15
    bn.extbz r5, r5
    bg.jal 0x204144
    bt.addi r10, 0x1
    bg.bne r13, r10, write_loop
    bt.mov r7, r12
response:
    bn.sh_1 0x0(r14), r7
    bt.j 0x205c3c
