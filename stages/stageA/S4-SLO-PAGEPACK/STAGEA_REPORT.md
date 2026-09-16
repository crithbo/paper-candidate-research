# S4-SLO-PAGEPACK Stage A Report

- Lane id: `CANDIDATE-EXECUTION-LANE-1`
- Assignment id: `STAGEA-L1-20260809-S4-SLO-PAGEPACK-INITIAL`
- Input freeze SHA-256: MetaKV slice `E5D16D849BCD2E015C5E54A161E202241E7B7D25696F4055C742D51649DDF2A8`; upstream package hashes are in `EXPERIMENT_CONTRACT.yaml`.
- Cross-assignment contamination declaration: `false`. Only the three assigned S4 upstream packages, role/rule/template files, and official first-party sources were used.
- Decision: `STOP`
- Quality tier: `BELOW_Q2_STOP`
- Evidence ceiling: `TRACE_LEVEL_EXACT_REDUCED_EPOCH_NEGATIVE__NO_PRODUCTION_PERFORMANCE_CLAIM`
- Novelty route: `N2`
- Stage semantics: this is a bounded natural-trace core-risk pilot. It does not establish production performance, concurrency correctness, or a paper main claim.

## Material Passport

- Material type: `STAGEA_RESULT`
- Source class: frozen natural trace, official upstream code/docs, original papers, deterministic solver/replay
- Verification status: `VERIFIED_BY_BYTE_IDENTICAL_DUAL_REPLAY`
- Stable result digest: `55A97297FB0A00465CB6414EC7C6F4F2B3BFD57A1BE3F0FFF6AAE8B0FBFB2FFA`

## Frozen contract

The exact object remained an OBASE-admissible, CacheLib-compatible, epochal unmanaged opaque-object heap with Handle-protected access; movement occurs only at epoch boundaries after handles drain. Page size is 4 KiB, GET/SET/DELETE order and object sizes come from the trace, and the page backend is unchanged. Mobility is an adapter property justified by CacheLib's official Handle/object model, never inferred from raw operations.

The immutable parent contract is `EXPERIMENT_CONTRACT.yaml`. Two pre-observation amendments are explicit and hash-chained:

1. `CONTRACT_AMENDMENT_001.yaml` adds the omitted base-unit conversion of 100 work units per trace operation so the common trace-handling charge does not make the 5% cap impossible by construction.
2. `CONTRACT_AMENDMENT_002.yaml` replaces an access-only selection that yielded one-page vacuity with a causal access-tercile/size-rank selection. It retains 12 objects and the same trace/epochs, and produces 3/2/3 initial pages without observing evaluation accesses.

No candidate, comparator, objective, feasibility, or evaluation-epoch result existed before either amendment. Neither changes the research mechanism or consumes a scientific revision.

## Headroom or theoretical gap

The surviving hypothesis was that joint object-to-page assignment plus migration selection could reclaim strictly more fast-tier pages than a temperature layout followed by an online MDK-style target under the same 5% full-work cap. The exact reduced solver enumerated every capacity-legal layout; therefore, within each reduced object set and cost model, there was no hidden layout point outside the search.

The observed headroom is zero. In the only epoch where the costed exact candidate was feasible, it selected exactly the same layout and reclaimed the same 8,192 B as the faithful composition. In the two three-page epochs, exact planning alone cost 400,342 work units, above caps of 296,686 and 288,295; the much cheaper composition reclaimed all 12,288 B.

## Minimal mechanism and strongest baselines

- Candidate: exact joint object-to-page assignment and slow-page selection using prior-epoch accesses, capacity, migration, pointer/metadata, page-reclaim, trace-handling, and counted planning work.
- Strong deployment comparator: every causal previous-epoch temperature threshold, deterministic HOT/COLD packing, and every online MDK-style predicted page-target prefix. The complete causal sweep is a stronger envelope than choosing one tuned threshold.
- Offline exact actual-access solver: ceiling only; never treated as a deployable baseline. With its own planning cost charged, it was infeasible in epochs 1 and 3 and tied the candidate/composition at 8,192 B in epoch 2.
- Original layout and semantic replay: used for initial pages, migration accounting, and identical GET/SET/DELETE digest checks.

## Natural workload and mechanism-specific prediction

The frozen input is the first 120,000 complete records from the official cacheMon/Meta CacheLib `kvcache_traces_3.csv.zst` object, divided into a 30,000-row warmup and three 30,000-row evaluation epochs. `op_count` is preserved as access multiplicity. The 12-object reduced sets are selected only from previous-epoch information and occupy 3, 2, and 3 pages.

The preregistered signature required selective movement to create reclaimable pages that the temperature-layout-to-policy composition could not reach. The opposite occurred: previous-epoch heat was sufficiently weak or nonpersistent that the composition could put every reduced page in the slow tier within the cap. This is a registered no-gain region, not evidence for the mechanism.

## Highest-risk probe result

- Risk-bearing premise: a strict full-cost reclaimed-byte residual remains over faithful `OBASE-temperature layout -> online MDK-style target` at fixed SLO.
- Probe/counterexample-search scope: three natural MetaKV-derived 30,000-row epochs, 12 objects per epoch, exact capacity-legal assignment enumeration, full causal baseline envelope, full abstract-work ledger, pointer/semantic replay, dual reproduction.
- Result: residuals are `-12,288 B`, `0 B`, and `-12,288 B`; positive epochs `0/3`.
- Negative-result meaning: the faithful composition absorbs every costed candidate point. In epochs 1/3 the exact candidate is infeasible because planning cost exceeds the cap; in epoch 2 it is an identical, more expensive layout.
- Positive-result ceiling: not applicable. No `NOT_FALSIFIED` or `PRELIMINARY_SUPPORT` result is claimed.

## Directional increment

- Performance/quality/Pareto/complexity effect: no positive Pareto or reclaimed-byte increment exists on the frozen finite object. The composition reaches the full 3/2/3-page reclaim target at lower work.
- Why this is not ordinary tuning or a weak-baseline artifact: the candidate did execute a nontrivial joint assignment search, but the required current-composition baseline was stronger and cheaper. The STOP follows from that strong-baseline absorption, not from comparison to original layout alone.

## Performance evidence chain, if applicable

- Algorithm/data-structure change: exact joint layout/migration solver over explicit page assignments.
- Intermediate mechanism metric: exact states/transitions were `195,571/204,771`, `67/122`, and `195,571/204,771`; complete layouts were `127,314`, `6`, and `127,314`.
- End-to-end effect: candidate full-cost reclaimed bytes were `0`, `8,192`, `0`; composition envelope bytes were `12,288`, `8,192`, `12,288`.
- Full-cost result: candidate residual was never positive after trace, planning, migration, pointer/metadata, page reclaim, remote access, and fragmentation accounting.
- Generality region: only the frozen reduced MetaKV epochs and abstract cost profile.
- No-gain or regression region: low persistence across adjacent epochs and exact-planner work above the fixed cap.

## Current critical-cost analysis

The dominant candidate cost is planning, not migration. Epochs 1 and 3 each count 400,342 planning work units, exceeding their total incremental caps before remote access or migration can help. Epoch 2 needs only 189 planning units because two 2,040–2,032 B objects nearly determine the two-page partition; however, the composition reaches the identical layout with 63 planning units. Candidate migration is zero in epoch 2; the composition's migrations in epochs 1/3 are 4,208 B/3 objects and 2,576 B/4 objects, still far below cap.

## AI execution ledger

- AI executability class: `AI_CORE_EXECUTABLE` for this bounded trace/solver probe.
- Measured ai_core_fraction: `1.00` for input acquisition, normalization, solver, comparator, cost ledger, replay, and validation in Stage A; this does not cover a production concurrent runtime.
- Reproducible commands/artifacts: `node tools/fetch_inputs.mjs`, `node tools/run_probe.mjs --mode primary`, `node tools/run_probe.mjs --mode replay`, and `node tools/validate_replay.mjs`; exact artifacts are in `inputs/`, `results/`, and `tools/`.
- Human-only items: production C++ integration and independent concurrency audit were not attempted because the core premise failed first.

## Mechanism pivot, if used

None. No threshold/controller/selector fallback, backend change, object substitution, or Stage B work was attempted.

## Literature collision update

The source status remains `SEARCH_BOUNDED_OPEN_WITH_TWO_DIRECT_SUBTRACTORS`, with OBASE subtracting object-temperature layout and MDK subtracting SLO policy/targeting. The scientific STOP does not require a new direct paper collision: the mandatory same-information composition empirically absorbs the candidate on the frozen natural finite object.

## Stage B minimal prototype

Not proposed. A production CacheLib/OBASE integration, additional traces, or formal approximation work would be Stage B-scale work and cannot repair a failed Stage A premise without a new, mainline-authorized research object or mechanism.

## Q1/Q2 evidence-gap review

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Updated reference set: OBASE (OSDI 2026), MDK (OSDI 2026), HADES (DIMES 2025), BRUMM (ECRTS 2026).
- Status: `PARITY_NOT_PLAUSIBLE`
- Evidence already comparable: same object, causal information, full baseline envelope, natural input, exact reduced search, full cost, pointer/semantic replay, and byte-identical reproduction.
- Executable Stage B gaps: not applicable after STOP.
- Human/resource-dependent gaps: production concurrency integration remains untested but cannot reverse this frozen scientific gate.

## Non-relaxable quality audit

- Same-object: PASS. All methods use identical objects, epochs, mobility, 4 KiB backend, and semantics.
- Latest collision: bounded official-source status retained; no global novelty claim.
- Strong fair baselines: PASS. Full causal OBASE-style threshold envelope plus online MDK-style targets was replayed.
- Natural input/evidence: PASS at Stage A trace level; official MetaKV source and exact derived hash retained.
- Full-cost: PASS for the registered abstract ledger, including planning and trace handling. It is not a hardware-cycle claim.
- Reproducibility: PASS. Primary and replay nonvolatile files are byte-identical; validator passes all fields.
- Evidence/claim honesty: negative reduced-epoch result only; no production, large-scale, theorem, or end-to-end performance claim.

## Supported and unsupported claims

Supported: on the frozen three reduced natural epochs and cost profile, the exact joint candidate has no strict full-cost reclaimed-byte residual over the faithful composition; all legality and semantic replay checks pass.

Unsupported: general impossibility, global novelty, all CacheLib workloads, real machine slowdown, OBASE/MDK production equivalence, concurrent relocation performance, or any paper main claim.

## Mandatory user gate before Stage B

- Independent Stage A gate decision: not yet performed; owner recommends `STOP` for mainline/gate acceptance.
- User-facing evidence packet: `USER_REVIEW_PACKET.md`
- `PENDING_USER_STAGEB_REVIEW`: no
- Stage B user approval id/time: null
- Stage B authorized: false

## Human research reserve, if applicable

Not applicable. This is direct full-cost/strong-baseline scientific negative evidence, not an AI-capability limitation.

## User-action blocker, if applicable

None. The first trace fetch timed out and a first streaming implementation produced an incomplete unverified file; both are retained under `inputs/failed_attempt1/`. The official input was subsequently acquired and fully verified before claim-bearing execution, so the assignment is not resource-blocked.

