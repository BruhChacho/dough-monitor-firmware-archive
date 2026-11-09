"""Bounded binary64-to-binary32 checks for the four conversion leaves.

Runs only the pinned leaf bytes under the existing instruction model. The
independent oracle is Python's IEEE binary64 decode and binary32 packing; NaN
payload canonicalization is deliberately not compared.
"""
import json
import random
import struct

from aeon_helper_emulator import decoder_identity
from aeon_module_model import Memory, ModuleModel
from build_dc9_source_baseline import load_original, sha
from reconstruct_dc9_conversion_leaves import SPANS
from validate_dc9_module import inputs, initial_registers, stack_region


ENTRY = 0x2ad165
EXPECTED_CALLS = [0x2ac756, 0x2ac268, 0x2aba8f]
MASK32 = 0xffffffff


def oracle(bits):
    raw = bits.to_bytes(8, "little")
    value = struct.unpack("<d", raw)[0]
    try:
        return int.from_bytes(struct.pack("<f", value), "little")
    except OverflowError:
        # Python raises when a finite value rounds beyond binary32's range.
        return ((bits >> 32) & 0x80000000) | 0x7f800000


def validate():
    _, image, _ = load_original()
    _, segments, _ = inputs()
    model = ModuleModel(segments, call_policy="fallthrough-hypothesis")

    edge_bits = [
        0x0000000000000000, 0x8000000000000000,
        0x0000000000000001, 0x000fffffffffffff,
        0x0010000000000000, 0x3ff0000000000000,
        0xbff0000000000000, 0x400921fb54442d18,
        0x47efffffe0000000, 0x47effffff0000000,
        0x7fefffffffffffff, 0xffefffffffffffff,
        0x7ff0000000000000, 0xfff0000000000000,
    ]
    # Binary64 values around binary32 halfway points exercise nearest-even
    # rounding with an independent, host IEEE packing oracle.
    edge_bits.extend(int.from_bytes(struct.pack("<d", value), "little") for value in (
        1.0 + 2.0 ** -24, 1.0 + 3.0 * 2.0 ** -24,
        -(1.0 + 2.0 ** -24), 2.0 ** -149, 2.0 ** -150,
    ))
    rng = random.Random(0x2ad165)
    random_bits = []
    while len(random_bits) < 96:
        bits = rng.getrandbits(64)
        if ((bits >> 52) & 0x7ff) != 0x7ff:  # finite values only
            random_bits.append(bits)
    cases = edge_bits + random_bits

    visited, maximum_steps = set(), 0
    for bits in cases:
        regs = initial_registers(0x2ad165)
        regs[3], regs[4] = bits & MASK32, (bits >> 32) & MASK32
        memory = Memory([stack_region()])
        result = model.run(ENTRY, memory, regs)
        assert result["termination"] == "return"
        assert result["registers"][3] == oracle(bits), (hex(bits), hex(result["registers"][3]),
                                                       hex(oracle(bits)))
        assert result["registers"][1] == regs[1]
        # The converter uses r23 as its rounding carry; r10-r22 are preserved.
        assert result["registers"][10:23] == regs[10:23]
        assert all(name == "stack" for name, *_ in memory.writes)
        assert [target for _, target, _ in result["calls"]] == EXPECTED_CALLS
        visited.update(result["visited"])
        maximum_steps = max(maximum_steps, result["steps"])

    span_visits = {name: sum(start <= pc < end for pc in visited)
                   for name, start, end, _ in SPANS}
    assert all(span_visits.values())
    nan_bits = 0x7ff8000000000042
    nan_regs = initial_registers(0x2ad165)
    nan_regs[3], nan_regs[4] = nan_bits & MASK32, nan_bits >> 32
    nan_memory = Memory([stack_region()])
    nan_result = model.run(ENTRY, nan_memory, nan_regs)
    assert nan_result["termination"] == "return"
    assert nan_result["registers"][10:23] == nan_regs[10:23]
    assert all(name == "stack" for name, *_ in nan_memory.writes)
    return {
        **decoder_identity(),
        "status": "bounded binary64-to-binary32 results match Python struct packing",
        "entry": hex(ENTRY), "cases": len(cases),
        "finite_random_cases": len(random_bits),
        "observed_nan_case": {
            "input_binary64_bits": hex(nan_bits),
            "output_binary32_bits": hex(nan_result["registers"][3]),
            "note": "Observed emulator result only; no NaN payload oracle is asserted.",
        },
        "maximum_steps": maximum_steps,
        "visited_instructions_by_leaf": span_visits,
        "source_sha256": {name: sha(image[start - 0x200000:end - 0x200000])
                          for name, start, end, _ in SPANS},
        "limitations": [
            "Sampled values are not an exhaustive proof.",
            "NaN payload behavior is not compared; the output shown is one observation only.",
            "Calls use the ModuleModel fallthrough-link hypothesis; no hardware behavior is validated.",
        ],
    }


if __name__ == "__main__":
    print(json.dumps(validate(), indent=2))
