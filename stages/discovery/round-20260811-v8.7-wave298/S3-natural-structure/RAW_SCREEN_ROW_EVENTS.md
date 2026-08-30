# RAW_SCREEN_ROW_EVENTS

Phenomenon-first screen, cutoff 2026-08-11; official-source only and no execution/download.

| ID | Fresh versioned native artifact | Three-version public change trace and proposed recourse observation | State |
|---|---|---|---|
| R1 | IANA TZif zoneinfo files | IANA publishes named historical tzdata releases and a per-release version file; compare `V-1,V,V+1` zone-file changes, controlling changed rules/zones and `zic` version. | `DEEP_DIVE_REQUIRED` |
| R2 | TeX engine `.fmt` format files | Official TeX/TeX Live release-tag and generated format-file chain is possible, but a public hash-pinned three-version set and stable recourse law were not frozen. | `NOT_ADMITTED_UNFROZEN` |
| R3 | GNU Emacs native `.eln` files | Official Emacs releases plus native-compilation cache outputs provide a version series, but native code is explicitly machine/version dependent; stable same-reader adjacent trace is not frozen. | `DEEP_DIVE_REQUIRED` |
| R4 | GHC `.hi` interface files | Official GHC releases produce binary interfaces and expose `--show-iface`; same-run object/interface dependency complicates a fixed reader contract. | `DEEP_DIVE_REQUIRED` |
| R5 | OCaml `.cmi` compiled interfaces | Official compiler versions yield versioned artifacts, but compatible adjacent reader/trace identity is not frozen. | `NOT_ADMITTED_UNFROZEN` |
| R6 | PostgreSQL initial catalog data | Official server releases generate native catalog data, but a public three-version exact catalog artifact/stock-reader chain was not frozen. | `NOT_ADMITTED_UNFROZEN` |

No entry is promoted merely from format layout; each first requires an actual repeated change/cost observation.
