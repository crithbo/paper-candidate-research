# V8-SNAPSHOT-CONSTRAINT-SCHEDULER Stage 0 PRIMARY Report

- Lane id: `STAGE0-BATCH-GATE-PRIMARY`
- Assignment id: `STAGE0-P1-20260811-V8-SNAPSHOT-CONSTRAINT-SCHEDULER-PRIMARY-V8.7`
- Input freeze SHA-256: AGENTS `66231F71...B063`; plan `F5C7D04D...AD22`; registry `253F93B7...D934`; role `741EC354...626E`; Discovery handoff `814631EF...802A`; Discovery manifest self `9A2A422C...2206` (`9/9 PASS`)
- Cross-assignment contamination declaration: this review uses only the frozen Wave225 Discovery package, the Stage 0 role/template/skill instructions, and sources independently listed in `SOURCE_AUDIT.md`; no conclusion or score from another candidate was imported.
- Decision: `REVISE_ONCE`
- Quality tier: `TIER_B_Q2_VIABLE` **conditional on the one atomic static gate below**
- Confirmation status: `PENDING_CONFIRMATION`
- Confidence: `0.90`
- Evidence ceiling: `CURRENT_SOURCE_AND_STATIC_DESIGN_REVIEW_ONLY`
- Novelty route: `N2`
- Candidate venue family: software systems / managed runtimes / VM implementation; Q2 is plausible only after the mechanism is made target-specific and certifiable.
- Stage semantics: conditional paper-potential screen; this report does not establish the main claim.

## Structural paper potential vs current readiness

- Structural paper potential if successful: `TIER_B_Q2_VIABLE`. A deterministic algorithm that exploits V8's native pending-forward-reference, hot-object, back-reference, alignment, space and allocation-stream constraints to construct a non-dominated legal snapshot schedule would be more than flag tuning or an emitter patch. The same stock decoder and fixed heap graph provide a crisp same-function contract.
- Current evidence-acquisition readiness/risk: `MEDIUM_LOW__FINITE_STATIC_CLOSURE`. The source action boundary and a finite Stage A route are credible, but the proposed scheduler has no complete state, recurrence, complexity or guarantee. The four-object witness is not yet bound to concrete V8 types/slots/partition.
- Why missing implementation/results/proof/hardware is not structurally fatal: Stage 0 asks whether a successful study could form a paper. V8 is open source, the reader/format contract is inspectable, and a small native snapshot plus public V8/Node carriers give a finite falsification route. No hardware or proprietary resource is required. The revision is requested for an underdefined paper mechanism, not for missing empirical results.

## Discovery provenance

- Opportunity origins: objective/constraint transfer—preserve the stock reader and graph semantics while changing only native-legal generic-object serialization decisions.
- Domain tags: V8, snapshot serialization, VM startup, data layout, constrained scheduling.
- Paper genealogy: V8 native snapshot protocol → general heap/data locality work → GraalVM Native Image profile-guided heap ordering (CGO 2025) → CAHP-based cross-build matching and heap ordering (OOPSLA 2025).
- Discovery method revision: none inherited as candidate evidence.
- Backtest reference and status: not used.
- Reminder: Discovery calibration and self-score are not candidate evidence.

## Frozen object and claim

The exact object is one matching-version V8 startup snapshot over a fixed target/build configuration, fixed builtins, roots, snapshot partitions and heap graph. The output must be accepted by the unmodified matching stock deserializer, reconstruct the same object identities/aliases and required graph, and expose the same observable JavaScript behavior. Code-cache changes, alternate readers, changed objects, profile input, external compressors and cross-version compatibility are excluded.

The only admissible candidate action is intentional deferral and deterministic selection/order of **eligible generic non-code heap objects** after all native map-first, space, partition, root/cache, nondeferrable-object and forward-reference obligations are respected. It may emit only existing native snapshot bytecodes. Builtin ordering remains a baseline action, not part of the candidate contribution.

The claim ceiling at Stage 0 is: a credible target-specific N2 hypothesis and finite test route. This report does not claim a legal regenerated candidate snapshot, compression improvement, startup improvement or theorem.

## Positive opportunity map

- Natural workloads: 20–50 frozen official V8/Node snapshot-generating fixtures/configurations that produce nontrivial startup heaps; each carrier must record source/tag, build args, script, graph/object counts and license.
- Expected headroom, not observed headroom: the fixed depth-first/LIFO-deferred order can make a shared object become serialized before another referencing object. A legal alternate deferral can change pending-forward-reference resolution, later back-reference/hot-object tokens and deserialization allocation adjacency. Whether this creates material full-cost headroom is unknown.
- Mechanism-specific prediction: gains, if any, should concentrate in snapshots with repeated references among eligible same-partition objects and a frontier whose order changes both native token use and allocation-page grouping. Graphs with no legal choice or weak sharing should degenerate to stock behavior.

## Named baselines and fairness contract

1. **Pinned stock V8 serializer** at `c635f0d160b6e988b5ea5a907511a2929beb5d5e`, including strong-root traversal, native caches, current recursive traversal, actual LIFO deferred stack, pending-forward-reference protocol, back references and eight-entry hot-object list.
2. **Complete current snapshot configuration union**, including read-only/shared/startup/context partition behavior, fixed `V8_SNAPSHOT_COMPRESSION` state and zlib path, `stress_snapshot`, `extensible_ro_snapshot`, checksum/profile flags, `mksnapshot` startup/warmup inputs and fixed `reorder_builtins` behavior. These are finite native controls, not a fictional universal optimizer.
3. **Same-information deterministic local scheduling baselines**: stock order; stable legal queue order; and a bounded finite grid of single-score policies (raw-byte/backref estimate only, page grouping only, and hot-recency only). Each uses the same graph and no profile.
4. **Small exhaustive legal scheduler** only as an oracle for tiny witnesses. It is not a deployment baseline and cannot judge the candidate dead merely because it can enumerate the same actions.
5. **CAHP/Native Image ordering** is a direct methodological and claim subtractor, not an equal-function baseline: it changes runtime/format, uses cross-build profile information, and has a much less constrained object-permutation surface.

All deployment comparators receive the same fixed graph and static serializer metadata, preserve the stock reader, and are charged for scheduler/precomputation, `mksnapshot` CPU/peak RSS/temp bytes, raw and compressed snapshot bytes, decompression/deserialization/cold-start distributions, process RSS/page-locality counters, verification and fallback.

## Collision analysis

### Nearest-prior facet matrix

| Work/current mechanism | Exact object | Information | Action/algorithm | Guarantee/result | Cost | Disposition |
|---|---|---|---|---|---|---|
| Pinned current V8 serializer | Same | Same | Fixed recursive traversal plus native deferral/backref/forward-ref/hot-list machinery | Stock compatibility | Native cost | Strongest same-object baseline; exposes protocol but not a configurable complete generic-object scheduler |
| V8 `reorder_builtins` | Same snapshot build, code-only facet | Profile for builtins | Builtin code ordering | Native output | Native cost | Direct subtractor; does not order generic heap objects |
| Basso et al., CGO 2025 | GraalVM Native Image | Instrumented-run profile and cross-build matching | Profile-guided code and heap ordering | Page-fault/startup gains | Full AOT build/runtime | Direct method/claim subtractor; different runtime, information and format |
| Basso et al., OOPSLA 2025 (CAHPs) | GraalVM Native Image | Instrumented profile + CAHP matching | Exact/partial cross-build object matching and heap ordering | Published artifact and page-fault/startup improvements | Full pipeline | Strongest recent collision; absorbs broad “heap snapshot ordering for startup/locality” wording, but not the frozen V8 static/native-bytecode problem |
| Generic topological/list scheduling | Abstract precedence graph | Static graph | Order ready vertices | Generic feasibility/heuristics | Abstract | Kernel subtractor; a candidate that is only a local score or generic solver wrapper has no publishable residual |

### Seed-distance and method-name deletion test

- Seed distance from current V8: one native serializer decision boundary; same reader and bytecode. This is close enough to be executable but creates wrapper risk.
- Seed distance from CAHPs/CGO: different VM, profile information, object mapping problem, serialization grammar and deployment contract. Their broad ordering/startup claim nevertheless forces a narrow V8-specific paper claim.
- Method-name deletion test: deleting “CSS” leaves only “choose a legal object order using a bounded score,” which is not yet a paper mechanism. The residual becomes credible only if the revision defines a V8-specific sufficient state and a nontrivial exact/FPT/certified-Pareto guarantee that accounts for native actions.
- Latest-collision conclusion: no `DIRECT_FATAL` same-object paper or current V8 action was found in the bounded search; status remains `SEARCH_BOUNDED_OPEN`, not an absence claim.

## Competing mechanism decision

- Selected mechanism: target-specific deterministic native-deferral scheduling with a bounded state that represents ordered hot-list contents, serialized/backref status, unresolved forward references, allocation cursor/alignment and partition legality.
- Registered backup: none. A profile-guided object reorderer, alternate format or generic ILP is a new object/mechanism and is not authorized.
- Pivot boundary: the one revision may refine the scheduler state/guarantee without changing fixed V8 object, information, reader, workload family or objectives. Changing any of those requires a new ID.

## Residual paper kernel

**Conditional kernel:** a V8-format-specific constrained scheduling algorithm over existing serializer actions, with an auditable finite state and certified frontier, that finds legal same-graph snapshots outside the complete native/current single-score union. Its novelty must come from how V8 pending forward references, hot/back references and allocation-stream constraints couple—not from the fact that object ordering can affect locality.

The proposed additive optimization target may combine exact native byte-token cost with an explicitly declared page/allocation proxy. Fixed zlib compressed size and measured startup are evaluation objectives, not additive DP costs: compression is global and stateful, so an “exact compressed-size DP” would exceed the current evidence unless compressor state is modeled.

## One atomic Stage 0 revision gate

- Gate id: `V8_NATIVE_DEFERRAL_SCHEDULER__NON_GENERIC_STATE_AND_GUARANTEE_CERTIFICATE`
- Single proposition: **under the pinned V8 same-object contract, the complete legal intentional-deferral action grammar admits a finite target-specific sufficient state and an exact/FPT or certified-Pareto scheduler over a declared additive raw-byte/page objective, and one concrete typed native-legal `R,A,B,C` construction selects a schedule not expressible by the stock/current single-score action catalog while remaining within existing bytecodes and reader semantics.**
- Static closure required (one certificate, not separate admission gates):
  - bind `R,A,B,C` to actual current V8 object types, tagged slots, space/partition and pre-serialized map conditions; show why `C` is deferrable and both `A,C,B` and `A,B,C` streams are legal;
  - enumerate intentional defer, deferred-object selection, resolve, hot/backref and no-op/degenerate actions and map current flags/actions into the catalog;
  - define state sufficiency, transitions, objective, deterministic ties, complexity and guarantee; an exhaustive tiny oracle may validate but cannot be the method;
  - give degeneration maps to stock traversal, stable queue and every declared single-score baseline, and narrow claims around CGO/CAHPs;
  - preserve matching stock decoder, exact expanded graph/aliasing, partition, alignment and JavaScript behavior; freeze the finite Stage A witness/replay/full-cost killer.
- Falsifiers: the typed witness is illegal; the action requires a new bytecode/reader/profile; sufficient state hides unbounded object identity/history; the method is generic topological sorting, arbitrary beam search, scalar tuning or a CP/ILP wrapper; the only objective is unmodeled zlib size; or the complete current union can reproduce every claimed action/guarantee.
- Failure sentinel: `BELOW_Q2_STOP__GENERIC_HEAP_ORDERING_OR_LOCAL_SCORE_WRAPPER`
- Revision budget if independently confirmed: `1/1`; this PRIMARY recommendation does not itself execute or consume it.

## Evidence route

- `PARETO_APPROXIMATION / COMPLEXITY_THEORY / PERFORMANCE`

## Performance-optimization admissibility

- Same-function contract: fixed V8 build and heap graph; stock deserializer; exact roots, aliases, partitions and observable JavaScript.
- Algorithmic delta: conditional; must become the target-specific certified scheduler in the atomic gate.
- Full-cost ledger: scheduler/graph construction; `mksnapshot` CPU, peak RSS, temp/storage; raw/compressed bytes; decompression/deserialization; cold-start distribution; process RSS/page metrics; verification; failures and stock fallback.
- Strong-implementation fairness: same commit, compiler/build flags, machine, warmup/cold policy, graph and available metadata. Builtin profile ordering may not lend its profile to the candidate.
- Generality and failure boundary: 20–50 natural carriers, plus explicit no-choice/low-sharing degenerations. No claim from a single synthetic graph.
- Why not routine tuning: only the certified native-state scheduler can qualify. A threshold/weight/queue-order sweep is explicitly below Q2.

## Q1/Q2 paper shape

- Problem: V8's fixed snapshot traversal couples representation bytes and deserialized allocation locality, yet current controls do not expose a general native-legal generic-object schedule.
- Contribution: one format-specific scheduling formulation/algorithm with a formal legality and frontier guarantee, plus a stock-reader-preserving implementation.
- Evidence plan: typed witness and exact tiny oracle; static action/degeneration audit; natural carrier evaluation against the complete current union; full-cost Pareto and failure strata.
- Expected paper narrative: “constrained V8 snapshot scheduling,” not “new heap snapshot ordering.”

## Q1/Q2 shape calibration

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Reference set: Basso et al. CGO 2025; Basso et al. OOPSLA 2025; Shuf et al. OOPSLA 2002.
- Status: `PARITY_NOT_PLAUSIBLE` for Q1 at Stage 0; conditional Q2 shape remains credible.
- Contribution-shape gap: target-specific scheduler/guarantee is not yet defined and broad ordering novelty is occupied.
- Evidence-shape gap: no native candidate stream or natural evaluation exists yet; this is readiness, not a negative result.
- Stage A closure plan: first close fidelity on the typed witness, then compare the fixed union on frozen carriers. No claim-bearing run precedes stock-reader/graph-equivalence closure.

## Non-relaxable quality audit

- Same-object: **PASS as a definition**, conditional on native typed-witness closure before measurement.
- Latest collision: **PASS_WITH_SEARCH_BOUNDED_OPEN**; CAHPs/CGO sharply lower the claim ceiling, but no same-object direct fatal was found.
- Strong fair baselines: **PASS as a finite design**; complete current V8 union plus same-information local policies and a tiny oracle are named.
- Natural input/evidence: **FINITE_ROUTE**, not yet acquired.
- Full-cost: **PASS as a ledger design**; compressed/startup metrics cannot be omitted.
- Reproducibility: **FINITE_ROUTE** with pinned source/build/carriers and hashes.
- Evidence/claim honesty: **PASS**; all benefits remain hypotheses.

## Evidence path and AI completion

- AI executability class: `AI_CORE_EXECUTABLE`
- Estimated ai_core_fraction: `0.88`
- 72-hour first evidence after a successful revision: construct the typed legal witness; implement or instrument the native deferral decision behind one guarded build; verify stock deserialization, graph/alias digest and JS behavior; compare stock/stable/single-score schedules and tiny exhaustive oracle before any natural timing. Then run a small stratified subset of carriers.
- Human-only items and why they are non-decisive: venue choice and final interpretation; no specialized hardware or inaccessible data is needed for the first claim-bearing evidence.

## Fidelity closure plan audit

- Discovery status: `FINITE_FIDELITY_GAP`
- Complete action and native semantics are finite and same-object: yes in principle; not yet enumerated in the candidate proposal.
- Comparator, denominator, full-cost and small-witness plan: finite and auditable.
- Why an unimplemented interface is not structurally fatal: the modification point and existing reader protocol are source-visible. The scientific revision concerns algorithm identity/guarantee, not implementation readiness.
- Reminder: Stage 0 audits the plan; Stage A must actually close `PRE_CLAIM_CONTRACT_FIDELITY_GATE` before its first claim-bearing run.

## Independent current upstream reality check

- Frozen upstream commit/check date: V8 `c635f0d160b6e988b5ea5a907511a2929beb5d5e`, checked 2026-08-11; official main architecture documentation was also checked. A live `git ls-remote HEAD` failed with Windows schannel `SEC_E_NO_CREDENTIALS`; no absence inference uses that failure.
- Current official documentation checked: V8 Snapshot and Serializer System; custom startup snapshot documentation.
- Actual source paths/symbols checked: `src/snapshot/serializer.{h,cc}` (`SerializeDeferredObjects`, `SerializeObject`, `MustBeDeferred`, `CanBeDeferred`, pending refs, deferred stack); `startup-serializer.cc`; `serializer-deserializer.{h,cc}`; `snapshot.cc`; `snapshot-compression.cc`; `mksnapshot.cc`; `src/flags/flag-definitions.h`.
- Default/non-default flags/configurations checked: snapshot compression build flag and fixed zlib path; `stress_snapshot`; `extensible_ro_snapshot`; checksum/deserialization profiling; startup blob/warmup inputs; builtin reordering; target arch/OS and matching-build constraints.
- Discovery absence claim: **narrowly confirmed for the checked source/config surface**. Current V8 implements the underlying protocol and fixed traversal/deferred behavior, but no configurable complete generic-object scheduling action was found.
- Non-tuning residual: conditional target-specific scheduling algorithm/guarantee in the atomic revision gate.

## Stage A highest-risk probe plan

- Risk-bearing premise: intentional deferral can generate a different legal native stream on real current V8 objects, and the target-specific state does not collapse to generic/list scheduling or stock/local-score policies.
- Cheap discriminating probe: typed `R,A,B,C` snapshot; stock decoder and graph digest; two legal schedules; exact native-token accounting and tiny exhaustive frontier; no performance claim required.
- Negative result that kills the direction: witness illegality; reader/graph mismatch; no union-external action; scheduler degenerates to scalar tuning/generic solving; or every natural full-cost point is dominated by the finite union.
- Positive-result ceiling: preliminary support/non-falsification only; not main-claim proof.

## Stop conditions

- Atomic revision falsifies or cannot define the proposition without changing the object/information/reader.
- Current source or a same-object paper directly supplies the complete action and guarantee.
- Candidate reduces to queue/weight/flag tuning, generic topological scheduling, emitter engineering or uncharged offline optimization.
- Any stock-reader, graph/alias, partition or observable-JS mismatch.
- Fewer than 10% of frozen natural carriers contain more than one legal candidate action, or the finite current union dominates candidate p50/p90 full-cost Pareto results.

## Dual-axis score

- Academic value: `45/70` (problem 10/15; N2 clarity 10/20; nearest-work delta 8/15; baseline/venue 8/10; falsifiability/evidence route 9/10)
- AI executability bonus: `27/30`
- Total: `72/100`
- Score interpretation: the numeric threshold does not override the atomic mechanism gap; hence `REVISE_ONCE`, not PASS.

## STAGE0_REPAIR_VECTOR

- `OMITTED_CURRENT_SAME_OBJECT`: no
- `OMITTED_FIRST_PARTY_FEATURE`: no material action absorption found
- `OMITTED_GENERIC_KERNEL`: yes—generic scheduling must be explicitly subtracted
- `ATOMIC_ACTION_UNCLEAR`: yes
- `NATURAL_CARRIER_GAP`: finite readiness gap only
- `FULL_COST_GAP`: ledger is defined; measurements absent by stage design
- `Q2_SHAPE_GAP`: yes, until the target-specific state/guarantee certificate closes

## Authorizations

- Stage A: `false`
- Stage B: `false`
- Experiment/benchmark: `false`
- Next route: same long-lived, uninvolved D-root confirmation sentry.

