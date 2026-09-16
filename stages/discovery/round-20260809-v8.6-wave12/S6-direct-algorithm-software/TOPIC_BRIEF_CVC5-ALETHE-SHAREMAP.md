# CVC5-ALETHE-SHAREMAP — cvc5 proof-DAG 的 scope-safe Alethe named-term 构造

- Status: `PROPOSE_STAGE0`
- Fidelity status: `FINITE_FIDELITY_GAP`
- Quality tier: `TIER_B_Q2_VIABLE`
- Opportunity origins: `O7`
- Domain tags: `FORMAL_PROOFS`, `SMT`, `PROOF_SERIALIZATION`, `CPU_REPRODUCIBLE`
- Contribution route: `N2`
- Discovery date / frozen cutoff: `2026-08-09`
- Discovery method: accepted/calibrated `DISCOVERY_METHOD_V2_V8_1` plus v8.6 `FIDELITY_CLOSURE_PLAN`; blocked two-axis `v8.2r2` was not used.

## Research question

For a fixed UNSAT SMT-LIB theorem whose cvc5 proof DAG is already available, can a scope-safe, cost-bounded construction choose and emit Alethe named-term bindings so that the **same cvc5 theorem and proof rules** are accepted by an Alethe checker, while improving proof bytes and end-to-end proof-output/checking cost over cvc5's current no-term-sharing Alethe emitter?

## Paper genealogy and subtractors

- Deployment anchor: cvc5's official [Alethe output documentation](https://cvc5.github.io/docs/cvc5-1.1.2/proofs/output_alethe.html) requires `dag-thresh=0` because cvc5 does not yet support printing Alethe proofs with term sharing. Current [ProofFormat API](https://cvc5.github.io/docs/cvc5-1.3.2/api/java/io/github/cvc5/modes/ProofFormat.html) still lists Alethe and CPC output.
- Current alternative proof path: cvc5's upstream [NEWS](https://github.com/cvc5/cvc5/blob/main/NEWS.md) identifies CPC as default and documents CPC/Ethos compatibility, including current Ethos 0.2.2 checking for cvc5 1.3.2 proofs. CPC/Ethos is a same-theorem verification comparator but not an Alethe-byte baseline.
- Format and direct subtractor: the official [Alethe specification](https://verit.loria.fr/alethe.pdf) supports SMT-LIB `:named` annotations for term sharing and documents veriT's `--proof-with-sharing`. The candidate cannot claim named annotations, Alethe sharing, or generic proof compression.
- Checker/subtractor: official [Carcara](https://github.com/ufmg-smite/carcara) is an Alethe proof checker/elaborator and checks a proof file against its original SMT-LIB problem. Its TACAS 2023 paper is its closest checker calibration, not the candidate's contribution.
- Natural carrier: the official [SMT-COMP 2025](https://smt-comp.github.io/2025/) benchmark ecosystem / SMT-LIB formulas, restricted at Stage A to cvc5-supported Alethe UNSAT logics (initially QF_UF and selected linear arithmetic) that yield a baseline proof and checker acceptance.
- Search boundary: original papers and official/upstream documents/source through 2026-08-09. Queries covered cvc5 Alethe term sharing, `dag-thresh`, CPC/Ethos, Alethe sharing, Carcara and SMT-COMP. No cvc5-specific algorithm that constructs named-term sharing from its proof DAG was located. This is `SEARCH_BOUNDED_OPEN`, not priority or firstness.

## Exact object and theorem/proof/checker guarantee

The frozen object is a **cvc5-generated Alethe refutation trace for a fixed UNSAT SMT-LIB input**, initially in logics that the upstream cvc5 Alethe path explicitly supports. Same function/quality means: identical original assertions and UNSAT theorem; identical cvc5 proof-rule meaning after full expansion of every named term; no dropped or strengthened assertion; and acceptance by the same Alethe checking contract against the original `.smt2` input. The first fidelity target is `carcara check proof.alethe theorem.smt2`; CPC/Ethos is separately retained as a theorem-level cross-check where applicable. It is not generic SMT solving, a new proof rule/checker, proof elaboration UI, external format conversion, or a different solver's trace.

## Strongest deployable same-information action union

| Facet | Frozen union |
|---|---|
| Information | Original SMT-LIB theorem, cvc5 native proof DAG/proof objects, rule labels/premises/conclusions, current Alethe grammar and checker version |
| Actions | cvc5's current no-sharing Alethe emission (`dag-thresh=0`); normal cvc5 proof output options; CPC emission/Ethos checking as theorem-level comparator; Alethe/veriT sharing and Carcara checking as external direct subtractors |
| Guarantees | Original theorem refutation, existing cvc5 proof rules, standard Alethe syntax, native checker acceptance; no new axioms/rules/solver result |
| Full cost | cvc5 solve/proof generation, DAG analysis, binding selection, serialization, bytes, Carcara parse/check CPU/RSS, optional CPC/Ethos check; failures/timeouts all count |

The union deliberately includes a no-sharing cvc5 baseline and an existing sharing-capable Alethe producer. A result cannot compare only bytes against cvc5 or treat a different solver theorem/proof as an equal-quality winner.

## Action-gap certificate (structural hypothesis, not a proven result)

1. cvc5's official Alethe documentation requires `dag-thresh=0` specifically because its emitter does not support term-sharing printing. Therefore the current cvc5 Alethe emitter's action interface contains direct term printing but not a mapping from repeated proof-DAG subterms to scoped `:named` references.
2. Alethe itself already permits named annotations and veriT already has `--proof-with-sharing`; those are direct subtractors. The residual is **not** the format action. It is the cvc5-specific full constructor `M: native proof-DAG occurrences → legal named bindings/reference locations`, chosen under scope, rule-serialization and checker-cost constraints.
3. `M` must preserve every expanded term byte/AST meaning and must be compared against all union members. If cvc5's current source or a direct paper already implements an equivalent scope-safe mapping, this candidate is `DIRECT_ABSORPTION` and stops.

## Mechanism hypothesis

Build occurrence signatures over cvc5's proof DAG, compute legal Alethe binding regions using a dominator/scope index, then solve a bounded benefit problem that chooses a named binding only when repeated serialized expansion exceeds binding/reference bytes plus checker parse cost. Emit definitions before all uses, retain the exact cvc5 proof step order/rules, and forbid cross-scope substitutions. This is a direct N2 construction/data structure; it is neither an adjacent local rewrite nor a wrapper around a proof file.

## Competing mechanisms

- Mechanism A — dominator-constrained share map: globally select repeated terms with a costed legal common scope. Prediction: benefits large repeated normal forms across many proof steps; loses where occurrence scopes do not intersect.
- Mechanism B — threshold-only local naming: name only syntactically repeated terms in each individual step. This is a deliberately weaker same-emitter control, not the paper mechanism.
- Mechanism C — current cvc5 no-sharing Alethe emitter (`dag-thresh=0`).
- External direct subtractor — veriT Alethe `--proof-with-sharing`, assessed only on shared natural SMT-LIB theorem families and without treating different solver proof rules as a cvc5 same-information replacement.

## Candidate claim

For a characterized subset of natural SMT-COMP/SMT-LIB UNSAT formulas, cvc5 proof-DAG-aware named-term construction can preserve the original Alethe theorem/checker contract while yielding a non-dominated end-to-end proof serialization/checking point relative to cvc5 no-sharing emission and the frozen union. No universal proof compression or solver-speed claim is made.

## Full-cost and no-gain boundary

- Same function: theorem, assertions, UNSAT result, cvc5 proof rules, and checker verdict are unchanged.
- Full denominator: solve/proof generation, DAG indexing, binding optimization, emitted bytes, serialization CPU/RSS, checker parse/check CPU/RSS, disk I/O and timeout/unsupported outcomes.
- No-gain region: small proofs; DAGs whose repeated terms have no shared legal scope; terms shorter than definition/reference overhead; checker parsers whose name expansion dominates; unsupported Alethe logics.
- Not tuning: `dag-thresh`, proof granularity, solver flags, checker choice or a string-level compressor are baseline conditions/negative controls, not the new action.

## FIDELITY_CLOSURE_PLAN

`FINITE_FIDELITY_GAP` — no current result is needed, but the following bounded plan must close before claim-bearing Stage A observation:

1. Pin cvc5, Alethe grammar/spec revision and Carcara commit; select 10 public natural QF_UF/LIA UNSAT formulas on which current cvc5 emits baseline Alethe and `carcara check` succeeds.
2. Create a hand-written minimal named-term witness using only the standard Alethe sharing syntax. Verify it against the identical source theorem with Carcara; also parse/inspect expanded AST equality with the no-sharing proof. If any grammar/checker rejection prevents a legal same-contract representation, terminate `STRUCTURALLY_UNCLOSABLE` for this formulation.
3. Implement the complete mapping `M` in cvc5's Alethe emitter, not a post-processing wrapper. For every emitted binding, record its defining occurrence, all uses, lexical scope and expansion hash; reject any dangling/cross-scope map before checking.
4. Re-run the same theorem through native cvc5 output and Carcara, then independently retain CPC/Ethos acceptance when the cvc5 logic/output permits it. Account for all construction and checking cost under one run contract.

This plan uses public CPU artifacts and has a finite interface/semantic closure test. It neither assumes that Carcara accepts the representation nor treats a manually installed alternate checker as completed evidence.

## Finite Stage A killer

Freeze 60 public SMT-COMP/SMT-LIB UNSAT instances in supported Alethe logics, stratified by baseline proof size, after the 10-instance fidelity witness passes. Stop the mechanism if any condition occurs: (a) named-term witness or any candidate output fails same-theorem Carcara acceptance/expanded-AST equivalence; (b) fewer than 10% of eligible proofs contain a legal repeated-term action outside cvc5 no-sharing output; (c) on the predeclared p50 and p90 full ledger, A has no non-dominated point in bytes, cvc5 proof-output CPU/RSS and Carcara check CPU/RSS against C and the applicable union; or (d) mapping/index construction absorbs the apparent byte saving. Unsupported logics are reported separately and cannot be silently removed after results.

## Structural potential and evidence readiness

- Structural paper potential: `TIER_B_Q2_VIABLE` conditional on a genuine cvc5-native construction, format/checker closure, natural SMT proof corpus, full-cost Pareto result and a sharp no-gain characterization.
- Current evidence readiness: `FINITE_FIDELITY_GAP`. The exact standard supports sharing and a public checker/corpus exists, but cvc5-native named output and its acceptance have not been implemented or witnessed in this assignment.
- Why it is not Tier A now: Alethe sharing and veriT support are substantial direct subtractors; the residual is narrow and Stage 0 must independently prove that cvc5's native construction is not an implementation-only duplicate.

## Non-relaxable audit

- Same object: fixed cvc5 theorem/proof DAG to same Alethe refutation and original theorem checker contract.
- Collision honesty: generic Alethe sharing/veriT is subtracted; cvc5-specific residual remains `SEARCH_BOUNDED_OPEN`.
- Fair baseline: full union, including no-sharing cvc5 and external sharing-capable Alethe producer where theorem/logic match.
- Natural evidence: public SMT-COMP/SMT-LIB instances, not synthetic repeated-term proof trees.
- Reproducibility: pinned public commits/instances, output/expansion hashes and checker commands are mandated at Stage A.
- Claim ceiling: no implementation, proof, benchmark, checker run or result was produced by Discovery.
