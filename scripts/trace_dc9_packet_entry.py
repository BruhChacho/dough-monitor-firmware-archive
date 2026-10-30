"""Record the static parent path supplying the DC9 router's selector.

No USB/DDC transport or exploitability conclusion is inferred from these bytes.
"""
import json

from aeon_helper_emulator import context, decoder_identity
from build_dc9_source_baseline import ROOT, load_original, sha
from recompress_dc9 import SOURCE_SHA
from trace_dc9_commands import direct_target, disassemble


def main():
    _, expanded, _ = load_original()
    ctx = context()
    candidates = []
    for offset in range(len(expanded)):
        target = direct_target(expanded, offset)
        if target and target[0] == 0x26bf26:
            row = disassemble(ctx, expanded, 0x200000 + offset, 0x200000 + offset + target[1])[0]
            assert int(row['operands'].split(',')[-1], 16) == target[0]
            candidates.append(row)
    report = {
        'source_firmware_sha256': SOURCE_SHA, 'expanded_sha256': sha(expanded),
        **decoder_identity(),
        'parent_entry': '0x26bf26', 'parent_router_call': '0x26c155',
        'selector_source': 'slot byte 1', 'command_source': 'slot byte 2',
        'selector_mirror': '0x453cd1', 'command_mirror': '0x453cc8',
        'selectors_sent_to_router': ['0xcc', '0xf0', '0xf1'],
        'router_accepts_only': '0xcc',
        'parent_fragments': [disassemble(ctx, expanded, 0x26bf26, 0x26bf94),
                             disassemble(ctx, expanded, 0x26c153, 0x26c17c)],
        'direct_parent_entry_candidates': candidates,
        'caller_candidate': {'entry': '0x20cf64', 'call': '0x20cfea',
                             'listing_through_first_epilogue': disassemble(ctx, expanded, 0x20cf64, 0x20d05c)},
        'observed_pre_call_path': [
            'r3 supplies the slot; the shown path does not bound the slot index',
            'Global byte 0x45415d selects another path when nonzero',
            'Per-slot byte at 0x45414c + slot must be nonzero on the shown call path',
            'slot[0] & 0x7f must be nonzero; slot[that value] == 0xe6 takes another path',
            'Bit 0x20 in a halfword at *(uint32*)0x3b5f38 + 0x4c is set before the parent call and cleared after',
            'The shown path does not compare slot[5] (command-0x32 count) against the frame length'],
        'conclusion': 'Selector and one upstream call path recovered; physical transport and ingress validation remain unresolved',
        'limitations': [
            'All addresses are candidate runtime addresses; static branches are not observed execution',
            'Only the listed path is interpreted; other branches may affect processing',
            'The flag pointer is not classified as RAM or MMIO; this caller is not executed by the module model',
            'Receive/copy routines may enforce constraints not visible here',
            'No external reachability, vulnerability severity, hardware behavior or flash acceptance is established'],
    }
    (ROOT / 'analysis/dc9-packet-entry.json').write_text(json.dumps(report, indent=2) + '\n')
    print('Parent selector comes from slot byte 1; direct caller candidates:', len(candidates))


if __name__ == '__main__':
    main()
