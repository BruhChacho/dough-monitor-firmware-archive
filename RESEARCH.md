# Search log (2026-10-12)

This log records where the first archive pass looked and what remains uncertain. A missing result means no publicly downloadable file was located in this pass.

## Sources that yielded files

| Source | Result |
| --- | --- |
| [Current Spectrum One page](https://dough.tech/products/spectrum-4k-144hz) | Scaler and USB packages for ES07D03, ES07DC9, ES07E30. |
| [Current Spectrum Black page](https://dough.tech/products/spectrum-black) | Scaler packages for ES07E2D, ES07E2F, ES07E91, ES07EFE, ES07EF5, ES07EFB; Black 27 files use SharePoint. |
| [Archived Dough downloads page, August 2023](https://web.archive.org/web/20230811182459/https://intl.dough.tech/pages/downloads) | Older Spectrum One scaler and USB releases; its seven published SHA256 values all match the saved files. |
| [Dough community firmware post](https://www.reddit.com/r/doughcommunity/comments/15etlh9/firmware/) and [Beta 2 post](https://www.reddit.com/r/doughcommunity/comments/17lmham/beta_2_firmware_open_beta_testing_es07d03_matte/) | ES07D02 scaler 101/Beta01, ES07D03 Beta01/Beta02, Black 27 Beta006, and copies of other releases. |
| [TousLesDrivers ES07D03 v102](https://www.touslesdrivers.com/index.php?v_code=69501&v_langue=en&v_page=23) and [USB 18.02](https://www.touslesdrivers.com/index.php?v_code=71599&v_langue=en&v_page=23) | Older original Shopify CDN downloads recovered through its listing/redirect. |

An owner-maintained [Google Drive folder](https://drive.google.com/drive/folders/1ctVCjfHlQELR5pju_oIEHyFiPp4sp52Y?usp=sharing) also listed four packages. Their names and apparent versions matched files already recovered from the sources above, so they were not used as primary provenance or added as extra ZIPs.

## Gaps and follow-up leads

| Lead | Current status |
| --- | --- |
| ES07D03 scaler v103 | Mentioned in a [community release inventory](https://www.reddit.com/r/doughcommunity/comments/1vib2fl/scaler_and_usb_firmware_for_es0d02d03dc9_in_my/); no public file located. |
| Other development/test builds for ES07D02, ES07D03, ES07DC9 | The same inventory lists more releases, but no public download was provided there. |
| Spectrum Black 27 480 Hz ES07EF5/ES07EFB v1.0.6 | [Owners have asked for it](https://www.reddit.com/r/doughcommunity/comments/1wwab1i/does_anyone_have_access_to_th_106_firmware_for_th/). The current product page exposes v1.0.14, .16, .17, and .19 for these model IDs; no verified v1.0.6 file was located. |
| ES07E92, ES07EF6 | Model IDs appeared on Dough pages, but no corresponding firmware link was found in the support sections examined. |

The archived product pages were also investigated through the Internet Archive capture index. Snapshot retrieval became rate limited, so that avenue was not treated as evidence that older packages are absent. Possible filename patterns were checked against known Shopify store IDs only in a bounded way; a 404 for a guessed name does not prove the release never existed.

## Integrity and scope

The saved packages are unmodified ZIPs. The archive verifies SHA256, ZIP CRCs, and the vendor's published SHA256 where available. A matching hash proves consistency with a published value, not source code availability, updater safety, or hardware compatibility. No updater executable or firmware image was run during this collection pass.
