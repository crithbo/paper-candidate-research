# RAW_SCREEN_ROW_EVENTS

Cutoff 2026-08-11; official/primary sources only; no download, build, execution or benchmark.

| ID | Fresh versioned artifact family | Candidate release-trace phenomenon (not yet observed) | State |
|---|---|---|---|
| R1 | GLib `.gresource` binary bundle | unchanged resource paths/blobs may recur across adjacent GNOME app releases | `DEEP_DIVE_REQUIRED` |
| R2 | glibc `locale-archive` | unchanged locale-category payloads may recur across adjacent glibc/locale-data releases | `DEEP_DIVE_REQUIRED` |
| R3 | OpenType `.ttf/.otf/.ttc` public font releases | unchanged glyph/table regions may recur across adjacent upstream font releases | `DEEP_DIVE_REQUIRED` |
| R4 | systemd `hwdb.bin` | unchanged modalias-record cohorts may recur across hwdb release updates | `NOT_ADMITTED_UNFROZEN` |
| R5 | SELinux binary policy | unchanged policy-rule cohorts may recur across policy release tags | `NOT_ADMITTED_UNFROZEN` |
| R6 | GObject Introspection `.typelib` | unchanged introspection metadata groups may recur across GNOME library releases | `NOT_ADMITTED_UNFROZEN` |

These are different from all explicitly excluded or active reviewed artifact families. A release sequence alone is not recorded as a stable law.
