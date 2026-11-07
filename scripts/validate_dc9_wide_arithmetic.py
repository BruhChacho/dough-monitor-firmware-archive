"""Compare recovered 64-bit integer helpers with Python integer arithmetic."""
import json
import random

from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel
from build_dc9_source_baseline import LAYOUT, ROOT, sha
from validate_dc9_module import inputs
from validate_dc9_transfer import plain, regs
from validate_dc9_channel_storage import record_fixture, RECORDS, OUTPUT_OFFSETS
from validate_dc9_transfer import named

MASK = (1 << 64) - 1
MULTIPLY = 0x2aacb9
DIVIDE = 0x2ab331
COMPARE = 0x2aad0b
BIT_LENGTH = 0x33b628


def validate():
    expanded, segments, _ = inputs()
    model = ModuleModel(segments, call_policy='fallthrough-hypothesis')
    table = expanded[BIT_LENGTH-0x200000:BIT_LENGTH-0x200000+256]
    assert table == bytes(i.bit_length() for i in range(256))
    edges = (0, 1, 2, 0xff, 0x100, 0xffff, 0x10000, 0x7fffffff,
             0x80000000, 0xffffffff, 0x100000000, 0x100000001,
             0x7fffffffffffffff, 0x8000000000000000, MASK)
    rng = random.Random(0xdc9)
    pairs = [(x, y) for x in edges for y in edges]
    pairs += [(rng.getrandbits(64), rng.getrandbits(64)) for _ in range(256)]
    # Different divisor magnitudes exercise normalization and quotient correction.
    pairs += [(rng.getrandbits(64), rng.getrandbits(bits) or 1)
              for bits in (8, 16, 24, 32, 48) for _ in range(32)]
    counts = {}; visits = {}; maximum_steps = {}
    def signed64(value):
        return value - (1 << 64) if value & (1 << 63) else value

    for entry, name, operation in ((MULTIPLY, 'multiply', lambda x, y: x*y & MASK),
                                   (DIVIDE, 'divide', lambda x, y: x//y),
                                   (COMPARE, 'compare', lambda x, y:
                                    1 + (signed64(x) > signed64(y)) - (signed64(x) < signed64(y)))):
        visited = set(); count = 0; steps = 0
        for x, y in pairs:
            if entry == DIVIDE and y == 0:
                continue
            memory = Memory([plain(BIT_LENGTH, table, 'bit_length', False)])
            before = regs()
            before[3:7] = [x & 0xffffffff, x >> 32, y & 0xffffffff, y >> 32]
            result = model.run(entry, memory, before)
            after = result['registers']
            assert result['termination'] == 'return'
            actual = after[3] if entry == COMPARE else after[3] | (after[4] << 32)
            assert actual == operation(x, y), (name, x, y, after[3:5])
            assert after[1] == before[1] and after[10:23] == before[10:23]
            assert not memory.writes and not result['calls']
            assert all(n == 'bit_length' and size == 1 for n, _, size in memory.reads)
            visited.update(result['visited']); steps = max(steps, result['steps']); count += 1
        counts[name] = count; visits[name] = len(visited); maximum_steps[name] = steps
    memory = Memory([plain(BIT_LENGTH, table, 'bit_length', False)])
    before = regs(); before[3:7] = [123, 0, 0, 0]
    try:
        model.run(DIVIDE, memory, before)
    except ValueError as error:
        assert str(error) == 'Unmodeled division by zero'
    else:
        raise AssertionError('Division by zero must remain explicitly unmodeled')
    storage_cases = 0
    for channel in range(4):
        for width, height in ((1, 1), (1920, 1080), (65535, 65535)):
            for mask in (1, 4, 0x8000):
                memory = record_fixture(channel, width, height, mask)
                memory = Memory(memory.regions + [plain(BIT_LENGTH, table, 'bit_length', False)])
                expected = bytearray(named(memory, 'records').data)
                for index in range(4):
                    if index != channel:
                        values = {offset: 0 for offset in OUTPUT_OFFSETS}
                    else:
                        # One active channel receives the full 420-unit allocation
                        # in both banks. The third bank retains its prior bytes.
                        values = {0x5c: 0x45200000, 0x60: 0x85200000,
                                  0x68: 420 << 20, 0x6c: 420 << 20,
                                  0x74: width*height, 0x78: width*height}
                    for offset, value in values.items():
                        start = index*168 + offset
                        expected[start:start+4] = value.to_bytes(4, 'little')
                before = regs()
                result = model.run(0x2250e8, memory, before)
                assert result['termination'] == 'return'
                assert result['registers'][1] == before[1]
                assert result['registers'][10:23] == before[10:23]
                assert named(memory, 'records').data == expected
                targets = [target for _, target, _ in result['calls']]
                assert targets.count(MULTIPLY) == targets.count(DIVIDE) == 2
                assert len([w for w in memory.writes if w[0] == 'records']) == 60
                storage_cases += 1
    return {'source_layout_sha256': sha(LAYOUT.read_bytes()), **decoder_identity(),
            'status': 'bounded 64-bit multiply, unsigned quotient and signed comparison agree with Python integers',
            'cases': counts, 'strict_cases': sum(counts.values()),
            'single_active_storage_return_cases': storage_cases,
            'expected_rejections': 1, 'visited_instructions': visits,
            'maximum_steps': maximum_steps,
            'limitations': ['Inputs are bounded samples, not an exhaustive 64-bit proof.',
                            'Variable shift counts >=32 and division by zero remain rejected.',
                            'CPU/CALL semantics are modeled hypotheses; no hardware execution.'],
            'tools_sha256': {n: sha((ROOT/'scripts'/n).read_bytes()) for n in
                             ('validate_dc9_wide_arithmetic.py', 'aeon_module_model.py',
                              'aeon_subset_assembler.py')}}


if __name__ == '__main__':
    print(json.dumps(validate(), indent=2))
