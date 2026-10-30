"""Validate the bounded DC9 enable-leaf routines against pinned firmware.

The instruction model uses explicit fallthrough CALL links and ordinary RAM.
Ambiguous ``bg.sw_1`` stores are rejected by the default model and explored
under two named width hypotheses only. This is not hardware validation.
"""
import json

from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel
from build_dc9_source_baseline import ROOT, LAYOUT, sha
from reconstruct_dc9_engine_enable import SPANS
from validate_dc9_module import inputs, stack_region
from validate_dc9_transfer import plain, regs
from validate_dc9_metadata import ENGINES, METADATA, RECORDS
from validate_dc9_masked import POLICIES

ENGINE_STRIDE = 124
METADATA_STRIDE = 176
CHANNEL_STRIDE = 168
ENGINE_WORD = 8
METADATA_STATE = 0x0c
METADATA_SELECTION = 0x12
FLAG_GATE = 0xac
FLAG_BYTE = 0x98
COUNTER_WORD = 0xac
COUNTER_DELTA = 50
ZERO_TEST = 0x23ea03
STATE_WRITE = 0x23ea1e
FLAG_READERS = ((0x23ea6e, 3), (0x23ea99, 5))
COUNTER_SCAN = 0x23eac4
CHANNEL_WORD6C = 0x23eee9


def fixture(*, engine_count=6, metadata_count=6, channel_count=6,
            selections=None, states=None, gates=None, flags=None,
            record_metadata=None, word6c=None, counter_states=None):
    """Map only records touched by the chosen bounded path."""
    selections = {} if selections is None else selections
    states = {} if states is None else states
    gates = {} if gates is None else gates
    flags = {} if flags is None else flags
    record_metadata = {} if record_metadata is None else record_metadata
    word6c = {} if word6c is None else word6c
    counter_states = {} if counter_states is None else counter_states
    engines = bytearray(engine_count * ENGINE_STRIDE)
    metadata = bytearray(metadata_count * METADATA_STRIDE)
    for i, value in states.items():
        metadata[i * METADATA_STRIDE + METADATA_STATE:i * METADATA_STRIDE + METADATA_STATE + 4] = (value & 0xffffffff).to_bytes(4, 'little')
    for i, value in selections.items():
        metadata[i * METADATA_STRIDE + METADATA_SELECTION:i * METADATA_STRIDE + METADATA_SELECTION + 2] = (value & 0xffff).to_bytes(2, 'little')
    for i, value in gates.items():
        metadata[i * METADATA_STRIDE + FLAG_GATE:i * METADATA_STRIDE + FLAG_GATE + 2] = (value & 0xffff).to_bytes(2, 'little')
    for i, value in flags.items():
        metadata[i * METADATA_STRIDE + FLAG_BYTE] = value & 0xff
    for i, value in counter_states.items():
        metadata[i * METADATA_STRIDE + COUNTER_WORD:i * METADATA_STRIDE + COUNTER_WORD + 2] = (value & 0xffff).to_bytes(2, 'little')
    for i, value in word6c.items():
        metadata[i * METADATA_STRIDE + 0x6c:i * METADATA_STRIDE + 0x70] = (value & 0xffffffff).to_bytes(4, 'little')
    channels = bytearray(channel_count * CHANNEL_STRIDE)
    for i, value in record_metadata.items():
        channels[i * CHANNEL_STRIDE + 0x28] = value & 0xff
    return Memory([stack_region(), plain(ENGINES, engines, 'engines'),
                   plain(METADATA, metadata, 'metadata'),
                   plain(RECORDS, channels, 'channels')])


def named(memory, region_name):
    return next(region for region in memory.regions if region.name == region_name)


def validate():
    expanded, segments, _ = inputs()
    strict = ModuleModel(segments, call_policy='fallthrough-hypothesis')
    conditional = {name: ModuleModel(segments, call_policy='fallthrough-hypothesis',
                                     store_policy=name) for name in POLICIES}
    counts = {}
    conditional_counts = {name: {} for name in POLICIES}
    visited = set()

    def record(group, name, result):
        target = counts if group is None else conditional_counts[group]
        target[name] = target.get(name, 0) + 1
        visited.update(result['visited'])
        assert result['termination'] == 'return'

    # Return 1 exactly for a zero metadata word at +0x0c; exercise both sides
    # of the zero boundary and preserve the input word independently.
    for value in (0, 1, 0x7fffffff, 0x80000000, 0xffffffff):
        memory = fixture(states={0: value})
        before = regs(0)
        result = strict.run(ZERO_TEST, memory, before)
        assert result['registers'][3] == int(value == 0)
        assert named(memory, 'metadata').data[0x0c:0x10] == value.to_bytes(4, 'little')
        assert [r for r in memory.reads if r[0] != 'stack'] == [('metadata', METADATA + 0x0c, 4)]
        assert all(r[0] == 'stack' for r in memory.writes)
        record(None, 'metadata_zero_predicate_returns', result)

    # State 2 selects engine word 8 value 5; state 4 selects value 2; other
    # states select value 1. The metadata word is written before dispatch.
    for index in range(6):
        selection = (1 << 0) | (1 << 2) | (1 << 5)
        for state, selected in ((2, 5), (4, 2), (0x12345678, 1)):
            memory = fixture(selections={index: selection})
            before = regs(index, state)
            result = strict.run(STATE_WRITE, memory, before)
            meta = named(memory, 'metadata').data
            engine_data = named(memory, 'engines').data
            assert int.from_bytes(meta[index * METADATA_STRIDE + 0x0c:index * METADATA_STRIDE + 0x10], 'little') == state
            expected = bytearray(6 * ENGINE_STRIDE)
            for engine in (0, 2, 5):
                expected[engine * ENGINE_STRIDE + ENGINE_WORD:engine * ENGINE_STRIDE + ENGINE_WORD + 4] = selected.to_bytes(4, 'little')
            assert engine_data == expected
            assert result['registers'][23] == selected
            assert result['registers'][24] == ENGINE_STRIDE
            assert memory.writes == [
                ('metadata', METADATA + index * METADATA_STRIDE + 0x0c, 4, state),
                *(('engines', ENGINES + engine * ENGINE_STRIDE + ENGINE_WORD, 4, selected)
                  for engine in (0, 2, 5))]
            record(None, 'selected_engine_state_returns', result)

    # Exercise empty, low-bit, high-bit, and full 16-bit masks on a deliberately
    # synthetic 16-record RAM mapping. This checks the halfword selector limit,
    # ascending engine order, untouched bytes, and the asymmetric r23/r24
    # clobbers visible in the recovered instructions.
    for mask in (0, 1, 0x8000, 0xffff):
        for state, selected in ((2, 5), (4, 2), (0, 1)):
            memory = fixture(engine_count=16, selections={0: mask}, states={0: 0})
            engine_data = named(memory, 'engines').data
            engine_data[:] = b'\xa5' * len(engine_data)
            before = regs(0, state)
            result = strict.run(STATE_WRITE, memory, before)
            expected_engine = bytearray(b'\xa5' * (16 * ENGINE_STRIDE))
            expected_writes = [('metadata', METADATA + 0x0c, 4, state)]
            for engine in range(16):
                if mask & (1 << engine):
                    offset = engine * ENGINE_STRIDE + ENGINE_WORD
                    expected_engine[offset:offset + 4] = selected.to_bytes(4, 'little')
                    expected_writes.append(('engines', ENGINES + offset, 4, selected))
            assert bytes(engine_data) == bytes(expected_engine)
            assert memory.writes == expected_writes
            assert result['registers'][23] == selected
            assert result['registers'][24] == (ENGINE_STRIDE if mask else before[24])
            assert result['registers'][1] == before[1]
            record(None, 'state_write_mask_boundary_returns', result)

    # Both guarded readers accept index 5, reject index 6, and require a
    # nonzero halfword at +0xac before loading the relevant byte-0x98 bit.
    for entry, bit in FLAG_READERS:
        for index, gate in ((0, 0), (0, 1), (5, 1), (6, 1), (0xffffffff, 1)):
            for flag in (0, 1 << bit, 0xff):
                memory = fixture(gates={index: gate} if index < 6 else {},
                                 flags={index: flag} if index < 6 else {})
                result = strict.run(entry, memory, regs(index))
                expected = int(index <= 5 and gate != 0 and (flag >> bit) & 1 != 0)
                assert result['registers'][3] == expected
                reads = [r for r in memory.reads if r[0] != 'stack']
                if index > 5:
                    assert reads == []
                elif gate == 0:
                    assert reads == [('metadata', METADATA + index * METADATA_STRIDE + FLAG_GATE, 2)]
                else:
                    assert reads == [('metadata', METADATA + index * METADATA_STRIDE + FLAG_GATE, 2),
                                     ('metadata', METADATA + index * METADATA_STRIDE + FLAG_BYTE, 1)]
                record(None, 'guarded_metadata_flag_returns', result)

    # Caller contract: channel record byte +0x28 selects metadata, whose word
    # +0x6c is returned. The callee is exercised across six valid mappings.
    for channel in range(6):
        metadata_index = (channel + 2) % 6
        value = 0xa0b00000 | channel
        memory = fixture(record_metadata={channel: metadata_index}, word6c={metadata_index: value})
        result = strict.run(CHANNEL_WORD6C, memory, regs(channel))
        assert result['registers'][3] == value
        assert [r for r in memory.reads if r[0] != 'stack'] == [
            ('channels', RECORDS + channel * CHANNEL_STRIDE + 0x28, 1),
            ('metadata', METADATA + metadata_index * METADATA_STRIDE + 0x6c, 4)]
        record(None, 'channel_metadata_word6c_returns', result)

    # Counter routine scans exactly six metadata records, selecting word0c==4
    # and nonzero halfword +0xac. bg.sw_1 is deliberately unresolved in strict
    # mode and then run under both explicitly labeled store-width hypotheses.
    selected = {0: 4, 1: 4, 2: 3, 3: 4, 4: 4, 5: 4}
    raw_values = {0: 0x32, 1: 0x33, 2: 0x44, 3: 1, 4: 0xffff, 5: 0}
    gate_values = {0: 1, 1: 2, 2: 3, 3: 4, 4: 5, 5: 6}
    for policy, model in conditional.items():
        memory = fixture(states=selected, counter_states=raw_values, gates=gate_values)
        # Seed bytes adjacent to the counter to expose policy width differences.
        metadata = named(memory, 'metadata').data
        for i in range(6):
            metadata[i * METADATA_STRIDE + 0xae:i * METADATA_STRIDE + 0xb0] = b'\xa5\x5a'
        before_writes = len(memory.writes)
        result = model.run(COUNTER_SCAN, memory, regs())
        after = named(memory, 'metadata').data
        expected = {0: 0, 1: 0x33 - COUNTER_DELTA & 0xffff,
                    3: 1 - COUNTER_DELTA & 0xffff,
                    4: 0xffff - COUNTER_DELTA & 0xffff}
        for i in range(6):
            value = int.from_bytes(after[i * METADATA_STRIDE + 0xac:i * METADATA_STRIDE + 0xae], 'little')
            assert value == expected.get(i, raw_values[i])
            neighbor = after[i * METADATA_STRIDE + 0xae:i * METADATA_STRIDE + 0xb0]
            if policy == 'sleigh-store' and i in expected:
                raw = raw_values[i]
                word = (raw - COUNTER_DELTA) & 0xffffffff
                assert neighbor == word.to_bytes(4, 'little')[2:]
            else:
                assert neighbor == b'\xa5\x5a'
        metadata_reads = [address for name, address, _ in memory.reads if name == 'metadata']
        expected_reads = [METADATA + i * METADATA_STRIDE + 0x0c for i in range(6)]
        expected_reads += [METADATA + i * METADATA_STRIDE + 0xac for i in (0, 1, 3, 4, 5)]
        assert sorted(metadata_reads) == sorted(expected_reads)
        stores = [w for w in memory.writes[before_writes:] if w[0] == 'metadata']
        assert len(stores) == 4
        assert all(address in {METADATA + i * METADATA_STRIDE + 0xac for i in expected}
                   for _, address, _, _ in stores)
        record(policy, 'six_record_conditional_counter_scan_returns', result)

    strict_rejection = 0
    memory = fixture(states={0: 4}, counter_states={0: 0x33}, gates={0: 1})
    metadata_before = bytes(named(memory, 'metadata').data)
    try:
        strict.run(COUNTER_SCAN, memory, regs())
    except ValueError as error:
        assert 'unresolved store' in str(error)
        strict_rejection = 1
    else:
        raise AssertionError('Strict model accepted the unresolved bg.sw_1 counter store')
    assert named(memory, 'metadata').data == metadata_before
    assert all(name == 'stack' for name, *_ in memory.writes)

    layout = json.loads(LAYOUT.read_text())
    return {
        'status': 'bounded instruction-model returns against pinned firmware; hardware untested',
        'source_firmware_sha256': layout['source_firmware_sha256'],
        'source_layout_sha256': sha(LAYOUT.read_bytes()),
        **decoder_identity(),
        'call_policy': strict.call_policy,
        'cases': counts,
        'strict_cases': sum(counts.values()),
        'conditional_cases_by_policy': conditional_counts,
        'conditional_cases': sum(sum(v.values()) for v in conditional_counts.values()),
        'strict_ambiguous_store_rejections': strict_rejection,
        'visited_instruction_count': len(visited),
        'source_spans': [
            {'name': name, 'address': hex(start), 'end_exclusive': hex(end),
             'size': end - start,
             'sha256': sha(expanded[start - 0x200000:end - 0x200000]),
             'visited_instructions': sum(start <= pc < end for pc in visited),
             'observed_purpose': purpose}
            for name, start, end, purpose in SPANS],
        'assumptions': [
            'Fallthrough CALL links, little-endian loads and stores, low subregister behavior, and ordinary RAM are instruction-model assumptions.',
            'The two bg.sw_1 counter write widths are alternatives, not established ISA or firmware facts.',
            'The six-record metadata scan and byte/word offsets are taken from the byte-exact recovered disassembly.',
            'Metadata flag fields are reported as offsets and bit positions; higher-level field meaning is unresolved.',
            'No hardware, peripheral, interrupt, timing, or vendor application behavior is modeled.'],
        'key_offsets': {'engine_stride': ENGINE_STRIDE, 'metadata_stride': METADATA_STRIDE,
                        'channel_stride': CHANNEL_STRIDE, 'engine_word': ENGINE_WORD,
                        'metadata_state': METADATA_STATE, 'metadata_selection': METADATA_SELECTION,
                        'metadata_flag_gate': FLAG_GATE, 'metadata_flag_byte': FLAG_BYTE,
                        'counter_halfword': COUNTER_WORD, 'counter_delta_decimal': COUNTER_DELTA},
        'tools_sha256': {name: sha((ROOT / 'scripts' / name).read_bytes()) for name in (
            'validate_dc9_enable_leaf.py', 'reconstruct_dc9_engine_enable.py',
            'aeon_module_model.py', 'aeon_subset_assembler.py')},
    }


if __name__ == '__main__':
    report = validate()
    (ROOT / 'analysis/dc9-enable-leaf-validation.json').write_text(json.dumps(report, indent=2) + '\n')
    print(f"Enable leaf: {report['strict_cases']} strict cases, {report['conditional_cases']} conditional cases")
