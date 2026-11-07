"""Validate metadata state aggregation and its direct consumer boundary.

Runs recovered instructions from the pinned original byte stream. The model
uses plain RAM and does not represent hardware registers or peripheral effects.
"""
import json

from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel
from build_dc9_source_baseline import ROOT, LAYOUT, sha
from reconstruct_dc9_metadata_consumers import SPANS
from validate_dc9_module import inputs, stack_region
from validate_dc9_transfer import regs, plain, named
from validate_dc9_timer import peek
from validate_dc9_metadata_service import contract

STATE = 0x4543bc
SELECTOR_TABLE = 0x2af120
STATE_OUTPUTS = (0x454160, 0x454161, 0x454162)


def fixture(expanded, state=None):
    """Give all globals distinctive bytes, retaining sentinels around outputs."""
    data = bytearray((i * 37 + 0x53) & 255 for i in range(0x400))
    if state is not None:
        for offset, value in state.items():
            data[STATE - 0x454000 + offset] = value & 255
    selector_bytes = expanded[SELECTOR_TABLE - 0x200000:SELECTOR_TABLE - 0x200000 + 32]
    return Memory([stack_region(), plain(0x454000, data, 'globals'),
                   plain(0x453bcc, bytes([0xa5]*16), 'channel_globals'),
                   plain(0x4800e8, bytes([0xa5]*(4*132)), 'channel_words'),
                   plain(SELECTOR_TABLE, selector_bytes, 'selector_table', False)])


def aggregate_contract(data):
    base = STATE - 0x454000
    byte = lambda offset: data[base + offset]
    return (byte(7) | (0x80 if byte(1) != 0 else 0),
            byte(7) | byte(3) | byte(6) | byte(4),
            byte(7))


def validate():
    expanded, segments, _ = inputs()
    original = expanded
    model = ModuleModel(segments, call_policy='fallthrough-hypothesis')
    visited = set()
    counts = {}

    def record(name, result):
        counts[name] = counts.get(name, 0) + 1
        visited.update(result['visited'])

    # Sweep each consumed state byte independently through its full byte range.
    for offset in (1, 3, 4, 6, 7):
        for value in range(256):
            memory = fixture(expanded, {offset: value})
            before = bytes(named(memory, 'globals').data)
            result = model.run(0x20e76c, memory, regs())
            expected = aggregate_contract(before)
            assert result['termination'] == 'return'
            assert tuple(result['registers'][3:6]) == expected
            expected_regs=regs()[10:]
            expected_regs[23-10]=before[STATE-0x454000+6]
            expected_regs[24-10]=before[STATE-0x454000+4]
            assert result['registers'][10:] == expected_regs
            expected_memory=bytearray(before);expected_memory[0x160:0x163]=bytes(expected)
            assert named(memory, 'globals').data == expected_memory
            assert memory.writes == [('globals',a,1,v) for a,v in zip(STATE_OUTPUTS,expected)]
            record('aggregate_single_byte_sweep', result)

    # Check OR aliases, nonzero flag behavior, low-byte stores, and sentinels.
    for state_values in (
            {1: 1, 3: 0x12, 4: 0x24, 6: 0x48, 7: 0x81},
            {1: 0x80, 3: 0xff, 4: 0x80, 6: 0x7f, 7: 0x01},
            {1: 0, 3: 0, 4: 0, 6: 0, 7: 0},
            {1: 0x02, 3: 0x01, 4: 0x02, 6: 0x04, 7: 0x08}):
        memory = fixture(expanded, state_values)
        before = bytes(named(memory, 'globals').data)
        result = model.run(0x20e76c, memory, regs())
        expected = aggregate_contract(before)
        assert result['termination'] == 'return'
        assert tuple(result['registers'][3:6]) == expected
        # The tail stores only the three low bytes and leaves adjacent bytes intact.
        for address, value in zip(STATE_OUTPUTS, expected):
            assert named(memory, 'globals').data[address - 0x454000] == value
        assert named(memory, 'globals').data[0x15f] == before[0x15f]
        assert named(memory, 'globals').data[0x163] == before[0x163]
        assert [target for _, target, _, _ in memory.writes] == list(STATE_OUTPUTS)
        record('aggregate_and_low_byte_store', result)

    for mask in (*range(256),0x80000000,0xffffffff):
        for notify in (0,1,5,15,255):
            memory=fixture(expanded)
            arguments=regs(0x1234,0x2345,0x3456,notify,0x5678,mask)
            result=model.run(0x23417c,memory,arguments)
            assert result['termination']=='return'
            expected_globals=bytearray([0xa5]*16)
            for address,value in zip((0x453bd6,0x453bd5,0x453bcd,0x453bce,0x453bcc,0x453bd4),arguments[3:9]):
                expected_globals[address-0x453bcc]=value&255
            assert named(memory,'channel_globals').data==expected_globals
            expected_words=bytearray([0xa5]*(4*132))
            for i in range(4):expected_words[0x14+i*132:0x18+i*132]=(1 if mask&(1<<i) else 4).to_bytes(4,'little')
            assert named(memory,'channel_words').data==expected_words
            assert [target for _,target,_ in result['calls']]==[0x2118d2 for i in range(4) if mask&notify&(1<<i)]
            expected_regs=arguments[10:].copy();expected_regs[23-10]=0x450000
            assert result['registers'][10:]==expected_regs and result['registers'][1]==arguments[1]
            record('complete_channel_state_returns',result)

    # Execute both strict consumers then stop before register dispatch. The
    # separate register validator tests full returns under store hypotheses.
    for selector in (0, 1, 3, 7, 8, 0x100):
        for enabled in (0, 1, 0xffffffff):
            for flags in (0, 1, 0x20400, 0xffffffff):
                memory = fixture(expanded, {0: 0, 1: 0, 3: 0x12, 4: 0x24, 6: 0x48, 7: 0x81})
                before = bytes(named(memory, 'globals').data)
                base=STATE-0x454000
                expected=contract(before[base:base+40],enabled,selector,flags)
                arguments = regs(enabled, selector, flags)
                result = model.run(0x20f1ef, memory, arguments,
                                   stop_before=(0x20f2ae,))
                assert result['termination'] == 'breakpoint'
                assert named(memory,'globals').data[base:base+40]==expected
                assert result['registers'][3]==expected[20]
                assert named(memory,'globals').data[0x160:0x163]==bytes((expected[7]|(0x80 if expected[1] else 0),expected[7]|expected[3]|expected[6]|expected[4],expected[7]))
                assert [t for _,t,_ in result['calls']][:3]==[0x20e687,0x20e76c,0x23417c]
                for i in range(4):assert peek(memory,0x4800fc+i*132,4)==(1 if expected[12]&(1<<i) else 4)
                record('apply_consumer_prefix', result)

    return {
        'source_layout_sha256': sha(LAYOUT.read_bytes()),
        **decoder_identity(),
        'status': 'strict aggregate/store runs and bounded apply consumer prefixes',
        'cases': counts,
        'strict_cases': sum(counts.values()),
        'visited_instruction_count': len(visited),
        'source_spans': [
            {'name': name, 'address': hex(start), 'end_exclusive': hex(end),
             'size': end - start,
             'sha256': sha(original[start - 0x200000:end - 0x200000]),
             'visited_instructions': sum(start <= pc < end for pc in visited)}
            for name, start, end, _ in SPANS],
        'state_base': hex(STATE),
        'output_addresses': [hex(x) for x in STATE_OUTPUTS],
        'apply_stop_before': '0x20f2ae',
        'limitations': [
            'All state and output addresses are modeled as ordinary RAM.',
            'These strict accumulation prefixes stop before register dispatch; separate conditional validation covers the full chain.',
            'Observed aliases and byte preservation do not establish hardware register semantics.'],
        'tools_sha256': {name: sha((ROOT / 'scripts' / name).read_bytes()) for name in (
            'validate_dc9_metadata_consumers.py', 'reconstruct_dc9_metadata_consumers.py',
            'aeon_module_model.py', 'aeon_subset_assembler.py')},
    }


if __name__ == '__main__':
    report = validate()
    (ROOT / 'analysis/dc9-metadata-consumers-validation.json').write_text(
        json.dumps(report, indent=2) + '\n')
    print(f"Metadata consumers: {report['strict_cases']} strict cases")
