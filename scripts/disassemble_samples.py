"""Generate bounded disassembly excerpts with explicit file/address mappings."""
import hashlib
import json
from pathlib import Path
import sys
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / ".tools/python"))
import pypcode
from prepare_aeon import COMMIT


def main():
    layouts = json.loads((ROOT / "analysis/mstar-layouts.json").read_text())
    item = next(x for x in layouts if x["source_sha256"].startswith("0b5d8350af99"))
    data = (ROOT / item["expanded_path"]).read_bytes()
    if hashlib.sha256(data).hexdigest() != item["expanded_sha256"]:
        raise ValueError("Expanded image hash mismatch")
    languages = ROOT / f".tools/ghidra-aeon/ghidra-aeon-{COMMIT}/data/languages"
    language = pypcode.ArchLanguage(str(languages), ET.parse(languages / "aeon.ldefs").getroot()[0])
    context = pypcode.Context(language)
    lines = ["# ES07DC9 v101 rev1148: AEON excerpts", "",
             f"Input SHA256: {item['source_sha256']}",
             f"Expanded SHA256: {item['expanded_sha256']}",
             "Candidate load base: 0x200000; addresses below = expanded offset + base.",
             "AEON definition is incomplete. These are static decoder results, not execution traces.", ""]
    for start, end, label in [(0x100, 0x1cb, "startup"), (0x4059, 0x4080, "41-byte table membership helper")]:
        lines.extend([f"## {label}", "", "```text"])
        for i in context.disassemble(data[start:end], base_address=0x200000 + start).instructions:
            off = i.addr.offset - 0x200000
            raw = data[off:off + i.length].hex(" ")
            lines.append(f"{i.addr.offset:08x}  {raw:<12} {i.mnem:<18} {i.body}")
        lines.extend(["```", ""])
    table = data[0xaed7c:0xaeda5]
    if len(table) != 41:
        raise ValueError("Table out of range")
    lines.extend(["## Referenced table", "", "Expanded offset 0xaed7c; candidate address 0x2aed7c:",
                  "", "```text", table.hex(" "), "```", ""])
    (ROOT / "analysis/aeon-excerpts.md").write_text("\n".join(lines), encoding="utf-8")
    print("Wrote analysis/aeon-excerpts.md")


if __name__ == "__main__":
    main()
