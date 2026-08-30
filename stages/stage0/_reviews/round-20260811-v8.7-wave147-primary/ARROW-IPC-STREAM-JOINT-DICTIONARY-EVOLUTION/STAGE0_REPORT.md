# ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION Stage 0 Report

- Lane id: `STAGE0-BATCH-GATE / PRIMARY`
- Assignment id: `STAGE0-P1-20260811-ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION-PRIMARY-V8.7`
- Input freeze SHA-256: brief `89C04148DF3C3CE4953D0F56269D49D4D12D57DEF450B7A4AE6B0C3FF68E1A8D`; handoff `3CA83D4EB7BBF85551281FF6DC096E2503C4D125B30C238B1AD325E11DA0654D`; discovery manifest self `31EB791E2F8560CEC270B961124808706150A5151235E60409CD274C135C136D`, 8/8 verified
- Rules freeze SHA-256: `AGENTS.md` `66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063`; `ROLE_STAGE0_REVIEW.md` `741EC3544797FF8A5BF337E1E3448B5F683823E5229F818F162834400581626E`
- Cross-assignment contamination declaration: no prior candidate score, PASS, mechanism, or failure was inherited. Discovery's recommendation and absence statement were treated only as hypotheses.
- Decision: `REVISE_ONCE`
- Quality tier: `TIER_B_Q2_VIABLE` **if the one atomic revision gate closes**; otherwise `BELOW_Q2_STOP`
- Confidence: `0.88`
- Evidence ceiling: `STAGE0_CURRENT_SOURCE_AND_STATIC_GRAMMAR_AUDIT__NO_CANDIDATE_RESULT`
- Novelty route: `N2`
- Candidate Q1 venue family: data management / data formats / compression; current structural ceiling is credible Q2, not Q1.
- Stage semantics: conditional paper-potential screen; this report does not establish the main claim.

## Structural paper potential vs current readiness

- Structural paper potential if successful: **conditional Tier B**. A paper can exist if the contribution is an Arrow-specific algorithm or formal guarantee for a dominance-reduced dictionary-history lattice under shared record-batch cuts, not merely a new writer option or an application of generic shortest path/ILP.
- Current evidence-acquisition readiness/risk: **medium-low but finite**. The format, current C++ source, reader oracle, a legal static history pair, and an official natural carrier are available. The non-product algorithmic residual is not yet defined tightly enough.
- Why missing implementation/results/proof/hardware is not structurally fatal: the decisive closure is static/source/formal and CPU-only. The revision is required because the research proposition is under-specified after subtracting current first-party actions, not because results are absent.

## Discovery provenance

- Opportunity origins: direct software/algorithm residual in a standardized streaming columnar format.
- Domain tags: `DATA_FORMAT`, `DATABASE_STORAGE`, `COMPRESSION`, `ALGORITHM_DATA_STRUCTURE`.
- Paper genealogy: Arrow IPC grammar and C++ writer/reader; columnar-format/compression design; dictionary compression; multi-segment physical design.
- Discovery method revision: none used as candidate evidence.
- Backtest reference and status: not applicable to this scientific judgment.
- Reminder: method backtest is calibration, not candidate evidence.

## Frozen object and claim

Input is one fixed Arrow logical schema with at least two **flat, non-nested** dictionary fields, fixed dictionary index types, metadata, row order, logical field values, and nulls. Output is one standard Arrow IPC **stream** read by the stock C++ `RecordBatchStreamReader` at the frozen source revision. The candidate may change record-batch cuts and physical dictionary arrays/events, so equality means:

1. reader acceptance;
2. logical schema equality;
3. equal total row count and order after concatenating reader batches;
4. equal decoded logical values and null positions.

It cannot require identical record-batch partitioning, because partition choice is the decision variable. It cannot change logical values, field types/index widths, schema metadata, reader, stream grammar, compression codec arm, or external transport.

Primary isolation fixes metadata V5, 8-byte alignment, non-legacy framing, no body compression, and fixed threading. LZ4/Zstd and `min_space_savings` belong only in separately matched secondary arms.

## Positive opportunity map

- Natural workloads: official NYC TLC Yellow Taxi January and February 2025 records, preserved in original row order through a frozen logical schema mapping; additional months are replication, not required for the first probe.
- Observed or expected cost/headroom: no candidate headroom has been observed. Official Arrow sources establish that batch boundaries, dictionary evolution, message count, padding, and read/write work are real cost-bearing choices.
- Mechanism-specific prediction: when fields change category sets at different row boundaries, a shared cut may trade one field's prefix delta against another field's replacement and record-batch overhead. A paper-worthy method must exploit Arrow-specific prefix/replacement structure beyond ordinary joint segmentation.

### Static 2-field / 3-region legality witness

For flat dictionary fields `A:int8->utf8` and `B:int8->utf8`, use three ordered regions:

- `R1`: `A=a`, `B=x`;
- `R2`: `A=b`, `B=y`;
- `R3`: `A=b`, `B=x`.

One legal history initializes `A=[a]`, `B=[x]`, writes `R1`, emits `A` delta `[b]` and `B` replacement `[y]`, writes `R2`, then replaces `B` by `[x]` before `R3`. Another initializes `A=[a,b]`, `B=[x,y]`, writes `R1+R2`, replaces `B` by `[x]`, then writes `R3`. Both reconstruct the same logical rows with different message histories and costs.

This witness is **legal but not union-external**: current `WriteRecordBatch` can emit either history when the caller supplies the corresponding batches/dictionary arrays. It proves a decision space, not a new action or optimality residual.

## Named baselines and fairness contract

1. **Complete current C++ native union:** direct caller-provided `WriteRecordBatch` sequences and `WriteTable(max_chunksize)` over a finite legal grid; `emit_dictionary_deltas` false/true; matched metadata/alignment/legacy/compression/thread settings; current no-event, compatible prefix delta, replacement, nested restriction, dictionary mapper/tracker, writer and reader statistics.
2. **Generic same-information planning union:** ordinary segmented shortest path/ILP over cut positions and the Cartesian product of per-field dictionary states, plus independent per-field optimization followed by an optimal shared-cut merge. These are subtractors, not a universal impossibility oracle.
3. **Small-instance exact ceiling:** exhaustive enumeration of dominance-reduced legal histories on the static witness and tiny natural prefixes. It is an oracle, not a deployable baseline.

Every method receives the complete finite row sequence and identical schema. Full cost includes logical-to-dictionary construction/remapping, candidate planning, temporary and peak memory, message metadata/padding/bodies, writer/reader CPU and wall time, time to first complete batch, total decode latency, digest verification, and fallback.

## Collision analysis

Current status: `SEARCH_BOUNDED_OPEN__NO_DIRECT_FATAL_FOUND`. Current-source action absorption is real; direct paper absorption was not found in the bounded search.

### Nearest-prior facet matrix

| Source/mechanism | Same fixed logical stream | Same stock reader | Complete cuts/dictionary actions | Same planner/objective | Algorithm/guarantee | Classification |
|---|---:|---:|---:|---:|---:|---|
| Arrow C++ `WriteRecordBatch` + tracker | yes | yes | **yes, when caller supplies batches/dictionaries** | no automatic whole-stream planner | deterministic local writer policy | `DIRECT_SUBTRACT` / deployment baseline |
| Arrow C++ `WriteTable(max_chunksize)` grid | yes | yes | fixed-size convenience paths | no | no | deployment baseline |
| Generic product-state shortest path/ILP | yes if faithfully instantiated | yes | yes | yes | generic exact optimization | strongest methodological subtractor |
| Liu et al., PVLDB 2023, open-format study | Arrow included | format-level | no constructor | format trade-off characterization | empirical study | evaluation/domain anchor |
| Hildebrandt et al., ICISSP 2020, ArrowComp | Arrow data model | not this stream grammar | different codecs/representation | lightweight compression | implementation framework | domain subtractor, not direct |
| Raman & Swart, VLDB 2006 | relational compression | no | different encoding actions | entropy/query trade-off | formal/system method | contribution-shape anchor |

No checked source jointly supplies the frozen Arrow stream contract and a nontrivial whole-stream algorithm/guarantee. However, the current writer already exposes the **complete output action through caller-defined batches and dictionaries**, contradicting Discovery's action-gap framing.

### Seed-distance and method-name deletion test

- Seed distance: after removing Arrow names, the current proposal reads as finite-state multi-series segmentation with shared boundaries. That generic form is too close to an ordinary product-state shortest path to establish N2 by itself.
- Method-name deletion: a residual survives only if Arrow's prefix-delta/replacement lattice permits a specific state compression, dominance theorem, FPT/approximation result, or coupling guarantee that the generic formulation and current input-control surface do not provide.

## Competing mechanism decision

- Selected mechanism: **not yet closed**; preferred revision target is an Arrow-specific dominance-compressed/factorized planner over ordered dictionary prefix/replacement states with an exactness, complexity, approximation, or auditable frontier guarantee.
- Registered backup: full Cartesian product DP/ILP. It is retained as the fair methodological baseline/ceiling and cannot itself be the paper contribution.
- Pivot boundary: adding shared dictionary IDs across fields, changing index types/schema, using nested dictionaries, switching codecs/readers, or optimizing external transport changes the frozen mechanism/object. A wrapper that only prepares inputs for current writer is insufficient without the nontrivial algorithm/property.

## Residual paper kernel and one atomic revision gate

### Gate id

`NATIVE_INPUT_ACTION_COMPLETE__NONPRODUCT_ARROW_DICTIONARY_LATTICE_CERTIFICATE`

### Single proposition

After granting the baseline arbitrary legal caller-defined batch cuts and physical dictionary arrays, there exists a finite, dominance-reduced Arrow dictionary-history family and an Arrow-specific algorithm/formal property whose behavior or guarantee is not reducible to (a) current local writer policy, (b) independent per-field planning plus optimal shared-cut merge, or (c) ordinary Cartesian product segmentation/shortest path under the same information and full cost.

### Required revision artifact

One coherent certificate must define: the bounded dictionary action catalog; state equivalence/dominance; the exact Arrow-specific algorithmic reduction or guarantee; one legal small witness separating it from all three comparators; complexity in rows/fields/state width; and a finite stock-reader/full-cost falsifier. It need not contain an implementation, measured gain, or completed proof.

### Falsifier

If every legal state is merely a product of independent field states plus a shared cut cost, and the candidate is only generic DP/ILP, input preparation, threshold selection, or emitter engineering, the revision fails and the topic becomes `BELOW_Q2_STOP`.

## Evidence route

- `PARETO_APPROXIMATION`
- `COMPLEXITY_THEORY`
- `PERFORMANCE`

## Performance-optimization admissibility

- Same-function contract: concatenated decoded rows/schema/value/null equality under the frozen stock reader.
- Algorithmic delta: must be the revision's Arrow-specific state reduction/guarantee, not access to actions already exposed by `WriteRecordBatch`.
- Full-cost ledger: includes input dictionary construction/remapping and planner cost in addition to native writer/reader costs and serialized bytes.
- Strong-implementation fairness: direct arbitrary batches, fixed `max_chunksize` grid, both delta modes, generic planner controls, and tiny exact ceiling.
- Generality and failure boundary: stable/single-field dictionaries, one forced partition, synchronized field changes, or generic-product-optimal cases are expected null regimes.
- Why not routine tuning: only a nontrivial algorithm/formal residual beyond the complete native and generic action catalog qualifies.

## Q1/Q2 paper shape

- Problem: choose a standard-reader-compatible Arrow stream history when batch boundaries and field dictionaries evolve jointly.
- Contribution: conditional on revision, an Arrow-specific state-lattice algorithm/guarantee plus a format-faithful implementation.
- Evidence plan: static certificates, exact tiny instances, two official natural months, complete native/generic controls, and full-cost Pareto analysis.
- Expected paper narrative: a focused Q2 data-format/algorithm paper. Q1 shape is not currently plausible without a broader theorem and multi-system impact.

## Q1/Q2 shape calibration

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Reference set: Raman & Swart, VLDB 2006; Liu et al., PVLDB 2023; Hildebrandt et al., ICISSP 2020.
- Status: `PARITY_NOT_PLAUSIBLE` for Q1; conditional Q2 shape remains.
- Contribution-shape gap: no Arrow-specific non-product algorithm/property yet.
- Evidence-shape gap: no implementation or natural full-cost result, appropriately deferred to Stage A.
- Stage A closure plan: only after the atomic revision is accepted, close the stock-writer fidelity gate and run the bounded witness/natural killer.

## Non-relaxable quality audit

- Same-object: pass after defining equality on concatenated logical rows rather than identical batch partitioning.
- Latest collision: no direct fatal found; bounded search remains open.
- Strong fair baselines: Discovery's fixed-`max_chunksize` framing failed; corrected baseline must include arbitrary caller-defined batches/dictionaries and generic product-state planning.
- Natural input/evidence: official NYC TLC is a legitimate, finite natural route; relevance of its categorical drift is unmeasured.
- Full-cost: correctable; candidate dictionary construction/remapping and planner costs were missing from Discovery's explicit ledger.
- Reproducibility: public Arrow source and official data allow a finite route.
- Evidence/claim honesty: static history pair proves legality only. No byte, latency, memory, or Pareto superiority is claimed.

## Evidence path and AI completion

- AI executability class: `AI_CORE_EXECUTABLE`
- Estimated ai_core_fraction: `0.88`
- 72-hour first evidence: after revision acceptance, pin/build the current C++ reader/writer, replay the two legal histories, enumerate the complete native/generic witness union, and hash/download the two official monthly carrier files. This is a finite plan, not evidence already obtained.
- Human-only items and why they are non-decisive: theorem and venue review benefit from human checking but do not block core construction or comparison.

## Fidelity closure plan audit

- Discovery status: `FINITE_FIDELITY_GAP`
- Complete action and native semantics are finite and same-object: yes after adding caller-defined `WriteRecordBatch` inputs; dominance reduction for candidate states remains the revision gate.
- Comparator, denominator, full-cost and small-witness plan: finite after the corrections above.
- Why an unimplemented interface/format/checker is not structurally fatal: all relevant sources and the stock reader are public; no proprietary resource is required.
- Reminder: Stage 0 audits the plan; Stage A must actually close `PRE_CLAIM_CONTRACT_FIDELITY_GATE` before its first claim-bearing run.

## Independent current upstream reality check

- Frozen upstream commit/tag and check date: Apache Arrow repository commit `42694575d0219f6a3a78b1f344bb071a60df6a4e`, checked 2026-08-11; current docs identify v25.0.0 API/format pages.
- Current official documentation checked: Arrow Columnar/IPC format, C++ IPC API, integration-testing contract, and official repository.
- Actual source paths/symbols checked: `cpp/src/arrow/ipc/writer.cc` (`RecordBatchWriter::WriteTable`, `IpcFormatWriter::WriteRecordBatch`, `WriteDictionaries`); `options.h`; `dictionary.cc` (`DictionaryFieldMapper`, `DictionaryMemo`, `CollectDictionaries`); `reader.cc` (`StreamDecoderInternal`, `RecordBatchStreamReader`); `writer.h`; dictionary replacement/delta tests.
- Default/non-default flags, thresholds and configurations checked: alignment, legacy framing, metadata V4/V5, codec, `min_space_savings`, threads, `emit_dictionary_deltas`, stream-ignored `unify_dictionaries`, arbitrary direct batches, `max_chunksize`, writer/read stats, nested delta restriction.
- Discovery absence claim confirmed, narrowed or contradicted: **contradicted at the action layer**. Current C++ accepts arbitrary record batches/dictionary arrays; it lacks an automatic global optimizer, not the legal actions.
- If contradicted, current native mechanism and finite configuration-grid baseline: included as baseline 1 above.
- Any non-tuning residual that remains: only the proposed Arrow-specific non-product algorithm/formal property, pending the one revision.

## Stage A highest-risk probe plan

- Risk-bearing premise: the accepted revision defines a genuine Arrow-specific reduction/guarantee and the natural carrier contains asynchronous multi-field dictionary evolution.
- Cheap discriminating probe or counterexample search: replay the explicit witness through the pinned writer/reader; enumerate all native and generic controls; then process frozen prefixes of two official monthly files with compression disabled.
- Negative result that kills the direction: current/generic union reproduces the claimed residual; reader/logical equality fails; the state catalog cannot be finitely dominance-reduced; relevant asynchronous field transitions are absent; or no full-cost Pareto residual remains and no independent formal result exists.
- Positive-result ceiling: preliminary support/non-falsification only; not main-claim proof.

## Stop conditions

- The atomic revision collapses to arbitrary `WriteRecordBatch` input construction, a fixed chunk/delta grid, ordinary Cartesian DP/ILP, or independent per-field policies plus a shared-cut wrapper.
- The candidate requires changed schema/index type/dictionary-id sharing, nested semantics, reader, codec arm, or external transport.
- A direct same-object paper/current planner with equal-or-stronger guarantee is found.
- Later fidelity or natural/full-cost killer conditions above trigger.

## STAGE0_REPAIR_VECTOR

- `OMITTED_FIRST_PARTY_FEATURE`: Discovery omitted arbitrary caller-defined `WriteRecordBatch` sequences/dictionary arrays from the strongest action catalog.
- `ATOMIC_ACTION_UNCLEAR`: the alleged new action is current-expressible; the residual must be recast as an algorithm/formal guarantee.
- `FULL_COST_GAP`: dictionary construction/remapping and candidate planning cost must be charged.
- `Q2_SHAPE_GAP`: generic product-state DP alone is insufficient for a credible Q2 contribution.

This repair vector is diagnostic and does not independently determine the `REVISE_ONCE` decision.

## Dual-axis score

- Academic value: `41/70`
- AI executability bonus: `27/30`
- Total: `68/100`

## Human research reserve

Not applicable. The core is public, CPU-executable, and auditable.

## User-action blocker

None. No resource failure was used as scientific evidence, and the scientific revision has not yet been consumed by this PRIMARY review.
