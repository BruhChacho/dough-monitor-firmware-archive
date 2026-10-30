"""Record control-flow and ring constraints from the full recovered DC9 service."""
import json

from aeon_helper_emulator import context, decoder_identity
from aeon_subset_assembler import encode
from build_dc9_source_baseline import ROOT, LAYOUT, load_original, sha
from reconstruct_dc9_receive import SPANS
from recompress_dc9 import SOURCE_SHA


def trace():
    _, expanded, _ = load_original()
    layout = json.loads(LAYOUT.read_text()); ctx = context()
    sources = {int(r['address'], 16): r['name'] for r in layout['routines']}
    segments = []
    for name, begin, end, purpose in SPANS:
        code = expanded[begin - 0x200000:end - 0x200000]
        rows = ctx.disassemble(code, base_address=begin).instructions
        calls, branches, stores = [], [], []
        for row in rows:
            pc = row.addr.offset; args = [x.strip() for x in row.body.rstrip(',').split(',')]
            original = code[pc - begin:pc - begin + row.length]
            if encode(row.mnem, args, pc, {}) != original:
                raise ValueError('Disassembly is not byte-reproducible')
            if row.mnem == 'bg.jal':
                target = int(args[-1], 0)
                calls.append({'address': hex(pc), 'target': hex(target), 'recovered_name': sources.get(target)})
            if row.mnem in ('bt.j', 'bn.j', 'bg.j') or row.mnem.startswith(('bg.b', 'bn.b')):
                target = int(args[-1], 0)
                branches.append({'address': hex(pc), 'instruction': row.mnem, 'target': hex(target),
                                 'inside_span': begin <= target < end})
            if row.mnem == 'bg.sw_1':
                ops = ctx.translate(original, base_address=pc, max_instructions=1).ops
                stores.append({'address': hex(pc), 'bytes': original.hex(), 'operands': args,
                               'pcode': [str(op) for op in ops]})
        segments.append({'name': name, 'begin': hex(begin), 'end_exclusive': hex(end),
                         'sha256': sha(code), 'instruction_count': len(rows), 'calls': calls,
                         'branches': branches, 'unresolved_width_stores': stores})
    return {'source_firmware_sha256': SOURCE_SHA, 'source_layout_sha256': sha(LAYOUT.read_bytes()),
            **decoder_identity(), 'status': 'static full transfer-service source with partial execution evidence',
            'segments': segments,
            'event_dispatch': {'query': '0x20cbd6', 'no_event_return': '0x20d445',
                               'global_error_mask': '0x0c at base+0x7dd4',
                               'receive': 'event & 0x18 == 0x08 -> 0x20d471',
                               'transmit': 'event & 0x18 == 0x10 -> 0x20d6bc',
                               'other': 'copy slot data register to adjacent register and clear software state/count'},
            'ring': {'current_array': '0x47ef80', 'previous_array': '0x47efb0',
                     'other_position_array': '0x47f3c0', 'element_bytes': 2,
                     'address_wrap_mask': '0x7f', 'normalization_increment': 128,
                     'continuation_normalization': 'while current <= previous: current = uint16(current + 128)',
                     'normalization_addresses': ['0x20d8c1', '0x20d8e2'],
                     'initial_normalization': 'if other_position > current: current += 128',
                     'initial_normalization_addresses': ['0x20d52c', '0x20d533'],
                     'capacity_claim': '128 address positions in these loops; no physical FIFO capacity or overrun guarantee'},
            'ready': {'decision_entry': '0x20d608', 'length_array': '0x454154', 'count_array': '0x45414c',
                      'predicate': 'length != 0 and count == length + 2 and slot_frame_status(slot) == 0',
                      'ready_store': '0x20da7c', 'state_array': '0x453b94', 'state_value': 5,
                      'bookkeeping_stores_with_unresolved_width': ['0x20d64d', '0x20da6b'],
                      'bookkeeping_address': '0x4551ec', 'bookkeeping_mask': '0x04'},
            'copy_store': {'address': '0x20d94c', 'expression': 'slot_base + received_count',
                           'slot_stride': 128, 'count_increment': 'uint8(count + 1)',
                           'local_bound': 'No explicit count<128 check between 0x20d937 and store; upstream reachability remains unresolved'},
            'indirect_read': {'entry': '0x20e47e', 'address_register': '0x3c02',
                              'address_value': 'uint16(argument - 0x4000)', 'data_register': '0x3c01',
                              'control_register': '0x3c06', 'busy_mask': '0x20', 'trigger_mask': '0x02',
                              'poll_counter_initial': '0xffff', 'retry_flag': '0x453b9e',
                              'retry_edge': ['0x20e50b', '0x20e4ca'],
                              'timeout_behavior': 'Polling exhaustion falls through; no separate error return is visible',
                              'execution_limit': 'Tests stop at masked-update dependency; finite busy polls and outer retry do not establish hardware completion'},
            'limitations': ['All names are inferred; physical channel/transport identities are unknown',
                            'Shared decoder is not independent ISA certification',
                            'No external reachability or whole-firmware safety claim follows from local count-bound probes',
                            'Raw firmware has no conventional PE/ELF import table; direct call targets serve as the local dependency evidence']}


if __name__ == '__main__':
    report = trace()
    (ROOT / 'analysis/dc9-receive-path.json').write_text(json.dumps(report, indent=2) + '\n')
    print(f"Recorded {len(report['segments'])} exact source spans and their direct dependencies")
