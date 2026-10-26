"""Bounded execution of DC9 channel helpers and selected transfer-service paths.

All register addresses hold plain bytes. Breakpoint results are explicitly
partial execution, not completion of the receive service or peripheral model.
"""
from functools import reduce
from operator import xor
import json

from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel, Region
from build_dc9_source_baseline import ROOT, LAYOUT, sha
from validate_dc9_module import inputs, initial_registers, stack_region, SLOT
from validate_dc9_registers import BUS, POINTER
from reconstruct_dc9_receive import SPANS

CONTROL = {0: 0x7d90, 1: 0x7d9c, 2: 0x7dc0, 3: 0x7d78, 7: 0x7dcc}
FRAME = {0: (0x7d84, 2), 1: (0x7de0, 1), 2: (0x7de0, 2), 3: (0x7d6c, 0x20), 7: (0x7d84, 1)}
EVENT = {0: 0x7c24, 1: 0x7c25, 2: 0x7ca8, 3: 0x7d48, 7: 0x7c20}
EVENT_OR = {0: 0x7c3c, 1: 0x7c3d, 2: 0x7cad, 3: 0x7d4d, 7: 0x7c38}
DATA = {0: 0x7c08, 1: 0x7c0c, 2: 0x7ca0, 3: 0x7d40, 7: 0x7c00}
READS = [(0x20c91d, CONTROL, 0x40), (0x20c98a, CONTROL, 0x80),
         (0x20cbd6, EVENT, 0xff), (0x20cc43, DATA, 0xff)]


def region(name, address, size, value=0, writable=True):
    return Region(name, address, bytearray([value] * size), writable)


def registers(slot=0, value=0):
    regs = initial_registers(0x12345678); regs[3:5] = [slot, value]
    return regs


def base_memory(extra=()):
    return Memory([stack_region(), Region('base', POINTER, bytearray(BUS.to_bytes(4, 'little'))), *extra])


def run_leaf(model, entry, slot, value, mapping):
    memory = base_memory([region('bus', BUS + off, 1, byte) for off, byte in mapping.items()])
    before = registers(slot, value)
    result = model.run(entry, memory, before)
    assert result['registers'][1] == before[1]
    assert result['registers'][10:22] == before[10:22]
    return result, memory


def writes(memory, name):
    return [(a, size, value) for n, a, size, value in memory.writes if n == name]


def service_memory(slot, event, error=0):
    bus = region('bus', BUS + 0x7c00, 0x200, 0x51)
    bus.data[EVENT[slot] - 0x7c00] = event
    bus.data[0x1d4] = error
    # Keep the base-pointer word separate from surrounding globals.
    globals_a = region('globals', 0x453b00, 0x1f0, 0xa5)
    globals_b = region('globals', 0x454100, 0x100, 0xa5)
    memory = base_memory([bus, globals_a, globals_b])
    return memory, bus, globals_a, globals_b


def validate():
    expanded, segments, _ = inputs()
    model = ModuleModel(segments, call_policy='fallthrough-hypothesis')
    counts = {}; visited = set()

    def record(name, result):
        counts[name] = counts.get(name, 0) + 1; visited.update(result['visited'])

    for slot in CONTROL:
        for value in range(256):
            for entry, mapping, mask in READS:
                result, memory = run_leaf(model, entry, slot, 0, {mapping[slot]: value})
                assert result['registers'][3] == value & mask
                assert not memory.writes
                record('status_and_data_reads', result)
            off, mask = FRAME[slot]
            result, memory = run_leaf(model, 0x20c9fa, slot, 0, {off: value})
            assert result['registers'][3] == value & mask and not memory.writes
            record('frame_status_reads', result)
            for entry, mask in ((0x20c80d, 8), (0x20c895, 0x30), (0x20cb4e, 4)):
                result, memory = run_leaf(model, entry, slot, 0, {CONTROL[slot]: value})
                assert writes(memory, 'bus') == [(BUS + CONTROL[slot], 1, value | mask)]
                record('control_bit_writes', result)
            for argument in (0, 1, 0x80, 0xff, 0x12345678):
                result, memory = run_leaf(model, 0x20ca70, slot, argument, {EVENT_OR[slot]: value})
                assert writes(memory, 'bus') == [(BUS + EVENT_OR[slot], 1, value | (argument & 255))]
                record('event_or_writes', result)
            result, memory = run_leaf(model, 0x20caf8, slot, value | 0x123400, {DATA[slot] + 1: 0xa5})
            assert writes(memory, 'bus') == [(BUS + DATA[slot] + 1, 1, value)]
            record('data_writes', result)
    leaf_entries = [start for _, start, _, _ in SPANS[:10]]
    for slot in (4, 5, 6, 8, 0xffffffff):
        for entry in leaf_entries:
            result, memory = run_leaf(model, entry, slot, 0xffffffff, {})
            assert not memory.writes and not memory.reads
            if entry in [r[0] for r in READS] + [0x20c9fa]:
                assert result['registers'][3] == 0
            record('unsupported_slot_noop', result)

    for seed in (0, 1, 0x55, 0xff):
        records = region('records', 0x47f3cf, 42, seed)
        flags = region('flags', 0x453b65, 10, seed)
        memory = Memory([records, flags, region('flag', 0x453c38, 1, seed), region('flag', 0x453b62, 1, seed)])
        result = model.run(0x20ccb0, memory, registers())
        assert records.data == bytes([seed]) + bytes(40) + bytes([seed])
        assert flags.data == bytes([seed]) + bytes(8) + bytes([seed])
        assert len(memory.writes) == 50
        record('state_initialization', result)
    for slot in range(8):
        state = region('state', 0x453b94, 8, 0xa5); counter = region('count', 0x45414c, 8, 0x5a)
        memory = Memory([state, counter]); result = model.run(0x20ccf6, memory, registers(slot))
        assert state.data == bytes(0 if i == slot else 0xa5 for i in range(8))
        assert counter.data == bytes(0 if i == slot else 0x5a for i in range(8))
        record('state_clear', result)
        for length in range(129):
            packet = bytes((i * 37 + slot) & 255 for i in range(128))
            memory = Memory([Region('packet', SLOT + slot * 128, bytearray(packet))])
            result = model.run(0x20cd13, memory, registers(slot, length))
            assert result['registers'][3] == reduce(xor, packet[:length], 0x3e)
            assert len(memory.reads) == length and not memory.writes
            record('packet_xor', result)

    for slot in CONTROL:
        memory, bus, ga, gb = service_memory(slot, 0)
        before = [bytes(r.data) for r in (bus, ga, gb)]
        result = model.run(0x20d33c, memory, registers(slot))
        assert [bytes(r.data) for r in (bus, ga, gb)] == before
        assert result['registers'][10:22] == registers(slot)[10:22]
        record('service_no_event', result)
        for event in (1, 4, 0x18, 0x80, 0x98):
            memory, bus, ga, gb = service_memory(slot, event)
            result = model.run(0x20d33c, memory, registers(slot))
            assert writes(memory, 'bus') == [(BUS + DATA[slot] + 1, 1, 0x51)]
            assert writes(memory, 'globals') == [(0x453b76 + slot, 1, 0), (0x453b94 + slot, 1, 0), (0x45414c + slot, 1, 0)]
            assert result['registers'][1] == registers(slot)[1]
            assert result['registers'][10:22] == registers(slot)[10:22]
            record('service_other_event', result)
        for event in (8, 0x10, 0x80, 0x88):
            memory, bus, ga, gb = service_memory(slot, event, error=4)
            result = model.run(0x20d33c, memory, registers(slot))
            expected = [(BUS + 0x7dd4, 1, 7), (BUS + CONTROL[slot], 1, 0x59),
                        (BUS + CONTROL[slot], 1, 0x79)]
            if event & 0x80:
                expected.append((BUS + EVENT_OR[slot], 1, 0xd1))
            expected += [(BUS + 0x7cf8, 1, 0x51), (BUS + 0x7cf8, 1, 0xd1)]
            assert writes(memory, 'bus') == expected
            assert writes(memory, 'globals') == [(0x453b6e + slot, 1, 1), (0x453b94 + slot, 1, 0), (0x45414c + slot, 1, 0)]
            assert result['registers'][1] == registers(slot)[1]
            assert result['registers'][10:22] == registers(slot)[10:22]
            record('service_global_error', result)

    # Execute the actual readiness decision, stopping before either uncertain
    # bookkeeping store path. A breakpoint is not a completed service run.
    for slot in CONTROL:
        for length in range(128):
            for count in sorted({0, 1, 127, 128, 129, 255, length + 1, length + 2}):
                for blocked in (False, True):
                    offset, bit = FRAME[slot]
                    memory = base_memory([region('count', 0x45414c + slot, 1, count),
                                          region('length', 0x454154 + slot, 1, length),
                                          region('bus', BUS + offset, 1, bit if blocked else 0)])
                    regs = registers(slot); regs[12] = slot
                    result = model.run(0x20d608, memory, regs, stop_before=(0x20da60, 0x20d630))
                    ready = length != 0 and count == length + 2 and not blocked
                    assert result['termination'] == 'breakpoint'
                    assert result['stopped_before'] == (0x20da60 if ready else 0x20d630)
                    record('readiness_decision_partial', result)

    for slot in CONTROL:
        for current in (0, 1, 2, 63, 64, 126, 127):
            for previous in (0, 1, 2, 63, 64, 126, 127):
                cur = Region('current', 0x47ef80 + slot * 2, bytearray(current.to_bytes(2, 'little')), True)
                prev = Region('previous', 0x47efb0 + slot * 2, bytearray(previous.to_bytes(2, 'little')))
                regs = registers(slot); regs[12], regs[15] = slot, slot * 2
                result = model.run(0x20d8a3, Memory([cur, prev]), regs,
                                   stop_before=(0x20d90e, 0x20d5d0))
                normalized = current + (128 if current <= previous else 0)
                assert int.from_bytes(cur.data, 'little') == normalized
                assert result['stopped_before'] == 0x20d90e
                assert result['registers'][11] == previous + 1
                record('ring_normalization_partial', result)

    for address in (0x4000, 0x4700, 0x477f, 0, 0xffff, 0x12345678):
        memory = base_memory([region('bus', BUS + 0x780c, 1), region('bus', BUS + 0x7804, 2),
                              region('broadcast', 0x455214, 2), region('retry_flag', 0x453b9e, 1)])
        result = model.run(0x20e47e, memory, registers(address), stop_before=(0x23dead,))
        expected = (address - 0x4000) & 0xffff
        assert writes(memory, 'bus') == [(BUS + 0x7804, 1, expected & 255), (BUS + 0x7805, 1, expected >> 8)]
        assert writes(memory, 'retry_flag') == [(0x453b9e, 1, 1)]
        assert result['registers'][3:6] == [0x3c06, 1, 2]
        record('indirect_read_setup_partial', result)

    return {'status': 'bounded plain-memory helper/service validation; partial paths explicitly stopped',
            **decoder_identity(), 'source_layout_sha256': sha(LAYOUT.read_bytes()),
            'tool_sha256': {n: sha((ROOT / 'scripts' / n).read_bytes()) for n in
                           ('aeon_module_model.py', 'aeon_subset_assembler.py', 'validate_dc9_receive.py')},
            'cases': counts, 'total_cases': sum(counts.values()),
            'visited_instruction_count': len(visited), 'visited_instruction_addresses': [hex(x) for x in sorted(visited)],
            'source_spans': [{'name': n, 'begin': hex(a), 'end_exclusive': hex(b),
                              'size': b-a, 'sha256': sha(expanded[a-0x200000:b-0x200000]),
                              'instruction_count': sum(a <= pc < b for pc in model.instructions),
                              'visited_instruction_count': sum(a <= pc < b for pc in visited)} for n,a,b,_ in SPANS],
            'limitations': ['Plain register bytes do not model peripheral acknowledgement, FIFO, interrupts or transport',
                            'Ready/not-ready paths stop before unresolved bg.sw_1 bookkeeping',
                            'Indirect read tests stop before masked update; busy timeout/retry completion unvalidated',
                            'Fallthrough CALL and low-halfword load/store semantics are explicit hypotheses',
                            'Receive/transmit payload loops and physical device behavior are not fully executed']}


if __name__ == '__main__':
    report = validate()
    (ROOT / 'analysis/dc9-receive-validation.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps({'total_cases': report['total_cases'], 'cases': report['cases'],
                      'visited_instructions': report['visited_instruction_count']}, indent=2))
