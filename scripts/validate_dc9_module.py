"""Compare recovered DC9 RAM command paths with independent Python contracts.

Always offline. The instruction model uses an explicit fallthrough CALL
hypothesis. These results are neither physical ISA validation nor flash approval.
"""
from functools import reduce
import json
from operator import xor

from aeon_helper_emulator import context, decoder_identity
from aeon_module_model import Memory, ModuleModel, Region, RETURN
from aeon_subset_assembler import assemble
from build_dc9_source_baseline import ROOT, LAYOUT, assemble_routines, assemble_tables, load_original, sha

PLANE = 0x47e15c
SLOT = 0x47eb80
RESPONSE = 0x453ce0
STACK = 0x700000


def inputs():
    _, expanded, _ = load_original()
    layout = json.loads(LAYOUT.read_text())
    assembled, routines = assemble_routines(expanded, layout)
    assembled, tables = assemble_tables(assembled, layout)
    segments = [(int(r['address'], 16), assembled[int(r['address'], 16) - 0x200000:
                int(r['address'], 16) - 0x200000 + r['size']]) for r in routines]
    table_regions = [(t['name'], int(t['address'], 16), bytes(int(x, 0) for x in t['values'])) for t in tables]
    return expanded, segments, table_regions


def initial_registers(seed=0):
    regs = [(seed + i * 0x1020304) & 0xffffffff for i in range(32)]
    regs[0], regs[1] = 0, STACK + 512
    return regs


def stack_region():
    return Region('stack', STACK, bytearray([0xa5] * 512), True)


def command_case(model, tables, *, plane, offset, count, slot=0, command=0x32, selector=0xcc, parent=False):
    packet = bytearray((i * 37 + 0x51) & 255 for i in range(128))
    packet[2:8] = bytes([command, 0, plane, count, offset >> 8, offset & 255])
    if parent:
        packet[1] = selector
    original_planes = bytes((i * 19 + 0x5a) & 255 for i in range(960))
    planes = Region('planes', PLANE, bytearray(original_planes), True)
    response = Region('response', RESPONSE, bytearray([0xa5, 0x5a]), True)
    memory = Memory([stack_region(), planes, response,
                     Region('slot', SLOT + slot * 128, packet),
                     *[Region(name, address, bytearray(data)) for name, address, data in tables]])
    if parent:
        # Non-overlapping single-byte state mirrors touched by the parent.
        memory = Memory(memory.regions + [Region('selector_mirror', 0x453cd1, bytearray([0xa5]), True),
                                         Region('command_mirror', 0x453cc8, bytearray([0xa5]), True)])
    regs = initial_registers(0xa1b2c3d4)
    regs[3], regs[4] = slot, selector
    result = model.run(0x26bf26 if parent else 0x26f043, memory, regs)
    if parent:
        assert memory.regions[-2].data == bytes([selector])
        assert memory.regions[-1].data == bytes([command])
    expected = bytearray(original_planes)
    expected_response = bytes([0xa5, 0x5a])
    if selector == 0xcc and command == 0x32:
        for i, value in enumerate(packet[8:8 + count]):
            if plane & 3 < 3 and offset + i < 320:
                expected[(plane & 3) * 320 + offset + i] = value
        expected_response = reduce(xor, packet[8:8 + count], 0).to_bytes(2, 'little')
    elif selector == 0xcc and command in (0x50, 0x51, 0x60, 0x71, 0x80, 0x86,
                                          0x91, 0x92, 0x93, 0x94, 0x95, 0x96, 0x97, 0x98, 0x99):
        expected_response = b'\0\0'
    assert planes.data == expected, 'Plane output differs from contract'
    assert response.data == expected_response, 'Response differs from contract'
    assert result['registers'][3] == 0
    assert result['registers'][1] == regs[1]
    assert result['registers'][9] == RETURN
    assert result['registers'][10:20] == regs[10:20], 'Saved GPR corruption'
    return result, memory


def validate():
    expanded, segments, tables = inputs()
    model = ModuleModel(segments, call_policy='fallthrough-hypothesis')
    legacy = ModuleModel(segments, call_policy='sleigh-link')
    visited, max_steps, command_cases = set(), 0, 0
    for plane in (0, 1, 2, 3, 0xfc, 0xfe, 0xff):
        for offset in (0, 1, 318, 319, 320, 65535):
            for count in range(121):
                result, _ = command_case(model, tables, plane=plane, offset=offset, count=count)
                visited.update(result['visited'])
                max_steps = max(max_steps, result['steps'])
                command_cases += 1
    for slot in (1, 3):
        result, _ = command_case(model, tables, plane=2, offset=250, count=120, slot=slot)
        visited.update(result['visited']); command_cases += 1

    parent_cases = 0
    for selector in (0xcc, 0xf0, 0xf1):
        for plane in (0, 2, 3):
            for offset in (0, 319, 65535):
                for count in (0, 1, 120):
                    result, _ = command_case(model, tables, plane=plane, offset=offset, count=count,
                                             selector=selector, parent=True)
                    visited.update(result['visited']); parent_cases += 1

    # Every route that can finish within the reconstructed subset: default,
    # fallback and reject, with full command bodies deliberately excluded.
    routing = json.loads((ROOT / 'analysis/dc9-command-routing.json').read_text())
    route_cases = 0
    for route in routing['routes_for_selector_cc']:
        code = int(route['command'], 16)
        if (route['selected_group'] in ('reject', 'fallback') or
                route.get('secondary_switch_target') == '0x205c39'):
            result, _ = command_case(model, tables, plane=0, offset=0, count=0, command=code)
            visited.update(result['visited']); route_cases += 1
    for selector in (0, 0xcb, 0xcd, 0x1cc, 0xffffffff):
        result, _ = command_case(model, tables, plane=0, offset=0, count=0, selector=selector)
        visited.update(result['visited']); route_cases += 1

    # Exercise the existing replacement inside its actual recovered caller,
    # retaining the same conditional model and explicit memory boundaries.
    rewrite, _ = assemble((ROOT / 'analysis/reconstructed/spectrum_one_table_helper_rewrite.aeon.s').read_text(), 0x204059)
    replacement = ModuleModel([(address, rewrite if address == 0x204059 else code)
                              for address, code in segments], call_policy='fallthrough-hypothesis')
    comparisons = []
    for route in routing['routes_for_selector_cc']:
        if (route['selected_group'] in ('reject', 'fallback') or
                route.get('secondary_switch_target') == '0x205c39'):
            comparisons.append(dict(plane=0, offset=0, count=0, command=int(route['command'], 16)))
    comparisons += [dict(plane=plane, offset=offset, count=count)
                    for plane in (0, 2, 3) for offset in (0, 319, 65535) for count in (0, 1, 120)]
    for case in comparisons:
        before, memory_before = command_case(model, tables, **case)
        after, memory_after = command_case(replacement, tables, **case)
        assert before['registers'] == after['registers']
        assert before['flag'] == after['flag']
        assert before['calls'] == after['calls']
        assert memory_before.reads == memory_after.reads
        assert memory_before.writes == memory_after.writes
        assert [bytes(r.data) for r in memory_before.regions] == [bytes(r.data) for r in memory_after.regions]

    # Strict slot-only mapping documents the first out-of-slot read. It does
    # not infer whether an upstream transport can deliver these counts.
    overreads = []
    for count, parent in ((121, False), (255, False), (121, True), (255, True)):
        try:
            command_case(model, tables, plane=0, offset=0, count=count, parent=parent)
        except ValueError as error:
            assert str(error) == 'Unmapped memory access: 0x47ec00+1', error
            overreads.append({'count': count, 'entry': 'parent' if parent else 'router', 'rejection': str(error)})
        else:
            raise AssertionError('Expected out-of-slot read rejection')

    setter_cases = 0
    for plane in (0, 1, 2, 3, 0x80000000, 0xffffffff):
        for offset in (0, 1, 318, 319, 320, 0x80000000, 0xffffffff):
            for value in (0, 1, 0x7f, 0x80, 0xff, 0x12345678, 0xffffffff):
                target = Region('planes', PLANE, bytearray([0xa5] * 960), True)
                memory = Memory([target])
                regs = initial_registers(); regs[3:6] = [plane, offset, value]
                result = model.run(0x204144, memory, regs)
                expected = bytearray([0xa5] * 960)
                if plane < 3 and offset < 320:
                    expected[plane * 320 + offset] = value & 255
                assert target.data == expected
                assert len(memory.writes) == int(plane < 3 and offset < 320)
                visited.update(result['visited']); setter_cases += 1

    copy_cases = []
    for seed in (0, 1, 0x55, 0xff):
        addresses = (0x600000, 0x601000, 0x602000)
        # Nonidentical planes and data patterns avoid cancellation hiding faults.
        sources = [bytes(((i * (17 + p * 2) + seed + p) ^ (i >> 3)) & 255 for i in range(320)) for p in range(3)]
        target = Region('plane_record', PLANE - 8, bytearray([0xa5] * 970), True)
        memory = Memory([stack_region(), target,
                         Region('source_pointers', 0x340144, bytearray(b''.join(a.to_bytes(4, 'little') for a in addresses))),
                         *[Region(f'source_{p}', a, bytearray(data)) for p, (a, data) in enumerate(zip(addresses, sources))]])
        regs = initial_registers(seed)
        result = model.run(0x2040d2, memory, regs)
        expected = bytearray([0xa5] * 8) + b''.join(sources) + reduce(xor, b''.join(sources), 0).to_bytes(2, 'little')
        assert target.data == expected
        assert result['registers'][1] == regs[1]
        assert sum(name == 'plane_record' for name, *_ in memory.writes) == 962
        visited.update(result['visited'])
        copy_cases.append({'seed': seed, 'output_sha256': sha(target.data), 'steps': result['steps']})

    offset_cases = 0
    for index in (0, 1, 2, 67, 68, 255, 65535, 0x80000000, 0xffffffff):
        for base in (0, 1, 0x1234, 0xffff):
            memory = Memory([Region('record_base', 0x340000, bytearray(base.to_bytes(2, 'little')))])
            regs = initial_registers(); regs[3] = index
            result = model.run(0x204168, memory, regs)
            assert result['registers'][3] == (index * 970 + base) & 0xffff
            visited.update(result['visited']); offset_cases += 1

    try:
        command_case(legacy, tables, plane=0, offset=0, count=1)
    except ValueError as error:
        legacy_failure = str(error)
    else:
        raise AssertionError('Expected known SLEIGH link failure')
    callsites = []
    for pc, (size, op, args) in model.instructions.items():
        if op == 'bg.jal':
            callsites.append({'address': hex(pc), 'target': args[0],
                              'fallthrough': hex(pc + size),
                              'sleigh_link': hex(pc + size * 2),
                              'sleigh_link_is_boundary': pc + size * 2 in model.instructions})
    ctx = context()
    load_ops = ctx.translate(expanded[0x4173:0x4177], base_address=0x204173, max_instructions=1).ops
    return {
        'status': 'bounded RAM behavior under an explicit instruction-model hypothesis; hardware untested',
        'source_firmware_sha256': json.loads(LAYOUT.read_text())['source_firmware_sha256'],
        'call_policy': model.call_policy, **decoder_identity(),
        'tool_sha256': {name: sha((ROOT / 'scripts' / name).read_bytes()) for name in
                       ('aeon_module_model.py', 'validate_dc9_module.py', 'aeon_subset_assembler.py')},
        'source_layout_sha256': sha(LAYOUT.read_bytes()),
        'command_32_cases': command_cases, 'other_router_cases': route_cases,
        'parent_selector_cases': parent_cases,
        'helper_rewrite_caller_comparisons': len(comparisons),
        'helper_rewrite_compared_state': ['all_32_GPRs', 'final_comparison_flag', 'calls',
                                         'ordered_memory_reads', 'ordered_memory_writes', 'all_mapped_memory'],
        'setter_cases': setter_cases, 'copy_cases': copy_cases, 'record_offset_cases': offset_cases,
        'max_command_32_steps': max_steps, 'modeled_instruction_count': len(model.instructions),
        'visited_instruction_count': len(visited),
        'unvisited_instruction_addresses': [hex(x) for x in sorted(set(model.instructions) - visited)],
        'slot_overread_cases': overreads, 'legacy_call_policy_failure': legacy_failure,
        'callsites': callsites,
        'aliased_halfword_load_pcode': [str(op) for op in load_ops],
        'limitations': [
            'Fallthrough CALL links fit the tested control flow; physical AEON semantics remain unverified',
            'Model also assumes little-endian data, low subregisters, read-before-write loads, r0 zero and no delay slots',
            'Static 128-byte slot stride does not establish transport packet length or number of slots',
            'Counts above 120 read beyond a slot in this path; upstream count validation and reachability are unknown',
            'Other secondary bodies, primary handler, MMIO, interrupts, timing and monitor features are not modeled',
            'No hardware probes, vendor program execution or flashing'],
    }


if __name__ == '__main__':
    report = validate()
    (ROOT / 'analysis/dc9-module-validation.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps({key: report[key] for key in ('command_32_cases', 'other_router_cases', 'setter_cases',
                      'record_offset_cases', 'visited_instruction_count', 'modeled_instruction_count',
                      'legacy_call_policy_failure')}, indent=2))
