"""Bounded independent fixtures for recovered channel helper leaves.

These are plain-memory instruction-model checks under the repository's stated
AEON hypotheses. External 0x22701c is always left unresolved and stopped at.
"""
from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel
from build_dc9_source_baseline import ROOT, LAYOUT, load_original, sha
from reconstruct_dc9_channel_update import SPANS
from validate_dc9_module import inputs, stack_region
from validate_dc9_transfer import plain, regs

CHANNELS = 0x4821ec
ENGINE = 0x47fa9c
GLOBAL = 0x47fa9c
METADATA = 0x3b4950
RETURN = 0xfffffff0


def channel_memory(*, count=4, index=0, words=None, global_words=None,
                   engine_slots=None, engine_records=13, stack=False):
    records = bytearray(count * 168)
    if words:
        for offset, value, width in words:
            records[offset:offset + width] = int(value).to_bytes(width, 'little')
    regions = [plain(CHANNELS, records, 'channels')]
    if global_words:
        globals_data = bytearray(0x200)
        for offset, value in global_words.items():
            globals_data[offset:offset + 4] = int(value).to_bytes(4, 'little')
        regions.append(plain(GLOBAL, globals_data, 'globals'))
    if engine_slots is not None:
        data = bytearray(engine_records * 124)
        for slot, value in enumerate(engine_slots):
            data[slot * 124:slot * 124 + 4] = int(value).to_bytes(4, 'little')
        regions.append(plain(0x47fd10, data, 'allocation'))
    if stack:
        regions.append(stack_region())
    return Memory(regions)


def validate():
    expanded, segments, _ = inputs()
    model = ModuleModel(segments, call_policy='fallthrough-hypothesis')
    counts = {}
    visited = set()

    def note(name, result):
        counts[name] = counts.get(name, 0) + 1
        visited.update(result['visited'])

    # 222843: geometry invalidation and exact equal-boundary store value.
    for x, height, expected35, expected36, r1 in (
        (0x800, 0x100, 0, 0, 0x123456ab),
        (0x700, 0x100, 1, 0xab, 0x123456ab),
        (0x700, 0x102, 1, 0, 0x123456ab),
    ):
        memory = channel_memory(words=[(0x18, x, 2), (0x1c, height, 2)])
        before = regs(0); before[1] = r1
        result = model.run(0x222843, memory, before)
        assert result['termination'] == 'return'
        assert memory.read(CHANNELS + 0x35, 1) == expected35
        assert memory.read(CHANNELS + 0x36, 1) == expected36
        if expected35:
            assert [(addr, value) for name, addr, width, value in memory.writes
                    if name == 'channels'] == [(CHANNELS + 0x35, 1), (CHANNELS + 0x36, expected36)]
        note('state_check_geometry', result)

    # 222ace/222af1: four distinct status outcomes each and untouched neighbors.
    for address, cases in (
        (0x222ace, ((0, 9, 1), (1, 0, 0), (1, 7, 0), (1, 2, 4))),
        (0x222af1, ((0, 9, 3), (1, 0, 2), (1, 7, 2), (1, 2, 4))),
    ):
        for first, second, expected in cases:
            firstoff, secondoff = ((0x84, 8) if address == 0x222ace else (0x17c, 0x100))
            memory = channel_memory(count=1, global_words={firstoff: first, secondoff: second})
            result = model.run(address, memory, regs(0))
            assert result['termination'] == 'return' and result['registers'][3] == expected
            assert not memory.writes
            note('global_status_selectors', result)

    # 2229f8: set rectangle with exact ordered writes, preserve neighbor sentinels.
    for engine, channel, channel_rect, oldmask, expected_left, expected_right in (
        (2, 1, (0x100, 0x100), 0, 0x100, 0x100),
        (3, 2, (0x200, 0x100), 0, 0x200, 0x100),
        (2, 1, (0x800, 0x100), 0, 0x80, 0x100),
        (2, 1, (0x700, 0x200), 0, 0, 0x180),
        (1, 1, (0x700, 0x200), 0, 0x700, 0x80),
        (2, 1, (0x100, 0x100), 1, 0x100, 0x100),
    ):
        records = bytearray(4 * 168)
        base = channel * 168
        # The routine copies full words from +0x18/+0x1c; use nonzero upper
        # halves so the independent oracle checks the full-width copy.
        rect_x_word = channel_rect[0] | 0x13570000
        rect_h_word = channel_rect[1] | 0x24680000
        records[base + 0x18:base + 0x1c] = rect_x_word.to_bytes(4, 'little')
        records[base + 0x1c:base + 0x20] = rect_h_word.to_bytes(4, 'little')
        records[base + 0x29] = 0x5a
        engine_data = bytearray(13 * 124)
        ebase = engine * 124
        records[base + 0x2a:base + 0x2c] = oldmask.to_bytes(2, 'little')
        engine_data[ebase + 0x0d:ebase + 0x0e] = b'\xaa'
        engine_data[ebase + 0x0f:ebase + 0x10] = b'\xbb'
        engine_data[ebase + 0x0c:ebase + 0x0d] = b'\xcc'
        engine_data[ebase + 0x14:ebase + 0x18] = b'\xdd' * 4
        engine_data[ebase + 0x48:ebase + 0x4c] = b'\xee' * 4
        engine_data[ebase + 0x54:ebase + 0x58] = b'\xff' * 4
        memory = Memory([plain(CHANNELS, records, 'channels'), plain(ENGINE, engine_data, 'engines')])
        result = model.run(0x2229f8, memory, regs(engine, channel))
        assert result['termination'] == 'return'
        baseaddr = ENGINE + ebase
        expected = [(CHANNELS + base + 0x2a, 2, oldmask | 1 << engine),
                    (baseaddr + 0x10, 1, channel), (baseaddr + 8, 4, 1),
                    (baseaddr + 0x4c, 4, rect_x_word),
                    (baseaddr + 0x50, 4, rect_h_word),
                    (baseaddr + 0x0e, 1, 0x5a)]
        # The post-copy clamps update halfwords only; neighboring copied upper
        # halves remain intact. The source uses unsigned comparison at 0x77f.
        if channel_rect[0] > 0x77f:
            expected.append((baseaddr + 0x4c, 2, (channel_rect[0] - 0x780) & 0xffff))
        elif channel_rect[0] + channel_rect[1] > 0x780:
            if engine & 2:
                expected.extend(((baseaddr + 0x4c, 2, 0),
                                 (baseaddr + 0x50, 2, expected_right)))
            else:
                expected.append((baseaddr + 0x50, 2, expected_right))
        actual = [(addr, width, value) for name, addr, width, value in memory.writes]
        assert actual == expected
        assert memory.read(baseaddr + 0x0d, 1) == 0xaa and memory.read(baseaddr + 0x0f, 1) == 0xbb
        assert memory.read(baseaddr + 0x0c, 1) == 0xcc and memory.read(baseaddr + 0x14, 4) == 0xdddddddd
        assert memory.read(baseaddr + 0x48, 4) == 0xeeeeeeee and memory.read(baseaddr + 0x54, 4) == 0xffffffff
        assert memory.read(CHANNELS + base + 0x2a, 2) == oldmask | 1 << engine
        note('rectangle_order_and_sentinels', result)

    # 222b65 allocator: scans engine[5..12].+8; first free, exhaustion, fault.
    for slots, expected in (([1, 1, 0, 1, 1, 1, 1, 1], 7), ([1] * 8, 13)):
        memory = channel_memory(engine_slots=slots)
        result = model.run(0x222b65, memory, regs())
        assert result['termination'] == 'return' and result['registers'][3] == expected
        note('allocator_available_or_exhausted', result)
    short = channel_memory(engine_slots=[1], engine_records=1)
    try:
        model.run(0x222b65, short, regs())
        raise AssertionError('expected allocator mapping fault')
    except ValueError as exc:
        assert 'Unmapped memory access' in str(exc)

    # 227145: exhaust table returns zero; success prefix updates metadata then
    # stops before unresolved 22701c, preserving its call arguments.
    records = bytearray(4 * 168)
    metadata = bytearray(4 * 176)
    allocations = bytearray(13 * 124)
    for slot in range(5, 13):
        allocations[slot * 124 + 8:slot * 124 + 12] = (1).to_bytes(4, 'little')
    memory = Memory([plain(CHANNELS, records, 'channels'),
                     plain(METADATA, metadata, 'metadata'),
                     plain(ENGINE, allocations, 'engines'), stack_region()])
    result = model.run(0x227145, memory, regs(1, 0x55))
    assert result['termination'] == 'return' and result['registers'][3] == 0
    assert not [w for w in memory.writes if w[0] != 'stack']
    note('metadata_update_allocator_exhaustion', result)

    engine_data = bytearray(13 * 124)
    memory = Memory([plain(CHANNELS, records, 'channels'),
                     plain(METADATA, metadata, 'metadata'),
                     plain(ENGINE, engine_data, 'engines'), stack_region()])
    result = model.run(0x227145, memory, regs(1, 0x55), stop_before=(0x227196,))
    assert result['termination'] == 'breakpoint' and result['stopped_before'] == 0x227196
    assert result['registers'][3] == 0x55 and result['registers'][4] == 5
    assert memory.read(CHANNELS + 168 + 0x2c, 2) == 1 << 5
    assert memory.read(ENGINE + 5 * 124 + 8, 4) == 1
    assert memory.read(ENGINE + 5 * 124 + 0x10, 1) == 1
    note('metadata_update_pre_external_prefix', result)

    spans = [(name, start, end - start) for name, start, end, _ in SPANS
             if start in {0x222843, 0x222ace, 0x222af1, 0x2229f8, 0x222b65, 0x227145}]
    return {
        'source_layout_sha256': sha(LAYOUT.read_bytes()), **decoder_identity(),
        'status': 'bounded channel leaf fixtures passed under plain-memory model hypotheses',
        'cases': counts, 'case_count': sum(counts.values()),
        'visited_instruction_count': len(visited),
        'source_spans': [{'name': name, 'address': hex(start), 'end_exclusive': hex(start + size),
                          'sha256': sha(expanded[start - 0x200000:start - 0x200000 + size]),
                          'visited_instructions': sum(start <= pc < start + size for pc in visited)}
                         for name, start, size in spans],
        'limitations': ['All memory is plain bytes; there are no peripheral side effects.',
                        'The 0x22701c service remains unresolved and is stopped before execution.',
                        'Results preserve model assumptions and do not establish physical behavior.'],
        'tools_sha256': {name: sha((ROOT / 'scripts' / name).read_bytes()) for name in
                         ('validate_dc9_channel_leaves.py', 'aeon_module_model.py',
                          'aeon_subset_assembler.py')},
    }
