# Isolated V9 Shadow — confirmed replacement slots

Input is the same neutral snapshot as canonical. This file is non-authoritative and does not alter canonical decisions.

| Signature | Canonical | Shadow | Difference / leakage |
|---|---|---|---|
| GLIBC_GCONV_MODULES_CACHE | NOT_ADMITTED_UNFROZEN | NOT_ADMITTED_UNFROZEN | V9 exposes alias/module-cost and GCONV_PATH countertests; stable, no canonical leakage. |
| NCURSES_TERMINFO_DATABASE | NOT_ADMITTED_UNFROZEN | NOT_ADMITTED_UNFROZEN | V9 separates tree/hash build configuration and lookup-search-order attack; stable, no canonical leakage. |

XKB is intentionally absent: `EXCLUDED_CROSS_LANE_DUPLICATE__S3_RETAINS` after its premature canonical hash, and never received shadow treatment.
