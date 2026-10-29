"""Bounded execution of recovered first-engine preparation.

Byte memory and CALL/store policies are explicit hypotheses. The fixtures do
not represent peripherals, completion of full apply, or physical operation.
"""
from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel
from build_dc9_source_baseline import ROOT, LAYOUT, sha
from reconstruct_dc9_engine_prepare import SPANS
from validate_dc9_module import inputs, stack_region
from validate_dc9_transfer import plain, regs, named
from validate_dc9_channel_apply import apply_fixture
from validate_dc9_masked import POLICIES, fixture as bus_fixture
from validate_dc9_registers import BUS

ENGINES = 0x47fa9c
RECORDS = 0x4821ec
GLOBAL_HALFWORD = 0x343c14
# Literal logical register bases emitted by 0x21ffb3..0x22089f. Both bytes
# are mapped for helpers that request halfwords. This is an address list, not
# an automatically growing bus or a model of device register behavior.
REGISTER_OFFSETS = (
    0x10800003, 0x10800010, 0x10800012, 0x10800014,
    0x10800016, 0x1080008c, 0x1080000c, 0x1080000e,
    0x10800004, 0x10800006, 0x0f80000e, 0x0f800010,
    0x0f800012, 0x0f800014, 0x0f8000ac, 0x20800020,
    0x57800020, 0x58800020)


def isolated_fixture(index, mode=0, *, global_value=1000):
    engines = bytearray(13 * 124)
    base = index * 124
    engines[base + 4:base + 8] = (0x200 + index * 0x100).to_bytes(4, 'little')
    engines[base + 0xc] = mode
    engines[base + 0x10] = 0  # The recovered reader selects channel record zero.
    return Memory([stack_region(), plain(ENGINES, engines, 'engines'),
                   plain(RECORDS, bytes(4 * 168), 'records'),
                   plain(GLOBAL_HALFWORD, global_value.to_bytes(2, 'little'),
                         'global_halfword', False)])


def nonstack_writes(memory):
    return [write for write in memory.writes if write[0] != 'stack']


def mapped_return_fixture(index, *, zero_bank=False):
    bank = 0 if zero_bank else 0x200 + index * 0x100
    logicals = [bank + offset + lane for offset in REGISTER_OFFSETS
                for lane in (0, 1)]
    base = isolated_fixture(index, 1)
    if zero_bank:
        named(base, 'engines').data[index * 124 + 4:index * 124 + 8] = bytes(4)
    bus = bus_fixture(logicals, [0x30] * len(logicals), 0)
    return Memory(base.regions + [region for region in bus.regions
                                  if region.name != 'stack'] +
                  [plain(0x455210, b'\0\0', 'range_mode')])


def validate():
    expanded, segments, _ = inputs()
    strict = ModuleModel(segments, call_policy='fallthrough-hypothesis')
    cases = {}; conditional = {}; visited = set()

    def record(name, result, policy=None):
        group = cases if policy is None else conditional.setdefault(policy, {})
        group[name] = group.get(name, 0) + 1
        visited.update(result['visited'])

    # The source has a local index >3 return after its first two leaf calls.
    for index in range(4, 13):
        memory = isolated_fixture(index)
        before = regs(index)
        result = strict.run(0x21ffb3, memory, before)
        assert result['termination'] == 'return'
        assert result['registers'][1] == before[1]
        assert result['registers'][10:23] == before[10:23]
        assert [target for _, target, _ in result['calls']] == [0x2227ef, 0x21bd8d]
        assert memory.reads[:6] == [
            ('engines', ENGINES + index * 124 + 4, 4),
            ('engines', ENGINES + index * 124 + 0x10, 1),
            ('engines', ENGINES + index * 124 + 0x4c, 2),
            ('engines', ENGINES + index * 124 + 0x68, 2),
            ('engines', ENGINES + index * 124 + 0x50, 2),
            ('engines', ENGINES + index * 124 + 0x6a, 2)]
        assert not nonstack_writes(memory)
        record('out_of_range_engine_return', result)

    # Stop at the source's first register-service decision. Both record modes
    # exercise real arithmetic and globally sourced size; no service is stubbed.
    for index in range(4):
        for mode in (0, 1):
            memory = isolated_fixture(index, mode)
            result = strict.run(0x21ffb3, memory, regs(index),
                                stop_before=(0x22020d,))
            assert result['termination'] == 'breakpoint'
            assert result['registers'][13] == index
            assert result['registers'][14] == 0
            assert [target for _, target, _ in result['calls']] == (
                [0x2227ef, 0x21bd8d, 0x21bd1e] +
                ([] if mode else [0x21bd1e]))
            assert [read for read in memory.reads if read[0] == 'global_halfword'] == [
                ('global_halfword', GLOBAL_HALFWORD, 2)] * (1 if mode else 2)
            assert [write[2:] for write in memory.writes if write[0] == 'stack'
                    and write[1] == regs()[1] - 0x58 + 0x18] == [
                        (4, 0x8eb if mode else 0x86f)]
            assert not nonstack_writes(memory)
            record('selected_engine_service_prefix', result)

    # Continue the mode-one path to the first real register helper and check
    # its three arguments. Its byte/register side effects are outside this
    # breakpoint and are not inferred from the call alone.
    for index in range(4):
        memory = isolated_fixture(index, 1)
        memory = Memory(memory.regions + [plain(0x455210, b'\0',
                                               'range_mode')])
        result = strict.run(0x21ffb3, memory, regs(index),
                            stop_before=(0x23dfe1,))
        assert result['termination'] == 'breakpoint'
        assert [target for _, target, _ in result['calls'][-2:]] == [
            0x21bd1e, 0x23dfe1]
        assert result['registers'][3:6] == [
            0x10800203 + index * 0x100, 0x20 if index & 1 else 0x10,
            0x20 if index & 1 else 0x10]
        assert memory.reads[-1] == ('range_mode', 0x455210, 1)
        assert not nonstack_writes(memory)
        record('first_register_helper_arguments', result)

    # The actual full-apply fixture enters this function after four channel
    # updates. The global halfword is explicit input, and execution stops at
    # the same first register-service decision for both existing store policies.
    for policy in POLICIES:
        model = ModuleModel(segments, call_policy='fallthrough-hypothesis',
                            store_policy=policy)
        for index in range(4):
            memory = mapped_return_fixture(index, zero_bank=True)
            before = regs(index)
            result = model.run(0x21ffb3, memory, before, max_steps=30000)
            assert result['termination'] == 'return'
            assert result['registers'][1] == before[1]
            assert result['registers'][10:23] == before[10:23]
            assert not any(name.startswith('bus_') for name, *_ in memory.writes)
            assert len([target for _, target, _ in result['calls']
                        if target in (0x23dfe1, 0x23e152, 0x23dfb6)]) == 8
            assert [(name, value) for name, _, _, value in memory.writes
                    if name in ('counter', 'lock')][:4] == [
                        ('counter', 1), ('lock', 1),
                        ('counter', 0), ('lock', 0)]
            record('selected_engine_zero_bank_returns', result, policy)
        for index in range(4):
            memory = mapped_return_fixture(index)
            engine_before = bytes(named(memory, 'engines').data)
            records_before = bytes(named(memory, 'records').data)
            before = regs(index)
            result = model.run(0x21ffb3, memory, before, max_steps=30000)
            assert result['termination'] == 'return'
            assert result['registers'][1] == before[1]
            assert result['registers'][10:23] == before[10:23]
            assert bytes(named(memory, 'engines').data) == engine_before
            assert bytes(named(memory, 'records').data) == records_before
            helper_targets = [target for _, target, _ in result['calls']
                              if target in (0x23dfe1, 0x23e152,
                                            0x23dfb6)]
            assert helper_targets == [0x23dfe1, 0x23e152, 0x23dfe1,
                                      0x23e152, 0x23dfe1, 0x23dfe1,
                                      0x23dfe1, 0x23dfb6]
            page_address = BUS + 2 * (0x200 + index * 0x100)
            data_writes = [(address - page_address, value)
                           for name, address, width, value in memory.writes
                           if name.startswith('bus_') and address != page_address]
            offsets = ([5, 0x20, 0x21, 0x24, 0x25, 0x40, 0x40,
                        0x118, 0x119, 0x158] if index & 1 else
                       [5, 0x1c, 0x1d, 0x20, 0x21, 0x40, 0x40,
                        0x118, 0x119, 0x158])
            values = [0x30, 0, 0, 0, 0, 0x31 if index & 1 else 0x30,
                      0x30, 0, 0x40, 0x32]
            assert data_writes == list(zip(offsets, values))
            assert all(width == 1 for name, address, width, value in
                       memory.writes if name.startswith('bus_'))
            record('selected_engine_mode_one_returns', result, policy)
        for config, active in ((0x20, 1), (0, 0)):
            memory = apply_fixture(expanded, config, active)
            # Prior enabled setup selects owner index four. A fifth synthetic
            # record is explicit input for this otherwise unmapped read.
            named(memory, 'records').data.extend(bytes(168))
            memory = Memory(memory.regions + [plain(GLOBAL_HALFWORD,
                          (1000).to_bytes(2, 'little'), 'global_halfword', False)])
            result = model.run(0x23fad0, memory, regs(), max_steps=100000,
                               stop_before=(0x22020d,))
            assert result['termination'] == 'breakpoint'
            assert [target for _, target, _ in result['calls'][-5:]] == [
                0x21ffb3, 0x2227ef, 0x21bd8d, 0x21bd1e, 0x21bd1e]
            assert ('global_halfword', GLOBAL_HALFWORD, 2) in memory.reads
            assert not any(name in ('global_halfword', 'config_pointer',
                                    'config', 'active') for name, *_ in memory.writes)
            record('full_apply_first_engine_prefix', result, policy)

    return {
        'source_layout_sha256': sha(LAYOUT.read_bytes()), **decoder_identity(),
        'status': 'first-engine preparation mode-one returns and bounded service prefixes; full apply remains partial',
        'cases': cases, 'strict_cases': sum(cases.values()),
        'conditional_cases_by_policy': conditional,
        'conditional_cases': sum(sum(group.values()) for group in conditional.values()),
        'visited_instruction_count': len(visited),
        'source_spans': [
            {'name': name, 'address': hex(start), 'end_exclusive': hex(end),
             'size': end - start,
             'sha256': sha(expanded[start - 0x200000:end - 0x200000]),
             'visited_instructions': sum(start <= pc < end for pc in visited)}
            for name, start, end, _ in SPANS],
        'limitations': [
            'Full apply has not returned; isolated mode-one returns prove only execution on mapped plain bytes, not service or physical effects.',
            'The modeled GPR, CALL, store, division, byte, and little-endian semantics are hypotheses.',
            'The selected-engine fixture uses a synthetic size and records; full apply adds an explicit fifth owner record. No device side effects are modeled.'],
        'tools_sha256': {name: sha((ROOT / 'scripts' / name).read_bytes())
                         for name in ('validate_dc9_engine_prepare.py',
                                      'reconstruct_dc9_engine_prepare.py',
                                      'aeon_module_model.py',
                                      'aeon_subset_assembler.py')},
    }


if __name__ == '__main__':
    report = validate()
    print(f"Engine prepare: {report['strict_cases']} strict, "
          f"{report['conditional_cases']} conditional")
