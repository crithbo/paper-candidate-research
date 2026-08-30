# TENSOR-FIBER-DELTAORDER Incremental Ordered Fibers for Dynamic Sparse Tensor Lowering

- Status: `PROPOSE_STAGE0`
- Primary lane: sparse tensor compiler / data structure
- Discovery date: 2026-08-02

## Research question

Can a delta-ordered fiber representation maintain lexicographic iteration for a stream of sparse tensor updates with less rebuild work than full format conversion while preserving MLIR SparseTensor iteration semantics?

## Importance and group fit

Sparse compilation currently treats format conversion as a materialization boundary. Dynamic graph, recommender, and sparse-update workloads make that boundary costly. This is a compiler-visible data-structure/algorithm claim, not a schedule choice.

## Exact object

An MLIR SparseTensor COO/CSR-like rank-2 or rank-3 tensor receiving an ordered stream of insert/delete updates, then lowered to the same lexicographically ordered fiber iteration result. Frozen outputs: coordinates, values, duplicate-reduction rule, iterator order, peak bytes, update work, and query work. It excludes changing numerical kernels or merely choosing among existing formats.

## Strongest fair baseline

The full union is: MLIR/TACO native coordinate assembly, sorted COO append + global sort/recompress, per-fiber balanced-tree/CSR rebuild, and a small-instance offline optimum that sees the complete update batch. All arms pay ingest, duplicate merge, index/value storage, conversion, iterator construction, and cleanup.

## Mechanism hypothesis

Use a compact base fiber plus bounded, mergeable delta runs indexed by a rank-aware prefix directory; merge only when a local potential exceeds the work needed to restore the next iterator prefix. The claim is an amortized update/query tradeoff and a deterministic order guarantee.

## Competing mechanisms

- Mechanism A: prefix-directory delta runs with potential-triggered local merge.
- Mechanism B: a packed-memory-array fiber with bounded relabeling.
- Mechanism C: epochal radix buffers followed by stable segmented merge.
- Preferred mechanism and why: A exposes an explicit potential and has the clearest same-object counterexample against rebuild and tree baselines.

## Candidate paper claim

For natural update traces, the representation reaches a Pareto point in total update work × ordered-iteration latency × peak metadata that the full baseline union cannot match; it preserves exact coordinate/value and duplicate semantics. Any complexity bound is conditional on the frozen update model and must be proved in Stage 0.

## Current collision subtraction

MLIR SparseTensor and TACO are deployment/assembly baselines; they do not, in the checked documentation, specify this online delta-fiber data structure or its update/iteration bound. This is `SEARCH_BOUNDED_OPEN`, not a novelty claim. A published dynamic sparse tensor format with the same update action, ordered iterator guarantee, and charged merge/index costs is `DIRECT_FATAL`.

## Decisive falsifier

On SuiteSparse-derived update streams, if sorted-COO/recompress or per-fiber tree realizes the same exact order with no worse complete cost on every pre-registered trace, or if adversarial interleaving makes the proposed local-merge work superlinear relative to its stated bound, stop.

## Executable evidence path

### 72-hour first evidence

Implement a standalone rank-2 reference and replay 12 public SuiteSparse matrices converted into deterministic insert/delete traces. Compare exact output and charged bytes/work with sorted COO, tree, and offline oracle; publish trace hashes.

### AI core fraction and critical path

`0.72` (`AI_CORE_EXECUTABLE`): AI can implement the reference, use MLIR/TACO semantics, build oracles, and reproduce the comparison. Human review is needed only for final research ownership and a general proof.

### Semantics-preserving open alternatives

MLIR SparseTensor, TACO, SuiteSparse Matrix Collection, and a local reference preserve the object; no commercial accelerator is required.

## Dual-axis score

- Academic value: `55/70`
- AI executability bonus: `23/30`
- Total: `78/100`

## AI and researcher boundary

Stage 0 must first test the stated falsifier and audit dynamic-format literature. AI may produce all early code/evidence; researchers adjudicate the formal theorem and novelty boundary.
