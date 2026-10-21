"""Small, strict AEON encoder for the nine instructions in one recovered helper.

Not a general assembler, linker, ABI implementation, or C compiler. Encodings
were checked against archived instructions and the pinned AEON SLEIGH fields.
"""
import re

SIZES = {"bg.movhi": 4, "bg.addi": 4, "bg.beq": 4, "bg.bne": 4,
         "bn.lbz": 3, "bt.j": 2, "bt.addi": 2, "bt.movi": 2, "bt.jr": 2}
ARITY = {"bg.movhi": 2, "bg.addi": 3, "bg.beq": 3, "bg.bne": 3,
         "bn.lbz": 2, "bt.j": 1, "bt.addi": 2, "bt.movi": 2, "bt.jr": 1}


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
    if op == "bg.movhi":
        word = 0xc0000001 | register(args[0]) << 21 | immediate(int(args[1], 0), 16) << 5
    elif op == "bg.addi":
        word = 0xfc000000 | register(args[0]) << 21 | register(args[1]) << 16 | immediate(int(args[2], 0), 16, True)
    elif op in ("bg.beq", "bg.bne"):
        word = (0xd4000000 | register(args[0]) << 21 | register(args[1]) << 16
                | immediate(target(args[2]) - pc, 13, True) << 3 | (2 if op == "bg.beq" else 6))
    elif op == "bt.j":
        word = 0x9000 | immediate(target(args[0]) - pc, 10, True)
    elif op in ("bt.addi", "bt.movi"):
        word = (0x9c00 if op == "bt.addi" else 0x9800) | register(args[0]) << 5 | immediate(int(args[1], 0), 5, True)
    elif op == "bt.jr":
        word = 0x8409 | register(args[0]) << 5
    else:
        memory = re.fullmatch(r"([^()]+)\((r[0-9]+)\)", args[1])
        if memory is None:
            raise ValueError("Expected offset(register) memory operand")
        word = (0x100000 | register(args[0]) << 13 | register(memory[2]) << 8
                | immediate(int(memory[1], 0), 8, True))
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
