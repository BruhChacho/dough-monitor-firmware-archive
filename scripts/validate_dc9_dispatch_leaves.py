"""Independent masked-byte contracts for four engine-parity register helpers."""
import json

from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel
from build_dc9_source_baseline import LAYOUT, sha
from validate_dc9_masked import fixture, POLICIES
from validate_dc9_module import inputs
from validate_dc9_registers import BUS, byte_address
from validate_dc9_timer import peek
from validate_dc9_transfer import plain, regs


def validate():
    _, segments, _ = inputs()
    cases = {}; visits = set()
    for policy in POLICIES:
        model = ModuleModel(segments, call_policy='fallthrough-hypothesis', store_policy=policy)
        count = 0
        for engine in range(4):
            bank = 0x200 + engine * 0x100
            engines = bytearray(4 * 124)
            engines[engine*124+4:engine*124+8] = bank.to_bytes(4, 'little')
            for value in (0, 1, 2, 3, 0x80, 0xffffffff):
                for entry, mask, data, offset in (
                        (0x21be98, 2, 2 if value else 0, 0x4c800016 if engine & 1 else 0x65800016),
                        (0x21bece, 1, int(value != 0), 0x4c800016 if engine & 1 else 0x65800016),
                        (0x21bf19, 0x30, 0 if value else 0x20, 0x0280001e if engine & 1 else 0x0480001e),
                        (0x21bf85, 0x18, value << 3, 0x02800015 if engine & 1 else 0x04800015)):
                    logical = (bank + offset) & 0xffffffff
                    memory = fixture([logical], [0xa5], 0)
                    memory = Memory(memory.regions + [plain(0x47fa9c, engines, 'engines', False)])
                    before = regs(engine, value)
                    result = model.run(entry, memory, before)
                    assert result['termination'] == 'return'
                    assert result['registers'][1] == before[1]
                    assert result['registers'][10:23] == before[10:23]
                    expected = (0xa5 & ~mask) | (data & mask)
                    page = BUS + 2*(logical & 0x7fff00)
                    writes = [(a, w, v) for n, a, w, v in memory.writes if n.startswith('bus_')]
                    assert writes == [(page, 1, logical >> 24)]*2 + [(byte_address(logical), 1, expected)], (policy, engine, hex(entry), value, writes, hex(logical), expected)
                    assert peek(memory, byte_address(logical)) == expected
                    assert peek(memory, 0x4551a8, 2) == peek(memory, 0xa0203034) == 0
                    assert not any(n == 'engines' for n, *_ in memory.writes)
                    visits.update(result['visited']); count += 1
        cases[policy] = count
    return {'source_layout_sha256': sha(LAYOUT.read_bytes()), **decoder_identity(),
            'conditional_cases': sum(cases.values()), 'cases_by_policy': cases,
            'visited_instruction_count': len(visits),
            'limitations': ['Explicit plain bus bytes and engine bank values; no peripheral effects.',
                            'Both ambiguous store policies and fallthrough CALL are hypotheses.']}


if __name__ == '__main__':
    print(json.dumps(validate(), indent=2))
