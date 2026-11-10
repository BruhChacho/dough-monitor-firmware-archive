# Firmware-derived reconstruction; excluded from the repository MIT grant.
# DC9 v101 candidate [0x27081c,0x270836); Pass timer_dispatch and Check timer string to timer_create_wrapper with arguments 0,1,1.
# Fixed original addresses; not a hardware-validated implementation.
    bg.movhi r3, 0x27
    bg.addi r3, r3, 0x836
    bt.movi r4, 0x0
    bt.movi r5, 0x1
    bt.movi r6, 0x1
    bg.movhi r7, 0x34
    bg.addi r7, r7, -0x3463
    bg.j 0x279e04
