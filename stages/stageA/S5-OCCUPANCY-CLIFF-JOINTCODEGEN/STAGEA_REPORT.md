# S5-OCCUPANCY-CLIFF-JOINTCODEGEN Stage A Report

- Decision: `REVISE_ONCE`
- Quality tier: `TIER_B_Q2_VIABLE` (conditional structural potential; Stage A evidence gate not yet met)
- Evidence ceiling: `ANALYTICAL_SOFTWARE_MIR_EXCERPT_MODEL`; no trace/GPU/hardware evidence
- Novelty route: `N2`
- Stage semantics: real pilot research on the highest-risk premise; this report does not establish the paper main claim.

## Frozen contract

`EXPERIMENT_CONTRACT.yaml` freezes LLVM commit `1f112d62e1fa2c4f1a04887abd72da1ed61cf791`, subtarget spelling `amdgpu11.00`, MIR-pass optimization semantics, two hashed public regression inputs, deterministic Python 3.12.13 implementation, candidate/ceiling budgets, metrics, costs, stopping rules, commands, and an explicit no-Stage-B boundary.

The intended exact object remains LLVM AMDGPU MachineScheduler + greedy RA. The executed probe is a smaller analytical object because no local `llc` exists. That reduction is disclosed and constrains all conclusions.

## Headroom or theoretical gap

Current LLVM already couples target occupancy and register-pressure thresholds inside a staged scheduling strategy. The residual hypothesis is narrower: a fixed-budget, multi-bank, tier-indexed frontier that jointly decides schedule/allocation feasibility and returns an incumbent/certificate. The probe found model-level latency headroom but no modeled tier or spill headroom. Therefore the defining tier gap remains unobserved rather than closed.

## Minimal mechanism and strongest baselines

The minimal implementation parses virtual-register SSA dependencies, approximates register-bank live units, and searches tier-indexed beam frontiers. It compares:

1. input-order staged proxy;
2. pressure-aware list proxy;
3. tier-frontier beam-8 candidate, at most 4,096 expansions/case;
4. beam-64, at most 32,768 expansions/case, as a loose offline ceiling.

The strongest mandatory baseline is actual current LLVM `GCNSchedStrategy` followed by greedy RA on the same commit/target/budget. It was named but not runnable and therefore not replaced by a proxy.

## Natural workload and mechanism-specific prediction

The two inputs are public LLVM regression MIR artifacts, not natural workload evidence. The predicted signature was improvement concentrated at an occupancy tier cliff, with no systematic gain away from cliffs. Neither input crossed a modeled tier and every method had zero modeled spill units. Thus the mechanism-specific signature was not observed.

## Highest-risk probe result

- Risk-bearing premise: a bounded tier-frontier state representation can expose a same-object non-dominated point near an AMDGPU occupancy/register-pressure cliff.
- Probe/counterexample-search scope: 104 parsed instructions across two `amdgpu11.00` upstream regression artifacts, with 4,096 candidate and 32,768 ceiling expansions/case.
- Negative-result meaning: the coarse excerpt model is not a valid cliff witness; it cannot support a Stage A PASS.
- Positive-result ceiling: `NOT_FALSIFIED` for deterministic model-level search only; the paper main claim is not established.

The candidate reduced cycle proxy 126→93 and 31→30 while matching the ceiling tier in both cases, but tier remained 8 and spill units remained 0 throughout. The larger case candidate increased modeled peak SGPR/VGPR from 8/1 to 9/2; this is inconsistent with interpreting its cycle result as pressure improvement.

## Directional increment

- Performance/quality/Pareto/complexity effect: only analytical cycle-proxy reductions (26.2% and 3.2%) at 1,759 and 849 expansions; no tier or spill increment.
- Why it is not ordinary tuning or a weak-baseline artifact: the proposed state/feasibility object is algorithmic, but the executed result is still proxy-only. No paper-level nontrivial increment is claimed.

## Performance evidence chain, if applicable

- Algorithm/data-structure change: tier-indexed bounded frontier over dependency-ready schedule prefixes.
- Intermediate mechanism metric: normalized tier and peak bank live units; neither demonstrated a tier transition.
- End-to-end effect: absent.
- Full-cost result: host search time and expansions recorded; LLVM compile, verifier, allocation, spill/reload, code size, fallback, and kernel time absent.
- Generality region: not established.
- No-gain or regression region: both test artifacts are no-gain for tier/spills; the larger case reg-pressure peaks worsen under the candidate.

## Current critical-cost analysis

Candidate search used 204.56 ms total across the two cases; the loose ceiling used 3,390.30 ms. These host Python timings are reproducibility costs, not a fair compiler-time budget. The candidate did not exhaust its expansion budget. Missing costs that could reverse a real result include MIR reconstruction, legality repair, allocator interactions, fallback, and verifier/runtime failures.

## AI execution ledger

- AI executability class: `AI_CORE_CONDITIONAL`
- Measured ai_core_fraction: `0.60` for the current critical path. AI completed source locking, model implementation, probe, replay, audit, and reporting; it could not supply the pinned AMDGPU LLVM runtime or natural compiled corpus.
- Reproducible commands/artifacts: contract, Python scripts, input excerpts, primary/replay JSON, command log, results, and SHA-256 manifest.
- Human-only items: approve/provide the bounded LLVM tool bundle/corpus; later decide AMD hardware representativeness and any Stage B authorization.

## Mechanism pivot, if used

None. No object, outcome metric, or mechanism pivot was used.

## Literature collision update

Bounded 2026-08-09 primary-source scan:

- [Current LLVM GCNSchedStrategy source at the frozen commit](https://github.com/llvm/llvm-project/blob/1f112d62e1fa2c4f1a04887abd72da1ed61cf791/llvm/lib/Target/AMDGPU/GCNSchedStrategy.cpp) explicitly optimizes wave occupancy and uses multi-stage pressure-aware rescheduling. This is a `DIRECT_SUBTRACT` against broad occupancy-aware scheduling claims.
- [Current LLVM GCNSchedStrategy API documentation](https://llvm.org/doxygen/classllvm_1_1GCNSchedStrategy.html) exposes critical/excess pressure limits and occupancy-sensitive scheduling behavior.
- [LLVM AMDGPU developer guidance](https://llvm.org/docs/AMDGPU/DeveloperGuideline.html) and [AMDGPU usage documentation](https://llvm.org/docs/AMDGPUUsage.html) support the MIR replay and occupancy-analysis route.

No fixed-budget multi-bank joint schedule/allocation certificate on this exact stack was found in the bounded scan. Status remains `SEARCH_BOUNDED_OPEN_WITH_DIRECT_SUBTRACT`; it is not a novelty-first claim and is not closed for Stage B.

## Stage B minimal prototype

Not authorized and not started. If a later independent Stage A gate PASS and explicit user approval existed, the minimum would be a verifier-legal LLVM integration on natural `amdgpu11.00` regions, actual current LLVM/pressure/min-reg baselines, a small-instance exact ceiling, full compile/spill/code-size ledger, and orthogonal kernel-time or architecture validation.

- Primary workload: public natural AMDGPU kernels compiled to complete MIR under the frozen stack.
- Required orthogonal validation: a second workload family or target, plus hardware/kernel-time validation if runtime claims are made.
- Candidate Q1 venue family: PLDI / CGO / ACM TOPLAS compiler optimization.

## Q1/Q2 evidence-gap review

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Updated reference set: Unison (TOPLAS 2019), Intel Processor Graphics Register Allocation (CGO 2018), RL4ReAl (CC 2023), plus GPU minimum-register scheduling as a methodological neighbor.
- Status: `PARITY_NOT_PLAUSIBLE` at current evidence readiness.
- Evidence already comparable: bounded algorithmic search object and fully replayable analytical artifact.
- Executable Stage B gaps: none can be scheduled before Stage A is repaired and independently passed.
- Human/resource-dependent gaps: pinned LLVM AMDGPU tool bundle and complete natural-kernel MIR corpus; AMD GPU only if a runtime claim is later pursued.

## Non-relaxable quality audit

- Same-object: `PARTIAL`; commit/subtarget frozen, but execution is not actual LLVM/RA.
- Latest collision: `SEARCH_BOUNDED_OPEN_WITH_DIRECT_SUBTRACT`; not Stage-B-complete.
- Strong fair baselines: `FAIL_CURRENT_STAGE`; actual LLVM+greedy absent.
- Natural input/evidence: `FAIL_CURRENT_STAGE`; regression MIR only.
- Full-cost: `FAIL_CURRENT_STAGE`; model search costs only.
- Reproducibility: `PASS_FOR_EXECUTED_PROBE`; deterministic replay verified.
- Evidence/claim honesty: `PASS`; analytical/software/GPU/hardware ceilings separated.

## Supported and unsupported claims

Supported:

- the frozen Python probe is deterministic and replays exactly;
- the candidate finds lower cycle-proxy orderings in both excerpt models;
- these particular models do not expose a tier/spill cliff.

Unsupported:

- any legal LLVM code-generation improvement;
- any real occupancy-tier retention, spill reduction, compile-time win, kernel speedup, energy benefit, cross-target generality, or main paper claim;
- novelty closure beyond the bounded residual scan.

## Mandatory user gate before Stage B

- Independent Stage A gate decision: pending; owner recommends `REVISE_ONCE`.
- User-facing evidence packet: `USER_REVIEW_PACKET.md`
- `PENDING_USER_STAGEB_REVIEW`: no
- Stage B user approval id/time: null
- Stage B authorized: false

## Human research reserve, if applicable

Not recommended at this point. The evidence gap is bounded and primarily resource/toolchain dependent, so `REVISE_ONCE` is more appropriate than reserve or STOP.
