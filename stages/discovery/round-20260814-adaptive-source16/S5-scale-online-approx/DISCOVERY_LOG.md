# Discovery log — S5 Source16

## Frozen assignment

- Assignment: `DISCOVERY-S5-20260814-ADAPTIVE-SOURCE16-SEMANTIC-RESIDUAL-V1`
- Method: canonical v8.7; `DISCOVERY_CLAIM_PACK_MODE=OFF`; no V9 output.
- Scope: scalable/approximate compiler, accelerator, and hardware-semantic constructors with a stock semantic oracle.
- Result: `COMPLETE_ZERO_PROPOSALS__SEMANTIC_RESIDUAL_TRIAGE__CURRENT_UNION_OR_CARD_FAILURE`.
- Exclusions applied before screening: network security, vulnerabilities, attacks/defences, exploits, protocol security, malicious traffic; active/hold identities; Source15 identities; generic solver/wrapper and paper-owned complete constructors.

## Source discipline and snapshot

Neutral source snapshot: 2026-08-14, read-only official current documentation and upstream source references.  Primary-source anchors used were LLVM’s current Loop Vectorizer/VPlan documentation and source, MLIR Vector/Pass documentation, and NVIDIA CUTLASS current scheduler documentation.  The snapshot precedes dispositions; no outcome-driven replacement was made.

## Residual-survival cards (raw guidance = 6)

| ID / opportunity anchor | Current native union frozen before depth | Strongest subtractor / stock oracle | Carrier | Initial card outcome |
|---|---|---|---|---|
| R1 LLVM VPlan loop-vector construction | legality, costed VF/UF candidate plans, plan transformations, `computeBestVF`, execution, vectorization hints | current LLVM LoopVectorizer plus VPlan validity/IR semantics | LLVM test-suite and existing vectorizer regression corpus | D1 witnessable; deep 1 |
| R2 MLIR Vector-to-LLVM/target lowering | vector rewrite/conversion patterns; LLVM/Arm/X86/AMX/SME/GPU lowering pass options | MLIR verifier and LLVM IR semantics | MLIR test-suite vector inputs | D1 witnessable; deep 2 |
| R3 CUTLASS grouped-kernel schedule construction | device-only and host-precompute schedule modes, grouped-kernel problem visitor, schedule pruning | CUTLASS reference kernels/output checker | CUTLASS profiler problem sets | Reject before depth: the only named residual was scheduler/policy selection, excluded by contract |
| R4 XLA GPU buffer assignment | live-range/coloring/heap-simulation plus backend buffer-assignment configuration and verifier path | XLA HLO verifier and executable result | XLA benchmark-suite HLO modules | Reject before depth: overlaps Source13/XLA buffer-assignment current-union family; no fresh anchor |
| R5 OpenVINO NPU compilation/mapping | device compilation properties, plugin compilation and model compilation paths | OpenVINO inference output checker | Open Model Zoo models | Reject before depth: Source13 union/collision already records this family; no distinct atomic action |
| R6 CIRCT/MLIR accelerator lowering | dialect conversion and target lowering pipelines | dialect verifier plus emitted IR equivalence | CIRCT regression designs | `NOT_ADMITTED_UNFROZEN`: target-specific theorem/certificate and natural carrier were not simultaneously frozen in the allowed source-only pass |

## Base-depth reviews

### R1 — LLVM VPlan loop-vector construction

Exact object: fixed LLVM IR loop/nest and target transform information, preserving LLVM IR and language semantic conditions used by LoopVectorize.  The two complete legal outputs are scalar/no-vectorization and a selected, executable VPlan with chosen VF/UF, legality checks, masks/epilogue as required.  Current official VPlan documentation states that it constructs candidate plans, computes their cost, can fork/prune them, and executes the best plan; current source exposes `computeBestVF`, `selectInterleaveCount`, and `executePlan`.

Therefore the proposed “joint plan selection” is directly expressed by the stock union rather than a union-external atomic action.  A stronger target-specific approximation or certificate was not frozen without changing the code-generation guarantee.  Full-cost would have to include compile time, emitted-code size, run time, and peak compiler memory; LLVM test-suite is a finite carrier, but cannot rescue direct absorption.

Disposition: `DROP__CURRENT_NATIVE_UNION_DIRECTLY_EXPRESSES_COMPLETE_PLAN_ACTION`.

### R2 — MLIR Vector-to-LLVM/target lowering

Exact object: a fixed legal MLIR Vector program, target contract, and equivalent LLVM/target-dialect lowering under current pass options.  Two legal outputs (for example nested aggregate versus flattened/vectorized lowerings) are visible at the dialect level, with verifier and emitted LLVM IR as stock semantic oracles.  Current MLIR documentation describes retargetable rewrite/conversion patterns and target-specific options for Vector-to-LLVM lowering, including Arm, X86, AMX, SME, GPU and explicit lowering choices.

The available source material admits alternative representations but does not freeze a target-specific approximation/FPT/certified Pareto guarantee for a same-output whole constructor.  Treating a pass-pipeline choice or option grid as the novelty would be a controller/configuration proposal.  A single allowed source-only closure pass was consumed; it did not produce a noncontroller atomic residual.

Disposition: `NOT_ADMITTED_UNFROZEN__TARGET_SPECIFIC_CERTIFICATE_AND_NONCONTROLLER_ACTION_NOT_CLOSED`.

## Depth gate and conclusion

The contract permits a third deep review only after at least three pre-outcome role-complete D1-witnessable cards.  This screen produced two such cards (R1 and R2); the gate did not open.  No family satisfies every required card field: two complete outputs, same guarantee, target-specific theorem/certificate, noncontroller residual, complete cost denominator, and finite falsifier.  No `TOPIC_BRIEF` is created.

## Primary sources consulted

- LLVM, [Vectorization Plan](https://llvm.org/docs/VectorizationPlan.html), current documentation snapshot.
- LLVM, [LoopVectorize.cpp](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Transforms/Vectorize/LoopVectorize.cpp), current upstream source snapshot.
- LLVM, [Auto-Vectorization](https://llvm.org/docs/Vectorizers.html), current flags and semantics.
- MLIR, [Vector dialect](https://mlir.llvm.org/docs/Dialects/Vector/) and [Passes](https://mlir.llvm.org/docs/Passes/), current documentation snapshot.
- NVIDIA, [CUTLASS grouped-kernel schedulers](https://docs.nvidia.com/cutlass/latest/media/docs/cpp/grouped_scheduler.html), current documentation snapshot.
