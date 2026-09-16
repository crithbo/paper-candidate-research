# DISCOVERY-S3-20260809-V8.5-WAVE11 — Discovery log

## Method, feedback prior, and scope

- Assignment: `DISCOVERY-S3-20260809-V8.5-WAVE11`; S3/O3 natural structure.
- Method: accepted/calibrated production Discovery `v2/v8.1`, v8.4 baseline-residual-first, and v8.5 `PRE_CLAIM_CONTRACT_FIDELITY_GATE` feedback prior.  Blocked two-axis `v8.2r2` was not used or claimed.
- Frozen cutoff: 2026-08-09.  Sources are original papers/author artifacts or official LLVM/ROCm/Triton project, source, and documentation pages.
- Active/terminal exclusions: PB, Git, RocksDB, S4, S1 active objects; terminal COH/O4/e-graph and legacy GPU lines; occupancy/regalloc, CDNA5/TDM, and target mapping.
- Architecture terminology: `gfx1250` is not CDNA5.  AMD Tensor Data Mover/Tensor DMA is not NVIDIA TMA.  No route crosses either unverified boundary.
- No experiment, benchmark, Stage0/A/B directory, or main-control file was created.

## Stage-A feedback translated upstream

The v8.5 feedback is used as a discovery prior, not as a new academic gate: a proposal cannot claim a global schedule from a local swap or a static proxy.  Before its first claim-bearing observation, it would need the entire native action, an actual same-object comparator, native compiler semantics, a single full-cost denominator, and legality/equivalence witnesses.  This ruled out using a local MachineScheduler run as a stand-in for global construction.

## Global-construction residual screen

| Route | Natural official carrier and stable structure | Candidate complete action | Current deployable same-information union | Action-gap / preclaim-fidelity result |
|---|---|---|---|---|
| W11-LLVM-01 | LLVM MIR functions expose control-flow superblocks and machine dependence edges; MIR serializes target instruction names exactly. | Compensation-free, cross-basic-block superblock schedule that improves resource/packet density while preserving liveness and all target constraints. | LLVM MachineScheduler's per-basic-block regions; upstream [HexagonGlobalScheduler commit](https://lists.llvm.org/pipermail/all-commits/Week-of-Mon-20260216/282359.html), which already schedules superblocks across blocks, supports speculative/predicative modes, pull-up, liveness preservation, and packet-density improvement. | `EMPTY`: the stated global construction is directly the existing action family.  Restricting it to no-compensation moves is an implementation subset, not N2. |
| W11-GPU-01 | Triton blocked programs naturally couple compute, memory movement, and synchronization at multi-warp granularity. | Globally construct a multi-warp movement/synchronization schedule from the blocked program. | [TLX](https://arxiv.org/abs/2605.10905) MIMW representation/orchestration and [ML-Triton](https://arxiv.org/abs/2503.14985) multi-level lowering. | `EMPTY`: the proposed global action is within MIMW/multi-level orchestration.  A source-level schedule chooser would additionally be a prohibited selector. |
| W11-LLVM-02 | LLVM’s generic MachineScheduler visits machine basic blocks and scheduling regions; natural MIR tests are verifier-ready. | Generic cross-block global schedule portable to arbitrary LLVM targets. | Generic local scheduler, target-specific global schedulers, established superblock/trace scheduling family. | `EMPTY`: portability alone changes backend coverage, not the decision variable or construction.  A real generic action would require target semantics and a native comparator for each target; no finite exact contract was frozen. |

## Two-layer conclusion

`grounded briefs = 0`; `PROPOSE_STAGE0 = 0`.

Conditional structural potential remains real for an actually new global-construction algorithm: LLVM MIR plus `-verify-machineinstrs` gives a natural carrier and legality witness, and Stage A could later use 20–50 MIR/program instances.  But the action-gap certificate is empty for every screened route, so potential does not become a Stage-0 recommendation.  This is not a readiness, implementation, GPU-access, or missing-result judgment.

## First-party evidence

1. [LLVM MachineScheduler source](https://llvm.org/doxygen/MachineScheduler_8cpp_source.html) and [MachineScheduler interface](https://llvm.org/doxygen/MachineScheduler_8h_source.html), showing per-machine-basic-block scheduling regions.
2. [LLVM MIR format reference](https://llvm.org/docs/MIRLangRef.html) and [official `-verify-machineinstrs` option](https://llvm.org/docs/doxygen/TargetPassConfig_8cpp.html).
3. [HexagonGlobalScheduler upstream commit](https://lists.llvm.org/pipermail/all-commits/Week-of-Mon-20260216/282359.html) (2026-02), including global superblock scheduling, speculative/predicative modes, and liveness handling.
4. [TLX](https://arxiv.org/abs/2605.10905) and [ML-Triton](https://arxiv.org/abs/2503.14985), author manuscripts.
5. [ROCm compiler reference](https://rocm.docs.amd.com/projects/llvm-project/en/latest/reference/rocmcc.html) and [HIP compiler documentation](https://rocm.docs.amd.com/projects/HIP/en/latest/understand/compilers.html), for target-specific compiler-object boundaries.

This search is bounded.  It makes no global novelty or performance claim.
