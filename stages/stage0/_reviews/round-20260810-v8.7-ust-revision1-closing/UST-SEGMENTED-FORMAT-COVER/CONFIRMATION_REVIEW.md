# UST-SEGMENTED-FORMAT-COVER — Revision 1 Closing Confirmation

## Administrative record

- Assignment: `STAGE0-C1-20260810-UST-SEGMENTED-FORMAT-COVER-REVISION1-CLOSING-V8.7`
- Mode: independent revision-final confirmation sentry
- Topic: `UST-SEGMENTED-FORMAT-COVER`
- Decision: `CONFIRM_STOP`
- Quality tier: `BELOW_Q2_STOP`
- Terminal sentinel: `BELOW_Q2_STOP__HYBRID_ROW_PARTITION_PLUS_UST_WRAPPER_ABSORPTION`
- Confidence: `0.95`
- Revision budget: `1/1 consumed`; no second revision is available
- Stage A authorized: `false`
- Stage B authorized: `false`
- Experiments performed: `none`

## Bottom line

I independently confirm the revision PRIMARY's structural STOP. The confirmation is narrower than the claim that any finite optimization problem can be encoded as a DAG. That generic observation would not eliminate algorithmic novelty. The decisive finding is instead that, for the already frozen candidate object and action family, the strengthened finite-state layered DAG gives a legality- and full-cost-preserving representation of every admissible cover, while the sole revision names neither a candidate-only legal action nor a nontrivial lower-complexity algorithm, approximation guarantee, or formal guarantee that escapes the finite fair comparator family.

Accordingly, success of the frozen mechanism would still amount to selecting a path/cover over the same legal hybrid-format actions already exposed by current UST and subtracted hybrid sparse-format work. It does not retain an independent N2 contribution adequate for Tier B. This is a structural paper-potential failure for this candidate ID, not a readiness failure and not a claim that no future, differently specified algorithm could ever be publishable.

## Input integrity

The frozen revision package was recomputed before review.

| File | Expected SHA-256 | Recomputed | Result |
|---|---|---|---|
| `REVISION_REPORT.md` | `D8F23A865C4C2244DA4823DC96A00CCCADBECD9243D3E20EC87A4B28533524BA` | same | PASS |
| `ACTION_CATALOG_AND_NONPRODUCT_AUDIT.md` | `677950F2631330857FCFCBF9A6E2532EFB8CFE78DFDDB324CAF71408BA9B23C7` | same | PASS |
| `CLAIM_MATRIX.md` | `076843D2EB1BEF9E0EF8087AB71396E4F43E9060EE22C94E0F8111B67A9C7E62` | same | PASS |
| `handoff.yaml` | `662630C0A99E53ADB58E8532A5C79450941F88F450BEDC4EFD66DBFA0D9F5BFF` | same | PASS |
| `HASH_MANIFEST.sha256` self | `1F0824DC941AF9DA4D9D967A7972C2AC7A127A4BF40E9E66A8B19B0A63556A47` | same | PASS |

The manifest's four payload entries all match. The registry snapshot read during review lagged the authoritative frozen assignment by still showing revision PRIMARY as active; because the user supplied the accepted handoff/manifest hashes and the on-disk package matches them exactly, this is a control-plane timing lag rather than an input provenance conflict.

## Frozen same object

The closing decision applies only to the following object:

- fixed sparse matrix `A`;
- fixed dense operand sequence `B` and reuse count `R`;
- fixed `C`, `alpha`, `beta`, dtype, and execution order;
- original row order;
- at most `K` disjoint contiguous row intervals covering the selected row domain;
- exactly one legal native UST action per interval;
- pinned nvmath-python UST v1.0.0 source at commit `bb27be436099b36559bae15a307c94d76b12e902`;
- action label containing storage format, format parameters, conversion path, dispatch backend, algorithm/kernel selector, plan signature, and output mode;
- full cost including conversion, planning/JIT, retained materialization, workspace/peak memory, execution, cache/reuse effects, transitions, and cold/warm behavior.

Changing this object is not an admissible repair after revision exhaustion.

## Independent audit of the finite-state path correspondence

### Legality and coverage

For a legal cover with intervals in original row order, emit one edge per interval. The edge selects the interval and one legal catalog action. The state records the next row and number of segments used, so contiguity, non-overlap, complete coverage, and the `K` bound are preserved. Conversely, every source-to-sink path whose edges obey those guards induces exactly the ordered interval/action cover written on its edges. No additional legal cover action was identified outside this catalog.

This establishes the relevant two directions for the frozen action family; it is not merely a one-way relaxation.

### Fixed charges, reuse, and cache state

The state can finitely record materialized formats, plan signatures, compile/cache status, and reuse round. First-use conversion or plan/JIT costs are charged on the transition that first introduces the corresponding signature, while later reuse observes the recorded state. Thus plan fixed charges and reuse/cache effects are not silently converted into additive per-row weights.

### Ordinary transitions and format changes

The previous action label is part of the state. Format/backend/plan switching costs can therefore be charged on the next edge. This covers ordinary sequential transition effects within the frozen one-cover execution contract.

### Memory and peak cost

To preserve full cost rather than only additive latency, the resource state must include the live materialized-object/plan set (or an equivalent sufficient statistic), current workspace, and prefix maximum. With that explicit interpretation, each transition updates live memory and the prefix peak, and a terminal path has the same retained and peak-memory accounting as its cover. This may cause exponential state growth, but it does not leave a legality or accounting gap.

### Cold/warm and multiobjective Pareto accounting

Cold/warm phase and reuse round are finite state. Vector path labels preserve latency, conversion/planning cost, memory/peak cost, and other declared objectives; nondominated labels produce the same Pareto set as the frozen covers. The correspondence therefore does not rely on collapsing full cost to one arbitrary scalar.

### What the correspondence does not prove

The correspondence proves expressibility and fair action-space coverage, not polynomial complexity, tractability, or the absence of every possible future approximation or structural theorem. An exact layered-DAG ceiling can be exponentially large. The deployable fair baseline must therefore include an equal-budget label-setting/beam/DP implementation, with the exact solver restricted to small ceilings.

That limitation does not rescue this revision. The candidate had one atomic opportunity to name a non-product residual—such as a specific candidate-only action, a formally stated exploitable structure yielding a nontrivial algorithmic bound, or an approximation guarantee—and did not do so. The frozen proposal remains an unnamed selector over the same state/action system, so there is no independently reviewable N2 beyond the fair comparator.

## Collision and subtraction result

No source was found that is exact-identical in title and implementation to the entire candidate wrapper. The STOP is nevertheless structural after the complete finite union is applied:

- current UST supplies the native format/plan/tensor composition and execution actions;
- 1D-VBR and Yang et al. subtract contiguous or dynamic-programmed sparse blocking/partition structure;
- HR-SpMM, GeneralSparse, and RSH-SpMM subtract hybrid row/region format selection and related sparse-format specialization;
- the strengthened comparator composes those legal choices with UST's pinned native actions while preserving the candidate's full cost and finite resource state.

Adding formats, feature weights, or a larger `K` expands the catalog or cost model but does not itself introduce a new constructor. An API lacking a one-call `cover` operation is an implementation gap, not the residual.

## Audit of proposed escape routes

| Escape route | Closing classification | Reason |
|---|---|---|
| Concurrent multi-plan overlap/interference | New mechanism/object boundary | The mathematical `A·B=C` may remain unchanged, but the decision becomes a co-scheduler/resource-interference problem outside the frozen sequential cover contract. |
| Multiple covers for phases or epochs | New mechanism/object boundary | This changes the frozen single-cover decision into materialized-view/online policy selection. |
| Fused converter/assembler | Deployment/mechanism drift | Even if numerical semantics stay fixed, it changes the pinned native conversion path and becomes compiler/emitter construction. |
| Approximate formats or arithmetic | Function/guarantee drift | This changes exact numerical semantics or the declared error contract. |
| Row reordering | Frozen physical-order drift | The candidate explicitly fixes original row order; invertibility does not make it the same optimization object. |
| Custom kernels | Deployment/mechanism drift | This leaves the native UST action family and becomes kernel generation/tuning. |
| Threshold, weight, or feature tuning | Product/controller residual only | It changes parameters of the same selector/cost model, not the constructor. |

Some of these routes could motivate a future new candidate ID, but none is a legal repair of this exhausted revision and none may be used to revive the present claim.

## Structural potential versus readiness

- `STRUCTURAL_PAPER_POTENTIAL`: `BELOW_Q2_STOP`. If the frozen cover selector succeeds, its actions and full-cost objective remain expressible by the fair finite-state comparator, and the revision supplies no independent algorithmic or formal residual.
- `CURRENT_EVIDENCE_READINESS`: not the basis of STOP. No implementation, benchmark, natural positive result, or proof was demanded. The revision package is sufficient only to decide the structural boundary.
- Resource availability: not a STOP reason.
- Missing commercial hardware: not a STOP reason.
- Absence of positive performance results: not a STOP reason.

## Final disposition

`CONFIRM_STOP / BELOW_Q2_STOP` is confirmed for `UST-SEGMENTED-FORMAT-COVER` under the frozen object and exhausted revision budget. No second revision, object substitution, mechanism substitution, Stage A, or Stage B is authorized. The result does not bar a separately registered future topic with a genuinely different object and independently reviewable N2.

Lane return: `IDLE_REUSABLE_AWAITING_MAINLINE`.
