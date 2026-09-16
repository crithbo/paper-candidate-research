# DEX-DELTA-PARETODP Stage 0 Report

- Lane id: `LONG_LIVED_D_ROOT_STAGE0_PRIMARY`
- Assignment id: `STAGE0-P2-20260811-DEX-DELTA-PARETODP-PRIMARY-V8.7`
- Input freeze SHA-256: Discovery handoff `17CFF2D6F4F261FAED21868BE5B4F77E22D6F674EAD61C48412813105781C6EC`; Discovery manifest self `26C3A53A1FB0B2F7FDE9066AFAEA31BDED91DBDFF61A1B03C39913ECAF222C7E` (`6/6 PASS`).
- Frozen controls: `AGENTS.md=66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063`; `plan.md=F5C7D04DF32391E3FD958C106BBE41B9A8063F137E7D847230CC5027D295AD22`; `registry.yaml=253F93B7A0E39B9AEE80E5E42E728DA43EEC281CE2DCACE0A5EAE97F4A97D934`; `ROLE_STAGE0_REVIEW.md=741EC3544797FF8A5BF337E1E3448B5F683823E5229F818F162834400581626E`.
- Cross-assignment contamination declaration: only the frozen controls, the Wave263 S3 Discovery six-file packet, the Stage0 templates, and sources listed in `SOURCE_AUDIT.md` were used. Shared `plan.md` and `registry.yaml` advanced after assignment start; their later contents were not reread or imported. No other candidate packet was read.
- Decision: `REVISE_ONCE`
- Quality tier: `TIER_B_Q2_VIABLE__CONDITIONAL_ON_UNIQUE_STATIC_REVISION_GATE`
- Confidence: `0.86`
- Evidence ceiling: `STAGE0_CONDITIONAL_PAPER_POTENTIAL__STATIC_CURRENT_UPSTREAM_AND_COLLISION_AUDIT_ONLY__NO_CANDIDATE_OUTPUT`
- Novelty route: `N2`; `N3` is optional and cannot support admission until a held-out natural recurrence is observed.
- Candidate Q1 venue family: `IEEE Transactions on Mobile Computing / ACM Transactions on Software Engineering and Methodology`; credible minimum shape after gate closure is a strong systems/compiler Q2-equivalent venue.
- Stage semantics: conditional paper-potential screen; this report does not establish the main claim.

## Structural paper potential vs current readiness

- Structural paper potential if successful: a DEX-specific, predecessor-aware constructor that jointly optimizes legal physical layout, final bytes, update bytes, and profile locality, with an exact parameterized Pareto guarantee and stock ART semantics, is a coherent `N2` paper kernel. It is stronger than choosing an R8 flag, ordering input classes, or wrapping a generic differencer.
- Current evidence-acquisition readiness/risk: medium-low. The current writer and collision landscape are finite, but the Discovery contract incorrectly treats an old ART `dexlayout` tree as current, under-specifies R8's current mixed-section actions, conflates DEX emission with dex2oat/dexpreopt deployment controls, and gives no cost-preserving state certificate for the pinned differencer.
- Why missing implementation/results/proof/hardware is or is not structurally fatal: it is not fatal at Stage0. The defect is static contract definition, not missing positive output. One integrated certificate can close it before StageA; failure of that certificate would be scientific failure.

## Discovery provenance

- Opportunity origins: `S3-natural-structure`; predecessor/current-version asymmetry plus legal DEX mixed-section order and alignment.
- Domain tags: Android, DEX, compiler writer, binary layout, incremental update, Pareto optimization, parameterized exact algorithms.
- Paper genealogy: generic delta compression and executable-aware differencing → update-conscious relocation/layout (R2/R3, Courgette) → profile-guided binary/DEX layout (ReDex, R8 startup layout) → mobile patcher studies and stronger differencers (`MDiffPatch`, `sdiff`) → proposed DEX-native joint construction.
- Discovery method revision: `V8_7_PLUS_R5_P0__R7_DORMANT__DISCOVERY_QUALITY_MODE_OFF`.
- Backtest reference and status: none supplied as candidate evidence.
- Reminder: method backtest is calibration, not candidate evidence.

## Frozen object and claim

The object remains an ordinary, non-compact, non-container, single `classes.dex` for each version pair. DEX version, minimum API, logical indexed items, class definitions, code/debug information, annotations, static values, and all reader-visible values are fixed per arm. DEX v041 multi-file containers, compact DEX, multidex repartitioning, identifier reindexing, code rewriting, shrinking, minification, desugaring differences, APK signing identity, external codecs, and custom readers are excluded.

The only admissible candidate action is to choose a legal order for writer-exposed movable mixed-section objects, then let the pinned native DEX writer regenerate offsets, alignment padding, map/header fields, signature, and checksum. Sorted ID tables, class-definition precedence, annotation ordering, alias/dedup identity, and other format-mandated order are immutable. The stock ART reader/verifier/runtime must accept the output. Reflection comparison covers specified values and membership; it must not manufacture a claim about incidental reflection enumeration order.

The narrow claim allowed after revision is:

> For a declared DEX-native action grammar and a pinned deterministic differencer with bounded encoder context, the candidate enumerates exactly the legal writer outputs and returns the exact Pareto frontier for `(final DEX bytes, patch bytes, frozen profile-locality cost)`, with an explicit FPT/exact complexity bound in the declared parameters.

It may not claim unrestricted VCDIFF optimality, arbitrary DEX layout optimality, natural update savings, startup improvement, or superiority over the strongest mobile patcher before evidence exists.

## Positive opportunity map

- Natural workloads: provenance-pinned adjacent versions of the same official AOSP module/product configuration that yield ordinary single-DEX artifacts; the pair must have the same producer/toolchain contract except for the source revision under study.
- Observed or expected cost/headroom: first-party R8 source establishes multiple legal mixed-section layouts driven by startup profiles, while the DEX format makes offsets, alignment and padding layout-sensitive. R2/R3 and Courgette establish the broader mechanism that preserving byte similarity across versions can materially affect update deltas. These are source-grounded opportunity facts, not candidate benefits.
- Mechanism-specific prediction: among current-version items tied under the same profile category and semantic constraints, an ordering that accounts for predecessor bytes and encoder state can differ from default/startup layout and may reduce patch bytes without changing the logical DEX object. Whether this recurs naturally is a StageA hypothesis.

`SOURCE_GROUNDED_NATURAL_OR_FORMAL_OPPORTUNITY_HYPOTHESIS`: on at least one provenance-pinned adjacent ordinary-DEX pair, the current R8 writer grammar admits two stock-ART-equivalent placements that are tied under the strongest current layout policy yet have different exact costs under a pinned current differencer; a DEX-specific bounded-state optimizer can choose the lower-cost placement without increasing the other frozen objectives beyond its Pareto point.

Finite falsifier: statically fail the unique certificate, or in StageA find that the complete current writer/profile/ReDex union reproduces every candidate decision, every native-legal tie has equal exact patch cost, the required state cannot be finite without replacing the declared guarantee/object, or no natural pair survives provenance and same-object checks.

## Named baselines and fairness contract

1. `R8_DEFAULT_MIXED_SECTION_LAYOUT`: pinned R8 producer and `DefaultMixedSectionLayoutStrategy`, with all non-layout transformations frozen identically.
2. `R8_STARTUP_PROFILE_LAYOUT_COMPLETE_GRID`: current public startup-profile input and all relevant default/nondefault startup-layout controls, including mixed-section layout, evaluated on the same frozen logical DEX IR.
3. `REDEX_INTERDEX_FDO_SAME_OBJECT_SUBSET`: a pinned ReDex writer/InterDex configuration restricted to transformations that preserve the frozen logical object; ordinary shrinking, rewriting, metadata removal, multidex repartitioning, or renaming are not same-object baselines.
4. `CURRENT_MOBILE_PATCHER_PORTFOLIO`: xdelta3/VCDIFF, bsdiff, archive-patcher, HDiffPatch and, where reproducibly available, the published `sdiff`/`MDiffPatch` implementations. Every arm receives the identical predecessor and the candidate/current output under the same information. Best-of reporting must include generation and reconstruction costs, not patch bytes alone.

Old ART `dexlayout` is retained as a historical direct subtractor and implementation oracle, not mislabeled as a current Android 17 action. `dex2oat`, dexpreopt and ART compiler filters are downstream matched deployment/cost controls; they are not moves that choose bytes in the shipped `classes.dex`.

## Collision analysis

### Nearest-prior facet matrix

| Work/mechanism | Same exact DEX object | Predecessor-aware layout | Current native writer action | Formal optimizer/guarantee | Full-cost/natural scope | Classification |
|---|---:|---:|---:|---:|---:|---|
| Current R8 startup mixed-section layout | Yes, under frozen non-transforming producer arm | No explicit predecessor objective found | Yes | No comparable exact Pareto guarantee found | Startup-oriented | `DIRECT_SUBTRACT` |
| ReDex InterDex/FDO | Conditional; only restricted writer/layout subset | No explicit patch objective found | Separate current DEX writer | No comparable guarantee found | Natural startup evidence | `DIRECT_SUBTRACT` |
| ART historical `dexlayout` | Yes for its supported ordinary DEX versions | No | No longer present in inspected current ART roots | No | Profile layout | `HISTORICAL_DIRECT_SUBTRACT` |
| R2/R3 relocatable-code update systems | Different embedded executable format/runtime | Yes | No | R3 includes optimal delta construction under its cost model | Natural embedded deployments | `METHODOLOGICAL_ADJACENT` |
| Courgette | Different executable representation | Yes, through symbolic adjustment | No | Heuristic/format-specific | Chrome updates | `METHODOLOGICAL_ADJACENT` |
| Hoag et al., LCTES 2023 | Native-function layout, not DEX mixed sections | Not version-delta aware | LLVM | Principled balanced-partitioning algorithm | Commercial mobile apps | `METHODOLOGICAL_ADJACENT` |
| `MDiffPatch`, INFOCOM 2024 | APK/compressed-file update pipeline | No producer-layout optimization | No | Patcher tradeoff mechanism | Mobile apps/full decode-recompress costs | `DEPLOYMENT_BASELINE` |
| `sdiff`, IEEE TMC 2024 | Mobile application updates | No producer-layout optimization | No | Combined differencing techniques | 200 apps, five cost metrics | `DEPLOYMENT_BASELINE` |

No inspected work completed the exact conjunction of fixed logical ordinary DEX, current writer-realizable mixed-section actions, predecessor-aware joint layout, and an exact parameterized Pareto certificate. This is `SEARCH_BOUNDED_OPEN`, not an absence claim. A later direct collision remains capable of stopping the topic.

### Seed-distance and method-name deletion test

Deleting `DEX-DELTA-PARETODP` and all coined state names leaves a recognizable research problem: jointly order offset-bearing objects in a constrained executable representation so that a current version remains semantically identical while its encoded difference from a predecessor and its profile locality are optimized. R2/R3 and Courgette make the broad concept non-novel; R8/ReDex make ordinary profile layout non-novel. The residual must therefore be the DEX-specific complete action quotient plus exact/FPT Pareto algorithm, not the slogan “reorder for smaller patches.”

Seed distance is adequate only conditionally: Discovery transferred the predecessor-aware opportunity, but the actual algorithm is presently a generic precedence-constrained sequencing idea with an asserted bounded suffix. Without the revision certificate, it is too close to generic ILP/DP plus a VCDIFF call.

## Competing mechanism decision

- Selected mechanism: current-writer-realizable, DEX mixed-section, predecessor-aware exact Pareto construction with a cost-preserving delta-transducer quotient.
- Registered backup: a narrower DEX byte-layout measurement/mechanism paper is not pre-registered as a pivot because it would not preserve the frozen N2 guarantee. N3 may supplement a successful N2 but cannot rescue it.
- Pivot boundary: no automatic pivot. If the certificate collapses to input ordering, a profile-mask search, generic ILP, or post-hoc differencer selection, the current mechanism stops; a changed object or measurement-only question requires a new candidate ID.

## Residual paper kernel

The residual is not a new atomic byte move. It is a new algorithm over current legal writer moves:

1. a complete DEX-native action grammar over the actual pinned writer;
2. a future-action- and cost-preserving quotient whose state contains all DEX alignment/offset/alias obligations and the complete deterministic differencer state needed by the declared bounded model;
3. an exact Pareto enumeration theorem and honest parameterized complexity; and
4. evidence that at least one certified decision is outside the finite current R8/ReDex layout union.

This is potentially nontrivial `N2`. It is not yet statically closed.

## Unique scientific revision gate

The only permitted Stage0 revision is:

`CURRENT_NATIVE_WRITER_ACTION_COMPLETE__BOUNDED_DELTA_TRANSDUCER_BIJECTION_CERTIFICATE`

It is one integrated proposition, not a request for candidate results. The revision must freeze one current R8 commit and one ordinary-DEX writer path, then prove all of the following in one auditable certificate:

1. `A_emit`: every candidate move maps to a concrete R8 mixed-section collection/order consumed by `FileWriter`; all format-mandated order, dedup/alias identity, offset fixups, alignment, signature and checksum behavior are listed. The map neither changes the logical DEX IR nor depends on D8/R8 transformations that alter it.
2. `U_current`: the finite current layout union is complete for the pinned producer—default layout, startup-profile and mixed-section flags/APIs, relevant testing/public hooks, and the same-object ReDex layout subset. Historical ART `dexlayout` and downstream dex2oat/dexpreopt controls are classified separately.
3. `Q_exact`: for a pinned differencer implementation/version and fixed window/hash/tie/secondary-compression settings, equivalent DP states have identical legal suffix actions and identical incremental/final costs. A short byte suffix is insufficient unless proven so; the certificate may use the exact bounded encoder-machine state and must state its size.
4. `bijection+complexity`: DP paths and all `A_emit`-legal outputs are bijective up to declared byte-identical symmetries; the Pareto recurrence is exact and the runtime/memory bound is explicit in DEX frontier width, changed-atom count, alignment state and encoder-context parameters. “Finite because the file is finite,” generic ILP, or identity enumeration alone does not satisfy N2.
5. `static divergence`: one byte-mechanical two-order witness is emitted by the pinned writer model, passes the static DEX legality/equality oracle, preserves fixed output semantics, and has an exact unequal pinned-patcher cost. This proves action divergence only, not natural benefit.
6. `StageA closure`: a finite preclaim gate names the tiny exhaustive native oracle, current-union replay, two provenance-pinned natural pairs, strongest patcher portfolio, and full-cost ledger.

If any conjunct cannot be stated without a custom reader, changed logical object, arbitrary input reordering, generic solver-only contribution, or a weaker non-exact guarantee, the revision outcome must be `BELOW_Q2_STOP` for this ID. No second Stage0 revision is authorized.

## Evidence route

- `PARETO_APPROXIMATION / COMPLEXITY_THEORY / PERFORMANCE`

The admission-bearing route is exact parameterized Pareto construction plus performance validation. Approximation is optional later, but cannot silently replace the frozen exact bounded-context claim.

## Performance-optimization admissibility

- Same-function contract: same predecessor information, same frozen current logical DEX IR, same ordinary DEX version and stock ART semantics; only current physical layout differs.
- Algorithmic delta: a DEX-specific quotient and exact Pareto solver over writer-realizable mixed-section actions.
- Full-cost ledger: profile acquisition/preparation separately; planner CPU/wall/RSS/temp; DEX writer and checksum/signature; final DEX bytes; patch generation CPU/wall/RSS/temp and patch bytes; reconstruction CPU/wall/RSS/temp; package recompression/signing bytes and time reported separately; ART verification/open/class-load/startup CPU/wall/RSS; failures and fallback cost.
- Strong-implementation fairness: pinned builds, identical cores/memory, warm/cold protocol, same predecessor/current information, deterministic seeds, best documented configuration within a finite prespecified grid, and complete failure reporting.
- Generality and failure boundary: ordinary single DEX only; gains may vanish with high churn, tiny files, already canonical order, container DEX, dominant package compression, or a patcher insensitive to legal reorderings.
- Why not routine tuning: only the certified DEX-specific exact quotient/guarantee clears the line. Choosing startup-profile membership, a class order file, VCDIFF window size, or best patcher does not.

## Q1/Q2 paper shape

- Problem: existing Android layout policies optimize startup/locality, while mobile differencers optimize fixed bytes; neither jointly constructs a semantically fixed DEX for an adjacent predecessor under a formal bounded model.
- Contribution: a current-writer-complete DEX action model, exact/FPT Pareto algorithm, and a fidelity-checked implementation.
- Evidence plan: static certificate; tiny exhaustive oracle; strongest current layout and patcher unions; 20–50 provenance-pinned adjacent natural pairs if obtainable after the StageA killer; full costs, paired statistics, ablations, and failure regimes.
- Expected paper narrative: the contribution is a DEX-specific joint optimization layer, not a new patch format. A negative natural result kills the performance paper even if the theorem is correct unless the formal contribution alone reaches venue strength.

## Q1/Q2 shape calibration

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Reference set: Hoag et al. LCTES 2023; Jin et al. INFOCOM 2024; Sun et al. IEEE TMC 2024; Dong et al. IEEE TC 2013/R3 follow-on.
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Contribution-shape gap: current packet lacks the target-specific state theorem and native writer completeness that distinguish it from generic sequencing.
- Evidence-shape gap: no implementation, natural pair result, strongest-union replay, full-cost result, statistics, or artifact; these are StageA/B gaps, not Stage0 fatal by themselves.
- Stage A closure plan: first close the preclaim fidelity gate on a tiny exhaustive oracle and two natural pairs; stop before scale-up if native legality, action residual, or exact-cost equivalence fails.

## Non-relaxable quality audit

- Same-object: definable, but only after separating frozen logical DEX IR from producer transformations and mapping candidate plans to the current writer.
- Latest collision: no `DIRECT_FATAL` found in bounded searches; status remains `SEARCH_BOUNDED_OPEN`. Current R8, ReDex, R2/R3, Courgette, LCTES layout, `MDiffPatch`, and `sdiff` materially narrow the claim.
- Strong fair baselines: finite and nameable after revision; Discovery's “D8/R8 + ART dexlayout + dex2oat” union is not correctly typed.
- Natural input/evidence: plausible but not pinned. “Official tags” alone are not an artifact pair; product/module/toolchain/DEX version and build provenance must be fixed.
- Full-cost: finite and specified above; Discovery omitted the strongest patcher portfolio and blurred package/deployment costs.
- Reproducibility: feasible with source/commit pins, extracted hashes, commands, container/toolchain lock, exact patcher configuration, and raw per-pair records.
- Evidence/claim honesty: no output or benefit is claimed. The old ART source and static witness cannot be presented as current execution or natural savings.

## Evidence path and AI completion

- AI executability class: `AI_CORE_CONDITIONAL`
- Estimated ai_core_fraction: `0.75`
- 72-hour first evidence: after revision acceptance, implement only the preclaim oracle/hook needed to enumerate tiny legal orders, replay default/startup layouts, run one pinned differencer, and validate two natural pairs. No large corpus is needed for the first killer.
- Human-only items and why they are non-decisive: private Google Play telemetry or proprietary signing keys are unnecessary; public AOSP modules, stock ART, R8/ReDex source, and public differencers suffice for the first decisive work.

## Fidelity closure plan audit

- Discovery status: `FINITE_FIDELITY_GAP`
- Complete action and native semantics are finite and same-object: conditionally yes; current R8 exposes the relevant writer collections, but the exact plan-to-writer map and complete current union must be certified.
- Comparator, denominator, full-cost and small-witness plan: finite after adding current mobile patchers and exact encoder settings.
- Why an unimplemented interface/format/checker is or is not structurally fatal: absence of code is not fatal; absence of a static action/state certificate is why revision is required.
- Reminder: Stage 0 audits the plan; Stage A must actually close `PRE_CLAIM_CONTRACT_FIDELITY_GATE` before its first claim-bearing run.

## Independent current upstream reality check

- Frozen upstream commit/tag and check date: inspected `android-17.0.0_r1` ART tag (tag object `fc31298bb626c4b5d53ae3b715c42a2daa802c08`, peeled commit recorded upstream as `b753cf97923c3695338d21466fa14c57b480a59a`, root tree `539d87e9b7c4b00b7f1443cca44578c5b9f6e5b2`) and ART main root tree `688a2326403cce6ce83425b218e3553f2c0ca12e`; R8 main root tree `f5105b3a1a0af3951439b2a81de9a6eb80f37e66`; check date `2026-08-11`. The revision must peel and freeze the exact R8 commit rather than relying on a moving branch/tree observation.
- Current official documentation checked: DEX format; R8 README; ART/ART Service configuration.
- Actual source paths/symbols checked: R8 `MixedSectionLayoutStrategy`, `StartupMixedSectionLayoutStrategy`, `DefaultMixedSectionLayoutStrategy`, `FileWriter`, `StartupOptions`; ART root trees; historical ART `dexlayout` writer/verifier; ReDex repository and InterDex/FDO descriptions.
- Default/non-default flags, thresholds and configurations checked: R8 startup layout optimization defaults on; mixed-section startup layout is controlled by `com.android.tools.r8.startup.layout` and uses startup profile inputs. ART compiler filters (`verify`, `speed`, `speed-profile`) govern verification/AOT deployment, not emitted DEX layout.
- Discovery absence claim confirmed, narrowed or contradicted: contradicted/narrowed. The inspected current ART roots contain no `dexlayout/`; the Discovery “current ART dexlayout tree” link is invalid as a current-native premise. Conversely, current R8 has broader profile-driven mixed-section layout than Discovery's prose captured.
- If contradicted, current native mechanism and finite configuration-grid baseline: R8 default versus startup mixed-section strategy, public startup profile/API and relevant default/nondefault layout controls; restricted ReDex InterDex/FDO arm.
- Any non-tuning residual that remains: predecessor-aware DEX mixed-section joint optimization plus exact cost-preserving quotient, conditional on the unique certificate.

The attempted `git ls-remote` transport failed locally with a Windows credential-provider error. No absence or version inference is drawn from that failure; official first-party Gitiles pages and their displayed trees/tags support the static audit.

## Stage A highest-risk probe plan

- Risk-bearing premise: the exact same-object writer grammar has a current-union residual and admits a tractable future-action/cost quotient for a real deterministic patcher.
- Cheap discriminating probe or counterexample search: exhaustive enumeration of all legal layouts for a tiny DEX with at least two movable clusters and one alignment/offset-threshold interaction; compare candidate DP, byte oracle, current R8 layout grid, stock ART equality, and exact patcher traces.
- Negative result that kills the direction: any missing native action, unequal logical object, non-bijective DP, quotient merge with different future costs, complete current-union reproduction, or lack of any natural legal divergence on the two pinned pairs.
- Positive-result ceiling: preliminary support/non-falsification only; not main-claim proof.

## Stop conditions

- The unique certificate cannot map all candidate actions to one pinned current writer without changing logical IR or reader semantics.
- Current R8/ReDex same-object union directly expresses every candidate decision under the same information and costs.
- The alleged exact state omits source/target window, match-table, address-cache, secondary-compressor, offset/alignment, alias, or tie-breaking history that changes a future legal action or cost.
- Exactness is obtained only by identity enumeration/generic ILP with no DEX-specific complexity or quotient result.
- The byte witness is not format-legal, not same-object, not writer-realizable, or has no exact patch-cost divergence.
- Natural carriers require container DEX, multidex repartition, custom reader, producer rewrite, or incomparable build/signing pipelines.
- Strong mobile patcher/full-cost comparisons leave no meaningful residual, or a later direct same-object paper collision is found.

## Dual-axis score

- Academic value: `51/70` (importance 12/15; N2 clarity/nontriviality 12/20; latest-work increment 10/15; baseline/cost/venue fit 8/10; falsifiability/evidence route 9/10).
- AI executability bonus: `25/30` (same-object artifacts/baselines 8/10; core implementation/comparison fraction 8/10; bounded killer/replay 9/10).
- Total: `76/100`

Scores rank the conditional opportunity and do not override the revision gate.

## Stage0 repair vector

`OMITTED_CURRENT_SAME_OBJECT; OMITTED_FIRST_PARTY_FEATURE; OMITTED_GENERIC_KERNEL; ATOMIC_ACTION_UNCLEAR; NATURAL_CARRIER_GAP; FULL_COST_GAP; Q2_SHAPE_GAP`

Material repairs: current ART `dexlayout` was incorrectly inherited as current; current R8 mixed-section layout was under-audited; deployment controls were mixed into emission actions; the predecessor suffix was not proven cost-sufficient; strongest 2024 mobile patchers and the older update-conscious relocation genealogy were missing from the decisive comparison.

## Human research reserve

Not applicable. The core certificate, writer hook, oracle, public corpus preparation, and comparisons are AI-executable after mainline authorizes the revision.

## User-action blocker

Not applicable. No resource failure prevents the static revision.
