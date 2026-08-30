# CVC5-ALETHE-SHAREMAP — Stage 0 Confirmation Review

- Assignment: `STAGE0-C1-20260809-CVC5-ALETHE-SHAREMAP-CONFIRM-V8.6`
- Mode: independent `STAGE0-CONFIRMATION-SENTRY`
- Cutoff: 2026-08-09
- Protocol disposition: `CONFIRM`
- Scientific disposition: `CONFIRM_REVISE_ONCE`
- Conditional quality tier: `TIER_B_Q2_VIABLE`
- Current evidence readiness: `FINITE_FIDELITY_GAP`
- Stage A authorized: `false`
- Stage B authorized: `false`
- Revision executed by this review: `false`
- Lane after delivery: `IDLE_REUSABLE_AWAITING_MAINLINE`

## Bottom line

PRIMARY's decisive collision is confirmed. The frozen Discovery premise that current cvc5 lacks a native Alethe term-sharing constructor is stale: current cvc5 has an `AletheProofPrinter`-integrated `AletheLetBinding`, derives its threshold from `dagThresh`, traverses the proof to letify terms, and emits Alethe `:named @p_*` definitions and references. The original candidate therefore cannot receive a direct Stage 0 PASS on the claimed missing-constructor gap.

The one allowed revision remains conditionally defensible, but only after a mechanical normalization. The strongest same-object baseline is not a few convenient threshold settings. It is the behaviorally complete finite family of native `AletheLetBinding` outputs induced by `dag-thresh` for each fixed finite proof, plus sharing-disabled output as an ablation. The candidate must expose a legal selection action or an algorithmic guarantee outside that family while preserving the same theorem, proof rules, expanded terms, Alethe contract, and Carcara checking. Threshold tuning, choosing among native outputs, a local emitter patch, or a postprocessor is structurally below the claimed contribution and must STOP.

This is a potential-screening conclusion, not a result claim. The residual has not been demonstrated, and no implementation or performance result is asserted. Its absence today lowers readiness; it is not by itself a scientific STOP.

## Input and provenance integrity

The frozen Discovery package and PRIMARY package were recomputed before review.

| Item | SHA-256 | Result |
|---|---|---|
| Discovery brief | `F2A72D38F7A941157A40D5F790B6EA4A955175921B9107757542ADC5312FF50C` | match |
| Discovery collision/source audit | `E45A70AADB9DDB28BE8C76DAC89F5AC68F535047917058B97D136B50DBF07FA0` | match |
| Discovery search log | `D3D07CA273FEEFC8304C71EDDB7F2402B23CCBE01B26728079E0ED809D1D4FB4` | match |
| Discovery handoff | `21003FB19312C795FB2510D634C773D3E9E31B82DB327F84632BDA086F374D52` | match |
| Discovery manifest | `24989909247799552B26B56645DA8559D346965A34B2C97F1AE5A86B6BC8F91C` | match |
| PRIMARY report | `07B0E705EC5B1E8C5B575077637DA5DA11CF7DF9346BDB945A369E114370E470` | match |
| PRIMARY comparator matrix | `FDCFE4F8FE06438C9FAB4C02F1C3C33744D74B13A8DE265D74315C286C2202A1` | match |
| PRIMARY source audit | `32B53108127146B921B5B463118ADC7AF4242B73BEF3BE394331512A0569B5DC` | match |
| PRIMARY handoff | `02AD233A0680CA7A7A9D6DDC4F44B3D2C4D4572206E296D7CFA262CA77A20A79` | match |
| PRIMARY manifest | `1D52D2F60866505AF0173C18FA234B3A41E4B04013B791F52849659BAFFB169B` | match (4/4) |

Registry status is consistent with a confirmation-active Stage 0 item: revision is unexecuted and downstream execution permissions remain closed. No provenance conflict was found.

## Independent decisive-source verification

### Current native implementation

The current [`alethe_printer.cpp`](https://github.com/cvc5/cvc5/blob/main/src/proof/alethe/alethe_printer.cpp) directly supports the collision finding:

1. `AletheProofPrinter` constructs `d_lbind` from `options().printer.dagThresh`, adding one to the user threshold when enabled.
2. Before printing, it traverses proof nodes and invokes the native letifier.
3. It disables the generic output-language DAG `let` pass for this printer, because named Alethe terms are handled separately.
4. It converts the native let map using the `@p_` prefix.
5. Assumptions, converted rule arguments/conclusions, and proof-scope material participate in the printer's term processing.

The current source tree contains the dedicated [`AletheLetBinding`](https://github.com/cvc5/cvc5/tree/main/src/proof/alethe) implementation. The upstream coverage view for [`alethe_let_binding.cpp`](https://cvc5.stanford.edu/downloads/builds/coverage/cvc5-2026-01-30/buildbot/coverage/build/src/proof/alethe/alethe_let_binding.cpp.gcov.html) shows that it subclasses the common let-binding machinery, emits `(! term :named @p_N)` definitions, reuses the generated names, and avoids descending through closure/binder boundaries in its conversion path.

The released cvc5 1.3.4 documentation gives a pinnable current baseline and illustrates native named sharing in Alethe output: [`:named @p_*` terms and later references](https://cvc5.github.io/docs/cvc5-1.3.4/proofs/output_alethe.html). By contrast, cvc5 1.1.2 documentation explicitly required `--dag-thresh=0` because term sharing was then unsupported: [historical 1.1.2 Alethe documentation](https://cvc5.github.io/docs/cvc5-1.1.2/proofs/output_alethe.html). Therefore the Discovery source was historically accurate but cannot support a 2026 current-gap claim.

### Contract and checker boundary

The [Alethe specification](https://verit.loria.fr/alethe.pdf) defines SMT-LIB-style named terms as syntactic sharing, and documents the corresponding veriT proof-sharing convention. [Carcara](https://github.com/ufmg-smite/carcara) is an upstream Alethe checker/elaborator and supplies the public CPU verification route for the pinned output contract. The [cvc5 system paper](https://cvc5.github.io/papers/2022/BarbosaBBKLMMMN-TACAS22.pdf) establishes its internal proof representation and target-specific output transformation architecture; it does not independently establish the proposed residual optimization.

No checked official/upstream or paper-original source in the bounded search established a direct current implementation of the narrowed, same-proof, globally costed legal-selection residual. That is a search-bounded absence, not proof of novelty.

## Claim and collision matrix

| Claim | Exact object | Finding | Collision class | Confirmation consequence |
|---|---|---|---|---|
| Current cvc5 lacks native Alethe term sharing | Same cvc5-produced Alethe refutation and printer contract | False for current cvc5; native letification and `:named @p_*` emission exist | `DIRECT_FATAL` for the frozen gap | Original candidate cannot direct PASS |
| A new constructor is needed merely to emit valid named terms | Same printer/output contract | Absorbed by `AletheProofPrinter` + `AletheLetBinding` | `EXACT/DIRECT` | Remove from novelty claims |
| Scope safety alone is the residual | Same proof scopes/binders | Current conversion already includes binder/closure safeguards and proof-scope processing for its supported outputs | `METHODOLOGICAL/PARTIAL` | Scope safety alone is insufficient N2 |
| Selecting a better `dag-thresh` is an algorithmic contribution | Same proof and native threshold option | Native parameter family supplies the action; selection/tuning is controller work | `METHOD/PRODUCT` | STOP if this is the revision outcome |
| A postprocessor or local emitter patch improves bytes | Same Alethe text after native production | Does not establish a new native legal-selection constructor or guarantee | `METHOD/DEPLOYMENT` | STOP under frozen object/mechanism |
| A scope-aware/costed legal selection exists outside every native threshold output | Same cvc5 proof, Alethe semantics, checker, and exact expansion | Not absorbed by the verified sources; existence unproven | `SEARCH_BOUNDED_RESIDUAL` | Eligible for the single revision gate only |
| Such a residual has an algorithmic guarantee and finite natural full-cost evaluation route | Same object and fidelity contract | Structurally capable of Tier B if established; no current result asserted | `CONDITIONAL_POTENTIAL` | Stage 0 revise-once, not Stage A authorization |

## Strongest fair baseline

The required same-information baseline is:

1. pinned cvc5 1.3.4 or one immutable current cvc5 commit;
2. its native `AletheProofPrinter` and `AletheLetBinding` behavior;
3. every behaviorally distinct native `dag-thresh` result for the fixed proof, represented by a preregistered finite grid proven complete for that proof's finite occurrence counts;
4. sharing-disabled native output as an ablation;
5. identical theorem, solver proof, Alethe rules, expansion semantics, checker, and cost accounting.

The completeness qualification is necessary. Because a fixed proof has finitely many subterms and occurrence counts, the threshold family has finitely many behaviorally distinct outcomes. An arbitrary small grid is not a fair union and can manufacture a false residual.

veriT is a format/provenance subtractor, not a same-proof native cvc5 competitor. Carcara is the fidelity checker and possible cost consumer, not the constructor baseline. CPC/Ethos are adjacent cross-format evidence; changing to those formats changes the frozen Alethe object.

## Atomic revision gate

### Confirmed gate, mechanically normalized

`CURRENT_NATIVE_LETIFIER_RESIDUAL__BEHAVIORALLY_COMPLETE_THRESHOLD_FAMILY`

For one pinned current cvc5/Alethe/Carcara contract and the same fixed cvc5 proof object, exhibit a legal candidate selection action or nontrivial algorithmic guarantee that is not expressible by any behaviorally distinct output of the native `AletheLetBinding` under `dag-thresh`, while preserving exact expanded terms and checker acceptance; state a finite natural-corpus, full-cost route that could later distinguish the residual from the native family.

This is one falsifiable residual proposition. Its source model, witness, fidelity obligations, and evidence route are parts of the same proposition rather than separate chances to change the object.

### Minimum mechanical closure for the revision

- Pin cvc5 1.3.4 or an immutable current commit, the Alethe contract, and Carcara version.
- Derive the native feasible family from current source, including scope/binder restrictions and all behaviorally distinct threshold outputs.
- Provide at least one same-proof witness action outside that family. Merely obtaining a different byte count from one baseline setting is insufficient.
- Identify the constructor/optimization structure or guarantee that supplies N2. A flag chooser, threshold tuner, local heuristic, emitter patch, or text postprocessor fails.
- Preserve theorem, proof rules, expanded terms, output format, and checker semantics. Changing any of these fails same-object review.
- Define a bounded later route over natural cvc5 Alethe proofs with full costs. Stage 0 does not require those results now.

### Falsifiers

The revision must return STOP if any of the following occurs:

- every proposed action equals an output of some native threshold;
- the purported residual exists only because the finite threshold set was incomplete;
- the mechanism reduces to selecting/tuning `dag-thresh`;
- the implementation is only a local printer patch or downstream postprocessor;
- the witness changes theorem, proof derivation, rule vocabulary, format, checker obligation, or exact expansion;
- the remaining claim is only engineering convenience without an independent algorithmic or formal guarantee.

## Structural paper potential versus readiness

### Structural paper potential

`TIER_B_Q2_VIABLE`, conditional on the atomic residual gate. If a legal action set genuinely lies outside the native threshold family and is produced by a scope-aware/costed constructor with a clear guarantee, the work can retain:

- N1: formal characterization of the current native threshold-feasible family under the pinned Alethe scope/expansion contract;
- N2: a constructor or optimization algorithm over a strictly larger legal action space;
- N3: same-proof, checker-preserving, full-cost evidence against the complete native family on natural cvc5 proof output.

If the residual fails, the successful-looking artifact would still be native threshold tuning or printer engineering, which is below the claimed Tier B shape.

### Current evidence readiness

`FINITE_FIDELITY_GAP`. The primary risk is whether any candidate action or guarantee actually lies outside the native family. Public source, released cvc5, Alethe specification, and Carcara provide a finite CPU/open-source route. No proprietary hardware or stack is implicated. Missing implementation, corpus results, or proof of the core proposition is recorded only as low readiness and is not used as a STOP reason.

## Decision and permissions

- Confirm PRIMARY's direct collision: **yes**.
- Confirm direct PASS for frozen candidate: **no**.
- Confirm one revision opportunity: **yes, only under the normalized atomic gate above**.
- Confirm current conditional Tier B potential: **yes**.
- Claim that the residual already exists or works: **no**.
- Authorize Stage A/B, implementation, experiment, or downstream project: **no**.
- Modify registry, plan, Discovery, PRIMARY, or revision package: **no**.

## Confidence and search boundary

- Current-native-sharing collision confidence: `0.99`.
- Atomic-gate assessment confidence: `0.88`.
- Conditional Tier B assessment confidence: `0.82`.
- Search boundary: official/upstream cvc5 source, release/current documentation, Alethe specification and paper lineage, veriT, Carcara, CPC/Ethos-facing cvc5 material, through 2026-08-09. No general web-derived secondary claim is used as decisive evidence.

