"""Compare original and rewritten helper machine code in bounded emulation."""
import hashlib
import json
from pathlib import Path

from aeon_helper_emulator import BASE, TABLE, HelperEmulator, decoder_identity
from aeon_subset_assembler import assemble
from prepare_aeon import COMMIT
from recompress_dc9 import SOURCE_SHA
from unpack_mstar import unpack

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "analysis/reconstructed/spectrum_one_table_helper_rewrite.aeon.s"


def validate(original):
    if hashlib.sha256(original).hexdigest() != SOURCE_SHA:
        raise ValueError("Unexpected source firmware")
    expanded, _ = unpack(original)
    source = SOURCE.read_text()
    candidate, listing = assemble(source, BASE)
    old = expanded[0x4059:0x4080]
    if len(candidate) != len(old) or candidate == old:
        raise ValueError("Expected a changed, same-size helper")
    table = expanded[TABLE - 0x200000:TABLE - 0x200000 + 41]
    baseline, replacement = HelperEmulator(old, table), HelperEmulator(candidate, table)
    arguments = list(range(512)) + [0xffff, 0x10000, 0x10001, 0x7fffffff, 0x80000000, 0xffffff00, 0xffffffff]
    seeds = [0, 0x5a5aa5a5, 0xffffffff]
    old_steps, new_steps, outcomes = [], [], []
    for seed in seeds:
        for value in arguments:
            a, b = baseline.run(value, seed), replacement.run(value, seed)
            expected = int(value in set(table))
            if (a["registers"] != b["registers"] or a["reads"] != b["reads"]
                    or a["registers"][3] != expected):
                raise ValueError(f"Semantic mismatch: value={value:#x}, seed={seed:#x}")
            old_steps.append(a["steps"])
            new_steps.append(b["steps"])
            outcomes.append([value, seed, expected, a["steps"], b["steps"], a["registers"], a["reads"]])
    report = {
        "source_firmware_sha256": SOURCE_SHA, "sleigh_commit": COMMIT,
        **decoder_identity(),
        "assembly_path": SOURCE.relative_to(ROOT).as_posix(),
        "assembly_normalized_utf8_sha256": hashlib.sha256(source.encode()).hexdigest(),
        "original_code_sha256": hashlib.sha256(old).hexdigest(),
        "replacement_code_sha256": hashlib.sha256(candidate).hexdigest(),
        "address": hex(BASE), "code_bytes": len(candidate),
        "arguments": [hex(x) for x in arguments], "register_seeds": [hex(x) for x in seeds],
        "comparisons": len(outcomes), "all_32_general_registers_equal": True,
        "table_reads_equal": True, "membership_oracle_equal": True,
        "maximum_original_steps": max(old_steps), "maximum_replacement_steps": max(new_steps),
        "outcomes_sha256": hashlib.sha256(json.dumps(outcomes, separators=(",", ":")).encode()).hexdigest(),
        "listing": listing,
        "limitations": ["SLEIGH-based helper emulation only; not whole-device emulation",
                        "Not an independent validation of SLEIGH or physical CPU behavior",
                        "519 selected uint32 arguments, not exhaustive 32-bit enumeration",
                        "Compares all 32 general registers and table reads, not all CPU state",
                        "No interrupts, cycle timing, MMIO, or proof of all entry paths",
                        "No hardware test and no user-visible feature change"],
    }
    return candidate, report


def main():
    item = next(x for x in json.loads((ROOT / "analysis/mstar-layouts.json").read_text())
                if x["source_sha256"] == SOURCE_SHA)
    candidate, report = validate((ROOT / item["source_path"]).read_bytes())
    folder = ROOT / "analysis/extracted/rebuild"
    folder.mkdir(parents=True, exist_ok=True)
    (folder / "dc9-table-helper-rewrite.bin").write_bytes(candidate)
    (ROOT / "analysis/aeon-rewrite-validation.json").write_text(json.dumps(report, indent=2) + "\n")
    print(f"{report['comparisons']} comparisons passed: result, all registers, table reads")


if __name__ == "__main__":
    main()
