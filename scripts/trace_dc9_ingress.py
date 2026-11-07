"""Bounded static evidence linking slot receive state to command dispatch."""
import json

from aeon_helper_emulator import context, decoder_identity
from build_dc9_source_baseline import ROOT, load_original, sha
from recompress_dc9 import SOURCE_SHA
from trace_dc9_commands import direct_target, disassemble


def main():
    _, expanded, _ = load_original()
    ctx = context()
    spans = [
        ('eight_slot_consumer', 0x20d130, 0x20d2b7),
        ('clear_slot_state_and_count', 0x20ccf6, 0x20cd13),
        ('receive_entry', 0x20d33c, 0x20d370),
        ('receive_ring_position_setup', 0x20d471, 0x20d4ee),
        ('receive_initial_copy_and_length_check', 0x20d4ee, 0x20d630),
        ('receive_continued_copy', 0x20d90e, 0x20d96a),
        ('mark_slot_ready', 0x20da4f, 0x20dab8),
        ('per_slot_status_query', 0x20c9fa, 0x20ca70),
        ('slot_xor_helper', 0x20cd13, 0x20cd4a),
        ('register_read_helper_entry', 0x20e47e, 0x20e4b3),
    ]
    listings = {name: disassemble(ctx, expanded, begin, end) for name, begin, end in spans}
    candidates = []
    for offset in range(len(expanded)):
        target = direct_target(expanded, offset)
        if target and target[0] == 0x20cf64:
            row = disassemble(ctx, expanded, 0x200000 + offset, 0x200000 + offset + target[1])[0]
            assert int(row['operands'].split(',')[-1], 16) == target[0]
            candidates.append(row)
    report = {
        'source_firmware_sha256': SOURCE_SHA, 'expanded_sha256': sha(expanded), **decoder_identity(),
        'status': 'static ingress/consumer path; hardware and physical transport unverified',
        'direct_dispatch_entry_candidates': candidates,
        'consumer': {'entry': '0x20d130', 'dispatch_call': '0x20d248',
                     'initial_slot': 0, 'exclusive_slot_limit': 8, 'slot_increment': 1,
                     'slot_base': '0x47eb80', 'slot_stride': 128,
                     'slot_span_for_this_loop': ['0x47eb80', '0x47ef80'],
                     'state_array': '0x453b94', 'dispatch_state': 5,
                     'evidence_addresses': ['0x20d14b', '0x20d165', '0x20d1c9',
                                            '0x20d21d', '0x20d225', '0x20d246', '0x20d248']},
        'receive_state': {'entry_candidate': '0x20d33c',
                          'received_byte_count_array': '0x45414c',
                          'expected_length_array': '0x454154',
                          'ring_position_arrays': ['0x47ef80', '0x47f3c0'],
                          'input_read_helper': '0x20e47e',
                          'input_address_expression': '(ring_position & 0x7f) + (helper_20c7a8(slot, 0) + 0x4700)',
                          'ready_condition_on_listed_path': 'expected_length != 0 and received_count == expected_length + 2 and helper_20c9fa(slot) == 0',
                          'length_source': 'Low seven bits read from the receive ring; may be filled from slot[0] when expected length is still zero',
                          'copy_destinations': ['0x20d5b5', '0x20d94c'],
                          'count_increment_stores': ['0x20d5bd', '0x20d954'],
                          'length_equality_branch': '0x20d62c',
                          'ready_state_store': '0x20da7c'},
        'correction_to_earlier_working_name': '0x45414c + slot is a received-byte counter on the recovered producer paths, not merely a boolean ready flag; readiness is state 5 at 0x453b94 + slot',
        'slot_xor_helper': {'entry': '0x20cd13', 'initial_xor': '0x3e',
                            'arguments': 'r3 slot, r4 count; this helper is not yet connected to the accepted command-0x32 path'},
        'segments': [{'name': name, 'begin': hex(begin), 'end_exclusive': hex(end),
                      'code_sha256': sha(expanded[begin - 0x200000:end - 0x200000]),
                      'listing': listings[name]} for name, begin, end in spans],
        'limitations': [
            'Eight-slot bound belongs to this consumer path, not a proof for all callers or indirect entries',
            'Producer listing is partial and not executed; ring capacity, overrun handling and all state transitions remain unresolved',
            'Received frame length and command-0x32 count at slot[5] are distinct; no relation between them is established',
            'Transport not identified: low-level helpers and register mappings still require analysis',
            'No device access, input injection, firmware patch or external reachability claim'],
    }
    (ROOT / 'analysis/dc9-ingress-path.json').write_text(json.dumps(report, indent=2) + '\n')
    print('Eight-slot consumer recovered; receive counter and ready-state fields distinguished')


if __name__ == '__main__':
    main()
