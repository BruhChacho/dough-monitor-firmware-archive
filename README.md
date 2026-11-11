# Dough monitor firmware archive

Original firmware packages for Dough and former Eve Spectrum monitors, with a
partial editable source build for Spectrum One ES07DC9 v101 rev1148.
This independent project is not affiliated with Dough.

## Find firmware

1. Read the exact model ID on your monitor or its label.
2. Find the model and component in the [firmware index](INDEX.md).
3. Check the package SHA256 against [MANIFEST.csv](MANIFEST.csv).
4. Read the vendor instructions inside the original ZIP.

The archive contains 45 original ZIP packages with 38 distinct SHA256 hashes.
Model IDs that differ by one character can require different firmware. Scaler
and USB firmware are separate targets. A package listing does not certify
compatibility; installing the wrong image or interrupting an update can leave
a monitor unusable. Original vendor installers and guides are kept inside ZIPs.

Packages use Git LFS. Install [Git LFS](https://git-lfs.com/) before cloning and
run `git lfs pull` if downloaded packages are pointer files.

## Edit and build

The [source build guide](firmware/README.md) explains how to prepare an editable
workspace, reproduce the stock DC9 image, and build fixed-size source changes
using Python 3.9 or newer. No additional Python packages are required.

[Editable assembly and tables](firmware/source/layout.json) cover 428 components,
111,840 code bytes and 1,203 table bytes. The code covers 4.609% of the
2,426,560-byte application. The rest remains a pinned vendor binary. A complete vendor source
tree, SDK and general target compiler are unavailable. Experimental images are
hardware-untested and are not offered as installable releases.

EFE scaler and USB BINs are reference inputs; they are not rebuilt from source.
The build commands do not flash or communicate with a monitor.

## Rights

Original project scripts and documentation use the [MIT license](LICENSE).
Vendor firmware, updater programs, instructions and firmware-derived assembly
and data retain their respective rights holders' rights. Their inclusion does
not make the vendor firmware open-source software or grant a modification license.
