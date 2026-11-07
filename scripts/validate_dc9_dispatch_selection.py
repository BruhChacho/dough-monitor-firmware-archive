"""Offline contracts for the recovered dispatch selector and metadata-key writer.

The bus consists of explicit plain bytes. Full apply uses actual recovered
timer_tick instructions on each wait-flag poll; neither clocks nor peripheral
side effects are modeled.
"""
import json

from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel
from build_dc9_source_baseline import LAYOUT, ROOT, sha
from validate_dc9_dispatch_apply import fixture as apply_fixture
from validate_dc9_engine_enable import add_bus
from validate_dc9_masked import POLICIES, fixture as bus_fixture
from validate_dc9_module import inputs
from validate_dc9_registers import BUS, byte_address
from validate_dc9_timer import TickOnPoll, peek
from validate_dc9_transfer import named, plain, regs

SELECT = 0x21be27
KEY_WRITE = 0x21dcee
POINTERS = 0x2af5b8
ENGINE = 0x47fa9c
METADATA = 0x3b4950
READ_LOGICAL = (0xfff01f8e, 0xfff01f8d, 0xfff01f90, 0xfff01f8f)
WRITE_LOGICAL = (0, 0xfff30b04, 0xfff30d04, 0xfff30f04, 0xfff31104,
                 0xfff30304, 0xfff30504, 0xfff30704, 0xfff31304)
TARGETS = (0x21dd25, 0x21dd36, 0x21dd6e, 0x21dd66, 0x21dd5e,
           0x21dd56, 0x21dd4e, 0x21dd46, 0x21dd3e)


def bus_writes(memory):
    return [(address, width, value) for name, address, width, value in memory.writes
            if name.startswith('bus_')]


def page_write(logical):
    return (BUS + 2 * (logical & 0x7fff00), 1, (logical >> 24) & 255)


def key_fixture(table, key, engine=3, metadata_index=2, data=0xa5):
    logical = WRITE_LOGICAL[key] if 0 <= key < len(WRITE_LOGICAL) else 0
    memory = bus_fixture([logical] if logical else [], [0x5a] if logical else [], 0)
    engines = bytearray(13 * 124)
    engines[engine * 124 + 0x1d] = metadata_index
    metadata = bytearray(6 * 176)
    metadata[metadata_index * 176:metadata_index * 176 + 4] = key.to_bytes(4, 'little')
    return Memory(memory.regions + [
        plain(ENGINE, engines, 'engines', False),
        plain(METADATA, metadata, 'metadata', False),
        plain(POINTERS, table, 'dispatch_pointers', False)])


def scheduled_fixture(expanded, model):
    table = b''.join(target.to_bytes(4, 'little') for target in TARGETS)
    # The archived channel-zero key is 5, so the first key write needs
    # its own explicit data byte. Its page byte is already in the fixture.
    memory = add_bus(apply_fixture(expanded, 0), (WRITE_LOGICAL[5],))
    memory = TickOnPoll(Memory(memory.regions + [
        plain(0x3b4948, bytes.fromhex('e803a55a'), 'dispatch_reload'),
        plain(0x4551e1, b'\x00', 'dispatch_callback_enable', False),
        plain(0x710000, bytes(512), 'tick_stack'),
        plain(POINTERS, table, 'dispatch_pointers', False)]), model, max_ticks=12)
    return memory


def validate():
    expanded, segments, tables = inputs()
    table = b''.join(target.to_bytes(4, 'little') for target in TARGETS)
    assert expanded[POINTERS - 0x200000:POINTERS - 0x200000 + len(table)] == table
    assert any(address == POINTERS and data == table for _, address, data in tables), \
        'dispatch pointer table is not in editable source'
    strict = ModuleModel(segments, call_policy='fallthrough-hypothesis')
    assert SELECT in strict.instructions and KEY_WRITE in strict.instructions
    counts = {'selector_valid': 0, 'selector_invalid': 0, 'key_cases': 0}
    visited = set()

    # Each possible low-byte engine index is checked. Only 0..3 may read the
    # paged register; all other values return the 0x1f sentinel without I/O.
    for index in (*range(256), 0xffffffff):
        for raw in ((0, 0x7c, 0xff) if index < 4 else (0,)):
            logical = READ_LOGICAL[index] if index < 4 else 0
            memory = bus_fixture([logical] if logical else [], [raw] if logical else [], 0)
            before = regs(index, 0x5a)
            result = strict.run(SELECT, memory, before)
            assert result['termination'] == 'return'
            assert result['registers'][3] == ((raw & 0x7c) >> 2 if index < 4 else 0x1f)
            assert result['registers'][1] == before[1]
            assert result['registers'][10:23] == before[10:23]
            assert [target for _, target, _ in result['calls']] == ([0x23dd44] if logical else [])
            assert bus_writes(memory) == ([page_write(logical)] if logical else [])
            assert [(address, width) for name, address, width in memory.reads
                    if name.startswith('bus_')] == ([(byte_address(logical), 1)] if logical else [])
            counts['selector_valid' if logical else 'selector_invalid'] += 1
            visited.update(result['visited'])

    # The independent expected table and bus contract cover every indexed
    # destination, the zero logical address, and the out-of-range fallback.
    for key in (*range(9), 9, 255, 0xffffffff):
        for engine, metadata_index in ((0, 0), (3, 2)):
            logical = WRITE_LOGICAL[key] if key < 9 else 0
            memory = key_fixture(table, key, engine, metadata_index)
            before = regs(engine, 0x123456a5)
            result = strict.run(KEY_WRITE, memory, before)
            assert result['termination'] == 'return'
            assert result['registers'][1] == before[1] and result['registers'][10:23] == before[10:23]
            assert [target for _, target, _ in result['calls']] == [0x222804]
            assert ('engines', ENGINE + engine * 124 + 0x1d, 1) in memory.reads
            assert ('metadata', METADATA + metadata_index * 176, 4) in memory.reads
            assert (('dispatch_pointers', POINTERS + 4 * key, 4) in memory.reads) == (key < 9)
            expected = [page_write(logical), (byte_address(logical), 1, 0xa5)] if logical else []
            assert bus_writes(memory) == expected, (key, engine, bus_writes(memory))
            assert not any(name in ('engines', 'metadata', 'dispatch_pointers')
                           for name, *_ in memory.writes)
            counts['key_cases'] += 1
            visited.update(result['visited'])

    full = {}
    for policy in POLICIES:
        model = ModuleModel(segments, call_policy='fallthrough-hypothesis', store_policy=policy)
        memory = scheduled_fixture(expanded, model)
        result = model.run(0x23fad0, memory, regs(), max_steps=100000,
                           stop_before=(0x22169e,))
        assert result['termination'] == 'breakpoint' and result['stopped_before'] == 0x22169e
        calls = [target for _, target, _ in result['calls']]
        assert calls.count(SELECT) == 1 and calls.count(KEY_WRITE) == 2
        assert calls.count(0x24209d) == 4 and 0x21fb61 not in calls
        expected_ticks = 4 if policy == 'sleigh-store' else 8
        expected_wait = '01000000' if policy == 'sleigh-store' else '0000003c'
        expected_reload = 'e4030000' if policy == 'sleigh-store' else 'e003a55a'
        key_writes = [value for name, address, width, value in memory.writes
                      if address == byte_address(WRITE_LOGICAL[5]) and width == 1]
        pointer_reads = [address for name, address, width in memory.reads
                         if name == 'dispatch_pointers' and width == 4]
        assert key_writes == [1, 0] and pointer_reads == [POINTERS + 5 * 4] * 2
        assert len(memory.tick_results) == expected_ticks
        assert all(tick['termination'] == 'breakpoint' and tick['stopped_before'] == 0x241841
                   for tick in memory.tick_results)
        assert bytes(named(memory, 'dispatch_wait').data).hex() == expected_wait
        assert bytes(named(memory, 'dispatch_reload').data).hex() == expected_reload
        assert not any(name in ('dispatch_callback_enable', 'dispatch_pointers')
                       for name, *_ in memory.writes)
        full[policy] = {'stopped_before_call': '0x22169e', 'caller_steps': result['steps'],
                        'ticks': expected_ticks,
                        'key_bus_values': key_writes, 'pointer_reads': len(pointer_reads),
                        'wait_bytes': expected_wait, 'reload_bytes': expected_reload}

    return {'status': 'bounded dispatch selection and scheduled-tick validation',
            'source_layout_sha256': sha(LAYOUT.read_bytes()), **decoder_identity(),
            'counts': counts, 'visited_instruction_count': len(visited),
            'full_apply': full,
            'limitations': ['Full apply advances through two real metadata-key writes and stops before the engine-one service call at 0x22169e.',
                            'Plain bus bytes have no peripheral behavior.',
                            'TickOnPoll runs the recovered timer prefix on flag reads, without a physical clock.',
                            'CALL, data endianness and ambiguous store widths remain model hypotheses.'],
            'tools_sha256': {name: sha((ROOT / 'scripts' / name).read_bytes()) for name in
                             ('validate_dc9_dispatch_selection.py', 'aeon_module_model.py')}}


if __name__ == '__main__':
    print(json.dumps(validate(), indent=2))
