# Current Native Family and Action-Space Audit

- Candidate: `CVC5-ALETHE-SHAREMAP`
- Gate: `CURRENT_NATIVE_LETIFIER_RESIDUAL__BEHAVIORALLY_COMPLETE_THRESHOLD_FAMILY`
- Cutoff: 2026-08-09
- Audit class: static current-source and fixed-proof analysis; no experiment executed
- Outcome: `OUTSIDE_FAMILY_LEGAL_ACTION_IDENTIFIED__MECHANICAL_REPLAY_PENDING`

## 1. Pinned contract

- cvc5: official tag `cvc5-1.3.4`, release-page short commit `f3b21c4`.
- Printer path: `src/proof/alethe/alethe_printer.cpp`.
- Native naming path: `src/proof/alethe/alethe_let_binding.cpp` plus common let-binding machinery.
- Proof input: `test/regress/cli/regress0/proofs/qgu-fuzz-1-bool-sat.smt2`.
- Output: Alethe proof under `--dump-proofs --proof-format-mode=alethe`.
- Contract: Alethe v0.1, same theorem/rules/steps/expanded terms.
- Checker: Carcara `carcara-1.1.0` together with the unchanged SMT-LIB input.

The release is current and immutable enough for Stage 0 design. A future pre-claim bundle must additionally record a full source/archive hash and build hash; this is a readiness item, not a new scientific gate.

## 2. Native mechanism

Current `AletheProofPrinter` constructs its native binding logic from `dagThresh`, processes Alethe proof terms, and converts selected terms to `@p_` names. `AletheLetBinding` emits a first occurrence as a named term and later occurrences as references, with closure/binder restrictions.

This directly absorbs all versions of the old claim that cvc5 lacks Alethe term sharing. It also absorbs a claim based only on scope safety or the ability to emit named terms.

## 3. Complete threshold family

For fixed proof `P`, define:

- `E(P)`: terms eligible under the current native exclusions;
- `c_P(t)`: the count observed by the actual native processing path;
- `S_d(P)`: selected term set at threshold `d`.

The source-defined family is monotone: for enabled `d`, a term is selected when its count exceeds the threshold. Thus `S_{d+1}(P) subseteq S_d(P)`. Sharing-disabled `d=0` is a separate ablation.

Complete enumeration procedure for a later mechanical replay:

1. record every realized `c_P(t)` from the pinned processing path;
2. enumerate sharing-disabled output and the boundary thresholds induced by the realized counts;
3. serialize every output, expand named terms back to raw ASTs, and hash both forms;
4. deduplicate identical outputs; the remaining set is the behaviorally complete native family.

There are at most `|E(P)| + 2` distinct selection boundaries before serialization deduplication. A grid such as `{0,1,2,4,8}` is not automatically complete and is forbidden as the primary baseline.

## 4. Fixed-proof projection

The official cvc5 Alethe example contains:

- `@p_12`, defined at step `t5` for fully expanded term `L = (= (not (ite d c false)) (not d))`, then referenced at `t14`;
- `@p_10`, defined at `t3` for `H = (not b)`, then referenced at `t4` and `t22`.

The documented projection is therefore `c(L)=2`, `c(H)=3` at the printed-occurrence level. The native threshold chain projected to these two terms cannot contain `{L}`: any threshold low enough to include `L` also includes `H`.

This is a static source/text certificate. Before any claim-bearing run, the release-matched native processing counters must reproduce the ordering `c_P(H) > c_P(L)` and the complete output family. If not, this witness is invalid and the mechanism stops; it may not be repaired by choosing a new proof after seeing the failure.

## 5. Outside-family legal action

Action `A*`:

1. name `L` at its first occurrence in `t5` and reference it in `t14`;
2. expand `H` at `t3`, `t4`, and `t22` instead of naming it;
3. change no other term, step, premise, rule, theorem, or format element.

Why it is outside the family: `A*` projects to `{L}`, which is not a member of the nested threshold chain.

Why it is legal: Alethe named terms are syntactic sharing. Expanding the selected name restores the exact fixed proof terms. The action does not cross a binder or closure in the documented proof.

Why it is not itself the algorithm: the 33-character `L` and 7-character `H` strings merely show a plausible cost inversion between count and net serialized benefit. Selecting terms independently by this local arithmetic is explicitly outside the permitted paper claim.

## 6. Nontrivial candidate action space

The admissible candidate space is the set of globally scope-feasible named-term selections and declaration sites under:

- definition-before-use;
- proof-scope visibility;
- closure/binder exclusion or an equivalently sound release-matched rule;
- term-containment and name-dependency order;
- exact full expansion;
- unchanged Alethe grammar and Carcara obligation.

The candidate N2 route is a global algorithm over this interaction structure. It must provide an exactness/approximation result or an auditable optimization certificate. Generic threshold selection, an emitter patch, a downstream text transform, and independent per-term byte ranking are outside the frozen mechanism.

## 7. Fidelity audit matrix

| Property | Static status | Required pre-claim closure |
|---|---|---|
| Same theorem/input | Preserved by definition of `A*` | Hash original SMT-LIB and solver result |
| Same proof steps/rules/premises | Preserved by definition | Parsed step-by-step equality audit |
| Same expanded terms | Preserved symbolically | Expansion-normalized AST hash equality |
| Same Alethe format | Preserved | Release-matched parser/Carcara replay |
| Checker acceptance | Credible finite route, not executed | Carcara check on native family and `A*` |
| Complete native family | Formally finite and nested | Native counter dump plus output/hash enumeration |
| Natural occurrence | Not established | 60-instance preregistered denominator |
| Full-cost advantage | Not established | Native-envelope p50/p90 Pareto ledger |

## 8. Stop conditions

Return scientific STOP if:

- native replay produces `A*` at any threshold;
- the count ordering needed by the fixed witness is false;
- any expansion, step, rule, theorem, format, or checker obligation changes;
- the complete family was not enumerated;
- the constructed mechanism is only threshold tuning, output selection, printer patching, postprocessing, or local byte ranking;
- no nontrivial algorithmic/formal guarantee can be stated;
- natural full-cost comparison shows no residual outside the complete native envelope.

## 9. Source ledger

- cvc5 1.3.4 release: https://github.com/cvc5/cvc5/releases/tag/cvc5-1.3.4
- cvc5 current Alethe documentation and fixed example: https://cvc5.github.io/docs-ci/docs-main/proofs/output_alethe.html
- cvc5 Alethe printer source: https://github.com/cvc5/cvc5/blob/main/src/proof/alethe/alethe_printer.cpp
- cvc5 Alethe let-binding source rendering: https://cvc5.stanford.edu/downloads/builds/coverage/cvc5-2026-01-30/buildbot/coverage/build/src/proof/alethe/alethe_let_binding.cpp.gcov.html
- Alethe specification v0.1: https://verit.loria.fr/alethe.pdf
- Carcara upstream: https://github.com/ufmg-smite/carcara

Absence result: `SEARCH_BOUNDED_OPEN`. No checked first-party source establishes the narrowed global selection algorithm; this does not prove novelty.

