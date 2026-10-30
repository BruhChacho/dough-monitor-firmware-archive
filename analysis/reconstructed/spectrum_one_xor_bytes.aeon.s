# XOR byte accumulator; nonpositive signed lengths return zero.
# Reconstructed from pinned ES07DC9 v101; not original vendor source.
# Firmware-derived code is excluded from the repository MIT grant.
# Candidate VA 0x204080; absolute targets retain the original layout.
bt.mov r5, r3
bt.movi r3, 0x0
bn.blesi r4,0x0,0x204098
bt.movi r6, 0x0
bn.add r7, r5, r6
bn.lbz r7,0x0(r7)
bn.xor r3, r3, r7
bt.addi r6, 0x1
bg.bne r4,r6,0x204089
bt.jr r9
