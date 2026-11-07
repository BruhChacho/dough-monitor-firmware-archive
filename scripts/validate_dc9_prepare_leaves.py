"""Bounded fixtures for engine-pair and deferred-request leaf routines.

All request destinations remain unmapped. The fixtures observe arguments at
the final CALL/JMP instruction and do not model peripheral effects.
"""
from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel
from build_dc9_source_baseline import ROOT, LAYOUT, load_original, sha
from reconstruct_dc9_engine_prepare import SPANS as PREPARE_SPANS
from validate_dc9_module import inputs, stack_region
from validate_dc9_transfer import plain, regs

PAIR = 0x22089f
GLOBAL_BASE = 0x455000
GLOBAL_MODE = 0x455210
GLOBAL_SECONDARY = 0x455211
GLOBAL_SELECTOR = 0x455214
BUS_POINTER = 0x453cf0
BUS_BASE = 0xa0000000
BUS_REGION = BUS_BASE + 0x205600
BUS_B18 = BUS_BASE + 0x205630
BUS_F18 = BUS_BASE + 0x205e30
REQUEST = 0x27b707


def model_fixture():
    _, segments, _ = inputs()
    return ModuleModel(segments, call_policy='fallthrough-hypothesis')


def pair_memory(mode=0, secondary=0):
    globals_data = bytearray(0x300)
    globals_data[0x210] = mode
    globals_data[0x211] = secondary
    globals_data[0x214:0x216] = b'\0\0'  # direct selector, under the current model
    bus = bytearray(BUS_F18 - BUS_REGION + 2)
    return Memory([stack_region(), plain(GLOBAL_BASE, globals_data, 'globals'),
                   plain(BUS_POINTER, BUS_BASE.to_bytes(4, 'little'), 'bus_pointer', False),
                   plain(BUS_REGION, bus, 'register_bus')])


def validate():
    _, expanded, _ = load_original()
    model = model_fixture()
    cases = {}
    visited = set()

    def note(name, result):
        cases[name] = cases.get(name, 0) + 1
        visited.update(result['visited'])

    # Constant leaf, exact return and no memory effects.
    result = model.run(0x21bd8d, Memory([]), regs())
    assert result['termination'] == 'return' and result['registers'][3] == 1
    assert result['visited'] == [0x21bd8d, 0x21bd8f]
    note('constant_one_return', result)

    # Direct mode: both logical pair words write low byte then high byte via
    # register_write16 -> register_write8. Values are caller inputs, not flags.
    for value in (0, 0x1234, 0xabcd, 0xffff, 0x12345678, 0xffffffff):
        memory = pair_memory()
        before = regs(value)
        result = model.run(PAIR, memory, before)
        assert result['termination'] == 'return'
        assert result['registers'][1] == before[1]
        assert result['registers'][10:13] == before[10:13]
        expected_writes = [
            ('register_bus', BUS_F18, 1, value & 0xff),
            ('register_bus', BUS_F18 + 1, 1, (value >> 8) & 0xff),
            ('register_bus', BUS_B18, 1, value & 0xff),
            ('register_bus', BUS_B18 + 1, 1, (value >> 8) & 0xff),
        ]
        actual = [w for w in memory.writes if w[0] == 'register_bus']
        page_f18, page_b18 = BUS_BASE + 0x205e00, BUS_BASE + 0x205600
        assert actual == [
            ('register_bus', page_f18, 1, 0x10), expected_writes[0],
            ('register_bus', page_f18, 1, 0x10), expected_writes[1],
            ('register_bus', page_b18, 1, 0x10), expected_writes[2],
            ('register_bus', page_b18, 1, 0x10), expected_writes[3],
        ]
        note('pair_direct_low16_byte_writes', result)

    # Nonzero mode enters the deferred halfword helper. Stop at its final tail
    # JMP after stack restoration; request arguments remain explicit.
    for value in (0x1234, 0xabcd):
        memory = pair_memory(mode=1)
        before = regs(value)
        result = model.run(PAIR, memory, before, stop_before=(0x23e5cd,))
        assert result['termination'] == 'breakpoint' and result['stopped_before'] == 0x23e5cd
        # The halfword leaf restores its 12-byte frame before the tail JMP;
        # the still-active pair caller owns the remaining 16-byte frame.
        assert result['registers'][1] == before[1] - 0x10
        assert result['registers'][3:7] == [0x10902f18, value, 0xffff, 0]
        assert not [w for w in memory.writes if w[0] == 'register_bus']
        note('pair_nonzero_mode_request_prefix', result)

    # Mode zero plus secondary status requests deferred dispatch. Stop before
    # entering its trampoline; the mode byte update is retained.
    memory = pair_memory(mode=0, secondary=1)
    result = model.run(PAIR, memory, regs(0x5a), stop_before=(0x23e49c,))
    assert result['termination'] == 'breakpoint' and result['stopped_before'] == 0x23e49c
    assert memory.read(GLOBAL_MODE, 1) == 1
    assert result['registers'][1] == regs()[1] - 0x10
    assert not [w for w in memory.writes if w[0] == 'register_bus']
    note('pair_secondary_status_dispatch_prefix', result)

    # Deferred masked halfword helper: even address tail has full mask and
    # restored stack; odd address CALL has shifted and ff00-masked value/mask.
    for address, value, mask, target, expected, restored in (
        (0x100, 0x12345678, 0x89abcdef, 0x23e4f0,
         [0x100, 0x12345678, 0x89abcdef, 0], True),
        (0x101, 0x12345678, 0x89abcdef, 0x23e4d2,
         [0x101, 0x7800, 0xef00, 0], False),
    ):
        before = regs(address, value, mask)
        result = model.run(0x23e4a6, Memory([stack_region()]), before,
                           stop_before=(target,))
        assert result['termination'] == 'breakpoint' and result['stopped_before'] == target
        assert result['registers'][3:7] == expected
        assert result['registers'][1] == (before[1] if restored else before[1] - 0x10)
        note('deferred_masked_halfword_prefix', result)

    # Shifted byte request uses an unmasked 32-bit shift (modulo uint32), in
    # contrast to the halfword request's ff00 mask.
    for address, target, expected_value, expected_mask in (
        (0x100, 0x23e508, 0x12345678, 0x89abcdef),
        (0x101, 0x23e502, 0x34567800, 0xabcdef00),
    ):
        result = model.run(0x23e4f4, Memory([]), regs(address, 0x12345678, 0x89abcdef),
                           stop_before=(target,))
        assert result['termination'] == 'breakpoint' and result['stopped_before'] == target
        assert result['registers'][3:7] == [address, expected_value, expected_mask, 0]
        note('deferred_shifted_byte_prefix', result)

    # Deferred halfword helper has the same parity distinction but an
    # unmasked even halfword path; odd CALL occurs before stack restoration.
    for address, target, expected_value, expected_mask, restored in (
        (0x100, 0x23e5cd, 0x12345678, 0xffff, True),
        (0x101, 0x23e5b3, 0x7800, 0xff00, False),
    ):
        before = regs(address, 0x12345678)
        result = model.run(0x23e58a, Memory([stack_region()]), before,
                           stop_before=(target,))
        assert result['termination'] == 'breakpoint' and result['stopped_before'] == target
        assert result['registers'][3:7] == [address, expected_value, expected_mask, 0]
        assert result['registers'][1] == (before[1] if restored else before[1] - 0xc)
        note('deferred_halfword_prefix', result)

    # Dispatch trampolines are tested immediately before their unmapped JMPs.
    result = model.run(0x23e49c, Memory([]), regs(0x456), stop_before=(0x23e49c,))
    assert result['termination'] == 'breakpoint' and result['registers'][3] == 0x456
    note('trampoline_27aa7f_prejump', result)
    result = model.run(0x23e4a0, Memory([]), regs(0x456), stop_before=(0x23e4a2,))
    assert result['termination'] == 'breakpoint' and result['registers'][3] == 1
    assert result['visited'] == [0x23e4a0]
    note('trampoline_27b4e2_prejump', result)

    spans = [(name, start, end) for name, start, end, _ in PREPARE_SPANS
             if start in {0x21bd8d, 0x22089f}]
    spans.extend((name, start, end) for name, start, end in (
        ('deferred_request_dispatch_27aa7f', 0x23e49c, 0x23e4a0),
        ('deferred_request_dispatch_27b4e2', 0x23e4a0, 0x23e4a6),
        ('deferred_masked_halfword_request', 0x23e4a6, 0x23e4f4),
        ('deferred_shifted_byte_request', 0x23e4f4, 0x23e50c),
        ('deferred_halfword_request', 0x23e58a, 0x23e5d1)))
    return {
        'source_layout_sha256': sha(LAYOUT.read_bytes()), **decoder_identity(),
        'status': 'bounded pair and deferred-request prefixes validated; service targets remain unmapped',
        'cases': cases, 'case_count': sum(cases.values()),
        'visited_instruction_count': len(visited),
        'source_spans': [{'name': name, 'address': hex(start), 'end_exclusive': hex(end),
                          'sha256': sha(expanded[start - 0x200000:end - 0x200000]),
                          'visited_instructions': sum(start <= pc < end for pc in visited)}
                         for name, start, end in spans],
        'limitations': ['All bus and global data is plain byte memory under explicit fixtures.',
                        'No request service at 0x27b707, 0x27aa7f, or 0x27b4e2 is modeled.',
                        'Register writes are observations under existing model hypotheses, not hardware semantics.'],
        'tools_sha256': {name: sha((ROOT / 'scripts' / name).read_bytes()) for name in
                         ('validate_dc9_prepare_leaves.py', 'aeon_module_model.py',
                          'aeon_subset_assembler.py')},
    }
