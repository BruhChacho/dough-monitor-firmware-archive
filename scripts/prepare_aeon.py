"""Prepare a pinned, locally patched AEON SLEIGH definition for pypcode.

Use --download to fetch the source archive if it is absent. This compiles only
the processor definition; it never executes monitor firmware or vendor tools.
"""
import argparse
import hashlib
from pathlib import Path, PurePosixPath
import re
import subprocess
import sys
import urllib.request
import zipfile

ROOT = Path(__file__).resolve().parents[1]
COMMIT = "de8a2539d474efa409ba458c565bc74f9e5e0b1d"
ARCHIVE_SHA256 = "25ee41c3e3dc4fe55d414128b89339980f745256be20defffbc463dc746cbef6"
URL = f"https://codeload.github.com/shinyquagsire23/ghidra-aeon/zip/{COMMIT}"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--download", action="store_true")
    args = parser.parse_args()
    folder = ROOT / ".tools/ghidra-aeon"
    archive = folder / "source.zip"
    if not archive.exists():
        if not args.download:
            parser.error("Source archive missing; pass --download to fetch the pinned source")
        folder.mkdir(parents=True, exist_ok=True)
        with urllib.request.urlopen(URL, timeout=60) as response:
            data = response.read(10 * 1024 * 1024 + 1)
        if len(data) > 10 * 1024 * 1024:
            raise ValueError("Source archive exceeds expected limit")
        archive.write_bytes(data)
    if hashlib.sha256(archive.read_bytes()).hexdigest() != ARCHIVE_SHA256:
        raise ValueError("AEON source archive hash mismatch")
    with zipfile.ZipFile(archive) as z:
        for member in z.infolist():
            path = PurePosixPath(member.filename)
            if path.is_absolute() or ".." in path.parts or ":" in member.filename or "\\" in member.filename:
                raise ValueError("Unsafe source archive member")
            if member.is_dir():
                continue
            dest = folder / Path(*path.parts)
            dest.parent.mkdir(parents=True, exist_ok=True)
            dest.write_bytes(z.read(member))
    languages = folder / f"ghidra-aeon-{COMMIT}/data/languages"
    spec = languages / "aeon.slaspec"
    text = spec.read_text()
    for field in ["i16_uimm4_2", "i24_uimm4_2"]:
        if len(re.findall(r"\b" + field + r"\b", text)) != 1:
            raise ValueError("Upstream field is no longer unused")
        text, count = re.subn(field + r"\s*=\s*\(4,\s*2\)", "# Removed unused invalid field " + field, text)
        if count != 1:
            raise ValueError("Unexpected field definition")
    spec.write_text(text)
    sys.path.insert(0, str(ROOT / ".tools/python"))
    import pypcode
    compiler = Path(pypcode.__file__).parent / "bin" / ("sleigh.exe" if sys.platform == "win32" else "sleigh")
    subprocess.run([str(compiler), str(spec)], check=True)
    print("Prepared", languages)


if __name__ == "__main__":
    main()
