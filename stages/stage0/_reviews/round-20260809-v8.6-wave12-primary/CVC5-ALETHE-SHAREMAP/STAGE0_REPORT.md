# Stage 0 PRIMARY report — CVC5-ALETHE-SHAREMAP

## Administrative record

- Assignment: `STAGE0-P1-20260809-CVC5-ALETHE-SHAREMAP-PRIMARY-V8.6`
- Role: `PRIMARY`
- Review cutoff: `2026-08-09`
- Decision: `REVISE_ONCE`
- Provisional quality tier: `TIER_B_Q2_VIABLE` **only if the atomic revision below survives**
- Structural paper potential: `CONDITIONAL_TIER_B_Q2_VIABLE`
- Current evidence readiness: `CURRENT_SOURCE_COLLISION_INVALIDATES_FROZEN_BASELINE`
- Confirmation: `PENDING_LONG_LIVED_CONFIRMATION_SENTRY`
- Stage A / Stage B authorization: `false / false`
- Confidence: `0.94` for the collision finding; `0.78` for `REVISE_ONCE` rather than immediate STOP

The Discovery recommendation and score were not inherited. No experiment was run and no result is inferred from absence of an implementation.

## Outcome first

The frozen proposal cannot pass as written. Its central premise—current cvc5 Alethe output is a no-term-sharing emitter requiring `--dag-thresh=0`—is stale. Current upstream cvc5 has a native Alethe let-binding path. The printer traverses converted proof conclusions and arguments, uses `dag-thresh` to select repeated terms, invokes `AletheLetBinding::letify`, and emits converted `@p_` names. Current official documentation shows the resulting `:named @p_*` Alethe output. This is the same deployment object and absorbs the proposal's claimed missing action `native cvc5 proof terms -> Alethe named bindings`.

This is not yet a proof that every stronger costed scope-aware selection algorithm is scientifically empty. The frozen Mechanism A also proposes a dominator/scope index and an end-to-end cost objective, whereas the inspected current printer visibly exposes a threshold-driven letification path. A single material revision is therefore warranted to replace the false no-sharing baseline with the current native letifier and demonstrate a non-tuning algorithmic residual. Failure to establish that residual is terminal `BELOW_Q2_STOP`; merely outperforming one `dag-thresh` setting is not enough.

## Exact object and contract

The same-object formulation is coherent after correction:

- Input: one fixed UNSAT SMT-LIB theorem in a logic supported by the pinned cvc5 Alethe exporter.
- Native object: the converted cvc5 Alethe proof terms, step order, premises and rules produced from the same internal proof.
- Action: choose legal Alethe named-term definitions and references without changing the proof rules or theorem.
- Output contract: a cvc5-emitted Alethe refutation accepted by the pinned Carcara checker against the identical `.smt2` input; expansion of every name must reproduce the baseline term AST.
- Cost: output bytes, native selection/serialization CPU and peak RSS, Carcara parse/check CPU and peak RSS, I/O, failures and timeouts. Solve/proof generation is retained in the ledger even when common across variants.

The proposal must not conflate the proof-node DAG (whose nodes/step premises cvc5 already reuses) with repeated term sub-DAGs inside converted Alethe conclusions and rule arguments. The candidate acts on the latter.

## Decisive current-source collision

The frozen brief used cvc5 1.1.2 documentation as if it described the current emitter. That page did require `--dag-thresh=0` because term-sharing output was not supported then. It is a historical boundary, not a current baseline.

Current upstream evidence changes all three relevant facts:

1. `src/proof/alethe/alethe_printer.cpp` constructs `d_lbind` from the printer `dagThresh` option and traverses assumptions, scope arguments, converted step conclusions and rule arguments before calling `letify`.
2. The same printer disables ordinary SMT-LIB `let` insertion inside `printTerm`, explicitly because names are managed by `AletheLetBinding`, then calls `d_lbind.convert(..., "@p_")`.
3. Current cvc5 Alethe documentation displays an emitted proof containing nested `(! term :named @p_N)` definitions and later `@p_N` references without the old `--dag-thresh=0` requirement.

This is an exact current-source collision with the proposal's stated missing constructor and its Baseline C. The Alethe specification and veriT's `--proof-with-sharing` remain earlier format/method subtractors, but they are no longer the only sharing implementations.

The inspected evidence does **not** establish that cvc5 already solves a full bytes-plus-checker-cost optimization or a dominator-constrained optimum. That narrower residual is `SEARCH_BOUNDED_OPEN`, not a positive novelty finding.

## Structural paper potential versus readiness

### Structural paper potential

Conditional `TIER_B_Q2_VIABLE` is defensible only for a corrected N2 paper core:

> Against pinned current cvc5 native Alethe letification, construct a scope-safe, costed selector with a stated algorithmic guarantee or nontrivial structural characterization, and obtain same-theorem/checker-valid non-dominated full-cost points on natural proofs.

This could form a credible formal-methods/tool paper if the contribution is an algorithm and analysis over the current native action space, not an emitter patch or a parameter sweep. A Q1-equivalent shape would additionally require a reusable scope/cost abstraction, broad natural proof coverage, strong theorem/complexity/approximation content, or a stable cross-logic law. Present material supports at most conditional Tier B.

### Current evidence readiness

Readiness is low because the frozen comparator and action-gap certificate are wrong, not because an implementation or benchmark result is absent. Public CPU-only upstream artifacts, Carcara, and SMT-COMP/SMT-LIB corpora give a finite reproducibility path. The Git transport failure observed in this review was an environment credential/TLS failure and carries no scientific inference.

## N1 / N2 / N3 assessment

- `N1`: not supported. Alethe named sharing, cvc5 native named output, and sharing-capable veriT already exist.
- `N2`: conditionally open only for an algorithm materially stronger than the pinned current threshold letifier: explicit legal-region model, non-product selection objective, and a guarantee or structural result that cannot be reproduced by a finite `dag-thresh` grid.
- `N3`: not established. A natural no-gain/gain characterization may become supporting evidence, but no law is currently known.

If the revision reduces the mechanism to selecting `dag-thresh`, changing printing heuristics, or wrapping an emitted proof, no N1/N2/N3 remains and the result is `BELOW_Q2_STOP`.

## Fair comparator roles

1. **Pinned current cvc5 native Alethe letifier, finite legal `dag-thresh` grid** — mandatory same-object strongest baseline. It uses the same theorem, same cvc5 proof, same Alethe grammar, same checker and same information.
2. **Pinned current cvc5 with sharing disabled** — ablation/negative control only, not the strongest baseline.
3. **Candidate costed scope-aware native selector** — must modify the same cvc5 emitter path and preserve the same proof/checker contract.
4. **veriT `--proof-with-sharing`** — direct method/deployment subtractor and theorem-level external reference. It is not an equal-quality same-proof baseline because solver proof rules and proof DAG differ.
5. **CPC/Ethos** — same-theorem cross-format deployment reference and independent cvc5 proof-path sanity check; it is not an Alethe byte baseline.
6. **Carcara** — checker/oracle and cost consumer, not a competing construction algorithm.

The candidate must not form a universal union by taking the best incomparable metric from different proof formats or solvers.

## Atomic revision gate

Revision budget: `1/1 available`; this review recommends consuming it only for the following single proposition.

### Proposition

`CURRENT_NATIVE_LETIFIER_RESIDUAL`:

> For one pinned current cvc5/Alethe/Carcara contract, the proposed native scope-and-cost selector exposes a legal selection action or guarantee not expressible by the current `AletheLetBinding` plus any preregistered finite `dag-thresh` setting, while preserving exact expanded proof terms and admitting a finite natural-corpus full-cost test.

### Required atomic submission

- Pin a current cvc5 commit or release containing `alethe_let_binding.*` and the inspected printer, plus Alethe grammar/spec and Carcara commits.
- Replace the no-sharing baseline with the current native letifier and document its exact legal regions, selection rule and binder/subproof behavior from source.
- Give a minimal same-proof witness where two current legal threshold settings cannot reproduce the candidate decision under the declared cost objective; specify the proof obligation or algorithmic guarantee.
- Update the fidelity plan and 60-instance killer so the candidate is compared against the full current native `dag-thresh` grid under the same theorem/checker and full ledger.

This is one gate: whether a non-tuning algorithmic residual exists beyond current native letification. These artifacts are components of one falsifiable certificate, not multiple revisions.

### Revision failure conditions

Recommend `BELOW_Q2_STOP` if any holds:

- current `AletheLetBinding` already implements the proposed legal-region and selection action;
- the only difference is a threshold, flag, local byte heuristic, or postprocessor;
- the witness changes proof rules, Alethe/checker contract, theorem, or solver trace;
- no finite same-object comparison against current native sharing can be defined;
- success would still yield only an emitter-engineering improvement without an N2 guarantee/structure and natural full-cost evaluation.

## Fidelity closure plan audit

The original closure path is public, CPU-feasible and bounded, but it is stale at step zero. A corrected pre-claim closure plan must:

1. pin the current native-sharing cvc5 baseline rather than reconstruct a capability already present;
2. use 10 public baseline-checkable UNSAT instances plus a small handwritten scope/binder witness;
3. compare native current-sharing, disabled-sharing and candidate outputs under identical theorem, proof-rule expansion and Carcara contract;
4. record expanded-term AST hashes, definition/use/scope ledgers and fail closed on dangling or cross-scope references;
5. verify the candidate is in the native emitter path and account for analysis/selection cost.

This plan can close before the first claim-bearing Stage A observation. No Stage A work is authorized by this report.

## Finite Stage A killer after revision and confirmation

If the revision and confirmation both pass, freeze 60 public UNSAT instances from supported Alethe logics, with hashes and an inclusion rule defined before results. Use all baseline-checkable instances as the denominator; report unsupported/timeout cases without post hoc removal.

Stop if:

- any candidate proof fails Carcara or expanded-term equality;
- fewer than 10% of the 60 instances expose an action not reproduced by the current native finite threshold grid;
- candidate p50 or p90 has no non-dominated point in proof bytes, output CPU/RSS and Carcara CPU/RSS against the current native union;
- candidate analysis/selection consumes the apparent savings;
- advantages require changing theorem, proof rules, checker, output grammar, logic set or proof-production options.

This is an executable future falsification route, not present evidence of success.

## Academic shape and claim ceiling

The strongest honest present claim is:

> Current cvc5 already performs native Alethe named-term letification, invalidating the proposed no-sharing baseline. A narrower costed-selector residual may remain but must be materially refrozen and independently confirmed.

No claim is allowed about compression ratios, checker speed, natural action frequency, optimality, or firstness. The provisional ceiling is a Tier B tool/algorithm paper only after the revision establishes a real current-baseline residual. Q1 potential is not presently supported.

## Score (fresh Stage 0 estimate)

### Academic 70

- problem importance and natural carrier: `8/10`
- exact object and same-function guarantee: `8/10`
- novelty after current-source subtraction: `4/15`
- mechanism/theory depth: `7/15`
- fair evaluation and full-cost design: `8/10`
- reproducibility/falsifiability: `8/10`

Academic subtotal: `43/70` before revision. Conditional successful revision estimate: `50–55/70`.

### AI 30

- public CPU implementation and checker path: `9/10`
- AI core-work fraction: `8/10` (`~0.75`, source analysis, algorithm, integration, harness, proof ledgers)
- verification/iteration tractability: `8/10`

AI subtotal: `25/30`.

The combined pre-revision score is `68/100`; it does not override the baseline-collision hard gate.

## Final decision

`REVISE_ONCE / PENDING_LONG_LIVED_CONFIRMATION_SENTRY`

Reason: a decisive same-object current-source collision invalidates the frozen action gap and strongest baseline, but the already-declared costed scope-selection mechanism may retain a narrower non-tuning N2 residual. Only the atomic current-native-letifier residual certificate may be revised. Stage A and Stage B remain closed.
