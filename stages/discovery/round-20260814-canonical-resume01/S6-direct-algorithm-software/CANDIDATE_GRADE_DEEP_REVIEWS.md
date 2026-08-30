# Candidate-grade deep reviews

## D1 — Linux eBPF verifier-state exploration

- Exact object: one eBPF program, kernel/version/configuration, helper and map declarations, and fixed accept/reject semantics; the stock kernel verifier is the oracle.
- Proposed contribution shape if a later closure succeeds: N2, a target-specific bounded-dependence construction that chooses checkpointing/subsumption histories while preserving verification outcome, with a stated safe-pruning/analysis-cost Pareto guarantee.
- Current strongest union: documented branch traversal, state equality/subsumption, liveness, stack/register tracking, loop handling and verifier configuration—not merely one traversal order.
- Witness status: a candidate two-history witness is conceptually available only after complete configuration-specific admissibility is fixed. It is not frozen from the bounded current-source snapshot.
- Natural carrier / finite route: kernel selftests and public BPF programs; fixed kernel verdict/log and replay as oracle. Full-cost denominator would be verification CPU, peak verifier memory, instruction/state counts and log/artifact size.
- 72-hour killer: if a minimal program cannot be shown to admit both stock-legal histories under one frozen kernel configuration while preserving verdict/log semantics, or if the complete union already includes the claimed construction, stop the line.
- Disposition: `NOT_ADMITTED_UNFROZEN`; not a rejection based on absent implementation/results.

## D2 — LibTIFF whole-image storage layout

- Exact object requested: one decoded image, tags and standard TIFF reader behavior. The stock library also exposes raw strip/tile organization.
- Full action union: strip/tile choice, dimensions, planar configuration, encoded/raw writer calls, compression and reader modes.
- Witness: strip versus tile storage is a legal decoded-raster divergence, but it is not a same-object witness against the complete reader contract because the documented low-level APIs distinguish the storage organization.
- Natural carrier / full cost / killer: versioned public image corpus; decoded-pixel equality, raw-organization observations, write/read CPU/RSS/temp/bytes/latency. A one-image read via both high- and low-level API would immediately falsify the claimed common object.
- Disposition: `STRUCTURAL_DROP__SAME_OBJECT_READER_CONTRACT_OR_CONFIG_SPACE`.

No brief is emitted because neither deep review establishes a bounded, non-generic, fair N2 residual.
