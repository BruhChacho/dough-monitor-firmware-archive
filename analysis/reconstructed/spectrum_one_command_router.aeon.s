# Selector 0xcc dispatch; command byte at 0x47eb80 + slot * 128 + 2.
# Reconstructed from pinned ES07DC9 v101; not original vendor source.
# Firmware-derived code is excluded from the repository MIT grant.
# Candidate VA 0x26f043; absolute targets retain the original layout.
# Calls: 0x26e0a4 primary predicate, 0x204059 secondary predicate,
# 0x23520b fallback predicate; handlers 0x26e335, 0x205bd8, 0x235207.
# Both larger handlers remain vendor code. No transport identity is assumed.
bt.addi r1, -0xc
bn.sw 0x8(r1), r9
bn.sw 0x4(r1), r10
bn.sw 0x0(r1), r11
bt.mov r11, r3
bg.sfnei r4, 0xcc
bn.bnf read_command
reject:
bt.movi r3, 0x0
return_common:
bn.lwz r11, 0x0(r1)
bn.lwz r10, 0x4(r1)
bn.lwz r9, 0x8(r1)
bt.addi r1, 0xc
bt.jr r9
read_command:
bn.slli r7, r3, 0x7
bg.movhi r6, 0x48
bg.addi r6, r6, -0x1480
bt.add r7, r6
bn.lbz r7, 0x2(r7)
bn.extbz r10, r7
bt.mov r3, r10
bg.jal 0x26e0a4
bn.bnei r3, 0x0, dispatch_primary
bt.mov r3, r10
bg.jal 0x204059
bn.beqi r3, 0x0, check_fallback
bt.mov r3, r11
bg.movhi r4, 0x45
bg.addi r4, r4, 0x3ce0
bg.jal 0x205bd8
bt.j return_common
dispatch_primary:
bt.mov r3, r11
bg.jal 0x26e335
bn.lwz r11, 0x0(r1)
bn.lwz r10, 0x4(r1)
bn.lwz r9, 0x8(r1)
bt.addi r1, 0xc
bt.jr r9
check_fallback:
bt.mov r3, r10
bg.jal 0x23520b
bn.beqi r3, 0x0, reject
bt.mov r3, r11
bg.movhi r4, 0x45
bg.addi r4, r4, 0x3ce0
bg.movhi r5, 0x45
bg.addi r5, r5, 0x3cde
bg.jal 0x235207
bt.j return_common
