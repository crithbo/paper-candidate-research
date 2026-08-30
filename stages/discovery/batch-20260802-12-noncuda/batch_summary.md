# Non-CUDA Discovery Wave 12 — Batch Summary

**Scope.** 12 non-synonymous Discovery briefs across accelerator compilers (2), PIM/NDP (2), quantization (2), runtime/data systems (3), and verification/debugging (3). This batch is a recommendation only: it creates no registry entry and does not advance any candidate.

## Decisions

| ID | Decision | Academic + AI | AI route | Core discriminating gate |
|---|---|---:|---|---|
| NPU-DISPATCH-CUT | PROPOSE_STAGE0 | 57 + 25 | executable | Pareto cut on 2 natural shape families |
| NPU-LAYOUT-WITNESS | PROPOSE_STAGE0 | 56 + 24 | executable | zero false merge on extracted graphs |
| PIM-KV-PLACEMENT | PROPOSE_STAGE0 | 58 + 22 | conditional | fixed-capacity traffic separation |
| PIM-SPARSE-REMAP | PROPOSE_STAGE0 | 55 + 25 | executable | reuse certificate calibration |
| QNT-RESIDUAL-ROUND | PROPOSE_STAGE0 | 58 + 26 | executable | held-out bit-exact error reduction |
| QNT-OUTLIER-ROUTE | PROPOSE_STAGE0 | 55 + 25 | executable | gain after complete side-path costs |
| RUNTIME-CHECKPOINT-COUPLE | PROPOSE_STAGE0 | 54 + 23 | executable | beat complete Cartesian union |
| LSM-SUBCOMPACTION-TAIL | PROPOSE_STAGE0 | 56 + 27 | executable | p99 gain at fixed WA |
| DATA-PARQUET-PAGECERT | PROPOSE_STAGE0 | 53 + 26 | executable | held-out full-cost frontier |
| VERIFY-MLIR-PROVENANCE | PROPOSE_STAGE0 | 57 + 28 | executable | reproducing minimized mismatch |
| VERIFY-RTL-ASSUMECORE | PROPOSE_STAGE0 | 56 + 24 | executable | portable reconstructed proof core |
| COMPILER-VECTOR-COUNTEREX | PROPOSE_STAGE0 | 52 + 27 | executable | natural counterexample partition |

## Ranking and audit notes

First investigation priority is `VERIFY-MLIR-PROVENANCE`, `QNT-RESIDUAL-ROUND`, `LSM-SUBCOMPACTION-TAIL`, then `NPU-DISPATCH-CUT`: each has a bounded open artifact path, a semantic oracle, and a mechanism-specific falsifier. `PIM-KV-PLACEMENT` is intentionally conditional: a trace/cycle model can decide the mechanism, but it must preserve legal bank-command semantics and must not claim device PPA.

All 12 remain `SEARCH_BOUNDED_OPEN`, not novelty-closed. Strongest direct-subtract audits are required before Stage 0, especially QQQ for `QNT-OUTLIER-ROUTE`, PIM mapping/DSE for both PIM briefs, and the complete Cartesian configuration union for `RUNTIME-CHECKPOINT-COUPLE`. The batch deliberately excludes prior failures: no invented PIM reduction action, no generic controller menu, no LLVM guard sharing, and no current-system action already known to cover the proposal.

Every brief locks natural inputs, 2–4 baselines, full cost accounting, and a mechanism-specific falsifier. Scores are ordering aids only; none is a PASS, and no test or experiment has been executed.

## Artifact integrity

Each topic directory contains `topic_brief.md`, `source_log.md`, and `handoff.yaml`; SHA-256 hashes for the first two are embedded in its handoff. The handoff itself is the source of the batch-local proposed transition. No master file was changed.
