"""Validate reconstructed register helpers against plain-byte memory contracts.

Addressed bytes are Python objects, never physical memory. Peripheral side
effects, polling, lock semantics and register-update counter width are excluded.
"""
import json

from aeon_module_model import Memory, ModuleModel, Region
from aeon_helper_emulator import context, decoder_identity
from build_dc9_source_baseline import ROOT, LAYOUT, sha
from recompress_dc9 import SOURCE_SHA
from validate_dc9_module import inputs, initial_registers, stack_region

BUS = 0xa0000000
POINTER = 0x453cf0
MASK = 0x455214
DESCRIPTORS = 0x47fa9c


def byte_address(logical):
    return BUS + ((logical & 0x7ffffe) * 2) + (logical & 1)


def memory_for(address_values, broadcast_mask=0, descriptors=()):
    regions = [stack_region(), Region('base_pointer', POINTER, bytearray(BUS.to_bytes(4, 'little'))),
               Region('broadcast_mask', MASK, bytearray(broadcast_mask.to_bytes(2, 'little')))]
    regions += [Region('bus', address, bytearray([value]), True) for address, value in sorted(address_values.items())]
    if descriptors:
        data = bytearray(15 * 124 + 8)
        for i, value in enumerate(descriptors):
            data[(i * 2) * 124 + 4:(i * 2) * 124 + 8] = value.to_bytes(4, 'little')
        regions.append(Region('descriptors', DESCRIPTORS, data))
    return Memory(regions)


def execute(model, entry, memory, argument, value=0):
    regs = initial_registers(0x10203040); regs[3], regs[4] = argument, value
    result = model.run(entry, memory, regs)
    assert result['registers'][1] == regs[1]
    assert result['registers'][10:15] == regs[10:15]
    return result


def bus_writes(memory):
    return [(address, value) for name, address, size, value in memory.writes if name == 'bus']


def validate():
    expanded, segments, _ = inputs()
    model = ModuleModel(segments, call_policy='fallthrough-hypothesis')
    counts = {'read8': 0, 'write8': 0, 'broadcast_write8': 0, 'read16': 0, 'write16': 0,
              'slot_buffer_offset': 0, 'slot_ring_position': 0}
    visited = set()
    arguments = (0, 1, 0xff, 0xff800000, 0x100, 0x101, 0x3c06, 0x12345678,
                 0xab801200, 0xab801201, 0xab801234, 0xff807ffe)
    for logical in arguments:
        active = bool(logical & 0x7fff00)
        paged = active and bool(logical & 0x800000)
        target = byte_address(logical)
        page = BUS + 2 * (logical & 0x7fff00)
        for value in (0, 1, 0x7f, 0x80, 0xff):
            mapping = {target: value, **({page: 0xa5} if paged and page != target else {})} if active else {}
            memory = memory_for(mapping)
            expected = (logical >> 24) & 255 if paged and page == target else value if active else 0
            result = execute(model, 0x23dd44, memory, logical)
            assert result['registers'][3] == expected
            assert bus_writes(memory) == ([(page, (logical >> 24) & 255)] if paged else [])
            visited.update(result['visited']); counts['read8'] += 1
            for mask in (0, 0xffff):
                if mask and paged:
                    continue
                memory = memory_for(mapping, mask)
                result = execute(model, 0x23ddb9, memory, logical, value | 0x123400)
                expected_writes = ([(page, (logical >> 24) & 255)] if paged else [])
                if active:
                    expected_writes.append((target, value))
                assert bus_writes(memory) == expected_writes
                visited.update(result['visited']); counts['write8'] += 1

    descriptors = [0x1000 + i * 0x200 for i in range(8)]
    for mask in (1, 2, 3, 4, 0x40, 0x8000, 0x5555, 0xaaaa, 0xffff):
        for low_offset in (0, 1, 0x34, 0xff):
            logical = 0xab801200 | low_offset
            mapping, expected = {}, []
            for group, descriptor in enumerate(descriptors):
                if (mask >> (2 * group)) & 3:
                    page, target = byte_address(descriptor), byte_address(descriptor + low_offset)
                    mapping[page] = mapping[target] = 0xa5
                    expected.extend([(page, 0xab), (target, 0x78)])
            memory = memory_for(mapping, mask, descriptors)
            result = execute(model, 0x23ddb9, memory, logical, 0x12345678)
            assert bus_writes(memory) == expected
            visited.update(result['visited']); counts['broadcast_write8'] += 1

    for logical in (0x1200, 0x1201, 0x12fe):
        lo, hi = byte_address(logical), byte_address(logical + 1)
        for value in (0, 1, 0x1234, 0xabcd, 0xffff):
            memory = memory_for({lo: value & 255, hi: value >> 8})
            result = execute(model, 0x23df85, memory, logical)
            assert result['registers'][3] == value
            assert [(address, size) for name, address, size in memory.reads if name == 'bus'] == [(hi, 1), (lo, 1)]
            visited.update(result['visited']); counts['read16'] += 1
            memory = memory_for({lo: 0xa5, hi: 0xa5})
            result = execute(model, 0x23dfb6, memory, logical, value)
            assert bus_writes(memory) == [(lo, value & 255), (hi, value >> 8)]
            visited.update(result['visited']); counts['write16'] += 1

    offsets = {0: (0x80, 0x300, 0x7d8c), 1: (0x100, 0x380, 0x7d98),
               2: (0x180, 0x400, 0x7da4), 3: (0x200, 0x480, 0x7d74), 7: (0, 0x280, 0x7dc8)}
    for slot in (*range(9), 0xffffffff):
        for mode in (0, 1, 0xffffffff):
            memory = Memory([])
            result = execute(model, 0x20c7a8, memory, slot, mode)
            assert result['registers'][3] == (offsets[slot][int(mode != 0)] if slot in offsets else 0xb900)
            visited.update(result['visited']); counts['slot_buffer_offset'] += 1
        regions = [Region('base_pointer', POINTER, bytearray(BUS.to_bytes(4, 'little')))]
        if slot in offsets:
            regions.append(Region('bus', BUS + offsets[slot][2], bytearray.fromhex('3412')))
        result = execute(model, 0x20c73b, Memory(regions), slot)
        assert result['registers'][3] == (0x1234 if slot in offsets else 0)
        visited.update(result['visited']); counts['slot_ring_position'] += 1
    ctx = context()
    unresolved_stores = []
    for address in (0x23ded2, 0x23df3a):
        code = expanded[address - 0x200000:address - 0x200000 + 4]
        translation = ctx.translate(code, base_address=address, max_instructions=1)
        unresolved_stores.append({'address': hex(address), 'bytes': code.hex(),
                                 'pcode': [str(op) for op in translation.ops],
                                 'sleigh_store_widths': [op.inputs[2].size for op in translation.ops
                                                        if op.opcode.name == 'STORE']})
    return {
        'status': 'reconstructed register helpers tested against simulated plain bytes; no physical device model',
        'source_firmware_sha256': SOURCE_SHA,
        **decoder_identity(), 'source_layout_sha256': sha(LAYOUT.read_bytes()),
        'tool_sha256': {name: sha((ROOT / 'scripts' / name).read_bytes()) for name in
                       ('aeon_module_model.py', 'aeon_subset_assembler.py', 'validate_dc9_registers.py')},
        'call_policy': 'fallthrough-hypothesis', 'cases': counts,
        'total_cases': sum(counts.values()), 'visited_instruction_addresses': [hex(x) for x in sorted(visited)],
        'excluded_masked_update': {'entry': '0x23dead',
            'store_observations': unresolved_stores,
            'reason': 'bg.sw_1 width unresolved: pinned SLEIGH stores four bytes where surrounding code reads a halfword counter; no guessed width is executed'},
        'limitations': ['Plain bytes do not model page windows, hardware registers, concurrency or timing',
                        'Physical CPU semantics and optional multi-target descriptor meanings remain unverified',
                        'Masked-update helper is byte-exact source only; no execution equivalence claim'],
    }


if __name__ == '__main__':
    report = validate()
    (ROOT / 'analysis/dc9-register-validation.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps({'total_cases': report['total_cases'], 'cases': report['cases']}, indent=2))
