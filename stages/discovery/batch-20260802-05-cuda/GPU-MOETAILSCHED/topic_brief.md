# GPU-MOETAILSCHED Dispatcher-visible tail scheduling for CUDA grouped MoE GEMM

- Status: `PROPOSE_STAGE0`
- Primary lane: CUDA runtime / algorithmic kernel scheduling
- Discovery date: 2026-08-02

## Research question

For a routed MoE layer whose expert token counts are known on the GPU, can a grouped-GEMM scheduler jointly choose device-visible problem order and tile ownership so that end-to-end MoE tail latency improves after dispatcher metadata, sorting, and synchronization are charged?

## Importance and group fit

MoE activation makes grouped GEMM naturally irregular: some experts receive very few tokens while others dominate the tail. CUTLASS provides persistent grouped kernels, round-robin tile assignment, problem sorting, and host/device scheduling modes, but its documentation treats these as kernel-local scheduler choices. The residual is a dispatcher-visible, end-to-end decision with a full metadata ledger—not ordinary tile-size tuning.

## Exact object

One GPU-resident MoE linear layer after routing. Decision variables are a stable expert/problem permutation, tile-owner policy, and when to materialize compact descriptor/prefix metadata. Costs include routing-to-GEMM synchronization, metadata reads/writes, sorting/compaction, workspace, GEMM tail, and restoration of token order.

## Strongest fair baseline

CUTLASS grouped-GEMM `kDeviceOnly` and `kHostPrecompute` schedulers, its documented problem sorting, a conventional per-expert launch, and their fair best combination under the same routed tensors, precision, and end-to-end accounting.

## Mechanism hypothesis

The GPU router has earlier visibility of expert occupancy than a generic grouped scheduler. A prefix-aware assignment that separates tiny experts from long expert tails can reduce idle persistent blocks without paying for host preparation or an unjustified global sort.

## Competing mechanisms

- Mechanism A: device-resident occupancy-bucket permutation plus prefix-aware tile ownership; prediction: lower last-block completion time at equal GEMM FLOPs; counterexample: CUTLASS sorting and round-robin already reproduce it.
- Mechanism B: two-tier schedule that drains tiny experts with one bounded queue and assigns long experts by proportional tiles; prediction: tail falls while median is unchanged; counterexample: queue metadata cancels the saved idle time.
- Mechanism C: route-order-preserving descriptor compaction that avoids global restoration; prediction: metadata cost is lower than a full expert sort; counterexample: coalescing loss erases the gain.
- Preferred mechanism and why: A directly exploits a decision variable unavailable to host precompute and yields a crisp tail-specific falsifier.

## Candidate paper claim

On public routed MoE workloads, a dispatcher-visible grouped scheduler produces end-to-end latency/tail Pareto points that the best documented CUTLASS scheduler mode plus sorting cannot reproduce when all routing and metadata costs are included.

## Current collision subtraction

CUTLASS is a `DEPLOYMENT_BASELINE`, not a collision: it documents grouped persistent scheduling, host/device scheduler modes, and sorting. This candidate is not `GPU-NCCLGROUPCUT` (no collective grouping), `CGPU-DECSLICE` (no codegen decision-slice minimization), or `GPU-MXSCALEFLOW` (no scale metadata flow). `SEARCH_BOUNDED_OPEN`: Stage 0 must inspect vLLM/DeepEP and CUTLASS MoE paths for a directly equivalent dispatcher-aware policy.

## Decisive falsifier

Drop if the best CUTLASS mode with documented sorting matches every candidate tail point after the same routing, compaction, restoration, and workspace ledger, or if public MoE dispatchers already implement the same policy and claim.

## Executable evidence path

### 72-hour first evidence

Use CUTLASS grouped-GEMM examples/profiler with synthetic-but-trace-derived expert histograms from an open MoE inference stack; implement A as a small scheduler variant and compare against both scheduler modes with CUDA-event timing and a metadata ledger. One real public MoE layer must be replayed before retaining the proposal.

### AI core fraction and critical path

`AI_CORE_EXECUTABLE`, about `0.76`. AI can build CUTLASS, extract router histograms from public code, implement the scheduler and ledger, run correctness tests, and reproduce all comparisons on a compatible CUDA GPU. The remaining boundary is hardware access and final paper ownership.

### Semantics-preserving open alternatives

CUTLASS source and profiler are open. If a Hopper/Blackwell device is absent, use the supported architecture available to preserve the grouped-scheduling object and label the claim architecture-limited.

## Dual-axis score

- Academic value: `59/70`
- AI executability bonus: `24/30`
- Total: `83/100`

## AI and researcher boundary

AI owns the implementation and audited comparison. The researcher decides whether the residual is sufficiently distinct from production MoE dispatchers and approves any device-specific claim.

