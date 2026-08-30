# CVC5-ALETHE-SHAREMAP — Revision 1 Closing Confirmation

- Assignment: `STAGE0-C1-20260809-CVC5-ALETHE-SHAREMAP-REVISION1-CLOSING-V8.7`
- Role: independent long-lived `STAGE0-CONFIRMATION-SENTRY`
- Mode: `CLOSING_SENTRY`
- Cutoff: 2026-08-09
- Protocol disposition: `CONFIRM`
- Closing disposition: `CONFIRM_STAGE0_PASS`
- Quality tier: `TIER_B_Q2_VIABLE`
- Novelty route: conditional `N2`
- Evidence ceiling: `STATIC_OUTSIDE_NATIVE_FAMILY_ACTION__ALGORITHM_AND_NATURAL_BENEFIT_UNESTABLISHED`
- Current readiness: `FINITE_PRECLAIM_FIDELITY_AND_ALGORITHM_DISCRIMINATION_ROUTE`
- Scientific revision budget: `1/1 consumed; no further revision available`
- Stage A authorized: `false`
- Stage B authorized: `false`
- Experiments run by this review: `none`
- Lane after delivery: `IDLE_REUSABLE_AWAITING_MAINLINE`

## Outcome

Revision 1 closes the Stage 0 gate at the level of **conditional paper potential**, not at the level of an established algorithm or empirical result.

The fixed official cvc5 1.3.4 Alethe proof is sufficient to give a static, same-proof action-space separation. In the fully expanded proof, the term named `@p_12` occurs twice, while the term named `@p_10` occurs three times. Both are eligible under the same native named-sharing path. Because every native `dag-thresh` configuration applies one uniform occurrence threshold, its selected-term projections are nested: a configuration that selects the lower-count `@p_12` term cannot reject the higher-count `@p_10` term. Therefore `NAME_P12__EXPAND_P10` lies outside every behaviorally distinct native threshold output.

The action is also statically legal under the frozen flat proof: `@p_12` is defined at its first occurrence in `t5` and referenced later in `t14`; removing `@p_10` and printing `(not b)` at `t3`, `t4`, and `t22` introduces no forward reference or scope crossing. Expanding all names yields the same step terms. This establishes only **existence of an outside-family legal action**.

It does not establish natural frequency, byte/checker benefit, a global algorithm, a theorem, or a paper result. Those remain explicitly downstream. The old claim that current cvc5 lacks native Alethe sharing remains permanently prohibited.

## Frozen-input integrity

All listed manifests were recomputed from disk.

| Package | Manifest SHA-256 | Entries | Result |
|---|---|---:|---|
| Discovery | `24989909247799552B26B56645DA8559D346965A34B2C97F1AE5A86B6BC8F91C` | 4/4 | match |
| Stage 0 PRIMARY | `1D52D2F60866505AF0173C18FA234B3A41E4B04013B791F52849659BAFFB169B` | 4/4 | match |
| Initial confirmation | `92E6A48054B4F961C36A762247E6ADAC7A8EEF194E5AD676BF256789DB42C052` | 2/2 | match |
| Revision 1 | `B0F6E65D405D764DA37BD37D18288AD8F5531E4E3E188FB2CDD62186B63E949C` | 3/3 | match |

Revision 1 artifact identities independently matched:

- `REVISION_REPORT.md`: `A87A32F2B10B7025772DD6192F8B1D880D3699E3ECD24B6D9B6F4A902B48655A`
- `CURRENT_NATIVE_FAMILY_ACTION_SPACE_AUDIT.md`: `8C34651E40E227E25DCB325C2C02E8846F89DE0780E0566E854A56B8C4293A78`
- `handoff.yaml`: `C95AA4A3C129E2281911B1F428E8D5BAA1BC68A6BA8CAD5AFCCE440BBBAE82F2`

Registry records the same revision package, marks revision 1 consumed, places this closing review active, and keeps Stage A/B and formal execution disabled. No provenance or ownership conflict was found.

## Independent source verification

### Release-matched fixed proof

The official [cvc5 1.3.4 Alethe documentation](https://cvc5.github.io/docs/cvc5-1.3.4/proofs/output_alethe.html) prints the frozen `qgu-fuzz-1-bool-sat.smt2` proof:

- `@p_10` is introduced in `t3` for `(not b)` and referenced in `t4` and `t22`: three fully expanded occurrences.
- `@p_12` is introduced in `t5` for `(= (not (ite d c false)) (not d))` after recursive name expansion and referenced in `t14`: two fully expanded occurrences.
- The proof is flat across these steps; neither term crosses a subproof, quantifier, or closure boundary.

The official [cvc5 1.3.4 release](https://github.com/cvc5/cvc5/releases/tag/cvc5-1.3.4) identifies full commit `f3b21c4483d3b88dc63cb7cd3e5eb092eee5e341`. The current official option documentation defines `dag-thresh` as dagifying common subexpressions appearing more than a single configured count, with zero disabling dagification. Current [`AletheProofPrinter`](https://github.com/cvc5/cvc5/blob/main/src/proof/alethe/alethe_printer.cpp) connects that option to the Alethe-specific let-binding pass, and the project-hosted [`AletheLetBinding`](https://cvc5.stanford.edu/downloads/builds/coverage/cvc5-2026-01-30/buildbot/coverage/build/src/proof/alethe/alethe_let_binding.cpp.gcov.html) rendering shows named definition/reference conversion and closure handling.

These sources are enough for the Stage 0 order-theoretic separation below. Release-matched binary replay remains a mandatory artifact-fidelity check before any claim-bearing Stage A observation; it is not treated as an already obtained result.

### Alethe legality boundary

The [Alethe specification](https://verit.loria.fr/alethe.pdf) treats `:named` terms as syntactic sharing. On the frozen flat proof, keeping the long term named at its first occurrence and replacing the short term's definition/references with its exact body changes only representation. [Carcara](https://github.com/ufmg-smite/carcara) remains the required executable checker oracle, not evidence already run by this closing review.

## Static certificate

Let `L` be the fully expanded term currently named `@p_12`, and `H` the fully expanded term currently named `@p_10`.

| Property | `L = @p_12` | `H = @p_10` |
|---|---|---|
| Fully expanded term | `(= (not (ite d c false)) (not d))` | `(not b)` |
| Definition location | `t5` | `t3` |
| Later references | `t14` | `t4`, `t22` |
| Expanded occurrence count | 2 | 3 |
| Eligible in documented native output | yes | yes |

For any uniform count threshold in the native family, selecting `L` implies selecting `H`, because `count(H) > count(L)` and both have already passed the same eligibility path. Thus every native selection projected to `{L,H}` is nested; the projection `{L}` is absent regardless of duplicate serialized outputs or threshold labels.

Define `A* = NAME(L) AND EXPAND(H)`. It has projection `{L}` and is therefore outside every behaviorally distinct native threshold result. Its definition precedes its sole use, and expanding `L` plus the unshared occurrences of `H` reconstructs the documented proof terms. No performance fact is needed for this separation.

### What the static certificate does not prove

- It does not prove that `A*` saves bytes after exact syntax accounting.
- It does not prove that similar actions occur naturally or frequently.
- It does not prove that checker time or memory improves.
- It does not prove that a global selector beats the complete per-proof native envelope.
- It does not prove that the proposed global optimization has a new theorem or algorithm.
- It does not restore any missing-native-sharing or generic Alethe-sharing claim.

## Algorithmic-substance audit

The fixed action alone is a local count-versus-length inversion. By itself it would be a byte heuristic or emitter choice and would be below Tier B. The retained paper kernel is narrower and conditional:

> Formulate legal named-term selection over the release-matched proof-scope/term-containment dependency structure, then construct a global exact, parameterized, approximation, or independently checkable optimization algorithm whose feasible action family strictly contains the native threshold chain while preserving exact expansion and the Alethe/Carcara contract.

This is a well-posed conditional N2 route because the intended decisions can interact through definition-before-use, declaration scope, nested named terms, dependency order, and expansion cost. It is not yet known that the natural instances exhibit enough such interaction, and the revision does not claim otherwise.

To retain the PASS, Stage A must fail closed if the instantiated problem decomposes into independent per-term net-byte tests or if the implementation is only a printer patch. A printer integration may be an evaluation vehicle, but it cannot be the paper contribution. The claim-bearing contribution must be the global problem characterization and an algorithm/formal guarantee over it.

The following do **not** qualify:

- choosing a `dag-thresh` value or a native output;
- ranking terms independently by local serialized savings;
- adding a flag or changing only emission syntax;
- postprocessing an already emitted proof;
- calling a generic ILP/SMT solver without a new formulation, structure, guarantee, or independently auditable certificate;
- using the single `A*` witness as evidence of natural benefit.

## Structural paper potential and readiness

### Structural paper potential

`TIER_B_Q2_VIABLE`, conditional. If successful, the minimum credible paper shape is:

- N1 support: a precise characterization of the native nested threshold family versus globally scope-feasible selections;
- N2 core: a nontrivial constructor/optimization algorithm or formal guarantee over the larger same-proof action space;
- evidence: natural cvc5 Alethe proofs, exact expansion/checker fidelity, and a full-cost comparison against the behaviorally complete native envelope.

The current package does not support Tier A and does not establish the N2 result. It shows that the proposed N2 is not vacuous merely because all legal actions were already native-threshold expressible.

### Current evidence readiness

Readiness remains limited but finite. Official source, release documentation, regression input, Alethe contract, and Carcara provide a public CPU path. Missing binary replay, implementation, theorem proof, corpus incidence, and performance results are downstream research work and do not by themselves negate Stage 0 potential.

## Mandatory pre-claim gate and finite Stage A killer

No Stage A is authorized here. If mainline later authorizes Stage A, no claim-bearing observation may be used until the following finite pre-claim gate closes:

1. Pin the full cvc5 1.3.4 source/archive and build hashes plus Carcara and Alethe versions.
2. Regenerate the exact fixed proof and verify the native occurrence ordering, all behaviorally distinct threshold outputs, and the absence of `A*` from that family.
3. Materialize `A*` in the same printer-side contract; verify step/rule equality, exact-expanded AST hashes, and Carcara acceptance.
4. Freeze an explicit global optimization problem: variables, legal declaration sites, scope/containment conflicts, objective, and the intended exactness/approximation/certificate statement.
5. Produce a cheap discriminating global-coupling witness or decomposition check. If all eligible decisions are independent local net-byte choices, stop before treating the mechanism as N2.

Only after that gate may the preregistered 60-instance natural killer run. It must use the complete per-proof native threshold envelope and report the fixed denominator, outside-family action incidence, proof bytes, construction/family-enumeration/serialization time, solver/proof time, Carcara time and peak RSS, disk, failures, timeouts, and fallback.

Scientific STOP conditions remain:

- the release-matched count ordering fails or a native threshold reproduces `A*`;
- exact expansion, proof structure, format, or Carcara fidelity fails;
- the mechanism decomposes to local byte ranking, threshold tuning, native-output selection, emitter engineering, postprocessing, or a generic solver wrapper without independent contribution;
- no nontrivial algorithmic/formal guarantee can be frozen;
- outside-family positive actions occur in less than 10% of the preregistered eligible natural proofs;
- no p50/p90 full-cost non-dominated residual survives the complete native envelope;
- analysis/construction overhead consumes the apparent benefit.

A positive pre-claim probe means only that the highest-risk premise was not falsified or received preliminary support. It does not establish the paper's main claim.

## Closing claim matrix

| Claim | Closing status | Permitted interpretation |
|---|---|---|
| Current cvc5 lacks native Alethe sharing | `DIRECT_FATAL / PERMANENTLY_REMOVED` | Never restore |
| The fixed proof contains a legal outside-threshold-family action | `STATICALLY_SUPPORTED` | Same-proof action-space existence only |
| `A*` is naturally useful | `UNESTABLISHED` | Stage A risk question |
| Scope-forest selection is already a nontrivial algorithm | `UNESTABLISHED` | Must be formalized and discriminated from local/product behavior |
| A nontrivial global algorithm/formal guarantee could support Tier B | `CONDITIONAL_POTENTIAL` | Stage 0 paper-shape judgment only |
| Natural full-cost Pareto residual exists | `UNESTABLISHED` | Stage A/B evidence obligation |
| Stage A or Stage B may start | `NOT_AUTHORIZED` | Mainline decision required |

## Final decision

`CONFIRM_STAGE0_PASS / TIER_B_Q2_VIABLE`

Reason: the release-matched official proof statically closes the action-space-existence portion of the sole revision without changing the object, and the remaining global-algorithm hypothesis has a finite, same-object, falsifiable pre-claim and Stage A route. The PASS is conditional research-potential admission, not validation of benefit or algorithmic success.

Confidence:

- static count/projection separation: `0.96`
- legal same-proof representation: `0.94`
- conditional Tier B structural potential: `0.82`
- current natural/algorithmic result: `not established`

Permissions remain closed. The revision package, Discovery, PRIMARY, confirmation, registry, plan, rules, and templates were not modified.

