# UST-SEGMENTED-FORMAT-COVER — Stage 0 PRIMARY Review

- Assignment: `STAGE0-P1-20260810-UST-SEGMENTED-FORMAT-COVER-PRIMARY-V8.7`
- Mode: `PRIMARY`
- Cutoff: `2026-08-10`
- Decision: `REVISE_ONCE`
- Confirmation: `PENDING_CONFIRMATION`
- Conditional quality tier: `TIER_B_Q2_VIABLE`
- Current evidence readiness: `SOURCE_READY__MECHANISM_RESIDUAL_UNDERFROZEN`
- Confidence: `0.86`
- Stage A/B authorized: `false / false`

## Executive judgment

The fixed object is coherent and has a finite fidelity route: one unchanged sparse matrix `A`, a declared sequence of dense right operands `B_1...B_R`, and the same row-ordered outputs `C_r=A B_r`. Contiguous row fragments can own disjoint output rows, so a multi-plan implementation need not change the mathematical object. Public SuiteSparse inputs and the open nvmath-python source make a later same-object test feasible. Lack of a current implementation or GPU result is therefore not a stop reason.

The present mechanism, however, is not yet independently separated from a small and fair prior family. NVIDIA UST v1.0.0 exposes one `TensorFormat` per `Tensor`, conversion, codegen/library dispatch, stateful planning, operand reset and plan reuse. It does not expose a documented native heterogeneous row-cover constructor. That absence leaves an action gap, but not a paper contribution by itself: multiple UST tensors and `Matmul` objects can already compose the execution.

The algorithmic core is also heavily subtracted. Ahrens and Boman already formulate contiguous row partitions, detailed runtime/memory costs, repeated-multiply amortization and a linear-time dynamic program for 1D-VBR. EVC-HYB is an explicit hybrid ELL/CSR partitioned representation. HR-SpMM is same-operation SpMM with adaptive row partitioning, two execution regimes, auxiliary indexing and SuiteSparse evaluation. GeneralSparse is same-operation SpMM with input-sensitive sparse-matrix division, format adjustment, a cost model and code generation. ParamSpMM adds an input-feature-driven configurable sparse representation and execution engine. None alone is an exact direct-fatal match to a UST, contiguous, multi-format, repeated-`B` cover, but together they show that an additive labelled segmentation DP plus unchanged per-segment UST calls is ordinary composition, not yet a nontrivial N2.

One scientific revision is justified because the object, natural carrier and falsifier are sound and the unresolved issue is atomic: whether the frozen cover contains a non-product decision or formal guarantee beyond contiguous partitioning plus per-format costs. The revision must not change the object, workload, row order, output semantics or UST deployment boundary.

## Structural paper potential versus readiness

| Axis | Judgment | Basis |
|---|---|---|
| Structural paper potential if the atomic gate closes | `TIER_B_Q2_VIABLE` | A genuinely coupled, budgeted/reuse-aware UST cover algorithm with a stated guarantee, natural heterogeneity regime and full-cost no-gain map could support a credible Q2 systems/algorithms paper. |
| Current evidence readiness | `SOURCE_READY__MECHANISM_RESIDUAL_UNDERFROZEN` | Current source, APIs, public corpus and finite comparator route exist. No implementation or result is required at Stage 0. The missing item is a claim-level mechanism separation certificate, not a resource. |
| Current disposition | `REVISE_ONCE` | The exact object passes, but N2 is not yet distinct from the finite strongest family. |

## Exact object and contract

- Input: a fixed canonical sparse matrix `A in R^(m x k)` with unchanged coordinates, values and original row order; dense operands `B_r in R^(k x n)`, `r=1...R`; declared dtype, transpose flags, `alpha`, `beta`, memory limit and UST version.
- Output: the same in-place UST SpMM contract `C_r := alpha A B_r + beta C_r`, with each original row produced exactly once and returned in its original position.
- Candidate action: choose at most `K` contiguous row intervals, one legal UST representation and one native `Matmul` plan per interval, plus directory, conversion, plan-reuse and execution schedule.
- Information: static structure of `A`, declared `R`, shapes/dtypes, admissible format/action catalog and a fixed memory budget; no post-hoc timing oracle unavailable to comparators.
- Cost: conversion/ingestion, all metadata, plan/JIT/library setup, plan cache, compilation, launches, temporary/output memory, output placement, execution and failure/fallback. Cold and warm ledgers remain separate.
- Semantics: floating-point results must use a frozen reference/tolerance and report format-dependent reduction-order effects; integer/order-safe witnesses must be bit-exact. A permissive tolerance cannot conceal row omission, duplication or changed `alpha/beta` semantics.

The same-object route is finite. A contiguous dense `C` row slice can serve as the in-place output for a segment if the pinned package accepts its layout; otherwise a charged segment result plus deterministic row copy is required. Each segment receives the same complete `B_r`. The Stage A pre-claim fidelity gate must demonstrate this on a small exact witness before any timing claim.

## Current upstream reality check

- Frozen upstream: NVIDIA `nvmath-python` tag `v1.0.0`, commit `bb27be436099b36559bae15a307c94d76b12e902`, commit date `2026-07-14`; `main` and `v1.0.0` resolved to the same commit on 2026-08-10.
- `nvmath/sparse/ust/tensor.py`: `Tensor.__init__` binds exactly one `tensor_format`; `convert()` creates one target tensor in one target format. No public tensor slice, segmented tensor or mixed-format cover constructor was found.
- `nvmath/sparse/ust/tensor_format.py`: the action catalog includes CSR/CSC/DCSR/DCSC/CROW/CCOL, diagonal/skew-diagonal, batched CSR/DIA, BSR/BSC builders, delta, structured and general DSL-built formats. This is a much stronger baseline than CSR alone.
- `nvmath/sparse/generic/_configuration.py`: documented non-default `codegen=True` forces UST code generation instead of cuSPARSE; default is library dispatch where supported. Memory limit and execution behavior are explicit costs/configurations.
- `nvmath/sparse/generic/matmulmod.py`: stateful `Matmul.plan()` amortizes preparation across executions; `reset_operands[_unchecked]()` and repeated `execute()` are native. Source also exposes finite non-default algorithm/kernel selectors through environment variables. These must be recorded or fixed, not silently inherited.
- `nvmath/sparse/ust/interfaces/torch_interface.py`: the current integration caches `Matmul` objects by format and shape and reuses them. Plan reuse is therefore native baseline behavior.
- Discovery absence claim: **narrowed, not contradicted**. No native complete cover constructor was found, but all primitive actions needed to build a cover externally already exist. The surviving claim must be about a new joint constructor/guarantee, not missing API support.

## Paper genealogy, collisions and seed distance

| Work | Same-object relation | What it subtracts | What remains only conditionally |
|---|---|---|---|
| NVIDIA UST/nvmath-python 1.0.0 | Same deployment API and SpMM semantics | Format DSL, conversion, named/custom formats, library/codegen dispatch, plan/reset/reuse | A joint algorithm choosing a heterogeneous contiguous cover under one full-cost budget |
| Ahrens & Boman, 1D-VBR | Same fixed sparse matrix, contiguous row partition, repeated multiplication and amortization; operation is SpMV and representation is VBR | The generic claim that contiguous row grouping plus additive cost DP is new | A non-product multi-format/plan coupling or guarantee specific to the complete UST action family |
| EVC-HYB | Sparse multiply with a hybrid ELL/CSR representation; reorders rows | Hybrid representation and row-class partition are old | Original-order, bounded multi-format UST construction with a stronger algorithmic property |
| HR-SpMM, ICS 2025 | Same SpMM operation; adaptive row partition, hybrid kernels, auxiliary mapping; SuiteSparse | Row partition plus heterogeneous execution is not new; kernel-only gains and omitted preprocessing are insufficient comparators | Full-cost UST cover only if it contributes more than a threshold split/wrapper |
| GeneralSparse, USENIX ATC 2025 | Same SpMM; input-aware division, format adjustment, cost model, code generation; SuiteSparse | Input-sensitive division plus generated execution is a current strong system baseline | A distinct UST-format-cover algorithm/guarantee under the same information and cost |
| ParamSpMM, GDMA/DASFAA workshop 2025 author version posted 2026 | Same GNN SpMM; configurable PCSR, input features, predicted configuration | Adaptive representation/config selection and amortized generation are subtractors | It uses a global configuration rather than a heterogeneous contiguous cover |

No single source was verified as an exact `DIRECT_FATAL`. Collision status is `SEARCH_BOUNDED_OPEN`, but the bounded strongest family leaves only a narrow algorithmic residual. Discovery's score and recommendation are not inherited.

## Finite strongest fair comparator set

1. `UST-GLOBAL-GRID`: every compatible whole-matrix UST format in the pinned catalog, library and codegen paths, finite legal algorithm/kernel settings, with identical memory limit, dtype, `alpha/beta`, `R`, plan reuse and cold/warm accounting.
2. `ADDITIVE-LABELLED-SEGMENT-DP`: the same permitted boundaries, formats, `K`, segment cost table and budget, solved as ordinary additive labelled segmentation. This is the decisive mechanism subtractor; it prevents renaming a standard DP as the contribution.
3. `HYBRID-SPMM-FAMILY`: HR-SpMM and GeneralSparse where a faithful same-input artifact is available; otherwise their published mechanism is used as a paper-level subtractor and negative control, not fabricated as an executable equal-quality baseline. ParamSpMM is an additional method subtractor.
4. `BOUNDED-EXHAUSTIVE-CEILING`: exhaustive search over small admissible covers with exactly the same objective and costs. It is an oracle/ceiling, not a deployment baseline.

This is a finite union around one object and action family. It is not a universal union and does not automatically stop the topic. The revision must demonstrate why comparator 2 cannot express the retained action/guarantee.

## N1/N2/N3 assessment

- `N1`: not established. A collection of existing UST tensors plus a directory is an external composite representation, but currently reads as wrapper engineering unless the representation has a formal semantic or complexity property.
- `N2`: conditional and currently underfrozen. The proposed additive DP is strongly anticipated by 1D-VBR and generic labelled segmentation. A non-product coupling, approximation/optimality theorem, or algorithmic data structure over the complete UST action family could establish N2.
- `N3`: plausible but not yet independently sufficient. SuiteSparse can test contiguous heterogeneous strata, but a descriptive heterogeneity observation without a nontrivial exploitation mechanism is unlikely to clear the Q2 floor.

## Unique atomic revision gate

Gate ID: `NONPRODUCT_UST_COVER_RESIDUAL_BEYOND_CONTIGUOUS_PARTITION_AND_HYBRID_SPMM`

Single proposition: under the frozen UST v1.0.0 same-SpMM contract, the complete cover has at least one legal decision/coupling or formal guarantee that cannot be represented by ordinary additive labelled contiguous segmentation over precomputed per-segment/per-format costs, and that is not already the row-split/hybrid execution action of HR-SpMM or the matrix-division/cost-model/codegen action of GeneralSparse.

The one revision must provide:

- a mathematical decision model with explicit variables, information, budget, objective and output semantics;
- the complete finite native action catalog and the additive labelled-DP comparator in the same notation;
- one named non-product interaction or guarantee, plus a minimal witness where it changes the legal or optimal action;
- a theorem/complexity/approximation statement or algorithm whose substance survives deletion of the name UST;
- a bounded Stage A test showing how the retained action will be observed and falsified on natural matrices while charging all costs.

Automatic revision failure:

- only adding more UST formats, thresholds, weights or estimator features;
- choosing among native outputs or tuning `K`, formats, codegen, algorithms or environment selectors;
- a Python directory/controller, emitter patch or postprocessor without a new algorithmic property;
- merely combining Ahrens-style DP with UST segment costs;
- changing to reordered rows, approximate products, pruned-GNN-only semantics, a new kernel family or another sparse operation.

If no such residual exists, the terminal scientific outcome should be `BELOW_Q2_STOP__HYBRID_ROW_PARTITION_PLUS_UST_WRAPPER_ABSORPTION`.

## Stage A highest-risk probe plan, if closing review later accepts the revision

- Risk-bearing premise: the retained non-product action changes cover choices on natural contiguous heterogeneity and yields a full-cost Pareto point unavailable to the four comparators.
- Corpus: at least 20 frozen SuiteSparse matrices selected by preregistered strata, not by observed speedup. Suggested strata are row-nnz coefficient of variation, adjacent-row Jaccard/run similarity, diagonal concentration and block density; include homogeneous/no-gain controls.
- Reuse: freeze `R in {1, 8}` and one or more declared dense widths before measurement. Do not tune strata or `R` after seeing gains.
- Fidelity first: verify one exact integer/order-safe witness and one floating witness, row coverage, coordinate/value preservation, `alpha/beta`, output placement and all memory limits before timing.
- Full ledger: conversion, directory, planner/compile, all launches, temporary/output bytes, peak memory, execution and fallback; cold and warm separately.
- Killer: stop if the retained action differs from `ADDITIVE-LABELLED-SEGMENT-DP` on fewer than 10% of eligible natural matrices, any equality/legality check fails, no preregistered natural stratum has a non-dominated p50/p90 point against `UST-GLOBAL-GRID`, or all apparent wins disappear after conversion/planning/launch/output costs.
- Positive-result ceiling: preliminary support for the structural hypothesis and mechanism; not proof of the paper's main performance claim.

## Q1/Q2 shape and claim ceiling

The current shape is below Q1 calibration and conditional at Q2. GeneralSparse contributes a full abstraction, cost model, code generator and end-to-end evaluation; HR-SpMM contributes new hybrid kernels and a broad matrix evaluation; TACO contributes a reusable format/compiler abstraction. The candidate can plausibly reach Q2 only if the revision freezes a genuinely distinct algorithmic property, then Stage A establishes at least one natural full-cost regime and an honest no-gain map. UST integration, a format chooser, an additive segmentation DP, or kernel-only timing supports at most an engineering note.

Maximum claim after a successful revision and Stage A: “a bounded same-object UST cover algorithm with a stated guarantee and preliminary natural full-cost advantage in preregistered heterogeneous regimes.” No generic superiority, platform generality or production claim is currently supportable.

## Stop conditions

- Current source or a primary prior exposes the complete same-information cover constructor and guarantee.
- The revision cannot identify a non-product action/guarantee beyond the finite strongest family.
- Exact row ownership or native in-place `C` semantics cannot be closed without changing the object or hiding output assembly.
- Only selected/synthetic matrices carry the effect; no preregistered natural stratum remains.
- Full-cost accounting removes every residual against the finite strong baselines.

## Dual-axis score

- Academic value: `44/70`
  - problem importance/opportunity: `11/15`
  - N1/N2/N3 clarity and nontriviality: `9/20`
  - increment over nearest work: `7/15`
  - baseline/full-cost/venue fit: `8/10`
  - falsifiability/boundary/evidence path: `9/10`
- AI executability bonus: `24/30`
  - same-object artifact/baseline: `8/10`
  - AI core implementation/comparison fraction: `7/10`
  - bounded killer/reproducibility: `9/10`
- Total: `68/100`
- AI route: `AI_CORE_CONDITIONAL`, estimated core fraction `0.65`

The score only supports spending the one revision; it does not override the unresolved N2 hard gate.

## Final decision

`REVISE_ONCE / PENDING_CONFIRMATION`.

Do not authorize Stage A or Stage B. Send this PRIMARY package to the long-lived confirmation sentry. The revision is scientific and atomic; it is not a request for implementation, GPU results or a larger corpus.
