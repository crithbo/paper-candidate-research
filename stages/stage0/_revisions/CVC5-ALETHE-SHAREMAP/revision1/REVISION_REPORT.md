# CVC5-ALETHE-SHAREMAP — Stage 0 Revision 1 Review

- Assignment: `STAGE0-P1-20260809-CVC5-ALETHE-SHAREMAP-REVISION1-V8.7`
- Role: long-lived `STAGE0-BATCH-GATE / PRIMARY`
- Mode: `STAGE0_REVISION1`
- Cutoff: 2026-08-09
- Atomic gate: `CURRENT_NATIVE_LETIFIER_RESIDUAL__BEHAVIORALLY_COMPLETE_THRESHOLD_FAMILY`
- Recommendation: `RECOMMEND_STAGE0_PASS_FOR_CLOSING_REVIEW`
- Structural paper potential if successful: `TIER_B_Q2_VIABLE`
- Current evidence readiness: `STATIC_ACTION_SPACE_CERTIFICATE__PRECLAIM_NATIVE_COUNT_AND_CHECKER_REPLAY_PENDING`
- Confidence: `0.82`
- Stage A authorized: `false`
- Stage B authorized: `false`
- Scientific revision budget: `revision 1/1 substantively used; mainline status transition pending confirmation`
- Lane after delivery: `IDLE_REUSABLE_AWAITING_MAINLINE`

## Decision

The revision closes the sole Stage 0 question at the level appropriate for a conditional paper-potential screen. It does **not** restore the stale claim that cvc5 lacks native Alethe sharing. Current `AletheProofPrinter` plus `AletheLetBinding` is the mandatory same-object baseline.

For the fixed official cvc5 Alethe example proof, the native `dag-thresh` family is a nested threshold chain over native occurrence counts. A legal selection that names the longer two-occurrence term represented by `@p_12` while leaving the shorter three-occurrence term represented by `@p_10` expanded cannot be produced by any member of that chain. This is a concrete same-proof action-space separation, not a result obtained by choosing a favorable threshold. It preserves the theorem, proof steps, Alethe rules, term expansion, and checker obligation.

That separation is enough to keep a conditional Tier-B N2 hypothesis alive: a global scope-feasible selector can optimize over a strictly larger legal action space than the native threshold family. It is not yet evidence that the proposed selector improves natural proofs. It is also not permission to publish a local byte heuristic. The only paper-shaped continuation is a nontrivial constructor over the scope/containment interaction graph, with an exactness, approximation, or auditable optimization certificate and full-cost comparison against the complete native family.

The recommendation is therefore a Stage 0 pass **for independent closing review only**. If the later pre-claim replay shows that the native counts differ from the audited fixed-proof projection, the proposed action equals a native output, exact expansion or Carcara checking fails, or the mechanism collapses to per-term byte ranking/emitter engineering, the direction must stop before any claim-bearing observation.

## Atomic proposition, falsifier, and result

### Single proposition

Under one pinned current cvc5/Alethe/Carcara same-proof contract, there exists a legal named-term selection outside every behaviorally distinct output induced by native `dag-thresh`; this larger action space admits a finite, checker-faithful, natural full-cost test of a nontrivial scope-feasible selection algorithm without changing the theorem, proof rules, output format, or expanded terms.

### Immediate falsifier

The proposition fails if the witness selection is reproduced by any behaviorally distinct native threshold output; if the apparent separation depends on an incomplete threshold grid; if exact expansion or checker acceptance differs; or if the only remaining construction is threshold tuning, native-output selection, a printer patch, a postprocessor, or independent per-term byte ranking.

### Revision result

`SUPPORTED_AT_STAGE0_ACTION_SPACE_LEVEL`. The official fixed proof supplies a static outside-family legal action. The algorithmic and natural full-cost portions remain conditional and are assigned to a finite pre-claim fidelity gate and Stage A killer; their absence today lowers readiness rather than negating structural potential.

## Frozen same-object contract

| Component | Frozen boundary |
|---|---|
| Solver/printer | Official cvc5 release tag `cvc5-1.3.4`, release page short commit `f3b21c4`; `--dump-proofs --proof-format-mode=alethe` |
| Native constructor | The release-matched `AletheProofPrinter` and `AletheLetBinding`; `dag-thresh` is the only varied native control |
| Fixed proof witness | `test/regress/cli/regress0/proofs/qgu-fuzz-1-bool-sat.smt2`, using the official cvc5 Alethe documentation output |
| Format | Alethe v0.1 named-term syntax and the same rule vocabulary |
| Checker | Carcara `carcara-1.1.0`, checking the proof together with the unchanged SMT-LIB input |
| Semantic equality | Identical theorem, assumptions, proof-step order and premises, rule applications, and fully expanded term trees; only valid named sharing may differ |
| Cost object | Serialized proof bytes plus construction, serialization, Carcara parse/check CPU and peak RSS, solver/proof time, disk footprint, failures, and fallback |

The release tag, official example, source paths, Alethe specification, and Carcara release are public and finite. A local `git ls-remote` attempt could not authenticate through the host's Windows TLS credential provider; no clone or experiment was attempted. This does not block the review because the official release page and documentation provide the pinned reference and the scientific conclusion does not depend on a locally downloaded repository. It yields no scientific inference.

## Current-source reality check

The current native implementation absorbs the original Discovery premise:

1. `AletheProofPrinter` derives its let binder from `dagThresh`, traverses proof material, invokes native letification, and converts selected terms to `@p_` names.
2. `AletheLetBinding` emits a first occurrence as `(! term :named @p_N)` and later occurrences as the name; its conversion avoids crossing closure/binder boundaries.
3. The official current documentation prints the fixed regression proof with `@p_1` through `@p_17` already present.
4. Alethe named terms are syntactic sharing; Carcara is the checker/elaborator. Neither is a candidate constructor baseline beyond its stated role.

Consequently, the following claims are forbidden:

- current cvc5 has no native Alethe sharing;
- scope safety alone is novel;
- selecting a better `dag-thresh` is the proposed algorithm;
- emitting `:named` terms or patching the emitter is the contribution;
- the fixed witness already establishes natural performance or a general theorem.

No checked official/current source or paper-original source directly covered the narrower global selection action outside the complete threshold chain. This remains `SEARCH_BOUNDED_OPEN`, not proof of novelty.

## Behaviorally complete native family

For a fixed proof `P`, let `E(P)` be the finite set of native-eligible terms after the current Alethe exclusions, and let `c_P(t)` be the count seen by the native processing path. Ignoring only duplicate serializations, native threshold `d >= 1` selects

`S_d(P) = { t in E(P) | c_P(t) > d }`,

while `d = 0` disables named sharing. The resulting selections form a nested chain. A behaviorally complete baseline therefore enumerates `d = 0`, `d = 1`, and the realized native counts (plus any release-specific boundary representative needed by the implementation), hashes the outputs after exact expansion, and deduplicates identical behaviors. A hand-picked threshold grid is invalid.

For the fixed documented proof, project the complete chain onto two named terms after full expansion:

| Term | Documented name | Expanded term | Printed occurrences in the fixed output | Selection relevance |
|---|---|---|---:|---|
| `L` | `@p_12` | `(= (not (ite d c false)) (not d))` | 2: definition at `t5`, use at `t14` | longer repeated term |
| `H` | `@p_10` | `(not b)` | 3: definition at `t3`, uses at `t4` and `t22` | shorter, more frequent term |

Under the source-defined threshold order, the projection can be `none`, `{L,H}`, `{H}`, or `none` again as the threshold rises; it cannot be `{L}`. Exact native counter replay remains a pre-claim mechanical obligation because Stage 0 did not execute the release. The official output and source semantics make the projection auditable, and any mismatch is preregistered as a decisive falsifier rather than silently repaired.

## Legal outside-family action

Define action `A*` on the same fixed proof:

- introduce a valid Alethe name for `L` at its first occurrence in step `t5` and use that name in `t14`;
- do not introduce `@p_10`; print `(not b)` in full at `t3`, `t4`, and `t22`;
- leave all other terms and all proof structure unchanged.

`A*` is legal syntactic sharing: expanding its one introduced name yields the same terms in the same proof steps. It is outside every native threshold selection because it selects the lower-count term while rejecting the higher-count term. The strict separation does not depend on a performance measurement.

A lexical sanity check explains why the action is not vacuous: the canonical strings have lengths 33 for `L` and 7 for `H`; the fixed native naming syntax can make the long repeated term beneficial while the short three-occurrence term pays definition/name overhead. These counts are only an explanatory static check. They are neither the candidate algorithm nor evidence of natural benefit.

## Candidate mechanism and claim ceiling

### Permitted N2 hypothesis

`SCOPE_FOREST_WEIGHTED_SELECTION`: construct the eligible term-containment and proof-scope dependency structure, then choose a jointly legal set of names and declaration sites under definition-before-use, binder/closure, nesting, and expansion constraints. The target objective is the same serialized/checker full-cost contract. A paper-shaped result must provide at least one of:

- an exact algorithm for a clearly parameterized structural class, such as bounded active scope-frontier width;
- a formal approximation guarantee for the general selection problem;
- an auditable global optimization certificate whose construction is itself the algorithmic contribution rather than a generic solver wrapper.

The fixed `A*` action proves only that this action space is strictly larger than the native threshold chain. It does not prove the proposed global algorithm is novel or effective.

### Structural paper potential

- `N1`: a precise feasible-family characterization of current native threshold sharing versus general scope-feasible named sharing.
- `N2`: a nontrivial global constructor over the strictly larger action space, with a formal or checkable guarantee.
- `N3`: optional natural regularity in scope/term reuse; not required for the minimum Tier-B shape.

If successful against the complete native baseline and full cost, this is a credible `TIER_B_Q2_VIABLE` software/algorithm paper core. A Q1 claim would require a stronger general theorem, broad natural proof evidence, and durable effect across logics and proof shapes. Current evidence does not justify Tier A.

### Current readiness

Readiness is low-to-moderate but finite. Public source, a release-tagged solver, an official natural regression input, an explicit checker, and a finite threshold-family enumeration route exist. What is missing is release-matched native-count replay, an implementation of the global selector, checker replay of `A*`, and natural-corpus full-cost evidence. Those are Stage A obligations, not Stage 0 STOP reasons.

## Strongest fair comparators

| Comparator | Role | Fairness boundary |
|---|---|---|
| Native cvc5 sharing disabled (`dag-thresh=0`) | Ablation | Same proof, rules, format, checker |
| Behaviorally complete `AletheLetBinding` threshold family | Primary baseline | Same fixed proof and all distinct native outputs; compare against the per-instance envelope, not one default |
| Candidate global scope-feasible selector | Candidate | Must operate before emission on the same converted proof and preserve exact expansion |
| Carcara | Fidelity oracle and measured consumer | Not a constructor baseline; parse/check cost is included |
| veriT proof sharing | Provenance/method subtractor | Different solver proof object; cannot replace same-cvc5 comparator |
| CPC/Ethos | Adjacent format negative control | Changes format/rules/checker and cannot be counted as same-object evidence |

## Finite pre-claim fidelity closure and Stage A killer

No Stage A work is authorized here. If mainline later authorizes it, the first claim-bearing observation must wait until the following finite closure succeeds:

1. obtain release-matched cvc5 source/binary and record full commit/archive SHA, build options, OS/compiler, Alethe specification, and Carcara binary/source SHA;
2. regenerate the documented proof from the unchanged SMT-LIB input;
3. derive every realized native count from the actual processing path and enumerate all distinct threshold outputs; record raw and exact-expanded hashes;
4. materialize `A*` inside the same printer-side contract, not as a text postprocessor;
5. verify exact-expanded AST equality and Carcara acceptance on the fixed proof;
6. only then evaluate 60 public, license-recorded SMT-COMP/SMT-LIB UNSAT instances supported by current cvc5 Alethe, with a preregistered denominator of baseline-checkable inputs;
7. compare candidate outputs against the complete per-proof native envelope and no-sharing ablation using proof bytes, solver/proof time, construction time, family-enumeration time, serialization, Carcara time/RSS, total disk, failures, and fallback.

The Stage A killer stops the mechanism if any of the following holds:

- `A*` is not outside the mechanically complete native family;
- exact expansion or Carcara acceptance differs;
- fewer than 10% of eligible natural proofs have a legal positive action outside the native family;
- the candidate is only per-term lexical ranking, threshold tuning, a printer patch, or postprocessing;
- no nontrivial algorithmic/formal guarantee survives implementation review;
- candidate p50 and p90 points are dominated by the complete native envelope under full cost;
- selection/family-analysis overhead consumes the serialized/checking benefit.

This route is CPU/open-source and finite. No hardware, proprietary stack, or user resource blocker is presently required.

## Source and provenance ledger

| Source | Authority and use | Boundary |
|---|---|---|
| [cvc5 1.3.4 release](https://github.com/cvc5/cvc5/releases/tag/cvc5-1.3.4) | Official tag, release date, short commit `f3b21c4` | Pin; not an evaluation result |
| [Current cvc5 Alethe documentation](https://cvc5.github.io/docs-ci/docs-main/proofs/output_alethe.html) | Official example proof and named terms | Fixed static witness; exact release replay pending |
| [cvc5 `alethe_printer.cpp`](https://github.com/cvc5/cvc5/blob/main/src/proof/alethe/alethe_printer.cpp) | Official current source for native integration | Current-source reality check |
| [cvc5 `alethe_let_binding.cpp` coverage view](https://cvc5.stanford.edu/downloads/builds/coverage/cvc5-2026-01-30/buildbot/coverage/build/src/proof/alethe/alethe_let_binding.cpp.gcov.html) | Official project-hosted source rendering for named-definition and scope behavior | Source boundary; release-matched replay pending |
| [Alethe specification v0.1](https://verit.loria.fr/alethe.pdf) | Format and named-sharing semantics | Same-format contract |
| [Carcara upstream](https://github.com/ufmg-smite/carcara) | Official checker/elaborator and release lineage | Fidelity oracle, not candidate baseline |
| [cvc5 TACAS 2022 paper](https://cvc5.github.io/papers/2022/BarbosaBBKLMMMN-TACAS22.pdf) | System and proof architecture genealogy | Does not establish residual algorithm |

Input package integrity was recomputed. Discovery manifest `24989909247799552B26B56645DA8559D346965A34B2C97F1AE5A86B6BC8F91C`, PRIMARY manifest `1D52D2F60866505AF0173C18FA234B3A41E4B04013B791F52849659BAFFB169B`, and confirmation manifest `92E6A48054B4F961C36A762247E6ADAC7A8EEF194E5AD676BF256789DB42C052` match the frozen packages. No provenance conflict was found.

## Final gate disposition

- Atomic revision gate: `CLOSED_FOR_STAGE0_POTENTIAL_SCREEN__PENDING_INDEPENDENT_CLOSING_CONFIRMATION`
- Recommended disposition: `RECOMMEND_STAGE0_PASS_FOR_CLOSING_REVIEW`
- Tier: `TIER_B_Q2_VIABLE`, conditional on the frozen N2 route and killer
- Readiness: `STATIC_ACTION_SPACE_CERTIFICATE__PRECLAIM_NATIVE_COUNT_AND_CHECKER_REPLAY_PENDING`
- Blocker: `none`
- Same-ID further revision: `not available; revision 1/1 used by this package`
- Stage A/B authorization: `false / false`
- Required next role: the same long-lived independent Stage 0 confirmation sentry, closing review only

