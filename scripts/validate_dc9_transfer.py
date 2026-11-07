"""Validate transfer dependencies, separating strict execution from store hypotheses.

No peripheral behavior is simulated: addressed registers are plain bytes.
Conditional results must never be reported as physical CPU or device validation.
"""
from functools import reduce
from operator import xor
import json

from aeon_helper_emulator import context, decoder_identity
from aeon_module_model import Memory, ModuleModel, Region
from build_dc9_source_baseline import ROOT, LAYOUT, sha
from validate_dc9_module import inputs, initial_registers, stack_region, SLOT
from validate_dc9_receive import BUS, CONTROL, DATA
from reconstruct_dc9_transfer import SPANS

TABLE = 0x3b4950
COUNTER = 0x4551a8
SETTING = 0x3cb308


def regs(*arguments):
    result = initial_registers(0x31415926)
    result[3:3 + len(arguments)] = arguments
    return result


def plain(address, data, name, writable=True):
    return Region(name, address, bytearray(data), writable)


def fixture(expanded, slot, packet):
    globals_data = bytearray(0x1800)
    globals_data[0x1f0:0x1f4] = BUS.to_bytes(4, 'little')  # base pointer 0x453cf0
    globals_data[0x16a8:0x16ac] = bytes.fromhex('0000a5a5')
    globals_data[0x64c + slot] = len(packet)  # received count at 0x45414c
    globals_data[0x8a + slot] = slot
    raw_table = expanded[TABLE - 0x200000:TABLE - 0x200000 + 6 * 176]
    channel = next((i for i in range(6) if raw_table[i * 176] == slot + 1), 6)
    globals_data[0x7e + slot] = channel
    packet = bytes(packet) + bytes([0xa5] * (128 - len(packet)))
    memory = Memory([stack_region(), plain(0x453b00, globals_data, 'globals'),
                     plain(BUS + 0x7000, bytes(0x1000), 'bus'),
                     plain(BUS + 0x203034, b'\0', 'lock'),
                     plain(TABLE, raw_table, 'channel_table', False),
                     plain(SLOT + slot * 128, packet, 'packet'),
                     plain(0x47efc0 + slot * 128, bytes([0x5a] * 128), 'shadow'),
                     plain(0x47ef90 + slot * 4, bytes(4), 'tx_pointer'),
                     plain(0x47eb70 + slot * 2, bytes(2), 'tx_remaining'),
                     plain(0x342294, bytes([0x11, 0x22, 0x33, 0, 0, 0, 1]), 'format_state'),
                     plain(SETTING, bytes.fromhex('a5a5a5a5'), 'setting')])
    return memory


def named(memory, name):
    return next(r for r in memory.regions if r.name == name)


def indirect_payloads(memory):
    address = 0; output = []
    for name, target, size, value in memory.writes:
        if name != 'bus':
            continue
        if target == BUS + 0x7804:
            address = (address & 0xff00) | value
        elif target == BUS + 0x7805:
            address = (address & 255) | (value << 8)
        elif target == BUS + 0x7800:
            output.append((address, value))
    return output


class ScriptedReads(Memory):
    """Explicit external read stimuli, not an interrupt or peripheral emulator."""
    def __init__(self, regions, sequences):
        super().__init__(regions)
        self.sequences = {address: list(values) for address, values in sequences.items()}
        self.scripted_reads = []

    def read(self, address, size):
        value = super().read(address, size)
        if address in self.sequences:
            if size != 1 or not self.sequences[address]:
                raise ValueError('Unexpected scripted read')
            value = self.sequences[address].pop(0)
            self.scripted_reads.append((address, value))
        return value


def validate():
    expanded, segments, _ = inputs()
    strict = ModuleModel(segments, call_policy='fallthrough-hypothesis')
    policies = {name: ModuleModel(segments, call_policy='fallthrough-hypothesis', store_policy=name)
                for name in ('sleigh-store', 'halfword-lane-hypothesis')}
    counts = {}; visited = set(); conditional = {p: {} for p in policies}

    def record(name, result, policy=None):
        target = counts if policy is None else conditional[policy]
        target[name] = target.get(name, 0) + 1
        if policy is None:
            visited.update(result['visited'])
        assert result['store_policy'] == (policy or 'reject')
        assert result['termination'] == 'return'

    # Copy inputs vary alignment and cross the byte/word/bulk thresholds.
    for size in (*range(0, 34), 63, 64, 65, 127, 128):
        for source_shift in range(4):
            for destination_shift in range(4):
                source = 0x600004 + source_shift; destination = 0x601004 + destination_shift
                data = bytes((i * 29 + size) & 255 for i in range(size))
                source_region = plain(source - 1, bytes([0x91]) + data + bytes([0x92]), 'source', False)
                dest_region = plain(destination - 1, bytes([0x93]) + bytes([0xa5] * size) + bytes([0x94]), 'destination')
                memory = Memory([source_region, dest_region]); before = regs(destination, source, size)
                result = strict.run(0x2aab1e, memory, before)
                assert dest_region.data == bytes([0x93]) + data + bytes([0x94])
                assert result['registers'][3] == destination
                assert result['registers'][10:] == before[10:]
                assert sum(n for _, _, n in memory.reads) == size
                assert sum(n for _, _, n, _ in memory.writes) == size
                record('memory_copy', result)

    raw_table = expanded[TABLE - 0x200000:TABLE - 0x200000 + 6 * 176]
    keys = [raw_table[i * 176] for i in range(6)]
    for variant in (keys, [1] * 6, [0] * 6, [255, 8, 7, 6, 5, 4]):
        table = bytearray(6 * 176)
        for i, key in enumerate(variant): table[i * 176] = key
        for slot in (*range(256), 0xfffffffe, 0xffffffff):
            memory = Memory([plain(TABLE, table, 'channel_table', False)])
            result = strict.run(0x20c711, memory, regs(slot))
            value = (slot + 1) & 0xffffffff
            expected = variant.index(value) if value in variant else 6
            assert result['registers'][3] == expected
            assert len(memory.reads) == min(expected + 1, 6) and not memory.writes
            record('channel_lookup', result)

    for slot in range(8):
        for state in (0, 1, 5, 7, 255):
            memory = Memory([stack_region(), plain(0x453b76 + slot, bytes([state]), 'state')])
            before = regs(slot); result = strict.run(0x20cd4a, memory, before)
            assert named(memory, 'state').data == b'\0'
            assert result['registers'][1] == before[1] and result['registers'][10:12] == before[10:12]
            record('wait_clear_without_delay', result)

    for slot in range(8):
        for count, header in ((0, 1), (0, 127), (1, 0), (1, 128), (255, 0)):
            memory = Memory([stack_region(), plain(SLOT + slot * 128, bytes([header]), 'packet'),
                             plain(0x45414c + slot, bytes([count]), 'count')])
            result = strict.run(0x20d2b7, memory, regs(slot))
            assert all(name == 'stack' for name, *_ in memory.writes)
            record('followup_early_return', result)

    # Entire default/reply formatting paths that do not execute ambiguous bg.sh.
    for slot in (0, 1, 2, 3):
        for selector in (0, 1, 2, 3, 0xcc, 0xff):
            for command in (0, 0x11, 0x13, 0xff):
                packet = bytes([4, selector, command, 0x34, 0x56, 0x78])
                memory = fixture(expanded, slot, packet)
                result = strict.run(0x26bdd1, memory, regs(slot))
                out = named(memory, 'packet').data
                if selector == 1:
                    assert out[:9] == bytes([0x88, 2, 0, command, 0, 0, 0, 0, 0])
                    assert result['registers'][3] == 8
                elif selector == 3:
                    assert out[0] == 0x80 and out[2] == 0
                    assert out[1] == 3 and out[3:6] == packet[3:6]
                else:
                    assert out[:len(packet)] == packet
                record('response_format_unambiguous', result)

    observations = []
    for policy, model in policies.items():
        # Identical bit-update contract, differing treatment of neighboring bytes.
        for initial in (0, 1, 0x55, 0x80, 0xff):
            for set_bits in (0, 1):
                for mask in (0, 1, 0x20, 0xff):
                    memory = fixture(expanded, 0, b'\x04\0\0\0\0\0')
                    named(memory, 'bus').data[0x80c] = initial
                    result = model.run(0x23dead, memory, regs(0x3c06, set_bits, mask))
                    assert named(memory, 'bus').data[0x80c] == (initial | mask if set_bits else initial & ~mask)
                    expected_counter = bytes.fromhex('00000000' if policy == 'sleigh-store' else '0000a5a5')
                    assert named(memory, 'globals').data[0x16a8:0x16ac] == expected_counter
                    assert named(memory, 'lock').data == b'\0'
                    record('masked_update_conditional', result, policy)
        for argument in (0x4000, 0x4700, 0x4fff, 0, 0xffff, 0x12345678):
            for data in (0, 0xff, 0x12345678):
                memory = fixture(expanded, 0, b'\x04\0\0\0\0\0')
                before = regs(argument, data)
                result = model.run(0x20e3be, memory, before)
                assert indirect_payloads(memory) == [((argument - 0x4000) & 0xffff, data & 255)]
                assert result['registers'][1] == before[1] and result['registers'][10:13] == before[10:13]
                record('indirect_write_conditional', result, policy)
        for word in (0, 1, 0x12345678, 0xffffffff):
            memory = fixture(expanded, 0, b'\x04\0\0\0\0\0')
            result = model.run(0x20e43a, memory, regs(word))
            assert indirect_payloads(memory) == [(0xfff - i, (word >> (i * 8)) & 255) for i in range(4)]
            record('indirect_write32_conditional', result, policy)

        for address in (0x4000, 0x4700, 0x477f, 0, 0xffff, 0x12345678):
            for value in (0, 0xa5):
                memory = fixture(expanded, 0, b'\x04\0\0\0\0\0')
                named(memory, 'bus').data[0x801] = value
                before = regs(address)
                result = model.run(0x20e47e, memory, before)
                assert result['registers'][3] == value
                assert named(memory, 'globals').data[0x9e] == 0
                assert result['registers'][1] == before[1] and result['registers'][10:13] == before[10:13]
                record('indirect_read_conditional', result, policy)
        base = fixture(expanded, 0, b'\x04\0\0\0\0\0')
        memory = ScriptedReads(base.regions, {BUS + 0x7801: [0x11, 0x22], 0x453b9e: [0, 1]})
        result = model.run(0x20e47e, memory, regs(0x4700))
        assert result['registers'][3] == 0x22
        assert memory.scripted_reads == [(BUS + 0x7801, 0x11), (0x453b9e, 0),
                                         (BUS + 0x7801, 0x22), (0x453b9e, 1)]
        assert all(not remaining for remaining in memory.sequences.values())
        assert named(memory, 'globals').data[0x9e] == 0
        record('indirect_read_scripted_retry_conditional', result, policy)

        # Setter/getter pair reveals an address-lane inconsistency in SLEIGH.
        for value in (0, 24, 25, 50, 100, 101, 255):
            memory = fixture(expanded, 0, bytes([4, 3, 0x12, 0, value, 0]))
            setter = model.run(0x26bdd1, memory, regs(0))
            setting_after = bytes(named(memory, 'setting').data)
            named(memory, 'packet').data[:3] = bytes([2, 1, 0x12])
            getter = model.run(0x26bdd1, memory, regs(0))
            observed = named(memory, 'packet').data[8]
            expected = (25 if value <= 24 else value) if value <= 100 and policy == 'halfword-lane-hypothesis' else 115
            assert observed == expected
            observations.append({'policy': policy, 'input': value, 'setting_bytes': setting_after.hex(), 'getter_byte': observed})
            record('setting_setter_conditional', setter, policy)
            record('setting_getter_conditional', getter, policy)

        # Complete follow-up pipeline, including copy, formatting, checksum,
        # indirect writes, transmit metadata/control and final marker.
        for slot in (0, 1, 2, 3):
            for length, selector in ((4, 0), (4, 1), (4, 3), (20, 0), (126, 0)):
                original = bytearray((i * 13 + 0x31) & 255 for i in range(length + 2))
                original[:3] = bytes([length, selector, 0x11])
                memory = fixture(expanded, slot, original)
                before = regs(slot)
                result = model.run(0x20d2b7, memory, before, max_steps=150000)
                output = named(memory, 'packet').data
                assert named(memory, 'shadow').data[:len(original)] == original
                response_length = output[0] & 127
                assert output[response_length + 1] == reduce(xor, output[:response_length + 1], 0x3e)
                count = response_length + 2
                buffer = {0: 0x300, 1: 0x380, 2: 0x400, 3: 0x480}[slot]
                expected = [(0x700 + buffer, 0x6e)]
                expected += [(0x700 + buffer + i + 1, output[i]) for i in range(min(count, 127))]
                assert indirect_payloads(memory) == expected
                assert int.from_bytes(named(memory, 'tx_remaining').data, 'little') == (127 if count > 127 else 0)
                assert int.from_bytes(named(memory, 'tx_pointer').data, 'little') == SLOT + slot * 128
                assert named(memory, 'bus').data[CONTROL[slot] - 0x7000] & 4
                assert named(memory, 'bus').data[DATA[slot] + 1 - 0x7000] == 0x6e
                assert result['registers'][1] == before[1]
                assert result['registers'][10:18] == before[10:18]
                record('followup_pipeline_conditional', result, policy)

    ctx = context(); store_rows = []
    for address in (0x26bedf, 0x26beec, 0x26bf15):
        code = expanded[address - 0x200000:address - 0x200000 + 4]
        row = ctx.disassemble(code, base_address=address).instructions[0]
        translated = ctx.translate(code, base_address=address, max_instructions=1).ops
        store_rows.append({'address': hex(address), 'bytes': code.hex(), 'instruction': row.mnem + ' ' + row.body,
                           'pcode': [str(op) for op in translated],
                           'store_source_varnodes': [{'space': op.inputs[2].space.name,
                                                      'offset': hex(op.inputs[2].offset), 'size': op.inputs[2].size}
                                                     for op in translated if op.opcode.name == 'STORE']})
    flag_candidates = []
    offset = 0
    while True:
        offset = expanded.find(bytes.fromhex('3b9e'), offset + 1)
        if offset < 0:
            break
        begin = offset - 2
        if begin < 0x3800:
            continue
        code = expanded[begin:begin + 4]
        if int.from_bytes(code, 'big') & 0xfc000000 not in (0xf0000000, 0xf8000000):
            continue
        row = ctx.disassemble(code, base_address=0x200000 + begin).instructions[0]
        flag_candidates.append({'address': hex(row.addr.offset), 'bytes': code.hex(),
                                'instruction': row.mnem + ' ' + row.body})
    return {'status': 'strict helper validation and separate conditional store-policy experiments',
            **decoder_identity(), 'source_layout_sha256': sha(LAYOUT.read_bytes()),
            'strict_store_policy': 'reject', 'strict_cases': counts, 'strict_total': sum(counts.values()),
            'conditional_cases': conditional, 'conditional_total': sum(sum(x.values()) for x in conditional.values()),
            'conditional_results_are_hardware_validation': False,
            'store_policy_definitions': {
                'reject': 'Default: no execution of bg.sw_1 or bg.sh',
                'sleigh-store': 'Literal SLEIGH source store shapes: sw_1 writes 32 bits at decoded address; sh writes source bits 16..31 at decoded address',
                'halfword-lane-hypothesis': 'sw_1 writes low 16 bits at decoded address; sh writes low 16 bits two bytes beyond decoded address',
                'common_assumptions': 'Both run within the existing little-endian data/fallthrough-CALL model; neither executes full SLEIGH P-code',
                'decoder_endian_declaration': 'big'},
            'raw_channel_keys': keys, 'setting_roundtrip_observations': observations,
            'store_load_evidence': store_rows,
            'retry_flag_direct_displacement_candidates': flag_candidates,
            'retry_flag_scan_limit': 'Only direct wide byte accesses with displacement 0x3b9e; computed pointers/aliases are not excluded',
            'strict_visited_instruction_addresses': [hex(x) for x in sorted(visited)],
            'source_spans': [{'name':n,'begin':hex(a),'end_exclusive':hex(b),'sha256':sha(expanded[a-0x200000:b-0x200000])} for n,a,b,_ in SPANS],
            'tool_sha256': {n:sha((ROOT/'scripts'/n).read_bytes()) for n in
                           ('aeon_module_model.py','aeon_subset_assembler.py','validate_dc9_transfer.py')},
            'limitations': ['Neither store policy has independent physical ISA confirmation',
                            'Plain register bytes do not model bus completion, FIFO, acknowledgement or asynchronous flag updates',
                            'Conditional full pipeline covers selected inputs; this is not hardware or full firmware validation',
                            'Delay helper 0x2420bb remains unresolved; flag-6 wait path is not completed',
                            'Current lookup table keys are archived data, not proof of runtime channel assignment']}


if __name__ == '__main__':
    report = validate()
    (ROOT/'analysis/dc9-transfer-validation.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps({k:report[k] for k in ('strict_total','conditional_total','strict_cases','conditional_cases')},indent=2))
