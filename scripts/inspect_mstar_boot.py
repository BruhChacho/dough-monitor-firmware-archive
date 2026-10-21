"""Record bounded DC9 bootloader disassembly with raw and relocated addresses."""
import hashlib
import json
from pathlib import Path
import sys
import xml.etree.ElementTree as ET

from prepare_aeon import COMMIT
from recompress_dc9 import SOURCE_SHA

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / ".tools/python"))
import pypcode


def main():
    entry = next(x for x in json.loads((ROOT / "analysis/mstar-layouts.json").read_text())
                 if x["source_sha256"] == SOURCE_SHA)
    data = (ROOT / entry["source_path"]).read_bytes()
    if hashlib.sha256(data).hexdigest() != SOURCE_SHA:
        raise ValueError("Input identity mismatch")
    languages = ROOT / f".tools/ghidra-aeon/ghidra-aeon-{COMMIT}/data/languages"
    language = pypcode.ArchLanguage(str(languages), ET.parse(languages / "aeon.ldefs").getroot()[0])
    context = pypcode.Context(language)
    relocation = 0x01000100 - 0x724d
    excerpts = [
        (0x2000, 0x20ab, 0, "Update-slot CRC and selection"),
        (0x231e, 0x2368, 0, "Second-stage copy and jump"),
        (0x743c, 0x74ab, relocation, "Raw DEFLATE wrapper"),
        (0x74ab, 0x7604, relocation, "Header selection and fallback"),
        (0x7604, 0x76ec, relocation, "Application marker and hardware CRC32"),
        (0x76ec, 0x7856, relocation, "Copy prefix, load stream, decode length and inflate"),
        (0x79d8, 0x79e9, relocation, "Application handoff call"),
        (0x7305, 0x7331, relocation, "Application jump to 0x200100"),
    ]
    lines = ["# DC9 v101 bootloader evidence", "",
             f"Source SHA256: `{SOURCE_SHA}`.", "",
             "Static decoding only. The AEON definition is incomplete; this is not an execution trace.",
             "Column 1 is the original file offset; column 2 is the candidate runtime address.",
             "The second-stage mapping follows the copy/jump arguments at raw 0x2322–0x2364:",
             "source 0x724d, destination 0x01000100, copy length 0x4eb8.", ""]
    for start, end, bias, title in excerpts:
        lines.extend([f"## {title}", "", "```text"])
        instructions = context.disassemble(data[start:end], base_address=start + bias).instructions
        cursor = start
        for ins in instructions:
            off = ins.addr.offset - bias
            if off != cursor or off + ins.length > end:
                raise ValueError("Disassembly span mismatch")
            cursor += ins.length
            raw = data[off:cursor].hex(" ")
            lines.append(f"{off:06x}  {ins.addr.offset:08x}  {raw:<12} {ins.mnem:<17} {ins.body}".rstrip())
        if cursor != end:
            raise ValueError("Incomplete excerpt")
        lines.extend(["```", ""])
    (ROOT / "analysis/mstar-boot-excerpts.md").write_text("\n".join(lines), encoding="utf-8")
    print("Wrote mapped bootloader excerpts")


if __name__ == "__main__":
    main()
