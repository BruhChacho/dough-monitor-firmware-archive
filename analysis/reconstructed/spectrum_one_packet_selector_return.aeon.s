# Firmware-derived reconstruction; excluded from the repository MIT grant.
# Candidate [0x26c153,0x26c17c); Parent dispatcher router call and common saved-register epilogue.
# Fragment only: other selector handlers are outside this source component.
    bt.mov r3, r10
    bg.jal 0x26f043
    bn.lwz r18, 0x0(r1)
    bn.lwz r17, 0x4(r1)
    bn.lwz r16, 0x8(r1)
    bn.lwz r15, 0xc(r1)
    bn.lwz r14, 0x10(r1)
    bn.lwz r13, 0x14(r1)
    bn.lwz r12, 0x18(r1)
    bn.lwz r11, 0x1c(r1)
    bn.lwz r10, 0x20(r1)
    bn.lwz r9, 0x24(r1)
    bn.addi r1, r1, 0x28
    bt.jr r9
