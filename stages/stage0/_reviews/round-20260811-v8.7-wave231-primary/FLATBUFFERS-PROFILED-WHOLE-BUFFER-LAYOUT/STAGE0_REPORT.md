# FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT Stage 0 PRIMARY Report

- Lane id: `LONG_LIVED_STAGE0_PRIMARY_D_ROOT`
- Assignment id: `STAGE0-P2-20260811-FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT-PRIMARY-V8.7`
- Input freeze SHA-256: Discovery handoff `F676A65B20AB1675FD8259D41AAB692FE6EE53398A25A6A728D41202B3179F8A`; the other four admitted file hashes are recorded in `SOURCE_AUDIT.md`.
- Cross-assignment contamination declaration: `false`; only the five assigned Discovery files, project controls/templates, and independently retrieved official/primary sources were used.
- Decision: `REVISE_ONCE`
- Quality tier: `TIER_B_Q2_VIABLE` only as conditional structural potential; this is not a Stage 0 PASS.
- Confidence: `0.89`
- Evidence ceiling: `STAGE0_STATIC_NATIVE_FEASIBLE_ACTION_ONLY__NO_ACTION_COMPLETE_DP_CERTIFICATE__NO_PERFORMANCE_OR_NOVELTY_CLAIM`
- Novelty route: `N2`
- Candidate Q1 venue family: systems/data-management or PL implementation venues; present shape is Q2-conditional rather than Q1-ready.
- Stage semantics: conditional paper-potential screen; this report does not establish the main claim.

## Structural paper potential vs current readiness

- Structural paper potential if successful: a profile-guided optimizer over the complete set of stock-reader-equivalent FlatBuffers construction actions, with an exact/FPT or certified-approximation result and whole-pipeline evidence, can be a nontrivial N2 paper.
- Current evidence-acquisition readiness/risk: `FINITE_FIDELITY_GAP`. The same object and natural carrier are finite, but the claimed DP state is not sufficient for current global reuse/history semantics and the supplied two-buffer text is not a byte-level certificate.
- Why missing implementation/results/proof/hardware is or is not structurally fatal: none is required at Stage 0. The revision is required because the static proposition itself is incomplete, not because it has not yet been run.

## Discovery provenance

- Opportunity origins: serialization bottleneck transfer; profile-guided locality; current native action composition.
- Domain tags: `SERIALIZATION`, `ZERO_COPY_READ`, `DATA_LAYOUT`, `PROFILE_GUIDED_OPTIMIZATION`, `DYNAMIC_PROGRAMMING`.
- Paper genealogy: FlatBuffers backward construction and zero-copy access; profile-guided data/code placement; cache-conscious object layout; exact scheduling/DP.
- Discovery method revision: `S2-bottleneck-transfer / wave231`.
- Backtest reference and status: not supplied as candidate evidence; method calibration is not used to support the decision.
- Reminder: method backtest is calibration, not candidate evidence.

## Frozen object and claim

The object must be a fixed schema, fixed identity-labelled rooted table DAG, fixed scalar/string/vector values, fixed root, fixed generated C++ stock reader and verifier configuration, fixed file identifier and size-prefix choice, and fixed access-profile input. Alias identity is frozen because stock C++ callers can observe equal offsets/pointers; value-equal but originally distinct tables may not be merged. Logical vector element order and keyed-vector semantics remain fixed.

The only admissible revised claim is:

> Given that fixed object and an action-complete catalog of legal C++ `FlatBufferBuilder` operations, compute a verifier-accepted, stock-reader-equivalent buffer minimizing a declared profile-weighted static layout cost plus byte cost. Provide an explicit finite state/recurrence that accounts for global reuse history and alignment, and prove exactness/FPT (or a stated certified bound) against an explicit exhaustive native-composition oracle on the same information.

No schema rewrite, reader change, post-compression, external codec, value change, vector permutation, or profile-informed comparator disadvantage is allowed.

## Positive opportunity map

- Natural workloads: official LiteRT/TFLite `.tflite` FlatBuffer models and official FlatBuffers examples with repeated tables/strings and selective access paths.
- Observed or expected cost/headroom: no candidate result exists. FlatBuffers' zero-copy access makes physical placement plausibly relevant, but the magnitude and stability are hypotheses.
- Mechanism-specific prediction: plans that move frequently first-touched descendants closer to the root/access frontier may reduce touched cache lines or first-access latency, subject to padding, buffer growth, vtable/string reuse, and planning/profile costs.

## Named baselines and fairness contract

1. Pinned stock generated object-API `Pack`/generated create order with matching builder/verifier settings.
2. Manual stock builder with caller order, all legal independent-child orders where feasible, default and non-default vtable dedup, explicit `CreateSharedString`/schema `shared`, explicit reuse of already-built offsets when the frozen graph aliases them, `force_defaults`, allocator/initial-size/buffer-min-alignment controls, identifier and size-prefix finalization.
3. Profile-informed `hot-first` and stable caller-order heuristics with identical profile and planning budget accounting.
4. Tiny explicit exhaustive enumerator over the complete native action catalog; it is an oracle for correctness, not a deployable universal baseline.
5. The revised DP/FPT candidate.

All use identical schema/object/profile split, generated reader, verifier limits, warm/cold protocol, and full-cost denominator. Complete native composition is not itself a scientific STOP: the candidate must still differ in solver complexity, scalability, solution guarantee, or online information/cost.

## Collision analysis

### Nearest-prior facet matrix

| Work/facet | Same FlatBuffers wire object | Profile-guided placement | Complete native action optimizer | Formal guarantee | Disposition |
|---|---:|---:|---:|---:|---|
| FlatBuffers upstream/docs | yes | no located | exposes actions, no located optimizer | no | current mechanism/comparator, not novelty |
| Cache-conscious structure layout/definition | no; changes in-memory layout | yes/affinity-guided | no | algorithmic placement methods | methodological neighbor |
| Profile-guided code positioning | no; code rather than serialized object | yes | no | ordering heuristic/algorithm | generic-kernel neighbor |
| EverParse | different formats and verified parser generation | no | no | formal parser/serializer properties | evidence-shape anchor, changed object |
| Zerializer | different serialization/offload design | no | no | no comparable native-layout DP | domain neighbor, changed object |

The bounded search through 2026-08-11 did not close an exact same-object collision. This is `SEARCH_BOUNDED_OPEN`; search or transport failure is not an absence inference.

### Seed-distance and method-name deletion test

Deleting “FlatBuffers” leaves a generic precedence-constrained profile-guided layout/scheduling problem. The residual becomes candidate-specific only if the revision proves that backward offsets, alignment, exact vtable/string reuse histories, alias identity, generated/vector constraints, and Finish semantics induce a nontrivial state/decomposition or guarantee. Without that certificate, the current text is generic subset scheduling plus emitter engineering.

## Competing mechanism decision

- Selected mechanism: global-reuse-aware bounded-frontier DP/FPT over an action-complete native catalog.
- Registered backup: bounded-frontier branch-and-bound/A* using the same state and an admissible lower bound, only as a validation/oracle route; it is not an automatic mechanism pivot.
- Pivot boundary: any replacement must preserve the fixed object, metric, workload, action catalog and guarantee class. Dropping global native actions, changing schema/reader, or becoming an uncertified hot-first heuristic is outside this topic.

## Residual paper kernel

The current union already contains both caller orders in the Discovery example. Therefore the residual is not a new construction action. It is a potentially new solver/guarantee for selecting and composing existing legal actions under FlatBuffers-specific global state. That N2 kernel remains finite but is not yet statically certified.

## Evidence route

- `PERFORMANCE / COMPLEXITY_THEORY`

## Performance-optimization admissibility

- Same-function contract: identical logical values and alias relation, schema, root, stock generated reader/verifier, file identifier/size-prefix, and access trace distribution.
- Algorithmic delta: exact/FPT or certified optimization of the whole legal construction plan, not a new builder knob.
- Full-cost ledger: profile collection/amortization, planner time/RSS, builder time/RSS/reallocations, final bytes, temporary memory, verification, mmap/load, reader latency, cache/TLB counters, and end-to-end latency/throughput.
- Strong-implementation fairness: same compiler/toolchain, pinned FlatBuffers source, same allocator/initial capacity/alignment and builder reuse policy, identical profile information, and complete current native composition.
- Generality and failure boundary: expected only where access skew and legal layout freedom exceed planner and padding costs; flat profiles, high reuse-history width, high arity, small buffers, or verifier/build overhead domination are explicit failures.
- Why not routine tuning: only a formal action-complete solver with a nontrivial state/guarantee and natural full-cost evidence qualifies. Caller order, hot-first, parameter search, or local padding/packing alone does not.

## Q1/Q2 paper shape

- Problem: current FlatBuffers lets callers choose several layout-affecting construction actions but provides no located profile-guided whole-buffer optimizer.
- Contribution: a same-object complete-action optimizer plus FlatBuffers-specific exact/FPT/certified result and fidelity checker.
- Evidence plan: byte-exact exhaustive equivalence on tiny objects, stock verifier/reader parity, official LiteRT/TFLite and a second natural corpus, strongest native union, full-cost measurements, ablations and failure boundaries.
- Expected paper narrative: flexible zero-copy formats expose hidden placement decisions; a formally characterized native action space can be optimized without changing the reader or wire object.

## Q1/Q2 shape calibration

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Reference set: Cache-Conscious Structure Layout/Definition (PLDI 1999), EverParse (USENIX Security 2019), Zerializer (HotOS 2021), plus FlatBuffers upstream as current mechanism evidence.
- Status: `PARITY_CONDITIONAL`
- Contribution-shape gap: the FlatBuffers-specific state and non-generic algorithmic theorem are unclosed.
- Evidence-shape gap: no natural-corpus, full-cost, strongest-union, or reproducibility evidence yet; this is acceptable only as a finite Stage A plan.
- Stage A closure plan: first close the preclaim static/executable action catalog and tiny exhaustive oracle equivalence; only then observe any performance claim.

## Non-relaxable quality audit

- Same-object: conditionally closable; revision must freeze alias identity and prohibit vector/logical reorder or value-equal table merging.
- Latest collision: `SEARCH_BOUNDED_OPEN`; no exact direct collision was established, and no absence claim is made.
- Strong fair baselines: specified, but action completeness must be mechanically certified.
- Natural input/evidence: official LiteRT/TFLite is a valid carrier; a second natural corpus is still required.
- Full-cost: ledger is finite but not yet instantiated.
- Reproducibility: pinned source, schema/object corpus, profile split, planner seed/config, byte checker and scripts are finite.
- Evidence/claim honesty: current evidence proves only legal action availability; it proves neither speedup, natural benefit, novelty, nor DP exactness.

## Evidence path and AI completion

- AI executability class: `AI_CORE_EXECUTABLE`
- Estimated ai_core_fraction: `0.88`
- 72-hour first evidence: static catalog, corrected source pin, exact tiny enumerator design, byte maps for the two-order witness, recurrence/state audit, and fail-closed verifier/reader parity contract.
- Human-only items and why they are non-decisive: venue choice and final scientific interpretation; neither blocks the first killer gate.

## Fidelity closure plan audit

- Discovery status: `FINITE_FIDELITY_GAP`
- Complete action and native semantics are finite and same-object: yes, if revision includes the full C++ builder/reader catalog and alias/vector constraints.
- Comparator, denominator, full-cost and small-witness plan: finite, but the supplied certificate contains no byte arrays/offset table or objective arithmetic.
- Why an unimplemented interface/format/checker is or is not structurally fatal: not fatal at Stage 0; the missing static state/exactness certificate is the revision reason.
- Reminder: Stage 0 audits the plan; Stage A must actually close `PRE_CLAIM_CONTRACT_FIDELITY_GATE` before its first claim-bearing run.

## Independent current upstream reality check

- Frozen upstream commit/tag and check date: release tag `v25.12.19`; annotated tag object `282dcb1c3266b45600510da4810092f6ec4c85f2`; peeled source commit `7e163021e59cca4f8e1e35a7c828b5c6b7915953`; checked 2026-08-11. Current official Git mirror master was `81edeb17d9118143f2c81caf27edfb0df401279e` (2026-06-18). The later release label `v25.12.19-2026-02-06-03fffb2` was also inspected as a release boundary.
- Current official documentation checked: C++ builder/object API, schema/shared strings, internals, verifier, file identifier/size-prefix, releases, and official LiteRT conversion/schema route.
- Actual source paths/symbols checked: `include/flatbuffers/flatbuffer_builder.h` (`FlatBufferBuilder`, `StartTable`, `EndTable`, `CreateSharedString`, vector creation, `ForceDefaults`, `DedupVtables`, `Finish`, `FinishSizePrefixed`, allocator/release/reset paths); `include/flatbuffers/verifier.h`; generated `Pack`/`UnPack` documentation.
- Default/non-default flags, thresholds and configurations checked: initial size, allocator ownership, buffer minimum alignment, default vtable dedup, `force_defaults`, shared-string pool, builder reset/reuse, identifier/size-prefix, verifier depth/table limits, keyed sorted-vector helper.
- Discovery absence claim confirmed, narrowed or contradicted: `NARROWED`. No current profile-guided optimizer was located, but the two child orders are already native caller actions, so the witness is not an action gap beyond the union. Discovery also mislabeled the annotated tag object as the source commit.
- If contradicted, current native mechanism and finite configuration-grid baseline: arbitrary legal independent-subobject construction order plus the native controls listed above; complete enumeration is finite on tiny instances.
- Any non-tuning residual that remains: solver complexity/guarantee for choosing a globally valid plan under reuse/alignment/history state.

## Unique scientific revision gate

`NATIVE_ACTION_COMPLETE__GLOBAL_REUSE_AWARE_FLATBUFFERS_LAYOUT_CERTIFICATE`

The one allowed revision must deliver a single auditable static certificate that:

1. corrects the release pin and freezes the same object including alias identity, vector order, key semantics, identifier/prefix and verifier limits;
2. enumerates every layout-relevant native action/configuration and states which are fixed versus optimized;
3. defines the objective with unambiguous byte endpoints and tie-breaking;
4. gives a sufficient DP/FPT state and recurrence covering buffer position/alignment, exact vtable history, shared-string/reuse history, alias availability and dependency/frontier constraints, with honest complexity parameters;
5. proves a bijection between DP paths and all native-legal plans, or states and proves a certified approximation bound;
6. supplies a byte-level, stock-builder-realizable witness: exact buffers/offset maps, verifier/reader equality, and objective arithmetic; and
7. separates the deployable solver from the exhaustive tiny oracle and explains the non-generic FlatBuffers-specific kernel.

This is one atomic proposition, not a request for implementation, native output on a corpus, or positive performance. Failure because the required state collapses to unrestricted generic ordering/packing, cannot represent the complete native union, or changes the object is scientific STOP material. Successful closure permits confirmation review.

## Stage A highest-risk probe plan

- Risk-bearing premise: the revised state is sufficient and materially smaller/more structured than brute-force native plan enumeration.
- Cheap discriminating probe or counterexample search: before any natural benchmark, exhaust all tiny identity-labelled DAGs/configurations within fixed bounds and compare solver optimum, byte layout, verifier/reader parity and objective to the explicit native oracle.
- Negative result that kills the direction: any legal native plan omitted, any DP path that is not native-realizable, alias/vector semantics change, or no non-generic guarantee/complexity residual.
- Positive-result ceiling: preliminary support/non-falsification only; not main-claim proof.

## Stop conditions

- Exact current-source or paper collision with the same-object complete-action optimizer and comparable guarantee.
- Required optimization merges distinct identities, reorders logical vectors, changes schema/reader/format, or omits decisive native actions.
- Claimed DP state is not sufficient for global reuse/alignment histories and no finite corrected certificate exists.
- Residual is only caller order, hot-first, local padding/packing, allocator tuning, or emitter engineering.
- Full-cost natural evidence cannot beat the strongest same-information native union after a faithful Stage A/B route.

## Dual-axis score

- Academic value: `49/70`
- AI executability bonus: `25/30`
- Total: `74/100`

The hard static-certificate gap overrides the numerical score and requires revision.

## STAGE0_REPAIR_VECTOR

`OMITTED_FIRST_PARTY_FEATURE + OMITTED_GENERIC_KERNEL + ATOMIC_ACTION_UNCLEAR + FULL_COST_GAP`

Material repairs are: annotated-tag versus peeled-commit provenance; vector/keyed-vector and alias-identity constraints; the fact that both witness orders are already in the native union; and global reuse-history state omitted from the claimed local DP.

## Human research reserve

Not applicable.

## User-action blocker

Not applicable; no resource failure was used as scientific evidence.
