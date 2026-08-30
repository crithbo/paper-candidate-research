# Results — CVC5 Carcara recovery R3C1

## Decision

`BLOCKED_USER_ACTION_REQUIRED__ROUTES_EXHAUSTED__R3H_RECOMMENDED`.

This is a resource-only outcome. `resource_ready=false`, claim-bearing observation
is false, scientific revision is not consumed, and Stage B remains false.

## Valid resource observations

- Exact Carcara tag source and Apache-2.0 license were preserved without changes.
- Rust/Cargo 1.72.0 GNU portable installation and version smokes passed.
- The locked crates.io dependency fetch passed after one transient network timeout.
- Clean build 1 failed at offline index resolution; the single mechanical correction
  closed that issue.
- Corrected clean build 2 failed at native linking because the frozen bootstrap lacks
  `libgcc_eh` and `libgcc` archives required by Rust's Windows GNU target.
- No `carcara.exe` was produced, so version/help/checker smoke and full preclaim were
  not executable.

## Cost ledger

| Operation | Wall | Result |
|---|---:|---|
| Rust 1.72 portable acquisition/install | about 61 s tool-observed | PASS |
| Locked dependency fetch | 61.397 s | PASS after one Cargo-managed timeout retry |
| Clean build 1 | 0.318 s | exit 101 before compilation |
| Corrected clean build 2 | 4.041 s | exit 101 at linker |

Peak process-tree RSS and exact child-process CPU were not available because WMI
process enumeration was access-denied. No false precision is claimed. The short
bounded calls are far below the 6 CPU-hour envelope. Pre-report storage was
1,268,471,686 B across 14,701 files, below 8 GiB; final package values are frozen
in the handoff/manifest.

## Scientific boundary

No candidate, Carcara checker, Alethe equivalence, natural corpus, full-cost Pareto,
Stage B, automation, system installation or shared-control write occurred. Evidence
ceiling is `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`.
