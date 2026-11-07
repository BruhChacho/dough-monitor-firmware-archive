"""Recover fixed DC9 receive-service spans and verify every encoded byte.

Pinned local decoder supplies mnemonics; the restricted encoder must reproduce
all original bytes. Existing different source/layout entries are never replaced.
This does not infer hardware semantics from byte equality.
"""
import json
from pathlib import Path

from aeon_helper_emulator import context
from aeon_subset_assembler import assemble
from build_dc9_source_baseline import ROOT, LAYOUT, load_original, sha

SPANS = [
    ('slot_control_or08', 0x20c80d, 0x20c895, 'Set bit 3 in the slot control byte; peripheral semantics unknown.'),
    ('slot_control_or30', 0x20c895, 0x20c91d, 'Set bits 4 and 5 in the slot control byte.'),
    ('slot_status40', 0x20c91d, 0x20c98a, 'Return bit 6 of the slot control byte.'),
    ('slot_status80', 0x20c98a, 0x20c9fa, 'Return bit 7 of the slot control byte.'),
    ('slot_frame_status', 0x20c9fa, 0x20ca70, 'Return the slot-specific frame status bit.'),
    ('slot_event_or', 0x20ca70, 0x20caf8, 'OR low byte of r4 into a slot event-related register.'),
    ('slot_data_write', 0x20caf8, 0x20cb4e, 'Write low byte of r4 to the slot data register.'),
    ('slot_control_or04', 0x20cb4e, 0x20cbd6, 'Set bit 2 in the slot control byte.'),
    ('slot_event_read', 0x20cbd6, 0x20cc43, 'Read the slot event-related byte.'),
    ('slot_data_read', 0x20cc43, 0x20ccb0, 'Read the slot data register.'),
    ('slot_state_initialize', 0x20ccb0, 0x20ccf6, 'Clear eight five-byte records, eight flags and two global bytes.'),
    ('slot_state_clear', 0x20ccf6, 0x20cd13, 'Clear slot state and received byte count; no slot bound in this routine.'),
    ('slot_packet_xor', 0x20cd13, 0x20cd4a, 'XOR slot bytes with seed 0x3e; caller must bound length.'),
    ('slot_transfer_service', 0x20d33c, 0x20db7b, 'Receive/transmit ring state machine; execution incomplete because of unresolved stores and peripheral calls.'),
    ('indirect_buffer_read8', 0x20e47e, 0x20e52d, 'Indirect byte read with bounded busy polls and retry flag; masked-update dependency has unresolved store width.'),
]


def local_branch(op):
    return op.startswith(('bg.b', 'bn.b')) or op in ('bt.j', 'bn.j', 'bg.j')


def recover(spans=SPANS):
    _, expanded, _ = load_original()
    ctx = context(); layout = json.loads(LAYOUT.read_text()); outputs = []
    for name, start, end, purpose in spans:
        code = expanded[start - 0x200000:end - 0x200000]
        rows = ctx.disassemble(code, base_address=start).instructions
        if sum(r.length for r in rows) != len(code):
            raise ValueError('Incomplete decode')
        targets = {int(row.body.rstrip(',').split(',')[-1], 0) for row in rows if local_branch(row.mnem)}
        targets = {x for x in targets if start <= x < end}
        if not targets.issubset({r.addr.offset for r in rows}):
            raise ValueError('Branch does not land at an instruction')
        lines = ['# Firmware-derived reconstruction; excluded from the repository MIT grant.',
                 f'# DC9 v101 candidate [{start:#x},{end:#x}); {purpose}',
                 '# Fixed original addresses; not a hardware-validated implementation.']
        for row in rows:
            if row.addr.offset in targets:
                lines.append(f'loc_{row.addr.offset:x}:')
            args = [x.strip() for x in row.body.rstrip(',').split(',')]
            if local_branch(row.mnem) and int(args[-1], 0) in targets:
                args[-1] = f'loc_{int(args[-1], 0):x}'
            lines.append('    ' + row.mnem + ' ' + ', '.join(args))
        source = '\n'.join(lines) + '\n'
        encoded, listing = assemble(source, start)
        if encoded != code:
            raise ValueError(f'Encoding differs from original: {name}')
        path = Path('analysis/reconstructed') / f'spectrum_one_{name}.aeon.s'
        record = {'name': name, 'address': hex(start), 'size': len(code), 'source': path.as_posix(),
                  'original_code_sha256': sha(code), 'purpose': purpose, 'component_kind': 'routine'}
        prior = [r for r in layout['routines'] if r['name'] == name]
        if prior and prior != [record]:
            raise ValueError(f'Existing layout differs: {name}')
        if (ROOT / path).exists() and (ROOT / path).read_text() != source:
            raise ValueError(f'Existing source differs: {path}')
        if not prior:
            layout['routines'].append(record)
        outputs.append((ROOT / path, source, len(listing)))
    # Validate every proposed source before writing any new file or layout.
    for path, source, _ in outputs:
        if not path.exists():
            with path.open('x') as handle:
                handle.write(source)
    layout['limitations'][0] = f"{len(layout['routines'])} reconstructed routines/fragments only; remaining firmware is a pinned vendor input"
    LAYOUT.write_text(json.dumps(layout, indent=2) + '\n')
    print(f'Recovered {len(outputs)} components, {sum(x[2] for x in outputs)} instructions')


if __name__ == '__main__':
    recover()
