# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x23ddb9,0x23dead); Logical register byte write; optional page selection and multi-target mask path.
# Fixed original addresses; not a hardware-validated implementation.
    bn.movhi_2 r5, 0x7f
    bg.ori r5, r5, 0xff00
    bn.and r6, r3, r5
    bn.beqi r6, 0x0, loc_23ddfb
    bg.movhi r7, 0x45
    bg.lhz r23, 0x5214(r7)
    bn.bnei r23, 0x0, loc_23ddfd
    bn.movhi_2 r5, 0x80
    bn.and r7, r3, r5
    bg.bnei r7, 0x0, loc_23de7c
loc_23dddb:
    bn.movhi_2 r5, 0x7f
    bg.ori r5, r5, 0xffff
    bn.and r7, r3, r5
    bn.slli r7, r7, 0x1
    bn.andi r6, r3, 0x1
    bn.sub r7, r7, r6
    bg.movhi r6, 0x45
    bg.lwz r6, 0x3cf0(r6)
    bt.add r7, r6
    bn.sbz 0x0(r7), r4
loc_23ddfb:
    bt.jr r9
loc_23ddfd:
    bn.movhi_2 r6, 0x80
    bn.and r7, r3, r6
    bn.beqi r7, 0x0, loc_23dddb
    bg.movhi r7, 0xff80
    bn.ori r7, r7, 0xff
    bn.and r3, r3, r7
    bt.movi r24, 0x0
    bn.ori r27, r0, 0x7c
    bg.movhi r26, 0x45
    bn.srli r25, r3, 0x18
    bt.j loc_23de24
loc_23de1e:
    bn.addi r7, r24, 0x2
    bn.extbz r24, r7
loc_23de24:
    bn.andi r7, r23, 0x3
    bn.beqi r7, 0x0, loc_23de74
    bn.muls r7, r24, r27
    bg.movhi r5, 0x48
    bg.addi r5, r5, -0x564
    bt.add r7, r5
    bn.lwz r6, 0x4(r7)
    bn.movhi_2 r5, 0x7f
    bg.ori r5, r5, 0xffff
    bn.and r7, r6, r5
    bn.slli r7, r7, 0x1
    bn.andi r5, r6, 0x1
    bn.sub r7, r7, r5
    bg.lwz r5, 0x3cf0(r26)
    bt.add r7, r5
    bn.sbz 0x0(r7), r25
    bt.add r6, r3
    bn.movhi_2 r5, 0x7f
    bg.ori r5, r5, 0xffff
    bn.and r7, r6, r5
    bn.slli r7, r7, 0x1
    bn.andi r6, r6, 0x1
    bn.sub r7, r7, r6
    bg.lwz r6, 0x3cf0(r26)
    bt.add r7, r6
    bn.sbz 0x0(r7), r4
loc_23de74:
    bn.srli r23, r23, 0x2
    bn.bnei r23, 0x0, loc_23de1e
    bt.jr r9
loc_23de7c:
    bn.slli r6, r6, 0x1
    bg.movhi r5, 0x45
    bg.lwz r7, 0x3cf0(r5)
    bt.add r6, r7
    bn.srli r7, r3, 0x18
    bn.sbz 0x0(r6), r7
    bn.movhi_2 r6, 0x7f
    bg.ori r6, r6, 0xffff
    bn.and r7, r3, r6
    bn.slli r7, r7, 0x1
    bn.andi r6, r3, 0x1
    bn.sub r7, r7, r6
    bg.lwz r6, 0x3cf0(r5)
    bt.add r7, r6
    bn.sbz 0x0(r7), r4
    bt.jr r9
