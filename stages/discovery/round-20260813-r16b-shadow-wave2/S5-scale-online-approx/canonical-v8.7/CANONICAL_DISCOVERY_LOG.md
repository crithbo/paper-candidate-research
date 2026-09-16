# Canonical v8.7 Discovery — R16B S5

Assignment: `DISCOVERY-S5-20260813-R16B-V9-PROSPECTIVE-SHADOW-WAVE2`.
Canonical method is frozen v8.7/OFF.  This document relies solely on the
preceding neutral snapshot; the V9 shadow is generated only after this file is
sealed and hashed.

| Family | current native union and same-object conclusion | Canonical disposition |
|---|---|---|
| S5-R16B-F01 GTK icon theme | `gtk4-update-icon-cache` explicitly constructs the same mmap-able cache from the same directory. Its `--force`, `--ignore-theme-index`, `--index-only`, `--include-image-data`, and `--validate` controls constitute the frozen union. It preserves stock GTK reader semantics and the tree-walk/cache-write/startup-cost denominator. | `DROP__CURRENT_UNION_DIRECTLY_EXPRESSES_ATOMIC_ACTION` |
| S5-R16B-F02 GdkPixbuf loader cache | Official runtime docs say `gdk-pixbuf-query-loaders` creates `loaders.cache`, which runtime GdkPixbuf reads; the documented module-directory and cache-file overrides belong to the comparator union. This is the same loader-signature action and cost boundary. | `DROP__CURRENT_UNION_DIRECTLY_EXPRESSES_ATOMIC_ACTION` |
| S5-R16B-F03 GIO module cache | GIO documents that a queryable installed module requires `gio-querymodules` to build lazy-loading cache files, with the same extension-point information and load-avoidance purpose. A changed trigger would only be a controller. | `DROP__CURRENT_UNION_DIRECTLY_EXPRESSES_ATOMIC_ACTION` |
| S5-R16B-F04 desktop MIME cache | The official specification names `update-desktop-database` as the native producer after desktop-file installation, while preserving the same fact-only MIME association semantics and disallowing a fictitious priority guarantee. | `DROP__CURRENT_UNION_DIRECTLY_EXPRESSES_ATOMIC_ACTION` |

All four are narrow direct-action drops, not assertions that their ecosystems
lack other research residuals.  No absence was inferred from an inaccessible
source page, and no missing implementation/result/resource was used negatively.
No `PROPOSE_STAGE0` or brief is produced.

For any future distinct residual, the finite fidelity killer is a small public
or canonical package directory: construct both states, require stock reader
acceptance and equal lookup facts, then reject if full-cost, reader semantics,
or guarantee differs.  This is an unexecuted Stage-A closure plan, not evidence.
