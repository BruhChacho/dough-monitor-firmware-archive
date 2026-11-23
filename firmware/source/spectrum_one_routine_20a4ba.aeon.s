# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x20a4ba,0x20a501); byte-exact only; hardware untested.
    bt.addi r1, -0x4
    bn.sw 0x0(r1), r9
    bg.jal 0x2acf9e
    bg.movhi r5, 0x53c8
    bg.ori r5, r5, 0xd4f1
    bg.movhi r6, 0x4009
    bg.ori r6, r6, 0x21fb
    bg.jal 0x2acae4
    bt.movi r5, 0x0
    bg.movhi r6, 0x4066
    bg.ori r6, r6, 0x8000
    bg.jal 0x2acd5b
    bg.jal 0x2ad577
    bt.movi r5, 0x0
    bg.movhi r6, 0x4090
    bg.jal 0x2acae4
    bg.jal 0x2ad216
    bn.exths r3, r3
    bn.lwz r9, 0x0(r1)
    bt.addi r1, 0x4
    bt.jr r9
