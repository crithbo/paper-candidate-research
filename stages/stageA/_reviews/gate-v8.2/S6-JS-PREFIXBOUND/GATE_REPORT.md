# Independent Stage A Gate Report — S6-JS-PREFIXBOUND

## Decision

- decision: `REVISE_ONCE`
- structural quality tier: `TIER_A_Q1_POTENTIAL` (conditional; separate from current readiness)
- current Stage A evidence readiness: `REPRODUCIBLE_ARTIFACT_WITH_CONTRACT_AND_COST_LEDGER_DEFECT`
- confidence: `0.97`
- evidence ceiling: `HASH_AND_STRUCTURE_VERIFIED`; finite exact-model implementation sanity check only
- venue family: `SIGMOD/PACMMOD`, `VLDB/PVLDB`, `ICDE`; `PODS` only after theorem depth exists
- Stage B recommendation now: `NOT_ELIGIBLE`
- `stageb_user_approval_id`: `null`

## Executive finding

The package contains real finite research rather than a fabricated proxy performance result. It implements a connected bushy merge-join join+sort problem, enumerates exact order states, produces a concrete counterexample to the weak final-`Omega` prefix, and preserves the finite optimum when grouping by a future-demand cost vector. JOB 4a is correctly limited to a natural-structure check.

PASS is nevertheless unavailable. The executable NDV function does not implement the formulas frozen in `EXPERIMENT_CONTRACT.yaml`. More importantly for the proposed mechanism, the reported signature-construction count omits the calls made for every quotient transition, while the combined runtime/RAM total does not separate the exact control from quotient, signature, bound and audit work. The observed 3.63% state-class and 0.38% transition reductions therefore do not show that any residual survives the full-vector signature's own cost.

This is a bounded same-object Stage A defect suitable for one atomic correction. It is not evidence that the unbounded theorem or a compact signature is impossible, so `STOP` is premature. The required work is public-CPU and AI-executable, so `HUMAN_RESEARCH_RESERVE` is not indicated.

## Claim and novelty-route consistency

The frozen research question remains the DPomega-level exact merge-join JS object: fixed query graph/statistics, connected bushy plan space without Cartesian products, legal merge-key permutations, partial-sort cost, final `Omega`, and identical optimum. The implementation is best described as an independent finite exact encoding of that object, not as a DPomega code reproduction.

The N2 route is still structurally plausible: a compact, provably safe future-demand quotient plus a useful admissible bound could be a nontrivial exact optimizer algorithm. The current full-vector signature is a semantic cost fingerprint. Since its components are the very next-action costs used in the counterexample check, equality makes zero first-action counterexamples largely definitional. The meaningful residual is therefore compactness and costed search reduction, not the raw zero count.

## Baseline fairness audit

| Baseline/control | Current status | Finding |
|---|---|---|
| Exact order-state DP | Executed in the same Python model | Valid finite exact ceiling, subject to the same unintended NDV profile |
| DPomega paper algorithm | Authoritative definition only | Correctly not claimed as reproduced; executable fidelity remains later hard gate |
| Naive final-`Omega` prefix | Executed ablation | Genuinely falsified; useful negative result |
| Order-free completion | Executed exact relaxation/oracle | Supports finite admissibility but is too expensive to establish useful online bound |

Full-system DPomega/Haffner/DPconv execution is not required merely to decide finite correctness at Stage A. But the minimal fair control must include separate exact-vs-quotient time/RAM/work accounting under identical inputs; the current combined run cannot answer absorption.

## Decisive Stage A premise/probe audit

### Future-equivalence

No finite optimum mismatch is reported. This verifies implementation consistency for the executed model. The `0` candidate continuation counterexamples are weaker evidence because the signature directly stores every compared demand cost. The `69,920` formal and six JOB witnesses against the naive signature are the stronger risk-bearing negative result.

### Bound admissibility

Zero overestimates over `404,479` reported checks is finite `NOT_FALSIFIED` evidence. The bound is never used by `quotient_dp` to prune or order exploration, so it has no measured state/transition/time residual. Its construction uses an exact completion oracle and cannot be promoted to a cheap heuristic.

### Frozen execution fidelity

The contract fixes simple attribute-specific NDV formulas. The code substitutes a SHA-256-derived formula. Both are deterministic, but only one was preregistered. Consequently, the exact result is not the result of the frozen formal family and cannot satisfy a PASS reproducibility gate.

## Workload and orthogonal-validation sufficiency

JOB 4a supplies a genuine five-relation SQL join graph and equality classes. With proxy cardinalities/NDVs, its `29 -> 24` states and `44 -> 41` transitions are legitimate orthogonal natural-structure evidence. They are not natural cost, optimizer performance, or DBMS evidence, and the package does not present them as such. This treatment is acceptable for Stage A.

## Cost, ablation and failure-mode audit

- formal state reduction: `3.634565%`;
- formal transition reduction: `0.383133%`;
- zero state reduction: `10,036 / 19,440` instances;
- positive state reduction: `9,404 / 19,440` instances;
- reported signature constructions: `404,450`, but this counter excludes the quotient transition path;
- reported quotient transitions alone: `873,620`, each invoking `signature(...)` in the submitted code;
- exact and quotient timing/RAM are not separated.

The broad no-gain region is honest and is not itself a STOP trigger. It makes full-cost non-vacuity decisive. Raw class count cannot stand in for retained memory because a full future-demand vector is materially larger than an order tuple.

The candidate's controlled replay matches after normalization, but `validate_results.py` removes the entire `full_cost` object, including nonvolatile GPU/network booleans, while the report says only three volatile fields were ignored. This limits the reviewer label to `HASH_AND_STRUCTURE_VERIFIED`.

## Latest-collision audit

DPomega remains the direct same-object subtractor; Haffner–Dittrich and DPconv are plain-join algorithmic subtractors; Luo et al. is a different acyclic/Yannakakis object. Independently added Simmen–Shekita–Malkemus raises the historical prior-art bar for generic order-property optimization. No verified paper was found that supplies the same DPomega-object future-demand quotient plus the proposed bound and cost residual. Status remains `SEARCH_BOUNDED_OPEN_WITH_DIRECT_SUBTRACT`, not a global novelty conclusion.

## Independent Q1/Q2 recalibration

- candidate comparator audit: bibliographic set is credible and roles are mostly correct;
- independently added paper: Simmen, Shekita, Malkemus, SIGMOD 1996, DOI `10.1145/233269.233320`;
- editor/venue-fit view: exact JS optimizer algorithms fit the named venues, but a full cost-vector relabeling without economic residual is below their contribution bar;
- methodology view: finite enumeration is explicit, but preregistration fidelity and comparative cost accounting fail;
- domain-contribution view: the safe compact quotient could be new; generic physical-order equivalence is established prior art;
- devil's-advocate view: the current signature can spend more work describing equivalence than the 0.38% transition saving eliminates;
- status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP` structurally, `NOT_READY_FOR_STAGEA_PASS` evidentially.

The unbounded theorem, DPomega executable fidelity, natural cardinalities, DBMS integration and broad workload statistics are core paper gaps but may remain Stage B work. Their absence is not the reason for this decision.

## Q1/Q2 sufficiency judgment

- clear problem: `YES`;
- non-trivial potential contribution: `YES_CONDITIONAL_ON_COMPACT_COSTED_RESIDUAL`;
- credible current evidence: `PARTIAL`; exact-model sanity check and negative ablation survive, frozen cost profile does not;
- executable formal/experiment gap: `YES`;
- reviewer-recognizable paper narrative: `YES_CONDITIONAL`;
- current minimum continuation tier: structural `TIER_A_Q1_POTENTIAL`, not an evidence PASS.

## Non-relaxable quality audit

| Gate | Status | Disposition |
|---|---|---|
| Same object | `FINITE_RESTRICTION_PLAUSIBLE__CONTRACT_PROFILE_DEVIATION` | Atomic revision |
| Latest collision | `SEARCH_BOUNDED_OPEN_WITH_DIRECT_SUBTRACT` | Continue through Stage B |
| Strong fair baselines | `EXACT_CONTROL_PRESENT__COMPARATIVE_COST_MISSING` | Atomic revision locally; DPomega later |
| Natural input/evidence | `JOB_STRUCTURE_ONLY_CORRECTLY_LABELED` | Accept for Stage A ceiling |
| Full cost | `OPEN_MISCOUNTED_SIGNATURE_WORK` | Atomic revision |
| Failure region | `HONEST_AND_BROAD` | Pass |
| Reproducibility | `HASH_AND_STRUCTURE_VERIFIED` | Correct contract and validator scope |
| Evidence/claim honesty | `MOSTLY_HONEST_WITH_OVERSTATED_FULL_COST_COUNT` | Revise; no dishonesty finding |
| AI executability | `SUPPORTED` | No reserve |

## Claim ceiling

Currently supported:

- the naive final-`Omega` prefix signature is unsafe on the executed finite model;
- the submitted full future-cost vector preserves the optimum on the executed, non-preregistered deterministic cost profile;
- the proposed max bound was not observed to overestimate in that finite run;
- a natural JOB graph contains some structural quotient opportunity under proxy costs.

Not supported:

- results for the frozen NDV family;
- a compact or minimal signature theorem;
- a useful/pruning bound;
- positive time or retained-memory residual after signature construction;
- DPomega executable fidelity;
- natural-cardinality, DBMS, optimizer-speed or unbounded claims.

## Single permitted revision gate

`CONTRACT_FAITHFUL_COSTED_NONVACUITY_GATE`

On the unchanged exact JS object and existing finite workload, freeze and execute the intended NDV formulas; separately account exact control, quotient, every signature vector operation, retained bytes and bound work; and demonstrate at identical optimum at least one predeclared positive local residual after the signature's own cost. A compact representation may be used only as the remaining same-mechanism pivot and must implement the identical equivalence relation.

- If the corrected, fully costed finite probe retains a nonempty residual, it may return for one independent gate re-review.
- If the full vector is absorbed and no bounded compact same-mechanism representation survives, recommend `STOP`.
- Do not turn this revision into an unbounded proof, DPomega system reproduction, DBMS integration or Stage B campaign.
- Mainline must confirm that a Stage A revision/pivot allowance is available; the Stage 0 revision is already recorded as consumed.

## Finite Stage B route retained, not authorized

After—and only after—the atomic Stage A gate closes positively, the remaining route is finite: prove unbounded equivalence/admissibility; derive compact signature and cheap bound; build an algorithm-level DPomega-faithful control; evaluate JOB/TPC-DS/SYN-S with real statistics; report exact optimum, optimizer time/RAM, signature/bound/queue cost, topology ablations and all no-gain regions; and close the latest collision search.

This report does not recommend `PENDING_USER_STAGEB_REVIEW` now. Even a future PASS may only recommend that state. Stage B remains forbidden until the user reviews the topic-specific packet and mainline records an explicit non-null `stageb_user_approval_id`.
