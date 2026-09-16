# CUDA/GPU Discovery Wave 27 — handoff summary

## Outcome

- Screened: 14 non-synonymous, parallel-algorithm objects.
- `PROPOSE_STAGE0`: 1 — `GPU-APSPGEMM-ROWCERT`.
- `DROP`: 13, consolidated in `DROP.md`.
- No formal state transition, GPU run, downstream directory, or shared-control edit was performed.

## Why the proposal remains

The remaining object is not a library/API exercise or a selector: it requires one mergeable row-local state to jointly determine randomized sparse-product work and establish a simultaneous per-row error guarantee. It has frozen natural input sources and an AI-executable CPU/simulation killer. Its largest risk is that randomized approximate matrix-product literature already supplies this exact coupled representation/bound; Stage 0 should make that the first collision gate.

## Required Stage 0 order

1. Freeze exact semiring, error norm, simultaneous-confidence language, pruning, and full cost ledger.
2. Audit approximate SpGEMM/randomized matrix-product papers and code for same-state/same-guarantee `DIRECT_FATAL` coverage.
3. Run the 72-hour CPU seed-replay coverage and bytes/work separation gate on frozen SuiteSparse pairs.
4. Only if both hold, decide whether CUDA porting can support a fair full-cost Pareto claim.
