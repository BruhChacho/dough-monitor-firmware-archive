"""Discover and preserve firmware linked from Dough's public product pages.

The Dough site currently has an expired TLS certificate. Only the HTML fetch
uses curl --insecure; firmware downloads from Shopify keep normal TLS checks.
This script never opens or executes downloaded files.
"""

from concurrent.futures import ThreadPoolExecutor, as_completed
from datetime import datetime, timezone
import hashlib
import html
import http.cookiejar
import json
from pathlib import Path
import re
import subprocess
import sys
from urllib.parse import unquote, urlparse
from urllib.request import HTTPCookieProcessor, Request, build_opener, urlopen
import zipfile


ROOT = Path(__file__).resolve().parents[1]
CATALOG = ROOT / "catalog.json"
PRODUCTS = {
    "Spectrum One": "https://dough.tech/products/spectrum-4k-144hz",
    "Spectrum Black": "https://dough.tech/products/spectrum-black",
}


def page_html(url):
    result = subprocess.run(
        ["curl.exe", "--insecure", "--location", "--silent", "--show-error", "--max-time", "30", url],
        capture_output=True,
        check=True,
    )
    return html.unescape(result.stdout.decode("utf-8", "replace"))


def discover():
    entries = []
    for family, page in PRODUCTS.items():
        body = page_html(page)
        anchor = body.find('<div class="support-guide">')
        if anchor < 0:
            raise RuntimeError("Support guide missing: " + page)
        section_end = body.find("</section>", anchor)
        section = body[anchor:section_end if section_end > anchor else None]
        for item in re.split(r'<div class="guide-item"', section)[1:]:
            model = re.search(r'data-button-text="([^"]+)', item)
            title = re.search(r'class="is-h3">(.*?)</a', item, re.S)
            urls = re.findall(r'<a[^>]+href="([^"]+)"', item)
            url = next((u for u in urls if "cdn.shopify.com" in u or "sharepoint.com" in u), None)
            if not (model and title and url):
                continue
            label = re.sub(r'<[^>]+>', ' ', title.group(1))
            label = ' '.join(label.split())
            if "firmware" not in label.lower():
                continue
            component = "usb" if label.lower().startswith("usb") else "scaler"
            filename = unquote(Path(urlparse(url).path).name)
            path = "downloads/official/" + filename if "cdn.shopify.com" in url else None
            published = re.search(r'<div class="guide-link">.*?<span>([^<]+)</span>', item, re.S)
            stated_hashes = re.findall(r'SHA256:\s*([0-9a-fA-F]{64})', item, re.I)
            entries.append({
                "family": family,
                "model": model.group(1),
                "component": component,
                "version": label.split("firmware", 1)[-1].strip(),
                "source_page": page,
                "source_url": url,
                "local_path": path,
                "status": "pending" if path else "external_link",
                "published_on_page": published.group(1).strip() if published else None,
                "vendor_sha256": stated_hashes[-1].lower() if stated_hashes else None,
            })
    return entries


def download(url, path):
    target = ROOT / path
    target.parent.mkdir(parents=True, exist_ok=True)
    if not target.exists():
        temporary = target.with_suffix(target.suffix + ".part")
        request = Request(url, headers={"User-Agent": "DoughFirmwareArchive/1.0"})
        opener = build_opener(HTTPCookieProcessor(http.cookiejar.CookieJar())) if "sharepoint.com" in url else None
        response_context = opener.open(request, timeout=120) if opener else urlopen(request, timeout=120)
        with response_context as response, temporary.open("wb") as out:
            if response.headers.get("Content-Type", "").split(";")[0] not in ("application/zip", "application/x-zip-compressed", "application/octet-stream"):
                raise RuntimeError("Unexpected content type for " + url)
            while True:
                block = response.read(1024 * 1024)
                if not block:
                    break
                out.write(block)
                if out.tell() > 200 * 1024 * 1024:
                    raise RuntimeError("Package exceeds 200 MiB limit: " + url)
        temporary.replace(target)
    digest = hashlib.sha256()
    with target.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    with zipfile.ZipFile(target) as archive:
        bad = archive.testzip()
        if bad:
            raise RuntimeError("ZIP CRC failure in " + path + ": " + bad)
        members = archive.namelist()
    return {"size_bytes": target.stat().st_size, "sha256": digest.hexdigest(), "zip_members": members}


def main():
    entries = discover()
    urls = {entry["source_url"]: entry["local_path"] for entry in entries if entry["local_path"]}
    print("Discovered", len(entries), "model entries and", len(urls), "unique Shopify packages", flush=True)
    results = {}
    with ThreadPoolExecutor(max_workers=4) as pool:
        futures = {pool.submit(download, url, path): url for url, path in urls.items()}
        for future in as_completed(futures):
            url = futures[future]
            try:
                results[url] = future.result()
                print("OK", urls[url], results[url]["size_bytes"], flush=True)
            except Exception as exc:
                results[url] = {"error": str(exc)}
                print("ERROR", urls[url], str(exc), flush=True)
    for entry in entries:
        if entry["source_url"] in results:
            details = results[entry["source_url"]]
            entry.update(details)
            entry["status"] = "downloaded" if "sha256" in details else "error"
            if entry["status"] == "downloaded" and entry["vendor_sha256"]:
                entry["vendor_hash_match"] = entry["sha256"] == entry["vendor_sha256"]
    catalog = {
        "discovered_at_utc": datetime.now(timezone.utc).isoformat(),
        "note": "Dough product page HTML was fetched with TLS verification disabled because the site certificate was expired; all Shopify package downloads used normal TLS verification.",
        "entries": entries,
    }
    CATALOG.write_text(json.dumps(catalog, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    print("Wrote", CATALOG, flush=True)
    if any(entry["status"] == "error" for entry in entries):
        sys.exit(1)


if __name__ == "__main__":
    main()
