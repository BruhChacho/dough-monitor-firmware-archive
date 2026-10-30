"""Bounded checks for recovered global mode setter/getter leaves.

The ambiguous bg.sh and bg.sw_1 stores remain hypotheses. Successful-store
fixtures map four writable bytes at 0x343c14 so both candidate lane
interpretations can be observed without silently extending memory or reusing
the older read-only halfword fixture. Boundary cases deliberately use unmapped
and read-only variants.
"""
from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel
from build_dc9_source_baseline import ROOT, LAYOUT, sha
from reconstruct_dc9_engine_mode import SPANS
from validate_dc9_module import inputs, stack_region
from validate_dc9_transfer import plain, regs

HALFWORD_SET = 0x21bd00
WORD_SET = 0x21bd0a
ADJACENT_HALFWORD_READ = 0x21bd14
RESET = 0x222634
APPLY_WRAPPER = 0x23d349
GLOBAL = 0x343c14
GLOBAL_NAME = 'global_mode'
POLICIES = ('sleigh-store', 'halfword-lane-hypothesis')
INITIAL_GLOBAL = bytes.fromhex('11223344')


def model_fixture(store_policy='reject'):
    _, segments, _ = inputs()
    return ModuleModel(segments, call_policy='fallthrough-hypothesis',
                       store_policy=store_policy)


def global_memory(data=INITIAL_GLOBAL, *, writable=True, with_stack=True):
    regions = [plain(GLOBAL, data, GLOBAL_NAME, writable)]
    if with_stack:
        regions.append(stack_region())
    return Memory(regions)


def nonstack_writes(memory):
    return [write for write in memory.writes if write[0] != 'stack']


def expected_store(op, policy, value):
    """Return expected bytes/write for one ambiguous global store."""
    before = bytearray(INITIAL_GLOBAL)
    if op == 'bg.sh':
        if policy == 'sleigh-store':
            before[0:2] = (value >> 16 & 0xffff).to_bytes(2, 'little')
            write = (GLOBAL, 2, value >> 16 & 0xffff)
        else:
            before[2:4] = (value & 0xffff).to_bytes(2, 'little')
            write = (GLOBAL + 2, 2, value & 0xffff)
    else:
        if policy == 'sleigh-store':
            before[:] = value.to_bytes(4, 'little')
            write = (GLOBAL, 4, value)
        else:
            before[0:2] = (value & 0xffff).to_bytes(2, 'little')
            write = (GLOBAL, 2, value & 0xffff)
    return bytes(before), (GLOBAL_NAME, *write)


def validate():
    expanded, _, _ = inputs()
    strict = model_fixture()
    cases = {}
    conditional = {policy: 0 for policy in POLICIES}
    conditional_boundary_cases = 0
    visited = set()

    def note(name, result, policy=None):
        group = cases if policy is None else conditional
        key = name if policy is None else policy
        group[key] = group.get(key, 0) + 1
        visited.update(result['visited'])

    # Both ambiguous setters reject by default before changing mapped bytes.
    for entry, op, value in ((HALFWORD_SET, 'bg.sh', 0x89abcdef),
                             (WORD_SET, 'bg.sw_1', 0x76543210)):
        memory = global_memory()
        with_error = None
        try:
            strict.run(entry, memory, regs(value))
        except ValueError as error:
            with_error = str(error)
        assert with_error == f'Unsupported instruction: {op}; unresolved store semantics'
        assert bytes(memory.regions[0].data) == INITIAL_GLOBAL
        assert not nonstack_writes(memory)
        cases['default_store_rejection'] = cases.get('default_store_rejection', 0) + 1

    # A store to an unmapped destination rejects; a read-only destination
    # retains all four sentinels. Both policies are exercised for each width.
    for entry, op, value in ((HALFWORD_SET, 'bg.sh', 0x89abcdef),
                             (WORD_SET, 'bg.sw_1', 0x76543210)):
        for policy in POLICIES:
            model = model_fixture(policy)
            unmapped = Memory([stack_region()])
            try:
                model.run(entry, unmapped, regs(value))
            except ValueError as error:
                if op == 'bg.sh':
                    unmapped_address = GLOBAL if policy == 'sleigh-store' else GLOBAL + 2
                    unmapped_size = 2
                else:
                    unmapped_address = GLOBAL
                    unmapped_size = 4 if policy == 'sleigh-store' else 2
                assert str(error) == (f'Unmapped memory access: '
                                      f'{unmapped_address:#x}+{unmapped_size}')
            else:
                raise AssertionError('Unmapped global store unexpectedly succeeded')
            assert not nonstack_writes(unmapped)

            readonly = global_memory(writable=False)
            before = bytes(readonly.regions[0].data)
            try:
                model.run(entry, readonly, regs(value))
            except ValueError as error:
                assert str(error) == 'Write to read-only region'
            else:
                raise AssertionError('Read-only global store unexpectedly succeeded')
            assert bytes(readonly.regions[0].data) == before
            assert not nonstack_writes(readonly)
            conditional[policy] += 1
            conditional_boundary_cases += 1

    # Nonzero 32-bit patterns expose the width and lane hypotheses directly.
    for entry, op, value in ((HALFWORD_SET, 'bg.sh', 0x89abcdef),
                             (WORD_SET, 'bg.sw_1', 0x76543210)):
        for policy in POLICIES:
            model = model_fixture(policy)
            memory = global_memory()
            before = bytes(memory.regions[0].data)
            result = model.run(entry, memory, regs(value))
            expected, write = expected_store(op, policy, value)
            assert result['termination'] == 'return'
            assert bytes(memory.regions[0].data) == expected
            assert nonstack_writes(memory) == [write]
            assert before == INITIAL_GLOBAL
            note('setter_width_and_lanes', result, policy)

    # The getter reads exactly the adjacent halfword, leaving the low global
    # sentinel bytes untouched. It is independent of store-policy hypotheses.
    memory = global_memory(bytes.fromhex('3412cdab'))
    result = strict.run(ADJACENT_HALFWORD_READ, memory, regs())
    assert result['termination'] == 'return'
    assert result['registers'][3] == 0xabcd
    assert memory.reads == [(GLOBAL_NAME, GLOBAL + 2, 2)]
    assert not memory.writes
    note('adjacent_halfword_getter', result)

    # Observe the real reset's first calls and arguments. Do not enter the
    # engine-mode configuration routine or simulate its external requests.
    for policy in POLICIES:
        model = model_fixture(policy)
        memory = global_memory()
        before = regs(7)
        result = model.run(RESET, memory, before, stop_before=(0x2213d0,))
        assert result['termination'] == 'breakpoint'
        assert result['stopped_before'] == 0x2213d0
        assert [target for _, target, _ in result['calls']] == [
            HALFWORD_SET, WORD_SET, 0x2213d0]
        assert result['registers'][3:5] == [0, 7]
        assert result['registers'][1] == before[1] - 8
        expected = (bytes.fromhex('ef080000') if policy == 'sleigh-store'
                    else bytes.fromhex('ef08a013'))
        assert bytes(memory.regions[0].data) == expected
        assert memory.reads == []
        note('reset_prefix_arguments', result, policy)

    # The 13-index wrapper reaches the first reset and stops at its first
    # configuration call. This checks wrapper/reset arguments without stubbing
    # the unmodeled register-request service beyond 0x2213d0.
    for policy in POLICIES:
        model = model_fixture(policy)
        memory = Memory([plain(GLOBAL, INITIAL_GLOBAL, GLOBAL_NAME, True),
                         plain(0x47fa9c, bytes(13 * 124), 'engines'),
                         stack_region()])
        before = regs()
        result = model.run(APPLY_WRAPPER, memory, before,
                           stop_before=(0x2213d0,))
        assert result['termination'] == 'breakpoint'
        assert result['stopped_before'] == 0x2213d0
        assert [target for _, target, _ in result['calls']] == [
            RESET, HALFWORD_SET, WORD_SET, 0x2213d0]
        assert result['registers'][3:5] == [0, 0]
        assert result['registers'][1] == before[1] - 16
        note('apply_wrapper_first_reset_prefix', result, policy)

    relevant = {HALFWORD_SET, WORD_SET, ADJACENT_HALFWORD_READ,
                RESET, APPLY_WRAPPER}
    spans = [record for record in SPANS
             if int(record[1]) in relevant]
    return {
        'source_layout_sha256': sha(LAYOUT.read_bytes()), **decoder_identity(),
        'status': 'bounded global setter/getter and wrapper/reset prefixes; configuration requests remain outside this leaf validator',
        'cases': cases,
        'conditional_cases_by_policy': conditional,
        'conditional_cases': sum(conditional.values()),
        'conditional_boundary_cases': conditional_boundary_cases,
        'visited_instruction_count': len(visited),
        'source_spans': [
            {'name': name, 'address': hex(start), 'end_exclusive': hex(end),
             'size': end - start,
             'sha256': sha(expanded[start - 0x200000:end - 0x200000]),
             'visited_instructions': sum(start <= pc < end for pc in visited)}
            for name, start, end, _ in spans],
        'limitations': [
            'Four writable bytes at 0x343c14 are explicit fixture input; no memory is automatically expanded.',
            'bg.sh and bg.sw_1 are measured under explicit SLEIGH-store and halfword-lane hypotheses; default execution rejects them.',
            'The wrapper and reset stop before 0x2213d0; mode requests, engine completion, and hardware effects are not modeled.'],
        'tools_sha256': {name: sha((ROOT / 'scripts' / name).read_bytes())
                         for name in ('validate_dc9_engine_mode_leaves.py',
                                      'reconstruct_dc9_engine_mode.py',
                                      'aeon_module_model.py',
                                      'aeon_subset_assembler.py')},
    }


if __name__ == '__main__':
    report = validate()
    print(f"Engine-mode leaves: {sum(report['cases'].values())} strict, "
          f"{report['conditional_cases']} conditional")
