"""Preserve Dough monitor packages linked from the 2023 Wayback capture."""

from concurrent.futures import ThreadPoolExecutor, as_completed
from datetime import datetime, timezone
import html
import json
from pathlib import Path
import re
from urllib.parse import unquote, urlparse
from urllib.request import urlopen

from collect_official import ROOT, download


PAGE = "https://web.archive.org/web/20230811182459/https://intl.dough.tech/pages/downloads"
OUTPUT = ROOT / "legacy-catalog.json"
def main():
    with urlopen(PAGE, timeout=30) as response:
        body = html.unescape(response.read().decode("utf-8", "replace"))
    packages = {}
    for row in re.findall(r'<tr[^>]*>(.*?)</tr>', body, re.I | re.S):
        link = re.search(r'href="([^"]+\.zip[^\"]*)"', row, re.I)
        if not link or "https://cdn.shopify.com/s/files/1/0292/5975/9756/files/" not in link.group(1):
            continue
        digest = re.search(r'SHA256:\s*([0-9a-fA-F]{64})', row, re.I)
        url = link.group(1)
        packages[url[url.index("https://cdn.shopify.com"):]] = digest.group(1).lower() if digest else None
    entries = []
    for url, vendor_sha256 in sorted(packages.items()):
        filename = unquote(Path(urlparse(url).path).name)
        models = [model for model in ("ES07D03", "ES07DC9") if model.lower() in filename.lower()]
        version = re.search(r'usb_fw_(.+)\.zip$|(?:scaler_fw_|_fw_)(\d+)\.zip$', filename, re.I)
        entries.append({
            "models": models,
            "component": "usb" if "usb_fw" in filename.lower() else "scaler",
            "version": next((part for part in version.groups() if part), "see filename") if version else "see filename",
            "source_page": PAGE,
            "source_url": url,
            "local_path": "downloads/legacy-2023/" + filename,
            "status": "pending",
            "vendor_sha256": vendor_sha256,
        })
    with ThreadPoolExecutor(max_workers=4) as pool:
        futures = {pool.submit(download, e["source_url"], e["local_path"]): e for e in entries}
        for future in as_completed(futures):
            entry = futures[future]
            try:
                entry.update(future.result())
                entry["vendor_hash_match"] = entry["sha256"] == entry["vendor_sha256"]
                entry["status"] = "downloaded" if entry["vendor_hash_match"] else "hash_mismatch"
                print("OK", entry["local_path"], entry["size_bytes"], flush=True)
            except Exception as exc:
                entry["status"] = "error"
                entry["error"] = str(exc)
                print("ERROR", entry["local_path"], str(exc), flush=True)
    OUTPUT.write_text(json.dumps({
        "discovered_at_utc": datetime.now(timezone.utc).isoformat(),
        "source_page": PAGE,
        "entries": entries,
    }, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    print("Wrote", OUTPUT)


if __name__ == "__main__":
    main()
