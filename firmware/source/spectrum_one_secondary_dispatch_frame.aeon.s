# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x205bd8,0x205c6e); Secondary dispatcher entry, default handler and shared epilogue; other switch bodies are separate fragments.
# Fixed addresses; CALL execution remains an explicit model hypothesis.
    bg.addi r1, r1, -0xa4
    bg.sw_0 0xa0(r1), r9
    bg.sw_0 0x9c(r1), r10
    bg.sw_0 0x98(r1), r11
    bg.sw_0 0x94(r1), r12
    bg.sw_0 0x90(r1), r13
    bg.sw_0 0x8c(r1), r14
    bg.sw_0 0x88(r1), r15
    bg.sw_0 0x84(r1), r16
    bg.sw_0 0x80(r1), r17
    bn.sw 0x7c(r1), r18
    bn.sw 0x78(r1), r19
    bt.mov r10, r3
    bt.mov r14, r4
    bn.slli r11, r3, 0x7
    bg.movhi r6, 0x48
    bg.addi r6, r6, -0x1480
    bn.add r7, r11, r6
    bn.lbz r7, 0x2(r7)
    bn.addi r7, r7, -0x32
    bn.extbz r7, r7
    bn.sfgtui r7, 0x6c
    bn.bf default
    bn.slli r7, r7, 0x2
    bg.movhi r6, 0x2b
    bg.addi r6, r6, -0x1488
    bt.add r7, r6
    bn.lwz r7, 0x0(r7)
    bt.jr r7
default:
    bn.sh_1 0x0(r14), r0
return_zero:
    bt.movi r3, 0x0
restore:
    bn.lwz r19, 0x78(r1)
    bn.lwz r18, 0x7c(r1)
    bg.lwz r17, 0x80(r1)
    bg.lwz r16, 0x84(r1)
    bg.lwz r15, 0x88(r1)
    bg.lwz r14, 0x8c(r1)
    bg.lwz r13, 0x90(r1)
    bg.lwz r12, 0x94(r1)
    bg.lwz r11, 0x98(r1)
    bg.lwz r10, 0x9c(r1)
    bg.lwz r9, 0xa0(r1)
    bg.addi r1, r1, 0xa4
    bt.jr r9
