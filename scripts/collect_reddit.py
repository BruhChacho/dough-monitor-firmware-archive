"""Preserve Dough firmware packages linked by its official Reddit posts."""

from concurrent.futures import ThreadPoolExecutor, as_completed
from datetime import datetime, timezone
import json
from urllib.parse import urlparse
from pathlib import Path

from collect_official import ROOT, download


POST = "https://www.reddit.com/r/doughcommunity/comments/15etlh9/firmware/"
BETA2_POST = "https://www.reddit.com/r/doughcommunity/comments/17lmham/beta_2_firmware_open_beta_testing_es07d03_matte/"
PREFIX = "https://cdn.shopify.com/s/files/1/0728/3153/3351/files/"
ITEMS = [
    ("ES07D03", "scaler", "108", POST, "spectrum_es07d03_scaler_fw_108_98bc9b51-b121-42aa-9ea8-76233332cc72.zip?v=1690840553"),
    ("ES07DC9", "scaler", "101", POST, "spectrum_es07dc9_scaler_fw_101_632e5593-443e-487d-975c-29fa3b0dd012.zip?v=1690840529"),
    ("ES07D02", "scaler", "101", POST, "spectrum_es07d02_scaler_fw_101.zip?v=1692801994"),
    ("ES07D03, ES07DC9", "usb", "06A4/0A.89.19.02", POST, "spectrum_es07d03-es07dc9_usb_fw_06A4-0A.89.19.02_1.zip?v=1690840446"),
    ("ES07D02", "scaler", "Beta01 rev1167", POST, "spectrum_es07d02_scaler_fw_1167_Beta01.zip?v=1694620704"),
    ("ES07D03", "scaler", "Beta01 rev1149", POST, "spectrum_es07d03_scaler_fw_1149_Beta01.zip?v=1690839643"),
    ("ES07D03", "scaler", "Beta02 rev1169", BETA2_POST, "spectrum_es07d03_scaler_fw_1169_Beta02_2.zip?v=1698873101"),
]


def main():
    entries = []
    with ThreadPoolExecutor(max_workers=4) as pool:
        futures = {}
        for model, component, version, page, file_query in ITEMS:
            url = PREFIX + file_query
            path = "downloads/reddit-2023/" + Path(urlparse(url).path).name
            entry = {"models": model.split(", "), "component": component, "version": version,
                     "source_page": page, "source_url": url, "local_path": path}
            entries.append(entry)
            futures[pool.submit(download, url, path)] = entry
        for future in as_completed(futures):
            entry = futures[future]
            try:
                entry.update(future.result())
                entry["status"] = "downloaded"
                print("OK", entry["local_path"], entry["size_bytes"], flush=True)
            except Exception as exc:
                entry["status"] = "error"
                entry["error"] = str(exc)
                print("ERROR", entry["local_path"], str(exc), flush=True)
    (ROOT / "reddit-catalog.json").write_text(json.dumps({
        "discovered_at_utc": datetime.now(timezone.utc).isoformat(),
        "entries": entries,
    }, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
