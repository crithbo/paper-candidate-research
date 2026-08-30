# Discovery log — S2 Wave 4

- Assignment: `DISCOVERY-S2-20260809-V8.4-WAVE4`
- Lane: `DISCOVERY-S2-BOTTLENECK-TRANSFER`
- Date cut-off: 2026-08-09 (Asia/Shanghai).
- Production method: accepted Discovery `v2/v8.1`; O2 is `CALIBRATED` in the registry.
- Excluded method: TLS-blocked two-axis `v8.2r2`; it was not used or cited as evidence.
- Source policy: paper originals plus author artifacts and official/upstream repositories only.
- Execution boundary: discovery and source verification only; no artifact download, experiment, benchmark, Stage 0/A/B, or shared-state change.

## Search frame

For each lead, first subtract the anchor's stated limitation/future-work-shaped action and current same-object mechanisms. A remaining idea must change the decision structure—not merely add a controller, cost-model weight, or extra scheduling knob—and must admit a public CPU/solver Stage A falsifier on 20–50 natural instances.

## Primary-source query record

1. `2025 2026 compiler lowering translation validation bottleneck verification paper`
2. `2025 2026 verified compiler lowering proof generation optimization paper artifact`
3. `zkVM proof generation compiler optimization 2026`
4. `zkVM proof shards compiler optimization`
5. `accelerator compiler data movement lowering verification paper 2026`
6. `Defeat the Heap AXI4MLIR GitHub artifact`
7. `storage DB compute metadata proof overhead 2025 2026 paper`
8. `distributed graph computation communication algorithm natural traffic matrices 2025 2026`

## Retained primary evidence

- [Automated Translation Validation of a Compiler for Statically Scheduled Accelerators (FMCAD 2025)](https://theory.stanford.edu/~barrett/pubs/MTP%2B25-abstract.html) already produces symbolic representations at each compiler/hardware stage, uses scheduling information to generate translation-validation queries, and includes formal-verification performance optimizations.
- [Evaluating Compiler Optimization Impacts on zkVM Performance (ASPLOS 2026; arXiv:2508.17518)](https://arxiv.org/abs/2508.17518) evaluates 64 LLVM passes and 58 benchmarks on SP1 and RISC Zero; its artifact is publicly deposited at [Zenodo](https://zenodo.org/records/17955453).
- [SP1 upstream](https://github.com/succinctlabs/sp1) is the current open source RISC-V zkVM. Its upstream ecosystem explicitly exposes multi-shard proof support, while the [riscv-emulator challenge](https://github.com/succinctlabs/riscv-emulator-challenge) describes the fixed-cycle shard work decomposition and serial execution front-end.
- [AXI4MLIR](https://arxiv.org/abs/2312.14821), [Data Transfer Optimizations](https://arxiv.org/abs/2402.19184), and [Defeat the Heap](https://arxiv.org/abs/2606.11158) form an open compiler lineage from DMA allocation/coalescing/pipelining to direct DMA-mapped, zero-copy lowering.

## Three-pass convergence

1. **Genealogy / seed distance.** The accelerator-translation-validation lead has no new decision structure: the anchor already jointly models the lowering stages, schedule information, validation queries, and verifier performance. The AXI4MLIR lead likewise already spans DMA allocation, coalescing, pipeline overlap, and current zero-copy lowering.
2. **Same-object collision.** The zkVM lead initially appears to transfer optimization cost from cycle reduction to proof-shard aggregation. Yet its natural residual—optimizing LLVM pass sequences with shard count or estimated aggregation cost—is only a new fitness weight for the anchor's existing per-program autotuning. It is not a new action, constraint, or representation. Choosing a different shard policy would also change SP1's prover/runtime object, preventing a fair same-stack claim.
3. **Artifact / natural-input / executable route.** The zkVM artifact has 58 public programs (sufficient quantity), but the contemplated CPU-only Stage A would only recompute a pass-sequence score; it cannot falsify an independent mechanism. The accelerator papers expose public source lineage but no 20–50 natural-instance solver formulation distinct from their existing allocation/coalescing/pipeline actions. Resource availability is not used as a rejection reason.

## Result

**Zero `PROPOSE_STAGE0` briefs (0/2).** The result follows direct structural absorption or lack of a finite non-wrapper residual, not lack of implementation, current results, hardware, or AI readiness. No terminal candidate is revived, and no Wave 3 UPMEM/PIMDAL object is reused.

Search is `SEARCH_BOUNDED_OPEN` only where indicated in the collision matrix; it is never a novelty conclusion.
