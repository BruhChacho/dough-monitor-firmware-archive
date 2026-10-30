"""Offline constraints on the unexplained Black 32 final byte.

Tests simple whole-body sums/XOR and differential full-body CRC8 hypotheses.
No firmware bytes are changed. Failure of these hypotheses does not identify
the actual algorithm or establish which bytes it covers.
"""
from functools import reduce
import hashlib
import json
from operator import xor
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def crc_table(poly, reflected=False):
    table = []
    for value in range(256):
        crc = value
        for _ in range(8):
            if reflected:
                crc = (crc >> 1) ^ (poly if crc & 1 else 0)
            else:
                crc = ((crc << 1) ^ (poly if crc & 128 else 0)) & 255
        table.append(crc)
    return table


def zero_powers(table, length):
    """Composition maps for advancing 1, 2, 4, ... zero bytes."""
    powers = [table]
    for _ in range(length.bit_length()):
        previous = powers[-1]
        powers.append([previous[previous[value]] for value in range(256)])
    return powers


def sparse_crc(differences, length, table, powers):
    """CRC(init=0) of a mostly-zero XOR difference, without allocating it."""
    crc, position = 0, 0
    for offset, value in [*differences, (length, 0)]:
        if not position <= offset <= length or not 0 <= value <= 255:
            raise ValueError('Invalid sparse difference')
        zeros, bit = offset - position, 0
        while zeros:
            if zeros & 1:
                crc = powers[bit][crc]
            zeros >>= 1
            bit += 1
        if offset < length:
            crc = table[crc ^ value]
        position = offset + 1
    return crc


def load_images():
    images, records = {}, []
    members = json.loads((ROOT / 'analysis/inventory.json').read_text())['members']
    for member in members:
        name = Path(member['local_path']).name
        if not name.endswith('.bin') or not any(model in name for model in ('es07efe', 'es07e91')):
            continue
        raw = (ROOT / member['local_path']).read_bytes()
        if hashlib.sha256(raw).hexdigest() != member['sha256']:
            raise ValueError('Source hash mismatch')
        if len(raw) != 0x190000:
            raise ValueError('Unexpected image size')
        images[name] = raw
        checksum = sum(raw[:-1]) & 255
        candidates = {'sum_mod_256': checksum, 'negative_sum_mod_256': (-checksum) & 255,
                      'complement_sum_mod_256': checksum ^ 255,
                      'xor': reduce(xor, raw[:-1], 0)}
        records.append({'name': name, 'source_path': member['local_path'],
                        'source_sha256': member['sha256'], 'size': len(raw),
                        'trailer_offset': hex(len(raw) - 1), 'trailer': hex(raw[-1]),
                        'whole_body_candidates': {key: {'value': hex(value), 'matches': value == raw[-1]}
                                                  for key, value in candidates.items()}})
    return images, records


def probe():
    images, records = load_images()
    pairs = []
    for version in ('19', '17', '16', '14', '13'):
        left = f'dough_es07e91_v1.0.{version}_USB-update.bin'
        right = f'dough_es07efe_v1.0.{version}_USB-update.bin'
        a, b = images[left], images[right]
        differences = [(i, x ^ y) for i, (x, y) in enumerate(zip(a[:-1], b[:-1])) if x != y]
        pairs.append((left, right, differences, a[-1] ^ b[-1], len(a) - 1))
    hypotheses = []
    # Equal length makes the common initialization and final XOR cancel.
    # Enumerate all degree-eight polynomials with nonzero constant term;
    # reflected convention represents that term as the high bit.
    for reflected in (False, True):
        for poly in (range(128, 256) if reflected else range(1, 256, 2)):
            table = crc_table(poly, reflected)
            powers = zero_powers(table, pairs[0][4])
            results = []
            for left, right, differences, expected, length in pairs:
                actual = sparse_crc(differences, length, table, powers)
                results.append({'left': left, 'right': right, 'calculated_delta': hex(actual),
                                'observed_trailer_delta': hex(expected), 'matches': actual == expected})
            for reverse_output in (False, True):
                output_results = []
                for result in results:
                    actual = int(result['calculated_delta'], 16)
                    if reverse_output:
                        actual = int(f'{actual:08b}'[::-1], 2)
                    output_results.append({**result, 'calculated_delta': hex(actual),
                                           'matches': actual == int(result['observed_trailer_delta'], 16)})
                hypotheses.append({'polynomial_in_shift_convention': hex(poly),
                                   'reflected': reflected, 'reverse_output_bits': reverse_output,
                                   'all_pairs_match': all(r['matches'] for r in output_results),
                                   'pairs': output_results})
    return {
        'status': 'negative constraints on whole-body checksum hypotheses; integrity unresolved',
        'images': records,
        'covered_span': ['0x0', '0x18ffff'],
        'excluded_final_byte': '0x18ffff',
        'pair_summary': [{'left': left, 'right': right, 'body_difference_count': len(diff),
                          'observed_trailer_delta': hex(expected)} for left, right, diff, expected, _ in pairs],
        'tested_crc8_hypotheses': len(hypotheses),
        'matching_crc8_hypotheses': [h for h in hypotheses if h['all_pairs_match']],
        'crc8_hypotheses': hypotheses,
        'scope_of_rejection': 'Fixed CRC8 polynomial/direction, any common initial value and final XOR, over every body byte in order',
        'limitations': ['Selected ranges, reordered bytes, bank-local checks, normalization, other CRC widths and non-CRC algorithms remain possible',
                        'No claim that the final byte is an integrity field has been proved by loader tracing',
                        'No Black 32 repacking, patching, hardware access or flash readiness is established'],
    }


if __name__ == '__main__':
    report = probe()
    (ROOT / 'analysis/black32-integrity-probe.json').write_text(json.dumps(report, indent=2) + '\n')
    print(f"Images: {len(report['images'])}; CRC8 hypotheses: {report['tested_crc8_hypotheses']}; "
          f"matching all pairs: {len(report['matching_crc8_hypotheses'])}")
