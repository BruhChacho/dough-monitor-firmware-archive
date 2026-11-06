"""Bounded, offline checks of the three recovered channel dispatch routines.

The bus is explicit plain byte memory. CALL fallthrough and ambiguous counter
stores are hypotheses; no timer, device, or unknown service is substituted.
"""
from aeon_module_model import Memory, ModuleModel, Region
from aeon_helper_emulator import decoder_identity
from build_dc9_source_baseline import LAYOUT, ROOT, sha
from reconstruct_dc9_channel_dispatch import SPANS
from validate_dc9_masked import POLICIES, fixture as bus_fixture
from validate_dc9_module import inputs, initial_registers
from validate_dc9_registers import BUS, byte_address

METADATA = 0x3b4950
ROUTE, SELECTOR, APPLY = 0x21ddcf, 0x21bfca, 0x226bb5
SELECTOR_LOGICAL = (0xfff01f8e, 0xfff01f8d, 0xfff01f90, 0xfff01f8f)
ROUTE_LOGICAL = (0xfff02e03, 0xfff02e02, 0xfff02e05, 0xfff02e04)
APPLY_LOGICAL = 0xfff0250e


def mapped_fixture(logicals, olds, *, counter=0, keys=()):
    memory = bus_fixture(logicals, olds, counter)
    table = bytearray(max(6, len(keys)) * 176)
    for index, key in enumerate(keys):
        table[index * 176:index * 176 + 4] = key.to_bytes(4, 'little')
    return Memory(memory.regions + [Region('metadata', METADATA, table)])


def registers(*args):
    before = initial_registers(0x31415926)
    before[3:3 + len(args)] = args
    return before


def bus_writes(memory):
    return [(address, value) for name, address, size, value in memory.writes
            if name.startswith('bus_')]


def bus_byte(memory, logical):
    region, offset = memory.locate(byte_address(logical), 1)
    return region.data[offset]


def page_write(logical):
    return (BUS + 2 * (logical & 0x7fff00), (logical >> 24) & 255)


def assert_saves(before, result, count):
    after = result['registers']
    assert after[1] == before[1] and after[9] == 0xfffffff0
    assert after[10:10 + count] == before[10:10 + count]


def validate():
    expanded, segments, _ = inputs()
    strict = ModuleModel(segments, call_policy='fallthrough-hypothesis')
    models = {p: ModuleModel(segments, call_policy='fallthrough-hypothesis', store_policy=p)
              for p in POLICIES}
    counts = {'strict': {}, **{p: {} for p in POLICIES}}
    visits = {'strict': set(), **{p: set() for p in POLICIES}}

    def note(policy, case, result):
        counts[policy][case] = counts[policy].get(case, 0) + 1
        visits[policy].update(result['visited'])

    # Out-of-range engines return before any bus work; the route still reads
    # the metadata word and calls the real selector once.
    for engine in (4, 0xffffffff):
        memory = mapped_fixture([], [], keys=(0x12345678,))
        before = registers(0, engine)
        result = strict.run(ROUTE, memory, before)
        assert result['termination'] == 'return' and not bus_writes(memory)
        assert [target for _, target, _ in result['calls']] == [SELECTOR]
        assert_saves(before, result, 2)
        assert ('metadata', METADATA, 4) in memory.reads
        note('strict', 'route_invalid_engine', result)

    for engine in (4, 0xffffffff):
        memory = mapped_fixture([], [])
        before = registers(0x12345678, engine)
        result = strict.run(SELECTOR, memory, before)
        assert result['termination'] == 'return' and result['registers'][3:6] == before[3:6]
        assert not memory.writes and not memory.reads
        note('strict', 'selector_invalid_engine', result)

    # Strict default reaches the real masked helper, then rejects its
    # unresolved bg.sw_1 before touching register data.
    memory = mapped_fixture([SELECTOR_LOGICAL[0], ROUTE_LOGICAL[0]], [0xa5, 0x5a],
                            keys=(1,))
    try:
        strict.run(ROUTE, memory, registers(0, 0))
    except ValueError as error:
        assert 'unresolved store semantics' in str(error)
    else:
        raise AssertionError('strict store policy accepted masked helper')
    assert not bus_writes(memory)
    assert bus_byte(memory, SELECTOR_LOGICAL[0]) == 0xa5
    counts['strict']['masked_store_rejection'] = 1

    # Mapping is read as a full word, then reduced to a byte. Distinct high
    # bits and each boundary exercise the three key-selection branches.
    for policy, model in models.items():
        for key in (0, 1, 4, 5, 7, 8, 0x100, 0x12345678):
            mapped = ((key + 3) if key <= 4 else (key - 5) if key <= 7 else key) & 255
            for engine in range(4):
                selector, route = SELECTOR_LOGICAL[engine], ROUTE_LOGICAL[engine]
                memory = mapped_fixture([selector, route], [0xa5, 0x5a], counter=1,
                                        keys=(key,))
                before = registers(0, engine)
                result = model.run(ROUTE, memory, before)
                assert result['termination'] == 'return'
                assert_saves(before, result, 2)
                assert [target for _, target, _ in result['calls']].count(SELECTOR) == 1
                assert ('metadata', METADATA, 4) in memory.reads
                expected_selector = (0xa5 & ~0x7c) | ((mapped << 2) & 0x7c)
                assert bus_byte(memory, selector) == expected_selector
                assert bus_byte(memory, route) == mapped
                assert memory.locate(0x4551a8, 2)[0].data[:2] == b'\x01\x00'
                assert memory.locate(BUS + 0x203034, 1)[0].data == b'\x01'
                expected = [page_write(selector), page_write(selector),
                            (byte_address(selector), expected_selector),
                            page_write(route), (byte_address(route), mapped)]
                assert bus_writes(memory) == expected, (policy, key, engine, bus_writes(memory))
                note(policy, 'route_valid_engine', result)

        for index, key in ((1, 5), (5, 0x12345678)):
            engine = 2
            logicals = [SELECTOR_LOGICAL[engine], ROUTE_LOGICAL[engine]]
            keys = [0] * 6
            keys[index] = key
            memory = mapped_fixture(logicals, [0xa5, 0x5a], counter=1, keys=keys)
            result = model.run(ROUTE, memory, registers(index, engine))
            mapped = (key - 5 if key <= 7 else key) & 255
            assert result['termination'] == 'return'
            assert ('metadata', METADATA + index * 176, 4) in memory.reads
            assert bus_byte(memory, logicals[1]) == mapped
            assert_saves(registers(index, engine), result, 2)
            note(policy, 'route_metadata_stride', result)

        # Selector zero is valid; high bits of r3 cannot leak through fc/7c.
        for value in (0, 0x1f, 0x20, 0x123456ff):
            logical = SELECTOR_LOGICAL[0]
            memory = mapped_fixture([logical], [0xa5], counter=0)
            before = registers(value, 0)
            result = model.run(SELECTOR, memory, before)
            expected = (0xa5 & ~0x7c) | ((value << 2) & 0x7c)
            assert result['termination'] == 'return' and bus_byte(memory, logical) == expected
            assert bus_writes(memory) == [page_write(logical), page_write(logical),
                                          (byte_address(logical), expected)]
            note(policy, 'selector_direct', result)

        # No flags returns; a high-byte-only request writes a real 16-bit
        # register twice, in order, via the existing 23dfb6 helper.
        memory = mapped_fixture([], [])
        before = registers(0x12340000, 2)
        result = model.run(APPLY, memory, before)
        assert result['termination'] == 'return' and not bus_writes(memory)
        assert_saves(before, result, 4)
        note(policy, 'apply_zero_flags', result)

        for high in (1, 0xab, 0x1234ab):
            memory = mapped_fixture([APPLY_LOGICAL, APPLY_LOGICAL + 1], [0xa5, 0x5a])
            before = registers(high << 8, 2)
            result = model.run(APPLY, memory, before)
            assert result['termination'] == 'return'
            assert_saves(before, result, 4)
            expected = [page_write(APPLY_LOGICAL), (byte_address(APPLY_LOGICAL), high & 255),
                        page_write(APPLY_LOGICAL + 1), (byte_address(APPLY_LOGICAL + 1), 0),
                        page_write(APPLY_LOGICAL), (byte_address(APPLY_LOGICAL), 0),
                        page_write(APPLY_LOGICAL + 1), (byte_address(APPLY_LOGICAL + 1), 0)]
            assert bus_writes(memory) == expected, bus_writes(memory)
            note(policy, 'apply_high_only', result)

    # The low-byte path invokes a real delay before later unrecovered
    # services. Missing timer memory must reject without inventing completion.
    low_faults = {}
    for policy, model in models.items():
        memory = mapped_fixture([], [])
        try:
            model.run(APPLY, memory, registers(1, 0))
        except ValueError as error:
            low_faults[policy] = str(error)
            assert str(error) == ('Unmapped memory access: 0x455204+4' if policy == 'sleigh-store'
                                  else 'Unmapped memory access: 0x455204+2')
            assert not bus_writes(memory)
        else:
            raise AssertionError('low-byte apply unexpectedly completed')
        # Permit the genuine delay helper to arm its timer, then halt before
        # the first poll. No clock ticks or service return is invented.
        timer = Region('timer', 0x455204, bytearray.fromhex('0000003c'), True)
        memory = Memory(mapped_fixture([], []).regions + [timer])
        result = model.run(APPLY, memory, registers(1, 0), stop_before=(0x2420b2,))
        assert result['termination'] == 'breakpoint' and result['stopped_before'] == 0x2420b2
        assert [target for _, target, _ in result['calls']] == [0x24209d]
        assert not bus_writes(memory)
        assert [(a, width, value) for name, a, width, value in memory.writes if name == 'timer'] == [
            (0x455204, 4 if policy == 'sleigh-store' else 2, 2), (0x455206, 1, 1)]
        note(policy, 'apply_low_timer_prefix', result)
    return {
        'status': 'bounded channel dispatch instruction-model validation',
        'source_layout_sha256': sha(LAYOUT.read_bytes()),
        **decoder_identity(),
        'tools_sha256': {name: sha((ROOT / 'scripts' / name).read_bytes()) for name in
                         ('validate_dc9_channel_dispatch.py', 'test_dc9_channel_dispatch.py',
                          'aeon_module_model.py', 'aeon_subset_assembler.py')},
        'counts': counts,
        'strict_cases': sum(counts['strict'].values()),
        'conditional_cases': sum(sum(counts[p].values()) for p in POLICIES),
        'strict_rejections': counts['strict']['masked_store_rejection'],
        'visited': {p: sorted(v) for p, v in visits.items()},
        'source_spans': [{'name': n, 'address': hex(a), 'end_exclusive': hex(b),
                          'size': b - a, 'sha256': sha(expanded[a-0x200000:b-0x200000]),
                          'visited_instructions': {p: sum(a <= pc < b for pc in v)
                                                   for p, v in visits.items()}}
                         for n, a, b, *_ in SPANS],
        'low_path_faults': low_faults,
        'limitations': ['Plain bytes have no peripheral timing or page-window behavior.',
                        'Counter-store policies and CALL semantics remain hypotheses.',
                        'Low-byte apply completion is unvalidated beyond the real delay and service boundary.'],
    }


if __name__ == '__main__':
    import json
    print(json.dumps(validate(), indent=2))
