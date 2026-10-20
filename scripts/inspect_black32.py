"""Recover bounded Black 32 code and identity evidence without execution."""
import hashlib
import json
from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / ".tools/python"))
import pypcode


def main():
    members = json.loads((ROOT / "analysis/inventory.json").read_text())["members"]
    results = []
    pattern = re.compile(bytes.fromhex("14 f0 30 6a 06 f2") + rb"." +
                         bytes.fromhex("6b c5 f6 7a ca 20 e8 00 65"), re.DOTALL)
    for member in members:
        name = Path(member["local_path"]).name
        if not name.endswith(".bin") or not any(x in name for x in ["es07efe", "es07e91"]):
            continue
        raw = (ROOT / member["local_path"]).read_bytes()
        if hashlib.sha256(raw).hexdigest() != member["sha256"]:
            raise ValueError("Sample hash mismatch")
        routines = []
        for match in pattern.finditer(raw):
            offset = match.start()
            context = pypcode.Context("MIPS:LE:32:16e")
            decoded = context.disassemble(match.group(), base_address=offset).instructions
            routines.append({"file_offset": hex(offset), "bytes": match.group().hex(" "),
                             "instructions": [{"file_offset": hex(i.addr.offset),
                                               "mnemonic": i.mnem, "operands": i.body}
                                              for i in decoded]})
        identity = []
        if "v1.0.19_" in name:
            for offset, size, label in [(0xcef30, 16, "target marker"), (0xcf074, 4, "ASCII numeric ID"),
                                        (0xcf080, 7, "ASCII model"), (0xcf30c, 7, "second ASCII model"),
                                        (0x10d72f, 7, "candidate glyph-coded model")]:
                value = raw[offset:offset + size]
                identity.append({"file_offset": hex(offset), "label": label,
                                 "bytes": value.hex(" "), "ascii": value.decode("ascii", "replace")})
        results.append({"name": name, "sha256": member["sha256"], "model_id_routines": routines,
                        "identity_evidence": identity,
                        "absence_meaning": "A missing signature does not establish absence of equivalent code"})
    (ROOT / "analysis/black32-code.json").write_text(json.dumps(results, indent=2) + "\n")
    print(f"Inspected {len(results)} Black 32 images; found routine in "
          f"{sum(bool(r['model_id_routines']) for r in results)} images")


if __name__ == "__main__":
    main()
