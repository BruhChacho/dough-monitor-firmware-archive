# Firmware-derived reconstruction; excluded from the repository MIT grant.
# Candidate [0x26bf26,0x26bf94); Parent dispatcher entry; selector from slot byte 1, command from byte 2. Selector cc/f0/f1 branches to router call fragment.
# Fragment only: other selector handlers are outside this source component.
    bn.addi r1, r1, -0x28
    bn.sw 0x24(r1), r9
    bn.sw 0x20(r1), r10
    bn.sw 0x1c(r1), r11
    bn.sw 0x18(r1), r12
    bn.sw 0x14(r1), r13
    bn.sw 0x10(r1), r14
    bn.sw 0xc(r1), r15
    bn.sw 0x8(r1), r16
    bn.sw 0x4(r1), r17
    bn.sw 0x0(r1), r18
    bt.mov r10, r3
    bn.slli r13, r3, 0x7
    bg.movhi r28, 0x48
    bg.addi r4, r28, -0x1480
    bn.add r5, r13, r4
    bn.lbz r7, 0x1(r5)
    bg.movhi r15, 0x45
    bg.sbz 0x3cd1(r15), r7
    bn.lbz r7, 0x2(r5)
    bg.movhi r14, 0x45
    bg.sbz 0x3cc8(r14), r7
    bg.lbz r4, 0x3cd1(r15)
    bg.sfeqi r4, 0xc0
    bn.bf 0x26c17c
    bg.sfnei r4, 0xd0
    bn.bnf 0x26c17c
    bg.sfeqi r4, 0xcc
    bn.bf 0x26c153
    bg.sfeqi r4, 0xf1
    bn.bf 0x26c153
    bg.sfnei r4, 0xf0
    bn.bnf 0x26c153
