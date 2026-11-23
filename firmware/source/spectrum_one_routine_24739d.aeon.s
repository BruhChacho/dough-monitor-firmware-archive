# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x24739d,0x247406); byte-exact only; hardware untested.
    bn.ori r6, r0, 0x64
    bg.movhi r7, 0x45
    bg.sh 0x3c70(r7), r6
    bg.addi r6, r0, 0x100
    bg.movhi r7, 0x45
    bg.sh 0x3c74(r7), r6
    bg.movhi r7, 0x45
    bg.sh 0x3c6c(r7), r6
    bn.ori r6, r0, 0xd2
    bg.movhi r7, 0x45
    bg.sh 0x3c60(r7), r6
    bn.ori r6, r0, 0xff
    bg.movhi r7, 0x45
    bg.sw_1 0x3c74(r7), r6
    bg.movhi r7, 0x45
    bg.sbz 0x3c6c(r7), r0
    bt.movi r6, 0x1
    bg.movhi r7, 0x45
    bg.sbz 0x5238(r7), r6
    bg.movhi r7, 0x45
    bg.sbz 0x523c(r7), r0
    bg.movhi r7, 0x45
    bg.sbz 0x523d(r7), r0
    bg.movhi r7, 0x45
    bg.sbz 0x523e(r7), r0
    bg.movhi r7, 0x45
    bg.sbz 0x523b(r7), r0
    bt.jr r9
