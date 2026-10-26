"""Validate recovered masked register updates against plain-byte memory.

The model treats the mapped register bus as ordinary bytes. Explicit store
policies exercise the ambiguous counter store as alternative hypotheses; they
do not establish hardware behavior.
"""
import json

from aeon_helper_emulator import context, decoder_identity
from aeon_module_model import Memory, ModuleModel, Region
from build_dc9_source_baseline import ROOT, LAYOUT, sha
from recompress_dc9 import SOURCE_SHA
from validate_dc9_module import inputs, initial_registers, stack_region
from validate_dc9_registers import BUS, POINTER, byte_address

WRITE8 = 0x23dfe1
WRITE16 = 0x23e152
COUNTER = 0x4551a8
LOCK_OFFSET = 0x203034
MASK_ADDRESS = 0x455214
MASK8 = 0xff
MASK16 = 0xffff
POLICIES = ('sleigh-store', 'halfword-lane-hypothesis')


def fixture(logicals, old_values, counter):
    """Map only the plain bytes needed for selected direct/paged updates."""
    bus_bytes = {}
    for logical, old in zip(logicals, old_values):
        target = byte_address(logical)
        bus_bytes[target] = old & 0xff
        # A flagged logical address selects a page byte before its data byte.
        if logical & 0x800000:
            page = BUS + 2 * (logical & 0x7fff00)
            bus_bytes[page] = (logical >> 24) & 0xff
    regions = [stack_region(),
               Region('base_pointer', POINTER, bytearray(BUS.to_bytes(4, 'little'))),
               Region('broadcast_mask', MASK_ADDRESS, bytearray(2)),
               Region('counter', COUNTER,
                      bytearray((counter & MASK16).to_bytes(2, 'little') + b'\xa5\x5a'), True),
               Region('lock', BUS + LOCK_OFFSET, bytearray([0]), True)]
    regions.extend(Region(f'bus_{address:08x}', address, bytearray([value]), True)
                   for address, value in sorted(bus_bytes.items()))
    return Memory(regions)


def _byte(memory, address):
    region, offset = memory.locate(address, 1)
    return region.data[offset]


def _case(model, entry, logical, value, mask, old, counter):
    width = 1 if entry == WRITE8 else 2
    logicals = [logical + index for index in range(width)]
    olds = [(old >> (8 * index)) & 0xff for index in range(width)]
    memory = fixture(logicals, olds, counter)
    regs = initial_registers(0x91627354)
    regs[3:6] = [logical, value, mask]
    result = model.run(entry, memory, regs)
    truncated = (old & (~mask & ((1 << (8 * width)) - 1))) | (
        value & mask & ((1 << (8 * width)) - 1))
    observed = sum(_byte(memory, byte_address(logical + index)) << (8 * index)
                   for index in range(width))
    assert observed == truncated, (entry, hex(logical), hex(observed), hex(truncated))
    assert result['termination'] == 'return'
    assert _byte(memory, BUS + LOCK_OFFSET) == (0 if counter == 0 else 1)
    counter_region = next(region for region in memory.regions if region.name == 'counter')
    assert int.from_bytes(counter_region.data[:2], 'little') == counter
    if model.store_policy == 'sleigh-store':
        assert counter_region.data[2:] == b'\x00\x00'
    else:
        assert counter_region.data[2:] == b'\xa5\x5a'
    return result


def validate():
    _, segments, _ = inputs()
    strict = ModuleModel(segments, call_policy='fallthrough-hypothesis')
    models = {policy: ModuleModel(segments, call_policy='fallthrough-hypothesis',
                                  store_policy=policy) for policy in POLICIES}
    # Both widths cover direct and paged addresses with zero and full masks.
    # Wide full masks exercise width truncation at the actual operation width.
    cases = ((WRITE8, 0x001234, 0x1ed, 0x000, 0xb6),
             (WRITE8, 0x001235, 0x345, 0x1ff, 0x96),
             (WRITE8, 0xab801234, 0x1ed, 0x000, 0xb6),
             (WRITE8, 0xab801235, 0x345, 0x1ff, 0x96),
             (WRITE16, 0x001240, 0x1234ed, 0x00000, 0xa55a),
             (WRITE16, 0x001242, 0xfedcba98, 0x1ffff, 0x9cb6),
             (WRITE16, 0xab801240, 0x1234ed, 0x00000, 0xa55a),
             (WRITE16, 0xab801242, 0xfedcba98, 0x1ffff, 0x9cb6))
    counters = (0, 1, 0xfffe, 0xffff)
    strict_rejections = 0
    conditional_cases = 0
    visited_by_policy = {policy: set() for policy in POLICIES}

    for entry, logical, value, mask, old in cases:
        for counter in counters:
            # The implicit/default policy must stop at bg.sw_1 before the
            # masked data update; only stack saves may have occurred.
            width = 1 if entry == WRITE8 else 2
            memory = fixture([logical + i for i in range(width)],
                             [(old >> (8 * i)) & 0xff for i in range(width)], counter)
            regs = initial_registers(0x91627354); regs[3:6] = [logical, value, mask]
            try:
                strict.run(entry, memory, regs)
            except ValueError as error:
                assert 'unresolved store' in str(error), error
                assert all(name == 'stack' for name, *_ in memory.writes)
                assert [ _byte(memory, byte_address(logical + i)) for i in range(width) ] == [
                    (old >> (8 * i)) & 0xff for i in range(width)]
                strict_rejections += 1
            else:
                raise AssertionError('Default model unexpectedly accepted ambiguous bg.sw_1')

            for policy, model in models.items():
                result = _case(model, entry, logical, value, mask, old, counter)
                conditional_cases += 1
                visited_by_policy[policy].update(result['visited'])
                assert result['steps'] > 0

    # Demonstrate that a two-byte update is not transactional: the low byte
    # succeeds, then an unmapped high byte rejects and leaves that write visible.
    logical, old, value, mask = 0x001240, 0xa55a, 0x1234beef, 0x0000ffff
    memory = fixture([logical], [old & 0xff], 1)
    # fixture maps the low byte only; it cannot map the adjacent high byte.
    regs = initial_registers(0x91627354); regs[3:6] = [logical, value, mask]
    partial_write = None
    try:
        models['halfword-lane-hypothesis'].run(WRITE16, memory, regs)
    except ValueError as error:
        partial_write = str(error)
        assert partial_write == f'Unmapped memory access: {byte_address(logical + 1):#x}+1', partial_write
    else:
        raise AssertionError('Expected missing high byte to reject the second byte operation')
    assert _byte(memory, byte_address(logical)) == ((old & 0xff) & ~(mask & 0xff) | value & mask & 0xff)
    prior_bus_writes = [(address, val) for name, address, _size, val in memory.writes
                        if name.startswith('bus_')]
    assert prior_bus_writes == [(byte_address(logical), value & mask & 0xff)]

    ctx = context()
    counter_store = []
    for address in (0x23e006, 0x23e06b):
        code = next(code for base, code in segments if base <= address < base + len(code))
        base = next(base for base, code in segments if base <= address < base + len(code))
        code = code[address - base:address - base + 4]
        translation = ctx.translate(code, base_address=address, max_instructions=1)
        counter_store.append({'address': hex(address), 'bytes': code.hex(),
                              'pcode_store_widths': [op.inputs[2].size for op in translation.ops
                                                     if op.opcode.name == 'STORE']})

    coverage = {policy: {'visited_instruction_count': len(addresses),
                         'entries': {hex(entry): sum(entry <= pc < end for pc in addresses)
                                     for entry, end in ((WRITE8, 0x23e0b6),
                                                        (WRITE16, 0x23e18c))}}
                for policy, addresses in visited_by_policy.items()}
    return {
        'status': 'masked register arithmetic validated using plain-byte memory and explicit store hypotheses',
        'source_firmware_sha256': SOURCE_SHA,
        **decoder_identity(),
        'source_layout_sha256': sha(LAYOUT.read_bytes()),
        'tool_sha256': {name: sha((ROOT / 'scripts' / name).read_bytes()) for name in
                        ('aeon_module_model.py', 'aeon_subset_assembler.py',
                         'validate_dc9_masked.py', 'test_dc9_masked.py')},
        'policies': list(POLICIES),
        'strict_cases': strict_rejections,
        'conditional_cases': conditional_cases,
        'cases_per_policy': conditional_cases // len(POLICIES),
        'coverage': coverage,
        'counter_store_observations': counter_store,
        'counter_values': list(counters),
        'direct_and_paged_cases': [{'width': 8 if entry == WRITE8 else 16,
                                    'logical': hex(logical), 'mask': hex(mask)}
                                   for entry, logical, _value, mask, _old in cases],
        'partial_write_failure': {'rejection': partial_write,
                                  'visible_bus_writes': prior_bus_writes,
                                  'low_byte_after_failure': hex(_byte(memory, byte_address(logical)))},
        'limitations': [
            'The modeled bus and lock are plain bytes; no page windows, devices, concurrency, or timing are modeled.',
            'sleigh-store and halfword-lane-hypothesis are explicit alternatives for ambiguous bg.sw_1 counter stores, not hardware facts.',
            'Passing arithmetic cases validate the reconstructed routines only under the bounded model; they do not establish physical CPU or device behavior.'
        ],
    }


if __name__ == '__main__':
    report = validate()
    (ROOT / 'analysis/dc9-masked-validation.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps({'strict_cases': report['strict_cases'],
                      'conditional_cases': report['conditional_cases'],
                      'coverage': report['coverage']}, indent=2))
