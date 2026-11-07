"""Record exact timer paths, dependency addresses and neighboring field uses."""
import json
from pathlib import Path

from aeon_helper_emulator import context, decoder_identity
from build_dc9_source_baseline import ROOT, LAYOUT, load_original, sha
from reconstruct_dc9_timer import SPANS
from trace_dc9_commands import disassemble


def trace():
    original, expanded, _ = load_original(); ctx = context()
    segments = []
    for name, start, end, purpose in SPANS:
        rows = disassemble(ctx, expanded, start, end)
        segments.append({'name': name, 'begin': hex(start), 'end_exclusive': hex(end),
                         'purpose': purpose, 'sha256': sha(expanded[start-0x200000:end-0x200000]),
                         'listing': rows})
    # Scan encoded displacements, accounting for opcode bits in the low two
    # bits. These are candidates, not a whole-program instruction boundary map.
    candidates = []
    for low in (*range(0x51a8, 0x51ac), *range(0x51ec, 0x51f0), *range(0x5204, 0x5208)):
        position = 0
        while True:
            found = expanded.find(low.to_bytes(2, 'big'), position)
            if found < 0: break
            position = found + 1; offset = found - 2
            if offset < 0x3800 or expanded[offset] & 0xfc not in (0xec, 0xe8, 0xf8, 0xf0):
                continue
            code = expanded[offset:offset+4]
            rows = ctx.disassemble(code, base_address=offset+0x200000).instructions
            if len(rows) == 1 and rows[0].length == 4:
                row = rows[0]
                candidates.append({'address': hex(row.addr.offset), 'bytes': code.hex(),
                                   'mnemonic': row.mnem, 'operands': row.body,
                                   'encoded_low16': hex(low),
                                   'boundary_verified_in_new_timer_spans': any(a <= row.addr.offset < b for _, a, b, _ in SPANS)})
    # Record exact pointer-call sites and P-code, with explicit store widths.
    sites = []
    for address in (0x241820, 0x242101, 0x241ac7, 0x241a94, 0x2420d7):
        offset = address - 0x200000
        row = ctx.disassemble(expanded[offset:offset+4], base_address=address, max_instructions=1).instructions[0]
        code = expanded[offset:offset+row.length]
        ops = ctx.translate(code, base_address=address, max_instructions=1).ops
        sites.append({'address': hex(address), 'bytes': code.hex(), 'instruction': row.mnem+' '+row.body,
                      'pcode': [str(op) for op in ops],
                      'store_widths': [op.inputs[2].size for op in ops if op.opcode.name == 'STORE']})
    return {'source_firmware_sha256': sha(original), 'source_layout_sha256': sha(LAYOUT.read_bytes()),
            **decoder_identity(), 'segments': segments, 'semantic_sites': sites,
            'neighbor_displacement_candidates': candidates,
            'findings': [
                {'id': 'F44', 'evidence': ['0x2420d7', '0x2420e1', '0x241826', '0x241abe', '0x241ac7'],
                 'observation': 'Delay arms counter 0x455204 and flag 0x455206; timer loads halfword, decrements, and clears flag at zero.',
                 'implication': 'A four-byte low-word store at 0x241ac7 clears the adjacent flag for any decremented count <=65535. Halfword stores preserve the countdown contract.'},
                {'id': 'F45', 'evidence': ['0x241a8b', '0x241a94', '0x241a98'],
                 'observation': 'Timer loads halfword at 0x4551f6, computes minus one, stores at decoded 0x4551f4, then reloads 0x4551f6.',
                 'implication': 'Low-halfword store at decoded address+2 fits decrement/reload behavior; literal pinned SLEIGH store does not.'}],
            'external_dependencies': {'direct_calls': ['0x20edc8', '0x20f7d2', '0x2384f1', '0x23dead'],
                                      'tail_call': '0x20f1a0', 'callback_slots': ['0x4824a4', '0x4824ac']},
            'limitations': ['Firmware-derived consistency evidence, not independent ISA or physical clock validation.',
                            'All-displacement scan may decode data or mid-instruction bytes; no resolved base register is implied.',
                            'No new verified ownership established for neighbors of 0x4551a8 or 0x4551ec.',
                            'Runtime callback assignments, interrupt caller and channel timer side effects remain unresolved.'],
            'tools_sha256': {'trace_dc9_timer.py': sha(Path(__file__).read_bytes())}}


if __name__ == '__main__':
    report = trace()
    (ROOT / 'analysis/dc9-timer-path.json').write_text(json.dumps(report, indent=2)+'\n')
    print(f"Recorded {len(report['segments'])} timer source spans and {len(report['neighbor_displacement_candidates'])} displacement candidates")
