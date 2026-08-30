# Candidate-grade deep review

## D1 — Chromium DataPack layout/version: `NOT_ADMITTED_UNFROZEN`

**Same-object contract.** Inputs freeze resource IDs, aliases, bytes and scale/locale semantics. Outputs must load in stock `ui::DataPack`, preserve lookups/full scans and preserve adjacent-version compatibility under the selected contract.

**Current action constraints and witness.** The current reader performs binary search by resource ID; aliases store resource-table indices; it checks table/offset bounds. Thus a resource-ID permutation is not a legal same-object action. A remaining two-layout witness would need to alter only legal payload/section placement while regenerating all offsets and passing reader/load/lookup equality. It is not yet frozen.

**Current strongest union.** Required closure covers current reader, DataPack writer, GRIT/repack, resource and alias tables, encoding, compression, scale/locale and every build flag. Source confirms portions of this union and a current main reader path, but not its exhaustive build-pipeline surface.

**Collision/residual.** Direct primary work on DataPack-specific layout/version/delta constructors remains unclosed. No claim says the current union lacks an action, or that a target-specific exact/FPT/Pareto/approximation result survives.

**Finite killer.** In 72 hours: pin a Chromium revision and build flags; create two stock-reader-accepted `.pak` outputs for a versioned resource corpus; verify identical ID/alias/full-scan results; reject if the proposed action changes IDs, violates binary-search/alias constraints, is generic layout/delta, or is produced by the complete pinned union. Ledger: pack/build CPU-RSS-temp, bytes/delta/apply, load/query CPU-RSS-latency.

**Decision.** `NOT_ADMITTED_UNFROZEN`; source/collision incompleteness is not an absence claim or scientific STOP.
