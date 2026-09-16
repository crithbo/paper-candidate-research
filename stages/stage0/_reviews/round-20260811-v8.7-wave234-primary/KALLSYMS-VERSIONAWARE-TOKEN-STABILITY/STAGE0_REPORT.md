# KALLSYMS-VERSIONAWARE-TOKEN-STABILITY Stage 0 Report

- Lane id: `STAGE0-BATCH-GATE-PRIMARY`
- Assignment id: `STAGE0-P1-20260811-KALLSYMS-VERSIONAWARE-TOKEN-STABILITY-PRIMARY-V8.7`
- Input freeze SHA-256: brief `3BF8B7737428D4C9274A413E604ABCAB5B84EE137820B94C825BC9451D2B5128`; source handoff `61753999C64164EF187304717C0DDE5021A310F7865C99B9C231B5E6CB2D6363`; source manifest self `05B47AEC024ABBEFA8965F61BE3E0036547E5C6DC3E5DB31D796A2E6AA46CB6D` (7/7 verified)
- Cross-assignment contamination declaration: no scientific conclusion, score, or state was inherited from another candidate or from the Discovery recommendation.
- Decision: `REVISE_ONCE`
- Quality tier: `TIER_B_Q2_VIABLE` conditional on one atomic gate
- Confidence: `0.88`
- Evidence ceiling: `CURRENT_SOURCE_AND_STATIC_DESIGN_REVIEW_ONLY`
- Novelty route: `N2`
- Candidate Q1/Q2 venue family: software systems, systems compression, and reproducible systems optimization; Q2 is the credible current target, not Q1 parity.
- Stage semantics: conditional paper-potential screen; this report does not establish the main claim.

## Structural paper potential vs current readiness

- Structural paper potential if successful: a decoder-preserving, version-conditioned constructor for the native Linux kallsyms representation could form a credible Q2 N2 paper if it has a deterministic bounded action frontier, an exact or certified optimization guarantee over that frontier, and a held-out full-cost residual beyond stock construction plus a strong binary delta.
- Current evidence-acquisition readiness/risk: medium-low but finite. Current upstream code, the reader contract, configuration surface, and the multi-pass link consistency check are auditable. Official tags and build inputs are obtainable. The missing item is not a performance result; it is a static contract certificate showing that the proposed frontier contains more than arbitrary encoder variants while remaining legal at the native link fixed point.
- Why missing implementation/results/proof/hardware is not structurally fatal: no special hardware is needed and the route is CPU/build based. Stage 0 does not require an implementation or positive result. The present `REVISE_ONCE` is caused by an underdefined algorithm/object boundary, not by absent measurements.

## Discovery provenance

- Opportunity origins: natural cross-version stability in a kernel-resident compressed name representation.
- Domain tags: Linux build/link, compact string dictionaries, binary delta, versioned artifacts, systems software.
- Paper genealogy: Linux's stock byte-pair-style token optimizer -> generic source/target delta formats and executable-aware deltas -> proposed native representation co-design across adjacent releases.
- Discovery method revision: frozen v8.7 Discovery assignment; its proposal is treated only as input.
- Backtest reference and status: none used as candidate evidence.
- Reminder: method backtest is calibration, not candidate evidence.

## Frozen object and claim

The intended same object is one fixed architecture, `.config`, compiler/binutils set, build environment, and ordered chain of adjacent official Linux tags. For each tag the candidate may change only the legal construction of `kallsyms_names`, markers, token table/index, offsets and name-order auxiliary arrays consumed by the unchanged in-kernel reader. Symbol inclusion, type/name values, native lookup behavior, and the final normalized `System.map` relation remain unchanged.

The review found one unresolved ambiguity that prevents immediate PASS: `scripts/link-vmlinux.sh` does not treat a supplied symbol map as an immutable offline input. It links a dummy table, regenerates kallsyms, relinks after addresses move, may run an extra pass when the kallsyms object size changes, and finally rejects a `System.map` mismatch. Therefore a different representation length/content participates in the native address fixed point. The candidate cannot claim same-object by encoding a previously frozen map and splicing the result after the native link.

The narrow acceptable claim is:

> Under the pinned native multi-pass link contract, choose a deterministic bounded family of decoder-legal kallsyms encodings and a predecessor-conditioned path through that family that minimizes a declared image/delta/build objective, while every selected representation converges to and verifies the same final symbol semantics as stock.

This can be made coherent by, for example, a native fixed-point-preserving frontier (including size/layout-neutral alternatives when equality to the stock map requires them). Whether such a nontrivial frontier exists is the atomic revision question.

## Positive opportunity map

- Natural workloads: 20--50 chronologically adjacent official Linux tags, one frozen production-like configuration and toolchain, with immutable tag/tree/config/toolchain manifests.
- Observed or expected cost/headroom: evidence establishes that current kallsyms construction is current-version-only greedy token profit. It does **not** establish that cross-version delta headroom exists. Headroom is a Stage A hypothesis.
- Mechanism-specific prediction: adjacent releases retain many symbol substrings and token-table entries; among locally comparable legal encodings, preserving predecessor-compatible token identities/order may reduce source-to-target delta cost enough to offset any allowed local cost.

## Named baselines and fairness contract

1. **Pinned stock Linux constructor**: the current `scripts/kallsyms.c` greedy global two-byte token-profit construction, under the exact same tag/config/toolchain and full native link flow.
2. **Stock plus VCDIFF**: generate the exact stock artifacts independently and delta them with one frozen RFC 3284-compatible implementation/configuration using the same predecessor bytes.
3. **Stock plus a second strong binary-delta implementation**: a pinned `bsdiff`-class or equivalent implementation, with parameters and CPU/RSS charged; it prevents a conclusion tied to one VCDIFF encoder.
4. **Finite predecessor-stability heuristic**: reuse/preserve predecessor token identities where legal and compare a finite weight/settings grid. This is a necessary direct subtractor for the proposed DP, not merely an ablation.

Courgette is a methodological/deployment negative control because it transforms executable address structure before differencing; it is not an equal-object kallsyms encoder. FSST is a symbol-table construction neighbor but changes the decoder/format and is not a legal baseline. Neither may be used to weaken the four same-function controls above.

All methods receive the same predecessor/current build inputs. Full cost includes map extraction, every native link/kallsyms pass, candidate generation, delta construction, verification, build CPU and peak RSS, image and delta bytes, decoder/boot and lookup costs, plus failure and fallback.

## Collision analysis

### Nearest-prior facet matrix

| Work/source | Exact object | Action/goal | Guarantee/cost | Classification |
|---|---|---|---|---|
| Current Linux `scripts/kallsyms.c` | same per-tag native representation | greedy current-only two-byte token substitutions | native reader and link integration | `DIRECT_SUBTRACT` |
| Current Linux link/reader | same native deployment | multi-pass fixed point, table expansion, lookup and map verification | exact deployment semantics | `DEPLOYMENT_BASELINE` |
| RFC 3284 / VCDIFF | arbitrary source/target byte strings | delta instruction selection/encoding | generic decoder, delta size/time | `DIRECT_SUBTRACT` as composition |
| Courgette | executable update bytes | normalize address structure, then binary diff | inverse transform and patch | `METHODOLOGICAL_ADJACENT`; different executable/reader contract |
| FSST, PVLDB 2020 | string collections | static symbol-table construction | fast random access/decode | `METHODOLOGICAL_ADJACENT`; different grammar/decoder |
| 2026 kallsyms line-info delta patches | source-line tables, not symbol-name token stream | block/ULEB128 delta coding | lookup-preserving line-info reduction | `CURRENT_NEIGHBOR`, not same object |

No first-party source or paper found in the bounded search directly claims a native-link-fixed-point, predecessor-aware kallsyms token-table/name-stream constructor with the proposed guarantee. Status remains `SEARCH_BOUNDED_OPEN`, not an absence proof.

### Seed-distance and method-name deletion test

After deleting the label “version-aware token stability,” the residual is still identifiable: choose among multiple native decoder-legal representations of the same symbol relation so that current artifact cost and predecessor-to-current patch cost are jointly optimized. That is distinguishable from post-hoc delta wrapping. However, deleting the proposed DP name exposes the current defect: Discovery has not specified how the finite frontier is generated or why its state is sufficient. Without that certificate the proposal collapses to a meta-selector over arbitrary encodings.

## Competing mechanism decision

- Selected mechanism: native-link-fixed-point-preserving bounded frontier plus predecessor-conditioned exact path optimization.
- Registered backup: a deterministic predecessor-stable token-assignment heuristic is an ablation/baseline, not an alternative paper mechanism.
- Pivot boundary: changing symbol selection, final symbol/address semantics, reader grammar, lookup behavior, kernel format, or optimizing only an external delta artifact requires a new topic ID. A generic binary-delta preprocessor or arbitrary beam search is not a permissible mechanism pivot.

## Residual paper kernel

The residual is not “apply VCDIFF to kernels.” It is a Linux-specific representation constructor whose legal actions are constrained by the stock token expansion grammar and native iterative link semantics, and whose objective includes both in-image representation and predecessor patchability. A publishable N2 requires:

- a complete deterministic frontier construction rather than an opaque candidate list;
- a sufficient target-specific state and exact/FPT/certified-frontier guarantee with honest complexity;
- a static legal divergence witness at the native link fixed point;
- a natural held-out residual against the named same-information union.

## Evidence route

- `PERFORMANCE`
- `PARETO_APPROXIMATION`
- `COMPLEXITY_THEORY` for the bounded frontier guarantee

## Performance-optimization admissibility

- Same-function contract: unchanged stock decoder/lookup and final normalized symbol relation; no post-link splice or changed reader.
- Algorithmic delta: predecessor-conditioned construction of the native token table/name stream over a declared bounded family.
- Full-cost ledger: image/kallsyms bytes, delta bytes, all generation/link/delta/verify CPU and peak RSS, link-pass count, boot/lookup CPU-RSS, semantic equality, and fallback.
- Strong-implementation fairness: current Linux constructor and two frozen binary delta engines; predecessor-stability heuristic receives identical information.
- Generality and failure boundary: official adjacent tags under one pinned architecture/config/toolchain. Conclusions do not extend to arbitrary configurations, modules, or non-kallsyms sections.
- Why not routine tuning: only if the revision supplies a finite state/transition construction and guarantee. A scalar weight, token-profit bonus, beam width, or delta-tool parameter grid is routine tuning and triggers the failure sentinel.

## Q1/Q2 paper shape

- Problem: repeated kernel releases independently optimize an in-image dictionary while deployments distribute version-to-version patches.
- Contribution: a native-semantics-preserving representation constructor that jointly accounts for local and cross-version cost.
- Evidence plan: static optimality/certificate checks on small instances; 20--50 official tags; named equal-information baselines; exact reader/map verification; full-cost accounting and chronological held-out evaluation.
- Expected paper narrative: current construction and fixed-point constraints -> target-specific bounded state -> action divergence -> natural prevalence/headroom -> end-to-end trade-off and failure boundary.

## Q1/Q2 shape calibration

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Reference set: FSST (PVLDB 2020), VCDIFF engineering (USENIX ATC 2002), REBL (USENIX ATC 2004), with Courgette as a non-peer-reviewed deployment boundary source.
- Status: `PARITY_NOT_PLAUSIBLE` for Q1 at current readiness; conditional Q2 shape remains plausible.
- Contribution-shape gap: the native frontier/state/guarantee is not yet closed.
- Evidence-shape gap: no natural chain measurement, held-out residual, or artifact yet; these are Stage A/B matters, not the reason for revision.
- Stage A closure plan: first close contract fidelity and one small exact oracle; then execute the finite official-tag killer before scaling.

## Non-relaxable quality audit

- Same-object: conditionally definable, but native link fixed-point preservation is not yet certified.
- Latest collision: current official source plus bounded primary-source/paper search completed; `SEARCH_BOUNDED_OPEN`.
- Strong fair baselines: finite named union specified; Discovery's single generic “VCDIFF/binary delta” label was strengthened with a second engine and predecessor-stability control.
- Natural input/evidence: official adjacent tags are natural and finitely obtainable; no positive evidence claimed.
- Full-cost: required dimensions are complete, including link-pass feedback and semantic fallback.
- Reproducibility: tags/config/toolchain, source commits, delta implementations/configs, manifests, commands and outputs can be hashed; route is finite.
- Evidence/claim honesty: source evidence supports only the current mechanism boundary and feasibility of the audit route.

## Evidence path and AI completion

- AI executability class: `AI_CORE_EXECUTABLE`
- Estimated ai_core_fraction: `0.88`
- 72-hour first evidence: after revision closure, use two small adjacent-tag builds and a synthetic-but-native legal map only as an oracle check; then sample natural tag pairs. Verify every frontier member through the unchanged generator/assembler/link/map path before comparing delta costs.
- Human-only items and why they are non-decisive: venue choice and final research judgment; neither blocks the finite technical route.

## Fidelity closure plan audit

- Discovery status: `FINITE_FIDELITY_GAP`
- Complete action and native semantics are finite and same-object: potentially yes, but only after the frontier is defined inside the multi-pass link fixed point.
- Comparator, denominator, full-cost and small-witness plan: finite and auditable as specified above.
- Why an unimplemented interface/format/checker is not structurally fatal: the stock source and reader are open and the candidate changes only the build-time constructor. The unresolved item is a static scientific definition, not resource availability.
- Reminder: Stage 0 audits the plan; Stage A must actually close `PRE_CLAIM_CONTRACT_FIDELITY_GATE` before its first claim-bearing run.

## Independent current upstream reality check

- Frozen upstream commit/tag and check date: Discovery pin `d58772d8520c7ef247c4b95c9bd76d3a25da9ff5`; independently checked on 2026-08-11 against current official GitHub source paths. Exact pinned-blob web retrieval was intermittently unavailable, so no absence inference relies on that transport failure.
- Current official documentation checked: current `init/Kconfig`; Linux kallsyms source and link flow; current kallsyms line-info documentation as a distinct adjacent feature.
- Actual source paths/symbols checked: `scripts/kallsyms.c::{find_best_token,optimize_result,optimize_token_table,sort_symbols}`, `kernel/kallsyms.c::{kallsyms_expand_symbol,kallsyms_lookup_name}`, `scripts/link-vmlinux.sh::{kallsyms,sysmap_and_kallsyms}` and final `cmp`.
- Default/non-default flags, thresholds and configurations checked: `CONFIG_KALLSYMS` defaults on; `CONFIG_KALLSYMS_ALL` is a non-default wider symbol-set mode; `CONFIG_KALLSYMS_SELFTEST` defaults off; generator options are `--all-symbols` and `--pc-relative`; `KALLSYMS_EXTRA_PASS` is a debug/workaround build variable. These are fixed object dimensions, not candidate tuning knobs.
- Discovery absence claim confirmed, narrowed or contradicted: narrowed. Current source lacks predecessor-aware token construction, but the action gap must be defined at the link fixed point, not at a detached map encoder.
- If contradicted, current native mechanism and finite configuration-grid baseline: not contradicted by a native version-aware constructor; current per-version greedy optimizer remains the strongest native local baseline.
- Any non-tuning residual that remains: a fixed-point-preserving, target-specific bounded frontier and exact/certified predecessor-conditioned path algorithm.

## Atomic revision gate

- Gate id: `NATIVE_LINK_FIXED_POINT_PRESERVING_FRONTIER_DIVERGENCE`
- Single proposition: under one pinned tag-pair/config/toolchain/native-link contract, a deterministic bounded kallsyms frontier contains at least two fully native legal representations with identical final stock symbol semantics; its sufficient predecessor state and recurrence give an exact or certified-frontier optimum, and one static two-version witness selects a different legal representation than current-only stock because the declared image-plus-delta objective is lower.
- Required static closure:
  1. define whether deployment is an offline jointly rebuilt chain or an online fixed-predecessor transition;
  2. define frontier generation, state, transitions, legality, base/terminal cases and complexity;
  3. bind every frontier member to the native multi-pass link, including object-size/address feedback and final map check;
  4. give one explicit legal two-version witness with byte accounting under a frozen delta encoder, not only symbolic inequalities;
  5. map every action to the four strongest controls and state the residual guarantee.
- Falsifiers: no two distinct representations survive the native map/fixed-point contract; the frontier is an arbitrary list/beam/grid; the recurrence depends on future/unavailable information under the chosen deployment mode; the witness changes mapping/reader or uses a post-link splice; the residual is only a scalar token-profit weight or generic binary-delta parameter search.
- Failure sentinel: `BELOW_Q2_STOP__DETACHED_MAP_ENCODER_OR_GENERIC_DELTA_TUNING`
- Revision budget if confirmation agrees: `1/1`.

## Stage A highest-risk probe plan

- Risk-bearing premise: native legal representation freedom remains after final map/fixed-point equality, and it changes patch cost in a way the current constructor plus equal-information deltas cannot reproduce.
- Cheap discriminating probe or counterexample search: enumerate all legal token choices for a tiny real-format symbol set, run the exact native emission/link consistency path, and compare stock, stability heuristic and candidate objective with a frozen delta implementation.
- Negative result that kills the direction: all legal same-map alternatives are byte-identical/equivalent under the delta objective; no bounded sufficient state exists; or the best candidate is reproduced by routine weight/parameter tuning.
- Positive-result ceiling: preliminary support/non-falsification only; not main-claim proof.

## Stop conditions

- revision gate falsified;
- direct same-object work found before Stage A that covers object, action, guarantee, natural evidence and full cost;
- stock plus the named deltas and predecessor-stability heuristic express the complete candidate action at equal information/cost;
- any semantic/map mismatch, changed reader, changed symbol set, or post-link-only artifact;
- no held-out image/delta/build Pareto residual after complete full-cost accounting.

## Dual-axis score

- Academic value: `45/70`
  - importance/opportunity 8/15
  - N2 clarity/nontriviality 12/20
  - increment over recent work 10/15
  - baseline/cost/venue fit 7/10
  - falsifiability/boundary/evidence route 8/10
- AI executability bonus: `27/30`
  - same-object artifacts/baselines 9/10
  - claim-critical AI implementation/comparison 9/10
  - bounded high-information probes/replay 9/10
- Total: `72/100`

## Stage0 repair vector

- `ATOMIC_ACTION_UNCLEAR`
- `FULL_COST_GAP`
- `Q2_SHAPE_GAP`

These identify what the single revision must close; they do not inherit or alter the scientific decision.
