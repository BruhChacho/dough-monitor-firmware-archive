"""Bounded P-code interpreter for the recovered table helper only.

No device access, stores, host calls, or peripheral model. Unknown operations,
uninitialized reads, out-of-range memory, and unexpected returns fail closed.
Instruction semantics come from the pinned, incomplete AEON SLEIGH definition;
agreement here is not hardware validation or independent ISA certification.
"""
from pathlib import Path
import hashlib
import platform
import sys
import xml.etree.ElementTree as ET

from prepare_aeon import COMMIT

ROOT = Path(__file__).resolve().parents[1]
BASE = 0x204059
TABLE = 0x2aed7c
RETURN = 0xfffffff0
LANGUAGES = ROOT / f".tools/ghidra-aeon/ghidra-aeon-{COMMIT}/data/languages"


def context():
    sys.path.insert(0, str(ROOT / ".tools/python"))
    import pypcode
    folder = LANGUAGES
    language = pypcode.ArchLanguage(str(folder), ET.parse(folder / "aeon.ldefs").getroot()[0])
    return pypcode.Context(language)


def decoder_identity():
    """Measure the runtime and exact local definition used by context()."""
    import pypcode
    module = Path(pypcode.__file__).resolve()
    return {
        "pypcode_version": pypcode.__version__,
        "pypcode_module_path": str(module.relative_to(ROOT) if module.is_relative_to(ROOT) else module),
        "python_version": platform.python_version(),
        "platform": platform.system(),
        "machine": platform.machine(),
        "sleigh_files_sha256": {
            name: hashlib.sha256((LANGUAGES / name).read_bytes()).hexdigest()
            for name in ("aeon.ldefs", "aeon.slaspec", "aeon.sla")
        },
    }


class HelperEmulator:
    def __init__(self, code, table, base=BASE, table_address=TABLE):
        if not code or not table:
            raise ValueError("Empty code or table")
        self.code, self.table = bytes(code), bytes(table)
        self.base, self.table_address = base, table_address
        self.context = context()
        self.registers = [self.context.registers[f"r{i}"] for i in range(32)]
        self.instructions = {}
        offset = 0
        # Decode every instruction boundary before evaluating any branch.
        while offset < len(code):
            pc = base + offset
            ops = self.context.translate(code[offset:], base_address=pc, max_instructions=1).ops
            if not ops or ops[0].opcode.name != "IMARK" or len(ops[0].inputs) != 1:
                raise ValueError("Unsupported instruction marker")
            marker = ops[0].inputs[0]
            length = marker.size
            if marker.offset != pc or length <= 0 or offset + length > len(code):
                raise ValueError("Instruction extends outside code")
            self.instructions[pc] = (length, ops[1:])
            offset += length

    def run(self, argument, seed=0, max_steps=512):
        if not 0 <= argument <= 0xffffffff:
            raise ValueError("Argument must be uint32")
        memory = {"register": {}, "unique": {}}

        def read(node):
            space = node.space.name
            if space == "const":
                return node.offset
            if space not in memory:
                raise ValueError(f"Unsupported value space: {space}")
            try:
                return int.from_bytes(bytes(memory[space][node.offset + i] for i in range(node.size)), "little")
            except KeyError as exc:
                raise ValueError("Read of uninitialized interpreter state") from exc

        def write(node, value):
            if node is None or node.space.name not in memory:
                raise ValueError("Unsupported destination")
            value &= (1 << (node.size * 8)) - 1
            memory[node.space.name].update({node.offset + i: b for i, b in enumerate(value.to_bytes(node.size, "little"))})

        for i, reg in enumerate(self.registers):
            write(reg, (seed + i * 0x1020304) & 0xffffffff)
        write(self.registers[3], argument)
        write(self.registers[9], RETURN)
        pc, reads = self.base, []
        for step in range(1, max_steps + 1):
            if pc not in self.instructions:
                raise ValueError(f"Branch outside instruction boundaries: {pc:#x}")
            length, ops = self.instructions[pc]
            next_pc = pc + length
            memory["unique"].clear()
            for op in ops:
                kind, args = op.opcode.name, op.inputs
                if kind == "COPY":
                    write(op.output, read(args[0]))
                elif kind in ("INT_ADD", "INT_LEFT", "INT_EQUAL", "INT_NOTEQUAL"):
                    a, b = read(args[0]), read(args[1])
                    if kind == "INT_ADD":
                        result = a + b
                    elif kind == "INT_LEFT":
                        result = a << b if b < op.output.size * 8 else 0
                    else:
                        result = int(a == b) if kind == "INT_EQUAL" else int(a != b)
                    write(op.output, result)
                elif kind == "LOAD":
                    if args[0].getSpaceFromConst().name != "ram":
                        raise ValueError("Unsupported load space")
                    address, size = read(args[1]), op.output.size
                    offset = address - self.table_address
                    if offset < 0 or offset + size > len(self.table):
                        raise ValueError(f"Read outside allowed table: {address:#x}")
                    reads.append((address, size))
                    write(op.output, int.from_bytes(self.table[offset:offset + size], "little"))
                elif kind in ("BRANCH", "CBRANCH"):
                    if args[0].space.name != "ram":
                        raise ValueError("Internal P-code branches are unsupported")
                    if kind == "BRANCH" or read(args[1]):
                        next_pc = args[0].offset
                        break
                elif kind == "RETURN":
                    if read(args[0]) != RETURN:
                        raise ValueError("Unexpected return address")
                    return {"registers": [read(reg) for reg in self.registers],
                            "reads": reads, "steps": step}
                else:
                    raise ValueError(f"Unsupported P-code operation: {kind}")
            pc = next_pc
        raise ValueError("Instruction budget exceeded")
