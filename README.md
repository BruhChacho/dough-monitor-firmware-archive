# Dough monitor firmware archive

An independent preservation project for publicly released firmware for Dough and former Eve Spectrum monitors. This repository collects the original ZIP packages, records where each was found, and provides hashes so owners can identify intact copies. The archive is incomplete and is not affiliated with Dough.

## Find a package

1. Read the exact model ID on your monitor or its label. Model IDs that differ by one character can require different firmware.
2. Open the [firmware index](INDEX.md), select that model ID, and distinguish **scaler** firmware from **USB** firmware.
3. Read the instructions inside the original ZIP before considering an update. The index records where Dough listed a package; it is not an independent compatibility certification.
4. Compare the downloaded ZIP with its SHA256 in [MANIFEST.csv](MANIFEST.csv). On Windows, run `Get-FileHash -Algorithm SHA256 path\to\package.zip`; on macOS or Linux, run `shasum -a 256 path/to/package.zip`.

Firmware updates can leave a monitor unusable if the wrong file is installed or the process is interrupted. Do not use a package solely because a model number appears in its filename. Some ZIPs include Windows updater executables or macOS disk images; this project has **not** executed or audited them. Beta firmware has its own risks and is labeled in the index.

## What is here

The archive currently holds **45 ZIP files with 38 distinct SHA256 hashes**, covering 10 model IDs. Identical bytes found under different historic URLs are retained as separate source copies. The [manifest](MANIFEST.csv) records each file's model mapping, source page, original URL, size, and hash. [Source catalogs](#collection-and-verification) preserve more metadata, including ZIP member names and vendor checksums when Dough published them.

The search recovered packages from Dough's [Spectrum One product page](https://dough.tech/products/spectrum-4k-144hz) and [Spectrum Black product page](https://dough.tech/products/spectrum-black), a [2023 capture of Dough's downloads page](https://web.archive.org/web/20230811182459/https://intl.dough.tech/pages/downloads), [Dough community firmware posts](https://www.reddit.com/r/doughcommunity/comments/15etlh9/firmware/), and older [TousLesDrivers listings](https://www.touslesdrivers.com/index.php?v_code=2224&v_page=26). Product pages still exposed download links during collection on 2026-10-12, although the old downloads page was gone.

Known gaps include the reported ES07D03 scaler v103; older test builds described by community members; Spectrum Black 27 480 Hz v1.0.6 for ES07EF5/ES07EFB; and firmware for model IDs such as ES07E92 and ES07EF6 that appeared in the search but had no located public package. Absence from this archive does not establish that a release never existed. The [search log](RESEARCH.md) records the leads and limits. Please [contribute a lead](CONTRIBUTING.md) if you have an original download URL, saved ZIP, release note, or trustworthy archived page.

## Collection and verification

The scripts in [`scripts/`](scripts/) are Python 3 programs that collect each source group. Run them from this checkout in this order if refreshing the archive:

```text
python scripts/collect_official.py
python scripts/collect_sharepoint.py
python scripts/collect_legacy.py
python scripts/collect_reddit.py
python scripts/collect_tld.py
python scripts/collect_black27_beta.py
python scripts/build_index.py
```

The final command checks every package against its recorded SHA256, checks ZIP CRCs, compares published vendor SHA256 values, and rebuilds `INDEX.md` and `MANIFEST.csv`. It does not execute any code from a downloaded ZIP.

Dough's site had an expired TLS certificate during collection. The official collector disables certificate checking **only to read the two product-page HTML documents**. Shopify and SharePoint package downloads use normal TLS certificate validation. The Wayback, Reddit, and TousLesDrivers lookups also use normal TLS validation.

Source catalogs: [`catalog.json`](catalog.json) (current product pages), [`sharepoint-catalog.json`](sharepoint-catalog.json), [`legacy-catalog.json`](legacy-catalog.json), [`reddit-catalog.json`](reddit-catalog.json), [`tld-catalog.json`](tld-catalog.json), and [`black27-beta-catalog.json`](black27-beta-catalog.json).

## Repository and rights

ZIPs are tracked with Git LFS. Install [Git LFS](https://git-lfs.com/) before cloning so the package files are fetched rather than only pointer files. The scripts and project documentation are offered under the [MIT license](LICENSE); firmware, updater programs, and vendor instructions inside `downloads/` remain the property of their respective rights holders. Their presence here does not make them open-source software or grant a firmware modification license. Rights holders can raise a specific concern through a repository issue.

This project is an independent community archive, not a support or warranty channel. The next research step is to inventory the binaries, identify hardware/platform variants and firmware containers, and document changes between versions without executing untrusted updaters on an owner’s monitor.
