# Reconstructed DC9 v101 helper at candidate address 0x204059.
# Input: r3. Output: r3 = 1 for a matching table byte, otherwise 0.
# Table address 0x2aed7c, exclusive end 0x2aeda5 (41 bytes).
# Firmware-derived reconstruction; excluded from the repository MIT grant.
# Nine-instruction assembler subset only; no hardware execution claim.

table_contains:
    bg.movhi r7, 0x2b
    bg.addi r7, r7, -0x1284
    bt.j test_byte
next_byte:
    bt.addi r7, 1
    bg.movhi r6, 0x2b
    bg.addi r6, r6, -0x125b
    bg.beq r7, r6, absent
test_byte:
    bn.lbz r6, 0(r7)
    bg.bne r3, r6, next_byte
    bt.movi r3, 1
    bt.jr r9
absent:
    bt.movi r3, 0
    bt.jr r9
