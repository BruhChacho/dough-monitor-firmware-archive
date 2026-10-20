"""Reproducible byte comparisons. Byte differences are not semantic changes."""
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def compare(a, b):
    limit = min(len(a), len(b))
    offsets = [i for i in range(limit) if a[i] != b[i]]
    result = {"left_size": len(a), "right_size": len(b), "different_bytes_in_overlap": len(offsets),
              "nonoverlapping_bytes": abs(len(a) - len(b)),
              "changed_64k_blocks": [{"offset": hex(start), "different_bytes": sum(
                  a[i] != b[i] for i in range(start, min(start + 65536, limit)))}
                  for start in range(0, limit, 65536) if a[start:start + 65536] != b[start:start + 65536]]}
    if len(offsets) <= 128:
        result["byte_changes"] = [{"offset": hex(i), "left": f"{a[i]:02x}", "right": f"{b[i]:02x}"} for i in offsets]
    return result


def main():
    members = json.loads((ROOT / "analysis/inventory.json").read_text())["members"]
    layouts = json.loads((ROOT / "analysis/mstar-layouts.json").read_text())
    def find(prefix):
        matches = [m for m in members if m["sha256"].startswith(prefix)]
        if len(matches) != 1:
            raise ValueError("Ambiguous sample")
        m = matches[0]
        data = (ROOT / m["local_path"]).read_bytes()
        if hashlib.sha256(data).hexdigest() != m["sha256"]:
            raise ValueError("Input hash mismatch")
        return m, data
    results = []
    for label, ap, bp in [
        ("One matte v108 vs glossy v101, both rev1148", "136d982", "0b5d83"),
        ("Black 32 matte vs Gorilla Glass v1.0.19", "c54e563", "e3eeed"),
        ("Black 27 480 Hz matte vs Gorilla Glass v1.0.19", "b92d11", "b8f861"),
        ("Black 32 Gorilla Glass v1.0.17 to v1.0.19", "2a8067", "e3eeed"),
        ("One Beta02 to Beta03", "ac2299", "d9be1e"),
    ]:
        a, aa = find(ap)
        b, bb = find(bp)
        item = {"label": label, "left_sha256": a["sha256"], "right_sha256": b["sha256"],
                "raw_comparison": compare(aa, bb)}
        maps = [[m for m in layouts if m["source_sha256"] == x["sha256"]] for x in [a, b]]
        if all(maps):
            item["expanded_comparison"] = compare(*[(ROOT / m[0]["expanded_path"]).read_bytes() for m in maps])
        results.append(item)
    (ROOT / "analysis/comparisons.json").write_text(json.dumps(results, indent=2) + "\n")
    for r in results:
        print(r["label"], r["raw_comparison"]["different_bytes_in_overlap"], "changed bytes")


if __name__ == "__main__":
    main()
