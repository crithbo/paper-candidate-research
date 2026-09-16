# Source and collision matrix

| first-party source | role | result |
|---|---|---|
| [Current `ui::DataPack` reader/writer source](https://chromium.googlesource.com/chromium/src/+/refs/heads/main/ui/base/resource/data_pack.cc) | Current reader checks, ID binary search, alias table, offset handling and writer-side alias construction. | Establishes ID/alias constraints and partial union. |
| [Current GRIT pack utility](https://chromium.googlesource.com/chromium/src/+/refs/heads/main/tools/grit/pak_util.py) | Official repack/read pipeline entry point. | Partial construction surface; does not close all build options. |
| [DataPack header](https://chromium.googlesource.com/chromium/src/+/54aadc512f3e268f2b760ba5d3805be94bda5df5/ui/base/resource/data_pack.h) | Native entry/alias representation reference. | Supports reader-oracle contract. |
| Primary DataPack-specific layout/version/delta papers and artifacts | Direct collision subtraction. | Not closed; no novelty conclusion. |

Only Chromium first-party sources support affirmative technical claims.
