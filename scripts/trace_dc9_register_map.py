"""Recover the static DC9 register-base initialization and byte-address map.

This tool reads archived firmware only. It never maps physical memory or invokes
the recovered register helpers. Logical channel IDs are not named transports.
"""
import json
import struct

from aeon_helper_emulator import context, decoder_identity
from build_dc9_source_baseline import ROOT, load_original, sha
from recompress_dc9 import SOURCE_SHA
from trace_dc9_commands import disassemble


def main():
    _, expanded, _ = load_original()
    ctx = context()
    spans = [
        ('initialization_call', 0x270735, 0x270764),
        ('mapping_dispatch', 0x271aa4, 0x271b3a),
        ('mapping_id_classification', 0x271b3a, 0x271c2c),
        ('mapping_assignment', 0x271c2c, 0x271c7e),
        ('logical_byte_read', 0x23dd44, 0x23ddb9),
        ('two_byte_write_wrapper', 0x23dfb6, 0x23dfe1),
        ('slot_buffer_offset', 0x20c7a8, 0x20c80d),
        ('slot_ring_position_register', 0x20c73b, 0x20c7a8),
        ('indirect_buffer_byte_read', 0x20e47e, 0x20e52d),
    ]
    table = expanded[0x13cbb4:0x13cbb4 + 18 * 4]
    targets = list(struct.unpack('<18I', table))
    assert targets[1] == 0x271afd
    offsets = {0: (0x80, 0x300, 0x7d8c), 1: (0x100, 0x380, 0x7d98),
               2: (0x180, 0x400, 0x7da4), 3: (0x200, 0x480, 0x7d74),
               7: (0, 0x280, 0x7dc8)}
    report = {
        'source_firmware_sha256': SOURCE_SHA, 'expanded_sha256': sha(expanded), **decoder_identity(),
        'status': 'static register mapping recovered; no device accesses or whole-system emulation',
        'base_initialization': {
            'base_pointer_storage': '0x453cf0', 'initial_expanded_bytes': expanded[0x253cf0:0x253cf4].hex(),
            'request_id': '0x12c', 'classification': 1, 'classification_return': '0x271bdc',
            'dispatch_table': '0x33cbb4', 'dispatch_table_sha256': sha(table),
            'class_1_target': hex(targets[1]), 'assignment_target': '0x271c6a',
            'assigned_base': '0xa0000000', 'returned_size_metadata': '0x7b80',
            'caveat': 'Observed initialization path; not proof of initialization ordering or immutable runtime state. Size metadata is not treated as a universal address bound.'},
        'byte_read': {
            'entry': '0x23dd44', 'zero_result_condition': '(logical & 0x007fff00) == 0',
            'byte_address': 'base + 2 * (logical & 0x007fffff) - (logical & 1)',
            'page_write_condition': '(logical & 0x00800000) != 0, after the zero-result check',
            'page_write_address': 'base + 2 * (logical & 0x007fff00)',
            'page_write_value': '(logical >> 24) & 0xff',
            'warning': 'The firmware helper named here as a read may write a page-selection byte; it is not inherently read-only on hardware.'},
        'indirect_buffer_read': {
            'entry': '0x20e47e',
            'address_programming': 'write16(logical 0x3c02, uint16(argument - 0x4000))',
            'control_register': '0x3c06', 'observed_poll_mask': '0x20',
            'data_register': '0x3c01', 'software_flag': '0x453b9e',
            'physical_addresses_if_initialized_base_applies': {
                'control': '0xa000780c', 'address_low_byte': '0xa0007804',
                'address_high_byte': '0xa0007805', 'data': '0xa0007801'},
            'caveat': 'Nested polling and software-flag behavior is not modeled; helper writes registers even when obtaining a byte.'},
        'slots': [{'slot': slot, 'mode_zero_buffer_offset': hex(rx),
                   'mode_nonzero_buffer_offset': hex(tx),
                   'ring_position_register_offset_from_base': hex(position),
                   'mode_zero_indirect_argument_start': hex(0x4700 + rx)}
                  for slot, (rx, tx, position) in offsets.items()],
        'unlisted_slot_behavior': 'Offset helper returns 0xb900; position helper returns zero. Physical meaning is unclassified.',
        'segments': [{'name': name, 'begin': hex(begin), 'end_exclusive': hex(end),
                      'code_sha256': sha(expanded[begin - 0x200000:end - 0x200000]),
                      'listing': disassemble(ctx, expanded, begin, end)} for name, begin, end in spans],
        'limitations': [
            'Candidate runtime map derived from archived instructions, not independently confirmed register documentation',
            'No DDC, HDMI, DisplayPort, USB or physical connector assignment is made for slot IDs',
            'Not all register-write helpers, status bits, timeouts or interrupt paths are reconstructed',
            'No recovered register access was executed on a device or included in the RAM-only model'],
    }
    (ROOT / 'analysis/dc9-register-map.json').write_text(json.dumps(report, indent=2) + '\n')
    print('Static base initialization 0xa0000000; five slot mappings and indirect-buffer registers recorded')


if __name__ == '__main__':
    main()
