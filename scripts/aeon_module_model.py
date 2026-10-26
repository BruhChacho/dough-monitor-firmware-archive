"""Bounded instruction model for recovered DC9 paths using plain byte memory.

This is an explicit hypothesis, not a hardware emulator or an ISA reference.
Pypcode supplies instruction text, checked by re-encoding each instruction;
execution below does not use its known-inconsistent CALL/load P-code. Assumes
32-bit GPRs, low byte/halfword operations, little-endian data, r0=0, no delay
slots. CALL policy must be chosen explicitly. No devices or host calls exist;
mapped register addresses are plain bytes without peripheral side effects.
Unresolved bg.sw_1/bg.sh stores are rejected by default. Explicit store policies
exist only for comparing hypotheses; neither establishes physical ISA behavior.
"""
from dataclasses import dataclass
import re

from aeon_subset_assembler import encode, register
from aeon_helper_emulator import context

MASK = 0xffffffff
RETURN = 0xfffffff0


def signed(value):
    return value - 0x100000000 if value & 0x80000000 else value


@dataclass
class Region:
    name: str
    address: int
    data: bytearray
    writable: bool = False


class Memory:
    def __init__(self, regions):
        self.regions = regions
        self.reads, self.writes = [], []
        for i, region in enumerate(regions):
            if not region.data or region.address < 0 or region.address + len(region.data) > 1 << 32:
                raise ValueError("Invalid memory region")
            for other in regions[:i]:
                if region.address < other.address + len(other.data) and other.address < region.address + len(region.data):
                    raise ValueError("Overlapping memory regions")

    def locate(self, address, size):
        if size not in (1, 2, 4) or address < 0 or address + size > 1 << 32:
            raise ValueError("Invalid memory access")
        for region in self.regions:
            offset = address - region.address
            if 0 <= offset and offset + size <= len(region.data):
                return region, offset
        raise ValueError(f"Unmapped memory access: {address:#x}+{size}")

    def read(self, address, size):
        region, offset = self.locate(address, size)
        self.reads.append((region.name, address, size))
        return int.from_bytes(region.data[offset:offset + size], "little")

    def write(self, address, size, value):
        region, offset = self.locate(address, size)
        if not region.writable:
            raise ValueError("Write to read-only region")
        value &= (1 << (8 * size)) - 1
        region.data[offset:offset + size] = value.to_bytes(size, "little")
        self.writes.append((region.name, address, size, value))


class ModuleModel:
    def __init__(self, segments, *, call_policy, store_policy='reject'):
        if call_policy not in ("fallthrough-hypothesis", "sleigh-link"):
            raise ValueError("Choose an explicit supported CALL policy")
        self.call_policy = call_policy
        if store_policy not in ('reject', 'sleigh-store', 'halfword-lane-hypothesis'):
            raise ValueError('Choose an explicit supported store policy')
        self.store_policy = store_policy
        self.instructions = {}
        occupied = set()
        ctx = context()
        for base, code in segments:
            rows = ctx.disassemble(code, base_address=base).instructions
            covered = 0
            for row in rows:
                pc = row.addr.offset
                args = [x.strip() for x in row.body.rstrip(',').split(',')]
                original = code[pc - base:pc - base + row.length]
                if encode(row.mnem, args, pc, {}) != original:
                    raise ValueError("Instruction re-encoding mismatch")
                if any(address in occupied for address in range(pc, pc + row.length)):
                    raise ValueError("Overlapping code segments")
                occupied.update(range(pc, pc + row.length))
                self.instructions[pc] = (row.length, row.mnem, args)
                covered += row.length
            if covered != len(code):
                raise ValueError("Incomplete code segment")

    def run(self, entry, memory, registers=None, *, max_steps=30000, stop_before=()):
        stops = set(stop_before)
        if not stops.issubset(self.instructions):
            raise ValueError("Stop address outside modeled instruction boundaries")
        regs = [0] * 32 if registers is None else list(registers)
        if len(regs) != 32 or any(not 0 <= x <= MASK for x in regs) or regs[0] != 0:
            raise ValueError("Expected 32 uint32 registers with r0 zero")
        regs[9] = RETURN
        pc, flag = entry, None
        calls, returns, visited = [], [], set()

        def value(arg):
            return regs[register(arg)]

        def put(arg, val):
            index = register(arg)
            if index:
                regs[index] = val & MASK

        def imm(arg):
            return int(arg, 0)

        def address(arg):
            match = re.fullmatch(r"([^()]+)\((r[0-9]+)\)", arg)
            if not match:
                raise ValueError("Invalid memory operand")
            return (imm(match[1]) + value(match[2])) & MASK

        for step in range(1, max_steps + 1):
            if pc not in self.instructions:
                raise ValueError(f"Outside modeled instruction boundaries: {pc:#x}")
            if pc in stops:
                return {"registers": regs, "flag": flag, "steps": step - 1, "calls": calls,
                        "visited": sorted(visited), "termination": "breakpoint", "stopped_before": pc,
                        "store_policy": self.store_policy}
            visited.add(pc)
            size, op, a = self.instructions[pc]
            next_pc = pc + size
            if op == 'bt.nop':
                if imm(a[0]) != 0:
                    raise ValueError('Only observed bt.nop 0 execution is modeled')
            elif op in ("bg.movhi", "bn.movhi_2", "bt.movhi"):
                put(a[0], imm(a[1]) << 16)
            elif op == "bt.movi":
                put(a[0], imm(a[1]))
            elif op == "bt.mov":
                put(a[0], value(a[1]))
            elif op == "bt.add":
                put(a[0], value(a[0]) + value(a[1]))
            elif op == "bt.addi":
                put(a[0], value(a[0]) + imm(a[1]))
            elif op in ("bg.addi", "bn.addi", "bg.ori", "bn.ori", "bn.andi"):
                x, y = value(a[1]), imm(a[2])
                put(a[0], x | y if op in ("bg.ori", "bn.ori") else x & y if op == "bn.andi" else x + y)
            elif op in ("bn.add", "bn.xor", "bn.muls", "bn.and", "bn.or", "bn.sub", "bn.nand"):
                x, y = value(a[1]), value(a[2])
                operations = {'bn.add': x + y, 'bn.sub': x - y, 'bn.xor': x ^ y,
                              'bn.and': x & y, 'bn.or': x | y, 'bn.nand': ~(x & y), 'bn.muls': x * y}
                put(a[0], operations[op])
            elif op in ("bn.cmov_0", "bn.cmov_1"):
                if flag is None:
                    raise ValueError("Read of uninitialized flag")
                put(a[0], value(a[1] if flag else a[2]))
            elif op == "bn.cmovsi_2":
                if flag is None:
                    raise ValueError("Read of uninitialized flag")
                # SLEIGH selects the register when F is set, otherwise the
                # signed five-bit immediate. Resolve the selected source before
                # writing in case destination aliases the register operand.
                source = value(a[1]) if flag else imm(a[2])
                put(a[0], source)
            elif op == 'bn.ff1':
                source = value(a[1])
                result = 0
                if source:
                    for bit in range(32):
                        if source & (1 << bit):
                            result = bit + 1
                            break
                put(a[0], result)
            elif op == 'bn.divu':
                numerator, denominator = value(a[1]), value(a[2])
                if not denominator:
                    raise ValueError('Unmodeled division by zero')
                put(a[0], numerator // denominator)
            elif op in ("bn.slli", "bn.srli"):
                x, y = value(a[1]), imm(a[2])
                put(a[0], x << y if op == "bn.slli" else x >> y)
            elif op == 'bn.sll':
                x, count = value(a[1]), value(a[2])
                if count >= 32:
                    raise ValueError('Unresolved variable shift count >=32')
                put(a[0], x << count)
            elif op == 'bn.sra':
                x, count = value(a[1]), value(a[2])
                if count >= 32:
                    raise ValueError('Unresolved variable shift count >=32')
                put(a[0], signed(x) >> count)
            elif op in ("bn.extbz", "bn.exthz"):
                put(a[0], value(a[1]) & (0xff if op == "bn.extbz" else 0xffff))
            elif op == 'bn.extbs':
                # Same low-byte hypothesis as extbz/lbz. Pinned SLEIGH uses
                # a high-byte register slice; no independent ISA claim follows.
                byte = value(a[1]) & 255
                put(a[0], byte - 256 if byte & 128 else byte)
            elif op in ("bn.lbz", "bg.lbz", "bn.lwz", "bg.lwz", "bg.lhz", "bn.lh"):
                width = 1 if op in ("bn.lbz", "bg.lbz") else 2 if op in ("bg.lhz", "bn.lh") else 4
                # Compute address before writing destination, including aliases.
                put(a[0], memory.read(address(a[1]), width))
            elif op in ("bn.sbz", "bg.sbz", "bn.sw", "bg.sw_0", "bn.sh_1", "bn.sh_2"):
                width = 1 if op in ("bn.sbz", "bg.sbz") else 2 if op in ('bn.sh_1', 'bn.sh_2') else 4
                memory.write(address(a[0]), width, value(a[1]))
            elif op in ('bg.sw_1', 'bg.sh'):
                if self.store_policy == 'reject':
                    raise ValueError(f'Unsupported instruction: {op}; unresolved store semantics')
                target, data = address(a[0]), value(a[1])
                if op == 'bg.sw_1':
                    memory.write(target, 4 if self.store_policy == 'sleigh-store' else 2, data)
                elif self.store_policy == 'sleigh-store':
                    memory.write(target, 2, data >> 16)
                else:
                    memory.write((target + 2) & MASK, 2, data)
            elif op == 'bn.sflesi':
                flag = signed(value(a[0])) <= imm(a[1])
            elif op == 'bn.sfgtsi':
                flag = signed(value(a[0])) > imm(a[1])
            elif op in ("bg.sfnei", "bn.sfnei", "bg.sfeqi", "bn.sfeqi", "bg.sfgti", "bn.sfgtui", "bn.sfleui"):
                flag = (value(a[0]) != imm(a[1]) if op in ("bg.sfnei", "bn.sfnei") else
                        value(a[0]) == imm(a[1]) if op in ("bg.sfeqi", "bn.sfeqi") else
                        value(a[0]) <= imm(a[1]) if op == 'bn.sfleui' else value(a[0]) > imm(a[1]))
            elif op in ("bn.bf", "bn.bnf"):
                if flag is None:
                    raise ValueError("Read of uninitialized flag")
                if flag == (op == "bn.bf"):
                    next_pc = imm(a[0])
            elif op in ("bg.beq", "bg.bne", "bg.ble", "bg.bgt", "bg.beqi", "bg.bnei", "bg.bleui", "bg.bgtui", "bn.beqi", "bn.bnei", "bn.blesi", "bn.bgtui", "bn.bleui"):
                x = value(a[0])
                y = value(a[1]) if op in ("bg.beq", "bg.bne", "bg.ble", "bg.bgt") else imm(a[1])
                take = (x == y if op in ("bg.beq", "bg.beqi", "bn.beqi") else
                        x != y if op in ("bg.bne", "bg.bnei", "bn.bnei") else
                        signed(x) <= y if op == "bn.blesi" else x <= y if op in ("bg.ble", "bg.bleui", "bn.bleui") else x > y)
                if take:
                    next_pc = imm(a[2])
            elif op in ("bt.j", "bg.j", "bn.j"):
                next_pc = imm(a[0])
            elif op in ("bg.jal", "bt.jalr"):
                # Read an indirect destination before changing r9 (it may alias).
                destination = value(a[0]) if op == 'bt.jalr' else imm(a[0])
                if destination not in self.instructions:
                    raise ValueError(f'Outside modeled instruction boundaries: {destination:#x}')
                link = pc + size + (size if self.call_policy == "sleigh-link" else 0)
                regs[9] = link
                returns.append(link)
                next_pc = destination
                calls.append((pc, next_pc, link))
            elif op == "bt.jr":
                next_pc = value(a[0])
                if a[0] == "r9":
                    expected = returns.pop() if returns else RETURN
                    if next_pc != expected:
                        raise ValueError("Unexpected return address")
                    if next_pc == RETURN:
                        return {"registers": regs, "flag": flag, "steps": step, "calls": calls,
                                "visited": sorted(visited), "termination": "return", "store_policy": self.store_policy}
            else:
                raise ValueError(f"Unsupported instruction: {op}")
            pc = next_pc
        raise ValueError("Instruction budget exceeded")
