"""Bounded validation of the recovered channel reference-count routine.

Execution uses the recovered instructions and plain byte memory. The Python
contract below independently counts active records that directly or indirectly
refer to the requested channel index; it does not emulate instruction steps.
"""
import json

from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, Region, ModuleModel
from build_dc9_source_baseline import ROOT, LAYOUT, sha
from reconstruct_dc9_engine_enable import SPANS
from validate_dc9_module import inputs, initial_registers, stack_region

RECORDS = 0x4821ec
RECORD_SIZE = 168
METADATA = 0x3b4950
METADATA_SIZE = 176
ENTRY = 0x23ee2c
ROUTINE = next(x for x in SPANS if x[0] == 'channel_reference_count')


def registers(target):
    result = initial_registers(0x13579bdf)
    result[3] = target
    return result


def fixture(channel_rows, metadata_words, metadata_tail=0):
    """Make exactly four channel records and independent metadata records.

    A row is (active_word, source_index, enabled_flag). Metadata words are
    uint32 values at offset 0x80; bytes at +0x7c are supplied separately.
    """
    rows = bytearray(RECORD_SIZE * 4)
    for i, (active, source, enabled) in enumerate(channel_rows):
        off = i * RECORD_SIZE
        rows[off+4:off+8] = int(active).to_bytes(4, 'little')
        rows[off+0x28] = source & 255
        rows[off+0x94] = enabled & 255
    metadata = bytearray(METADATA_SIZE * max(4, len(metadata_words)) + metadata_tail)
    for i, (word, refs) in enumerate(metadata_words):
        off = i * METADATA_SIZE
        metadata[off+0x80:off+0x84] = int(word).to_bytes(4, 'little')
        metadata[off+0x7c:off+0x7c+min(4, len(refs))] = bytes(refs[:4])
    return Memory([stack_region(), Region('channels', RECORDS, rows, True),
                   Region('metadata', METADATA, metadata, True)])


def contract(rows, metadata_words, target):
    """Independent bounded specification for the four-record routine."""
    # Serialize the fixture as bytes so the scan sees the same padding and
    # overlap with word+0x80 that a byte-addressed memory image exposes.
    metadata = bytearray(METADATA_SIZE * max(4, len(metadata_words)))
    for i, (word, refs) in enumerate(metadata_words):
        base = i * METADATA_SIZE
        metadata[base+0x7c:base+0x7c+min(4, len(refs))] = bytes(refs[:4])
        metadata[base+0x80:base+0x84] = int(word).to_bytes(4, 'little')
    count = 0
    for active, source, enabled in rows:
        if not active:
            continue
        if source == target:
            count += 1
            continue
        if not enabled:
            continue
        if source >= len(metadata_words):
            raise IndexError(f'source metadata index {source} is unmapped')
        source_word, references = metadata_words[source]
        if not source_word:
            continue
        if target >= len(metadata_words):
            raise IndexError(f'target metadata index {target} is unmapped')
        target_word, _ = metadata_words[target]
        if not target_word:
            continue
        # Firmware special-cases source metadata word 4 to three entries;
        # otherwise its byte-sized word value is the inclusive last index.
        limit = 3 if source_word == 4 else source_word & 255
        start = source * METADATA_SIZE + 0x7c
        found = False
        for offset in range(limit + 1):
            address = start + offset
            if address >= len(metadata):
                raise IndexError('metadata scan exceeds mapped fixture')
            if metadata[address] == target:
                found = True
                break
        if found:
            count += 1
    return count & 255


def validate():
    expanded, segments, _ = inputs()
    model = ModuleModel(segments, call_policy='fallthrough-hypothesis')
    cases = {}; visited = set()

    def run(name, rows, md, target):
        memory = fixture(rows, md)
        before = registers(target)
        result = model.run(ENTRY, memory, before)
        expected = contract(rows, md, target)
        assert result['termination'] == 'return'
        assert result['registers'][3] == expected
        assert result['registers'][1] == before[1]
        assert result['registers'][10:] == before[10:]
        assert all(name == 'stack' for name, _, _, _ in memory.writes)
        cases[name] = cases.get(name, 0) + 1
        visited.update(result['visited'])
        return result, memory

    # Exhaustively vary active/source/enable state in compact one-row fixtures.
    # The three remaining rows are inactive, isolating each decision branch.
    baseline_md = [(1, [0, 1, 2, 3]), (1, [0, 1, 2, 3]),
                   (1, [0, 1, 2, 3]), (1, [0, 1, 2, 3])]
    for target in range(4):
        for source in range(4):
            for active in (0, 1):
                for enabled in (0, 1):
                    rows = [(active, source, enabled), (0, 0, 0), (0, 0, 0), (0, 0, 0)]
                    run('single_record_decisions', rows, baseline_md, target)

    # Four records cover inactive records, same-index direct matches, and
    # indirect references across every metadata slot.
    for target in range(4):
        rows = [(1, (target + i) % 4, i & 1) for i in range(4)]
        md = [(1, [target]), (2, [target, (target+1) % 4]),
              (4, [target, 3]), (0x104, [target, 2])]
        run('four_record_mix', rows, md, target)

    # Directly exercise terminal-index inclusion and the word==4 special
    # bound. Source index 1 differs from requested target index 2, so these
    # cases must take the metadata scan path.
    for word, refs, expected, expected_terminal in (
            (2, [3, 3, 2], 1, METADATA + METADATA_SIZE + 0x7e),
            (4, [3, 3, 3, 3], 0, METADATA + METADATA_SIZE + 0x7f),
            (0x104, [3, 3, 3, 3], 0, METADATA + METADATA_SIZE + 0x80)):
        rows = [(0, 0, 0), (1, 1, 1), (0, 0, 0), (0, 0, 0)]
        md = [(1, []), (word, refs), (1, []), (1, [])]
        result, memory = run('inclusive_metadata_scan', rows, md, 2)
        assert result['registers'][3] == expected
        scan_reads = [a for n, a, size in memory.reads
                      if n == 'metadata' and size == 1 and a >= METADATA + METADATA_SIZE + 0x7c]
        assert scan_reads[-1] == expected_terminal

    # A zero target metadata word suppresses the scan after the source word
    # read. The contract also raises for invalid indices once such a read is
    # actually required instead of treating them as a safe no-op.
    rows = [(0, 0, 0), (1, 1, 1), (0, 0, 0), (0, 0, 0)]
    md = [(1, []), (1, []), (0, []), (1, [])]
    result, memory = run('zero_target_metadata', rows, md, 2)
    assert result['registers'][3] == 0
    assert not any(n == 'metadata' and METADATA + METADATA_SIZE + 0x7c <= a <
                   METADATA + METADATA_SIZE + 0x80 and size == 1
                   for n, a, size in memory.reads)

    # Bounded reads for unusual byte bounds: when no match occurs and the
    # inclusive bound is 255, the 8-bit loop counter wraps and does not finish.
    rows = [(1, 1, 1), (0, 0, 0), (0, 0, 0), (0, 0, 0)]
    md = [(0, []), (0x202, []), (255, [1]), (0, [])]
    rows = [(1, 2, 1), (0, 0, 0), (0, 0, 0), (0, 0, 0)]
    run('byte_bound_255_match', rows, md, 1)
    md = [(0, []), (0x202, []), (255, [2] * 4), (0, [])]
    rows = [(1, 2, 1), (0, 0, 0), (0, 0, 0), (0, 0, 0)]
    memory = fixture(rows, md, metadata_tail=128)
    try:
        model.run(ENTRY, memory, registers(1), max_steps=5000)
    except ValueError as exc:
        assert 'Instruction budget exceeded' in str(exc)
        cases['byte_bound_255_nonmatch_budget'] = 1
    else:
        raise AssertionError('Expected the byte-sized scan counter to wrap without a match')

    layout = json.loads(LAYOUT.read_text())
    source_record = next(r for r in layout['routines'] if r['name'] == ROUTINE[0])
    source_file = LAYOUT.parent / source_record['source'].split('/')[-1]
    return {'status': 'bounded actual-instruction reference-count validation',
            **decoder_identity(), 'source_layout_sha256': sha(LAYOUT.read_bytes()),
            'tool_sha256': {n: sha((ROOT / 'scripts' / n).read_bytes()) for n in
                            ('aeon_module_model.py', 'aeon_subset_assembler.py',
                             'validate_dc9_reference_count.py')},
            'routine': {'name': ROUTINE[0], 'begin': hex(ROUTINE[1]),
                        'end_exclusive': hex(ROUTINE[2]),
                        'source_sha256': sha(source_file.read_bytes()),
                        'firmware_sha256': sha(expanded[ROUTINE[1]-0x200000:ROUTINE[2]-0x200000])},
            'cases': cases, 'total_cases': sum(cases.values()),
            'visited_instruction_count': len(visited),
            'visited_instruction_addresses': [hex(x) for x in sorted(visited)],
            'limitations': ['Plain byte memory and explicit fallthrough CALL hypothesis; no hardware validation',
                            'Only channel indices 0..3 are mapped; invalid source or target accesses are not modeled as a safe no-op',
                            'A source metadata bound of 255 with no match wraps the 8-bit scan counter and is budget-limited',
                            'Field meanings are inferred from recovered callers; this validates observed control flow only']}


if __name__ == '__main__':
    report = validate()
    (ROOT / 'analysis/dc9-reference-count-validation.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps({'total_cases': report['total_cases'], 'cases': report['cases'],
                      'visited_instructions': report['visited_instruction_count']}, indent=2))
