# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x24211b,0x24214a); Call nop-return low-byte(argument) times, preserving r10; not a calibrated delay.
# Fixed original addresses; not a hardware-validated implementation.
    bt.addi r1, -0x8
    bn.sw 0x4(r1), r9
    bn.sw 0x0(r1), r10
    bt.addi r3, -0x1
    bn.extbz r10, r3
    bg.sfeqi r10, 0xff
    bn.bf loc_242140
loc_24212f:
    bg.jal 0x242099
    bn.addi r7, r10, -0x1
    bn.extbz r10, r7
    bg.sfnei r10, 0xff
    bn.bf loc_24212f
loc_242140:
    bn.lwz r10, 0x0(r1)
    bn.lwz r9, 0x4(r1)
    bt.addi r1, 0x8
    bt.jr r9
