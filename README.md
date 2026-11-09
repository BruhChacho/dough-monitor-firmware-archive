# Dough monitor firmware archive

An independent preservation project for publicly released firmware for Dough and former Eve Spectrum monitors. This repository collects the original ZIP packages, records where each was found, and provides hashes so owners can identify intact copies. The archive is incomplete and is not affiliated with Dough.

## Find a package

1. Read the exact model ID on your monitor or its label. Model IDs that differ by one character can require different firmware.
2. Open the [firmware index](INDEX.md), select that model ID, and distinguish **scaler** firmware from **USB** firmware.
3. Read the instructions inside the original ZIP before considering an update. The index records where Dough listed a package; it is not an independent compatibility certification.
4. Compare the downloaded ZIP with its SHA256 in [MANIFEST.csv](MANIFEST.csv). On Windows, run `Get-FileHash -Algorithm SHA256 path\to\package.zip`; on macOS or Linux, run `shasum -a 256 path/to/package.zip`.

Firmware updates can leave a monitor unusable if the wrong file is installed or the process is interrupted. Do not use a package solely because a model number appears in its filename. Some ZIPs include Windows updater executables or macOS disk images; this project has **not** executed them. Initial static analysis is documented below and is not a complete safety audit. Beta firmware has its own risks and is labeled in the index.

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

ZIPs are tracked with Git LFS. Install [Git LFS](https://git-lfs.com/) before cloning so the package files are fetched rather than only pointer files. Original analysis scripts and project prose are offered under the [MIT license](LICENSE). Firmware, updater programs, vendor instructions, and firmware-derived code/data remain subject to their respective rights holders' rights, including reconstructed snippets under `analysis/`. Their presence here does not make the vendor firmware open-source software or grant a firmware modification license. Rights holders can raise a specific concern through a repository issue.

## Reverse engineering

For community firmware development, start with the [raw files and source-build
guide](firmware/README.md). The current DC9 overlay contains **271 routines, 15,539 instructions / 47,338 code bytes**, plus **14 tables / 1,203 bytes**: **1.951% (about 1.95%)** code-byte coverage of the expanded application. The 2026-11-06 bulk batch adds 89 routines (5,201 instructions / 15,641 bytes) without ISA or model changes. Single-active-channel storage returns; lane-store full apply still stops at unrecovered conversion `0x2aae3d`. The combined offline gate passed on 2026-11-08 UTC: 40 stages and 231 tests, with zero failures, errors, or skips. It verified 361 run-artifact hashes and 423 source identities; preservation checked 450 snapshot files, 21 prior workspaces and 58 BIN files. The workspace contains 310 artifacts plus two USB images. No hardware behavior is established. See the [bulk-source report](analysis/2026-11-06_reverse-dc9-bulk-source-report.md), [workspace summary](analysis/community-bulk-source-workspace.json), and [source layout](analysis/reconstructed/dc9-source-layout.json).

The historical 2026-11-04 channel-dispatch milestone adds three byte-exact routines
(178 instructions / 529 bytes): route `0x21ddcf..0x21de65`, selector
`0x21bfca..0x21c024`, and apply `0x226bb5..0x226cd6`. Integrated validation
currently covers eight conditional cases across four active positions and two
store policies, using explicit logical bus mappings at `0xfff01f8d` and
`0xfff02e02` and a four-byte wait mapping at `0x455204`. Full apply stops at
`0x2420b2`, before its first flag poll, after a 35,459-instruction base plus nine instructions per channel. Isolated validation passed five strict cases (including one expected store rejection) and 86 conditional cases; integrated validation passed eight conditional cases. The offline gate finished 2026-11-05 UTC: 229 tests passed with no failures, errors, or skips. It verified 255 run-artifact hashes and 310 source identities, with 209 base workspace artifacts plus two USB images. Preservation checks found 414 snapshot files, retained 18 prior workspaces, and preserved 49 BIN files. This is not hardware validation. Routing and engine control return before delay arming; timer bytes `02000100` / lane `0200013c` remain literal, with no tick or completion event inferred. See the [dispatch report](analysis/2026-11-04_reverse-dc9-channel-dispatch-report.md), [workspace summary](analysis/community-channel-dispatch-workspace.json), and [workspace](analysis/extracted/firmware-validation-channel-dispatch-2026-11-04/workspace/).

The 2026-10-30 channel-assignment milestone and its 222-test combined gate are
historical. That fixture used an earlier input setup, stopped before
`0x21ddcf`, and faulted at `0xa0e03e00` without the newly supplied logical bus
mapping; a separate fixture without the timer mapping faults at `0x455204`.
See its [report](analysis/2026-10-30_reverse-dc9-channel-assignment-report.md)
and [historical validation](analysis/extracted/firmware-validation-channel-assignment-2026-10-30/validation.json).

The percentage measures recovered code bytes, not overall product readiness.
Earlier reports and workspaces remain historical snapshots.

The [analysis workspace](analysis/README.md) now includes a reproducible inventory, an unpacker that recovers the compressed program from all 13 distinct Spectrum One images, bounded AEON disassembly, a decoded Black 32 model-value routine, and a static analysis of the Black 27 updater. The [first technical report](analysis/2026-10-19_reverse-dough-report.md) records evidence, model/version differences, and remaining uncertainties.

Small annotated C reconstructions are available under [`analysis/reconstructed/`](analysis/reconstructed/). **A complete, buildable replacement firmware has not been recovered.** Extracted programs are generated locally from the preserved ZIPs; no monitor was flashed during analysis.

The [2026-10-20 milestone](analysis/2026-10-20_reverse-spectrum-one-report.md) adds
validated Spectrum One checksums and resource parsing, 13 byte-exact container
roundtrips, a bootloader trace, and an experimental DC9 recompression with
identical decoded program bytes. A small assembly build also reproduces one
recovered 39-byte routine exactly. The experimental image is not hardware-tested
and is not offered as an installable release.

This project is an independent community archive, not a support or warranty channel.
