"""Small, strict AEON encoder for the recovered command-routing routines.

Not a general assembler, linker, ABI implementation, or C compiler. Encodings
were checked against archived instructions and the pinned AEON SLEIGH fields.
"""
import re

SIZES = {"bg.movhi": 4, "bg.addi": 4, "bg.beq": 4, "bg.bne": 4,
         "bn.lbz": 3, "bt.j": 2, "bt.addi": 2, "bt.movi": 2, "bt.jr": 2}
ARITY = {"bg.movhi": 2, "bg.addi": 3, "bg.beq": 3, "bg.bne": 3,
         "bn.lbz": 2, "bt.j": 1, "bt.addi": 2, "bt.movi": 2, "bt.jr": 1}
SIZES.update({"bt.mov": 2, "bt.add": 2, "bn.sw": 3, "bn.lwz": 3,
              "bn.extbz": 3, "bn.slli": 3, "bg.sfnei": 4, "bn.bnf": 3,
              "bn.beqi": 3, "bn.bnei": 3, "bg.jal": 4, "bn.blesi": 3,
              "bn.add": 3, "bn.xor": 3})
ARITY.update({"bt.mov": 2, "bt.add": 2, "bn.sw": 2, "bn.lwz": 2,
              "bn.extbz": 2, "bn.slli": 3, "bg.sfnei": 2, "bn.bnf": 1,
              "bn.beqi": 3, "bn.bnei": 3, "bg.jal": 1, "bn.blesi": 3,
              "bn.add": 3, "bn.xor": 3})
SIZES.update({"bg.lwz": 4, "bg.sw_0": 4, "bg.lhz": 4, "bg.sbz": 4,
              "bg.ori": 4, "bg.sfgti": 4, "bg.sflesi": 4,
              "bg.sfleui": 4, "bg.sfgtsi": 4, "bn.sbz": 3, "bn.sh_1": 3,
              "bn.bf": 3, "bn.exthz": 3, "bn.srli": 3, "bn.bgtui": 3,
              "bn.muls": 3, "bn.addi": 3, "bn.andi": 3, "bn.sfgtui": 3})
SIZES.update({"bg.lbz": 4, "bg.sfeqi": 4})
ARITY.update({"bg.lwz": 2, "bg.sw_0": 2, "bg.lhz": 2, "bg.sbz": 2,
              "bg.ori": 3, "bg.sfgti": 2, "bg.sflesi": 2,
              "bg.sfleui": 2, "bg.sfgtsi": 2, "bn.sbz": 2, "bn.sh_1": 2,
              "bn.bf": 1, "bn.exthz": 2, "bn.srli": 3, "bn.bgtui": 3,
              "bn.muls": 3, "bn.addi": 3, "bn.andi": 3, "bn.sfgtui": 2})
ARITY.update({"bg.lbz": 2, "bg.sfeqi": 2})
SIZES.update({"bn.movhi_2": 3, "bn.and": 3, "bn.or": 3, "bn.nand": 3,
              "bn.sub": 3, "bn.ori": 3, "bg.bnei": 4, "bg.beqi": 4,
              "bg.j": 4, "bg.sw_1": 4, "bn.sfeqi": 3, "bn.cmov_0": 3})
ARITY.update({"bn.movhi_2": 2, "bn.and": 3, "bn.or": 3, "bn.nand": 3,
              "bn.sub": 3, "bn.ori": 3, "bg.bnei": 3, "bg.beqi": 3,
              "bg.j": 1, "bg.sw_1": 2, "bn.sfeqi": 2, "bn.cmov_0": 3})
SIZES.update({"bn.lh": 3, "bn.j": 3, "bg.ble": 4, "bg.bgt": 4})
ARITY.update({"bn.lh": 2, "bn.j": 1, "bg.ble": 3, "bg.bgt": 3})
SIZES.update({"bg.bleui": 4, "bg.bgtui": 4, "bn.bleui": 3, "bn.sfnei": 3, "bg.sh": 4})
ARITY.update({"bg.bleui": 3, "bg.bgtui": 3, "bn.bleui": 3, "bn.sfnei": 2, "bg.sh": 2})
SIZES.update({"bt.jalr": 2, "bt.nop": 2, "bn.divs": 3, "bn.divu": 3,
              "bn.sfleui": 3, "bn.sh_2": 3})
ARITY.update({"bt.jalr": 1, "bt.nop": 1, "bn.divs": 3, "bn.divu": 3,
              "bn.sfleui": 2, "bn.sh_2": 2})
SIZES.update({'bt.movhi': 2, 'bn.extbs': 3, 'bn.sflesi': 3,
              'bn.sll': 3, 'bn.sra': 3, 'bn.ff1': 3, 'bn.cmov_1': 3,
              'bn.sfgtsi': 3, 'bn.cmovsi_2': 3})
ARITY.update({'bt.movhi': 2, 'bn.extbs': 2, 'bn.sflesi': 2,
              'bn.sll': 3, 'bn.sra': 3, 'bn.ff1': 2, 'bn.cmov_1': 3,
              'bn.sfgtsi': 2, 'bn.cmovsi_2': 3})


def immediate(value, bits, signed=False):
    low, high = (-(1 << (bits - 1)), (1 << (bits - 1)) - 1) if signed else (0, (1 << bits) - 1)
    if not low <= value <= high:
        raise ValueError(f"Value {value} outside {'signed' if signed else 'unsigned'} {bits}-bit range")
    return value & ((1 << bits) - 1)


def register(text):
    if not re.fullmatch(r"r(?:[0-9]|[12][0-9]|3[01])", text):
        raise ValueError(f"Invalid register: {text}")
    return int(text[1:])


def encode(op, args, pc, labels):
    if op not in SIZES or len(args) != ARITY[op]:
        raise ValueError("Unsupported instruction or operand count")
    def target(value):
        return labels[value] if value in labels else int(value, 0)
    def memory_operand(text):
        memory = re.fullmatch(r"([^()]+)\((r[0-9]+)\)", text)
        if memory is None:
            raise ValueError("Expected offset(register) memory operand")
        return int(memory[1], 0), register(memory[2])
    if op == "bg.movhi":
        word = 0xc0000001 | register(args[0]) << 21 | immediate(int(args[1], 0), 16) << 5
    elif op == "bn.movhi_2":
        word = 0x040000 | register(args[0]) << 13 | immediate(int(args[1], 0), 13)
    elif op in ("bg.addi", "bg.ori"):
        word = ((0xfc000000 if op == "bg.addi" else 0xc8000000)
                | register(args[0]) << 21 | register(args[1]) << 16
                | immediate(int(args[2], 0), 16, op == "bg.addi"))
    elif op in ("bg.beq", "bg.bne", "bg.ble", "bg.bgt"):
        word = (0xd4000000 | register(args[0]) << 21 | register(args[1]) << 16
                | immediate(target(args[2]) - pc, 13, True) << 3
                | {"bg.beq": 2, "bg.bne": 6, "bg.ble": 1, "bg.bgt": 5}[op])
    elif op in ("bg.beqi", "bg.bnei", "bg.bleui", "bg.bgtui"):
        word = (0xd0000000 | register(args[0]) << 21 | immediate(int(args[1], 0), 5) << 16
                | immediate(target(args[2]) - pc, 13, True) << 3
                | {"bg.beqi": 2, "bg.bnei": 6, "bg.bleui": 1, "bg.bgtui": 5}[op])
    elif op == "bt.j":
        word = 0x9000 | immediate(target(args[0]) - pc, 10, True)
    elif op == "bn.j":
        word = 0x2c0000 | immediate(target(args[0]) - pc, 18, True)
    elif op == "bn.lh":
        offset, base = memory_operand(args[1])
        # Pinned decoder masks the displacement to an unsigned even byte.
        # Restrict to observed nonnegative offsets; do not invent sign extension.
        if offset % 2:
            raise ValueError("Halfword offset must be even")
        # All recovered instances have low encoding bit 1; the decoder hides
        # this bit. Reproduce only that observed form, not both aliases.
        word = 0x080001 | register(args[0]) << 13 | base << 8 | immediate(offset, 7)
    elif op in ("bt.addi", "bt.movi", "bt.movhi"):
        word = {'bt.addi': 0x9c00, 'bt.movi': 0x9800, 'bt.movhi': 0x9400}[op] | register(args[0]) << 5 | immediate(int(args[1], 0), 5, True)
    elif op in ("bt.jr", "bt.jalr"):
        word = (0x8409 if op == "bt.jr" else 0x8408) | register(args[0]) << 5
    elif op == "bt.nop":
        word = 0x8001 | immediate(int(args[0], 0), 4) << 1
    elif op in ("bt.mov", "bt.add"):
        word = (0x8800 if op == "bt.mov" else 0x8c00) | register(args[0]) << 5 | register(args[1])
    elif op in ("bn.lbz", "bn.lwz", "bn.sw", "bn.sbz", "bn.sh_1", "bn.sh_2"):
        store = op in ("bn.sw", "bn.sbz", "bn.sh_1", "bn.sh_2")
        offset, base = memory_operand(args[0] if store else args[1])
        reg = register(args[1] if store else args[0])
        encoded_offset = immediate(offset, 8, True)
        if op in ("bn.lwz", "bn.sw") and offset % 4:
            raise ValueError("Word memory offset must be four-byte aligned")
        if op == "bn.sh_1" and (offset < 0 or offset % 4):
            # Bit 1 selects the separate sh_2 constructor. Negative offsets
            # also lack a reliable sign-extension model in the pinned SLEIGH.
            raise ValueError("sh_1 supports only nonnegative four-byte-aligned offsets")
        if op == 'bn.sh_2' and (offset < 0 or offset % 4 != 2):
            raise ValueError('sh_2 supports only nonnegative offsets congruent to two modulo four')
        prefix = {"bn.lbz": 0x100000, "bn.lwz": 0x0c0002, "bn.sw": 0x0c0000,
                  "bn.sbz": 0x180000, "bn.sh_1": 0x0c0001, "bn.sh_2": 0x0c0003}[op]
        word = prefix | reg << 13 | base << 8 | encoded_offset
    elif op in ("bg.lwz", "bg.sw_0", "bg.sw_1", "bg.sh", "bg.lhz", "bg.sbz", "bg.lbz"):
        store = op in ("bg.sw_0", "bg.sw_1", "bg.sh", "bg.sbz")
        offset, base = memory_operand(args[0] if store else args[1])
        reg = register(args[1] if store else args[0])
        alignment = 4 if op in ("bg.lwz", "bg.sw_0", "bg.sw_1", "bg.sh") else 2 if op == "bg.lhz" else 1
        if offset % alignment:
            raise ValueError("Unaligned wide memory offset")
        prefix = {"bg.lwz": 0xec000002, "bg.sw_0": 0xec000000,
                  "bg.lhz": 0xe8000001, "bg.sbz": 0xf8000000, "bg.lbz": 0xf0000000,
                  "bg.sw_1": 0xec000001, "bg.sh": 0xec000003}[op]
        word = prefix | reg << 21 | base << 16 | immediate(offset, 16, True)
    elif op in ("bn.extbz", "bn.exthz", "bn.extbs"):
        word = (0x5c0000 | register(args[0]) << 13 | register(args[1]) << 8
                | {'bn.extbz': 0, 'bn.exthz': 4, 'bn.extbs': 2}[op])
    elif op == 'bn.sll':
        word = 0x4c0004 | register(args[0]) << 13 | register(args[1]) << 8 | register(args[2]) << 3
    elif op == 'bn.sra':
        word = 0x4c0006 | register(args[0]) << 13 | register(args[1]) << 8 | register(args[2]) << 3
    elif op == 'bn.ff1':
        word = 0x5c0008 | register(args[0]) << 13 | register(args[1]) << 8
    elif op in ("bn.slli", "bn.srli"):
        word = (0x4c0000 | register(args[0]) << 13 | register(args[1]) << 8
                | immediate(int(args[2], 0), 5) << 3 | (1 if op == "bn.srli" else 0))
    elif op in ("bg.sfnei", "bg.sfgti", "bg.sfeqi", "bg.sflesi", "bg.sfleui", "bg.sfgtsi"):
        signed_imm = op in ("bg.sflesi", "bg.sfgtsi")
        selector = {"bg.sfeqi": 0, "bg.sfnei": 2, "bg.sflesi": 4,
                    "bg.sfleui": 5, "bg.sfgtsi": 6, "bg.sfgti": 7}[op]
        word = (0xc0000000 | selector << 1 | register(args[0]) << 21
                | immediate(int(args[1], 0), 16, signed_imm) << 5)
    elif op in ("bn.sfgtui", "bn.sfeqi", "bn.sfnei", "bn.sfleui"):
        word = {"bn.sfgtui": 0x5c001b, "bn.sfeqi": 0x5c0001, "bn.sfnei": 0x5c0009, "bn.sfleui": 0x5c0013}[op] | register(args[0]) << 13 | immediate(int(args[1], 0), 8) << 5
    elif op == 'bn.sflesi':
        word = 0x5c0011 | register(args[0]) << 13 | immediate(int(args[1], 0), 8, True) << 5
    elif op == 'bn.sfgtsi':
        word = 0x5c0019 | register(args[0]) << 13 | immediate(int(args[1], 0), 8, True) << 5
    elif op in ("bn.bnf", "bn.bf"):
        word = (0x200003 if op == "bn.bnf" else 0x200001) | immediate(target(args[0]) - pc, 16, True) << 2
    elif op in ("bn.beqi", "bn.bnei", "bn.blesi", "bn.bgtui", "bn.bleui"):
        word = ((0x240000 if op in ("bn.blesi", "bn.bgtui", "bn.bleui") else 0x200000)
                | register(args[0]) << 13
                | immediate(int(args[1], 0), 3, op == "bn.blesi") << 10
                | immediate(target(args[2]) - pc, 8, True) << 2
                | (2 if op == "bn.bnei" else 3 if op == "bn.bgtui" else 1 if op == "bn.bleui" else 0))
    elif op in ("bg.jal", "bg.j"):
        word = 0xe4000000 | immediate(target(args[0]) - pc, 25, True) << 1 | (op == "bg.j")
    elif op == 'bn.cmovsi_2':
        # i24_simm3_5 spans bits 3 through 7: a signed five-bit immediate.
        word = 0x480002 | register(args[0]) << 13 | register(args[1]) << 8 | immediate(int(args[2], 0), 5, True) << 3
    elif op in ("bn.add", "bn.xor", "bn.muls", "bn.and", "bn.or", "bn.nand", "bn.sub", "bn.cmov_0", "bn.cmov_1", "bn.divs", "bn.divu"):
        word = ({"bn.add": 0x400004, "bn.xor": 0x440006, "bn.muls": 0x400003,
                 "bn.and": 0x440004, "bn.or": 0x440005, "bn.nand": 0x440007,
                 "bn.sub": 0x400005, "bn.cmov_0": 0x480000, "bn.cmov_1": 0x480001,
                 "bn.divs": 0x400000, "bn.divu": 0x400001}[op] | register(args[0]) << 13
                | register(args[1]) << 8 | register(args[2]) << 3)
    elif op in ("bn.addi", "bn.andi", "bn.ori"):
        word = ({"bn.addi": 0x1c0000, "bn.andi": 0x540000, "bn.ori": 0x500000}[op] | register(args[0]) << 13
                | register(args[1]) << 8 | immediate(int(args[2], 0), 8, op == "bn.addi"))
    else:
        raise ValueError("Instruction has no encoder")
    return word.to_bytes(SIZES[op], "big")


def assemble(source, base):
    immediate(base, 32)
    labels, rows = {}, []
    pc = base
    for lineno, raw in enumerate(source.splitlines(), 1):
        line = raw.split("#", 1)[0].strip()
        if not line:
            continue
        if line.endswith(":"):
            name = line[:-1]
            if not re.fullmatch(r"[A-Za-z_][A-Za-z_0-9]*", name) or name in labels:
                raise ValueError(f"Line {lineno}: invalid or duplicate label")
            labels[name] = pc
            continue
        words = line.split(None, 1)
        op = words[0]
        if op not in SIZES:
            raise ValueError(f"Line {lineno}: unsupported instruction {op}")
        args = [x.strip() for x in words[1].split(",")] if len(words) == 2 else []
        rows.append((lineno, pc, op, args))
        pc += SIZES[op]
        immediate(pc, 32)
    result = bytearray()
    listing = []
    for lineno, pc, op, args in rows:
        try:
            data = encode(op, args, pc, labels)
        except ValueError as exc:
            raise ValueError(f"Line {lineno}: {exc}") from exc
        result.extend(data)
        listing.append({"address": hex(pc), "bytes": data.hex(), "instruction": op + " " + ", ".join(args)})
    return bytes(result), listing
