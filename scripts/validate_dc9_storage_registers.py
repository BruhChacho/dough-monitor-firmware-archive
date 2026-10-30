"""Bounded validation for the two DC9 storage-register pairs at 0x226100.

Register addresses are ordinary mapped bytes. The masked helper contains an
ambiguous store, so full returns require an explicitly named store policy.
"""
import json

from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel
from build_dc9_source_baseline import ROOT, LAYOUT, sha
from reconstruct_dc9_channel_storage import SPANS
from validate_dc9_module import inputs
from validate_dc9_transfer import plain, regs
from validate_dc9_masked import fixture as bus_fixture, POLICIES
from validate_dc9_registers import BUS, byte_address

ENTRY = 0x226100
ENGINES = 0x47fa9c
STRIDE = 124
PAIR_COUNT = 2
BASE_WRITES = ((0x3280002e, 0x40, 2), (0x328000ae, 0x40, 2),
               (0x5280002e, 0, 2), (0x31800052, 0, 2),
               (0x2080003a, 0, 1), (0x2080003b, 0, 1))


def logicals(bank):
    """All byte addresses possibly touched, including either branch."""
    operations = (*BASE_WRITES, (0x20800047, 0, 1), (0x20800021, 0, 1),
                  (0x23800012, 0, 4), (0x23800052, 0, 4),
                  (0x2080002a, 0, 2), (0x2080002c, 0, 2),
                  (0x20800026, 0, 2))
    return [((base + bank + i) & 0xffffffff)
            for base, _, width in operations for i in range(width)]


def fixture(bank=0x200, pairs=((0, 0, 0, 0, 0), (0, 0, 0, 0, 0)), *, missing=None,
            read_only=None, counter=0):
    """Map only the globals, four engine records, and explicitly selected bus bytes.

    Each tuple is (state, width, partner_width, own_config, partner_config).
    The model reads both widths as unsigned low 16-bit values, including the
    instruction spelled ``bn.lh``. Bytes begin at 0xa5 so bit updates and
    unchanged neighboring bytes are observable.
    """
    assert len(pairs) == PAIR_COUNT
    addresses = logicals(bank)
    memory = bus_fixture(addresses, [0xa5] * len(addresses), counter)
    records = bytearray([0xa5] * (4 * STRIDE))
    for pair, (state, width, partner_width, own_config, partner_config) in enumerate(pairs):
        engine = pair * 2 * STRIDE
        partner = engine + STRIDE
        records[engine + 4:engine + 8] = (bank & 0xffffffff).to_bytes(4, 'little')
        records[engine + 8:engine + 12] = (state & 0xffffffff).to_bytes(4, 'little')
        records[engine + 0x50:engine + 0x52] = (width & 0xffff).to_bytes(2, 'little')
        records[partner + 0x50:partner + 0x52] = (partner_width & 0xffff).to_bytes(2, 'little')
        records[partner + 0x52:partner + 0x54] = (partner_config & 0xffff).to_bytes(2, 'little')
        records[engine + 0x52:engine + 0x54] = (own_config & 0xffff).to_bytes(2, 'little')
    memory.regions.append(plain(ENGINES, records, 'engines'))
    if missing is not None:
        memory.regions = [r for r in memory.regions if r.address != missing]
    if read_only is not None:
        next(r for r in memory.regions if r.address == read_only).writable = False
    return Memory(memory.regions)


def bus_writes(memory):
    return [(address, value) for name, address, _, value in memory.writes
            if name.startswith('bus_')]


def expected_writes(bank, pairs):
    """Independent logical-operation oracle; include each page-select write."""
    values = {byte_address(a): 0xa5 for a in logicals(bank)}
    expected = []

    def byte(logical, value, *, read_first=False):
        logical &= 0xffffffff
        if not logical & 0x7fff00:
            return
        page = BUS + 2 * (logical & 0x7fff00)
        target = byte_address(logical)
        if logical & 0x800000:
            expected.append((page, logical >> 24))
            values[page] = (logical >> 24) & 255
            if read_first:
                expected.append((page, logical >> 24))
        value &= 255
        expected.append((target, value))
        values[target] = value

    def write(base, value, width):
        for i in range(width):
            byte(base + bank + i, value >> (8 * i))

    def update(base, enable):
        logical = (base + bank) & 0xffffffff
        target = byte_address(logical)
        prior = values.get(target, 0xa5)
        byte(logical, prior | 8 if enable else prior & ~8, read_first=True)

    for state, width, partner_width, own_config, partner_config in pairs:
        for base, value, size in BASE_WRITES:
            write(base, value, size)
        if not state or not width:
            update(0x20800047, False)
            continue
        if ((width + partner_width) & 0xffffffff) <= 0x1400:
            slot = (0x1400 - width) & 0xfff8
            update(0x20800047, False)
            update(0x20800021, True)
        else:
            slot = 0
            update(0x20800047, True)
            update(0x20800021, False)
            write(0x23800012, 0, 4)
            write(0x23800052, 0, 4)
            write(0x2080002a, partner_config, 2)
            write(0x2080002c, own_config, 2)
        write(0x20800026, slot, 2)
    return expected


def validate():
    expanded, segments, _ = inputs()
    strict = ModuleModel(segments, call_policy='fallthrough-hypothesis')
    models = {policy: ModuleModel(segments, call_policy='fallthrough-hypothesis',
                                  store_policy=policy) for policy in POLICIES}
    scenarios = {
        'both_inactive': ((0, 0x100, 0x20, 0x3344, 0x1122), (0, 0, 0, 0, 0)),
        'zero_width_guard': ((1, 0, 0x20, 0x3344, 0x1122), (0, 0, 0, 0, 0)),
        'threshold_equal': ((1, 0x1300, 0x100, 0x3344, 0x1122), (0, 0, 0, 0, 0)),
        'threshold_above': ((1, 0x1301, 0x100, 0x7788, 0x5566), (0, 0, 0, 0, 0)),
        'high_bit_width': ((1, 0x8000, 0x100, 0x7788, 0x5566), (0, 0, 0, 0, 0)),
        'mixed_pair_order': ((1, 0x1301, 0x100, 0x7788, 0x5566),
                             (1, 0x100, 0x20, 0x3344, 0x1122)),
    }
    counts = {name: 0 for name in scenarios}
    visited = set()
    for policy, model in models.items():
        for name, pairs in scenarios.items():
            memory = fixture(pairs=pairs, counter=0)
            result = model.run(ENTRY, memory, regs())
            assert result['termination'] == 'return'
            assert result['registers'][1] == regs()[1]
            assert result['registers'][10:13] == regs()[10:13]
            assert bus_writes(memory) == expected_writes(0x200, pairs), (policy, name)
            assert len([r for r in memory.regions if r.name == 'engines']) == 1
            assert all(region != 'engines' for region, *_ in memory.writes)
            visited.update(result['visited'])
            counts[name] += 1

    inactive = scenarios['both_inactive']
    memory = fixture(pairs=inactive)
    try:
        strict.run(ENTRY, memory, regs())
    except ValueError as error:
        assert 'unresolved store' in str(error)
    else:
        raise AssertionError('Default store policy accepted the masked update')
    expected_prefix = expected_writes(0x200, inactive)[:20]
    assert bus_writes(memory) == expected_prefix

    return {'status': 'two storage-register pairs validated with explicit plain bus and store hypotheses',
            'source_layout_sha256': sha(LAYOUT.read_bytes()), **decoder_identity(),
            'conditional_cases_by_policy': {policy: len(scenarios) for policy in POLICIES},
            'conditional_cases': sum(counts.values()), 'strict_rejections': 1,
            'cases': counts, 'visited_instruction_count': len(visited),
            'source_spans': [{'name': name, 'address': hex(start), 'end_exclusive': hex(end),
                              'size': end-start, 'sha256': sha(expanded[start-0x200000:end-0x200000]),
                              'visited_instructions': sum(start <= pc < end for pc in visited)}
                             for name, start, end, _ in SPANS if start == ENTRY],
            'limitations': ['Plain bus bytes do not model hardware pages or peripheral effects.',
                            'Both ambiguous-store policies are hypotheses; the default rejects them.',
                            'Only the two reachable record pairs and bounded branch values are exercised.'],
            'tools_sha256': {name: sha((ROOT/'scripts'/name).read_bytes())
                             for name in ('validate_dc9_storage_registers.py',
                                          'reconstruct_dc9_channel_storage.py', 'aeon_module_model.py')}}


if __name__ == '__main__':
    report = validate()
    print(f"Storage registers: {report['conditional_cases']} conditional, {report['strict_rejections']} strict rejection")
