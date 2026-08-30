# CASE-A — blind executor record

Assignment: `BACKTEST-EXECUTOR-L1-20260814-RQ-REFINEMENT-STAGED-EVIDENCE-V1`  
Cutoff: `2018-05-20`  
Final decision: **PROPOSE_STAGE0**

## 1. Non-evidence seed pool and convergence

| Seed | Engine / perspective | Conclusion-first test (not evidence) | Convergence |
|---|---|---|---|
| A-S1 | Constraint manipulation / compiler-backend engineer | If portable primitive selection charged tuning and conversion cost, it could change which implementation is preferable without changing tensor semantics. | Retain; shares one carrier and cost tension. |
| A-S2 | Problem reframing / operator | The decision may be a reproducible implementation-plan construction problem, not a request to pick a vendor library. | Merge with A-S1. |
| A-S3 | Janusian tension / maintainer | A locally fast primitive can be globally worse after layout conversion, workspace, and tuning time are charged. | Retain as falsifier pressure. |
| A-S4 | Abstraction ladder / hardware architect | A target description can expose a finite, legal primitive-plan space for a fixed graph segment. | Retain as finite-closure route. |

Coverage advisory: `PASS` (four engines; compiler/backend, operator, maintainer, and hardware perspectives). The cluster is `portable primitive-plan construction`; no seed claims absence, novelty, or quality.

## 2. RQ candidates frozen before evidence disposition

All versions preserve: a fixed deep-learning graph segment, identical tensor semantics/quality, a specified target, and charged primitive, layout, workspace, compilation/search, and tuning costs.

| Version | Same-object RQ |
|---|---|
| A-RQ1 | For a fixed graph segment and target description, can a finite legality-aware primitive-plan search choose implementations that improve end-to-end charged cost over a fixed default plan? |
| A-RQ2 | Under the same graph and target, does explicitly charging layout conversion and workspace change the non-dominated portable primitive plan? |
| A-RQ3 | Can a cost model predict a portable primitive plan’s end-to-end cost without changing graph outputs or permitting uncharged tuning? |

Selected: **A-RQ2**, because it is one answerable decision with an explicit same-object counterfactual. FINER-lite: feasible `CONDITIONAL` (finite graph/tensor/target witness); interesting `CLEAR` (operator and maintainer decision); novelty threat `HIGH` (must inspect strongest compiler/primitive competitor); ethical/scope `PASS`; relevant `CLEAR`. This is scheduling information only, not a score or novelty result. Primary route: supplied E01–E03. Transport-only fallback: a versioned public primitive/graph specification identified later by Stage 0; no result-aware RQ reformulation is allowed.

## 3. Evidence locators and Question Card raw audit

| Locator | Local supplied material | Limited fact used |
|---|---|---|
| A-L1 | `sources/E01.pdf`, abstract and opening section | Efficient low-level primitives have target-specific implementation and memory consequences. |
| A-L2 | `sources/E02.pdf`, abstract and opening section | A heterogeneous framework combines symbolic and imperative execution and supports different execution models. |
| A-L3 | `sources/E03.pdf`, abstract and opening section | A graph carrier can map computation to heterogeneous hardware while retaining graph semantics. |

**Question Card — RAW_REQUIRED.** Exact public identity: the three supplied, dated public sources E01–E03, cutoff `2018-05-20`; carrier: `IMPLEMENTATION_CARRIER_ONLY`; exact object: the same graph segment’s legal low-level primitive implementation plan; endpoint: `target-native action`; contribution: `COMPILER_TOOL / N2`. The counterfactual is whether the portable plan changes once conversions/workspace/tuning are charged. The non-generic discriminator is construction of legal primitive/layout choices under a fixed graph contract, rather than an API wrapper, backend selector, or parameter choice. A versioned source locus is E01’s primitive interface/accounting context, read against E02/E03 graph carriers. Known direct fatal at this locus: `NONE_FOUND_WITHIN_BOUND`; the strongest skeptic is that an existing primitive library or graph framework already makes the same full-cost decision. Initial full-cost boundary: primitive runtime, conversion, workspace, compilation/search, and tuning/reuse cost.

Minimum falsifier: a two-operation graph whose legal plans either have identical charged cost to the direct primitive default or require semantic change. Finite closure: enumerate the fixed witness’s legal primitives/layout conversions, verify output equivalence, and ledger every charged cost. Stop/narrow if the strongest direct comparator already constructs the identical plan under the same ledger.

**Bounded closure debt.** `OPEN_BOUNDED`, owner `STAGE0`, maximum questions: (1) which default and non-default primitive paths exist at the frozen source locus; (2) whether the strongest public subtractor already globally charges conversion/workspace/tuning; (3) whether a versioned public graph witness exposes all required legality fields. Route: inspect those three public, versioned handles; failure: `LOCATOR_ONLY`/narrowed claim, not a rewritten object. Complete union, genealogy, full witness, and full cost protocol remain debt; claim ceiling is “RQ/Stage-0 screening only.” Source closure queue: `NOT_NEEDED` because supplied local sources give an identity and locus.

Front-end disposition: `EVIDENCE_QUALIFIED_RAW`; RQ audit `RQ_COMPLETE`; RAW_REQUIRED audit `COMPLETE`; eligible for C0 `YES`. This supports a conditional Stage 0 handoff only. Independent Stage 0 must reconstruct current union, direct collision, full-cost comparator, and Q2 shape; this executor does none of those final determinations.
