"""Recover three bounded DC9 active-engine routines.

This generator checks the archived bytes, instruction boundaries, complete
local CFG, source reassembly and collisions before writing source and layout.
"""
from pathlib import Path
import json

from aeon_helper_emulator import context
from aeon_subset_assembler import assemble
from build_dc9_source_baseline import LAYOUT, ROOT, load_original, sha

SPANS = (
    ('active_engine_mode_one', 0x21fb61, 0x21fe2c,
     'Active engine configuration, including the default return and longer register update path.'),
    ('active_engine_default_value', 0x21fb2b, 0x21fb61,
     'Return 0x78 except when the engine mode byte is 5; then calculate a scaled value.'),
    ('highest_set_bit_index', 0x2402ab, 0x2402c4,
     'Return the highest set bit index, or zero for zero input.'),
)
UNCONDITIONAL = {'bt.j', 'bn.j', 'bg.j'}
RETURN = {'bt.jr'}


def target(row):
    return int(row.body.rstrip(',').split(',')[-1].strip(), 0)


def is_branch(row):
    return row.mnem in UNCONDITIONAL or row.mnem.startswith(('bg.b', 'bn.b'))


def check_cfg(name, start, end, rows):
    starts = {row.addr.offset for row in rows}
    successors, returns = {}, []
    for row in rows:
        pc, next_pc, op = row.addr.offset, row.addr.offset + row.length, row.mnem
        if op in RETURN:
            if row.body.strip() != 'r9':
                raise ValueError(f'{name}: unexpected indirect return {pc:#x}')
            returns.append(pc)
            edges = []
        elif op in UNCONDITIONAL:
            edges = [target(row)]
        elif is_branch(row):
            edges = [target(row), next_pc]
        else:
            edges = [next_pc]
        if any(edge not in starts for edge in edges):
            raise ValueError(f'{name}: edge outside local instruction boundaries at {pc:#x}: {edges}')
        successors[pc] = edges
    if not returns:
        raise ValueError(f'{name}: no terminal return')
    reached, pending = set(), [start]
    while pending:
        pc = pending.pop()
        if pc in reached:
            continue
        reached.add(pc)
        pending.extend(successors[pc])
    if reached != starts:
        raise ValueError(f'{name}: unreachable instructions: {sorted(starts - reached)}')
    return returns


def recover():
    _, expanded, _ = load_original()
    prior_bytes = LAYOUT.read_bytes()
    layout = json.loads(prior_bytes)
    prior_routines, prior_tables = list(layout['routines']), list(layout['tables'])
    by_name = {record['name']: record for record in prior_routines}
    if len(by_name) != len(prior_routines):
        raise ValueError('duplicate existing routine name')
    owned = {name for name, *_ in SPANS}
    decoded = []
    for index, (name, start, end, purpose) in enumerate(SPANS):
        if start >= end or any(start < other_end and other_start < end
                               for _, other_start, other_end, _ in SPANS[index + 1:]):
            raise ValueError(f'{name}: invalid or overlapping requested span')
        for record in prior_routines + prior_tables:
            old_start = int(record['address'], 16)
            old_end = old_start + record['size']
            if record.get('name') == name and old_start == start and old_end == end and \
               record in prior_routines:
                continue
            if start < old_end and old_start < end:
                raise ValueError(f'{name}: overlaps existing editable source {record["name"]}')
        code = expanded[start - 0x200000:end - 0x200000]
        rows = context().disassemble(code, base_address=start).instructions
        if not code or not rows or rows[0].addr.offset != start or \
           rows[-1].addr.offset + rows[-1].length != end or \
           sum(row.length for row in rows) != len(code):
            raise ValueError(f'{name}: incomplete decode or invalid span boundary')
        returns = check_cfg(name, start, end, rows)
        labels = {target(row) for row in rows if is_branch(row)}
        lines = [
            '# Firmware-derived reconstruction; excluded from the repository MIT grant.',
            f'# DC9 v101 candidate [{start:#x},{end:#x}); {purpose}',
            '# Fixed original addresses; not hardware-validated.',
        ]
        for row in rows:
            pc = row.addr.offset
            if pc in labels:
                lines.append(f'loc_{pc:x}:')
            operands = [part.strip() for part in row.body.rstrip(',').split(',')]
            if is_branch(row):
                operands[-1] = f'loc_{target(row):x}'
            lines.append('    ' + row.mnem + ' ' + ', '.join(operands))
        source = '\n'.join(lines) + '\n'
        encoded, listing = assemble(source, start)
        if encoded != code or len(listing) != len(rows):
            raise ValueError(f'{name}: reassembly differs from archived bytes')
        relative = Path('analysis/reconstructed') / f'spectrum_one_{name}.aeon.s'
        path = ROOT / relative
        calls = sorted({target(row) for row in rows if row.mnem == 'bg.jal'})
        record = {'name': name, 'address': hex(start), 'size': len(code),
                  'source': relative.as_posix(), 'original_code_sha256': sha(code),
                  'purpose': purpose, 'component_kind': 'routine',
                  'external_call_targets': [hex(call) for call in calls],
                  'external_tail_targets': []}
        if name in by_name and by_name[name] != record:
            raise ValueError(f'{name}: existing layout record differs')
        if path.exists() and path.read_text() != source:
            raise ValueError(f'{name}: existing source differs')
        decoded.append((path, source, record, start, end, len(rows), returns, calls))
    additions = [record for _, _, record, *_ in decoded if record['name'] not in by_name]
    layout['routines'].extend(additions)
    if layout['tables'] != prior_tables or \
       [record for record in layout['routines'] if record['name'] not in owned] != \
       [record for record in prior_routines if record['name'] not in owned]:
        raise ValueError('unrelated layout records changed')
    layout['limitations'][0] = (f"{len(layout['routines'])} reconstructed routines/fragments only; "
                                'remaining firmware is a pinned vendor input')
    new_bytes = (json.dumps(layout, indent=2) + '\n').encode()
    if LAYOUT.read_bytes() != prior_bytes:
        raise ValueError('source layout changed concurrently; rerun recovery')
    for path, source, *_ in decoded:
        if not path.exists():
            with path.open('x') as handle:
                handle.write(source)
    if new_bytes != prior_bytes:
        if LAYOUT.read_bytes() != prior_bytes:
            raise ValueError('source layout changed concurrently before publication')
        LAYOUT.write_bytes(new_bytes)
    for path, _, record, start, end, count, returns, calls in decoded:
        print(json.dumps({'name': record['name'], 'address': hex(start), 'end_exclusive': hex(end),
                          'bytes': end - start, 'instructions': count,
                          'sha256': record['original_code_sha256'],
                          'returns': [hex(pc) for pc in returns],
                          'calls': [hex(pc) for pc in calls],
                          'source': str(path.relative_to(ROOT))}))
    print(f'added {len(additions)} records; layout has {len(layout["routines"])} routines')


if __name__ == '__main__':
    recover()
