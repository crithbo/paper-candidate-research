# WEBGRAPH-REFERENCE-FOREST Stage 0 Report

- Lane id: `STAGE0-BATCH-GATE / PRIMARY`
- Assignment id: `STAGE0-P1-20260810-WEBGRAPH-REFERENCE-FOREST-PRIMARY-V8.7`
- Input freeze SHA-256: brief `EE0B055F12EDBDE9C3C0C23D74E07BFB8C14468BAEC5C8FF63D70C2FA5D8C2E7`; handoff `A300A5E1F662E3A2F30C79B1A5D8029A5EDF8E43364843C1C433684481670591`; manifest self `599702F16DAC90960CCD1F27817FD2A19E6B08306FE5261260854016FA14381B` (4/4 verified)
- Cross-assignment contamination declaration: `NONE`; no prior candidate judgment or evidence was inherited.
- Decision: `REVISE_ONCE`
- Quality tier: `TIER_B_Q2_VIABLE` conditional on the single revision gate below
- Confidence: `0.94`
- Evidence ceiling: `SOURCE_VERIFIED_CONDITIONAL_POTENTIAL_ONLY__NO_MAIN_RESULT`
- Novelty route: `N2`
- Candidate Q1 venue family: graph algorithms/data structures and graph systems; Q2 minimum, Q1 only with a formal global guarantee plus broad natural full-cost evidence
- Stage semantics: conditional paper-potential screen; this report does not establish the main claim.

## Structural paper potential vs current readiness

- Structural paper potential if successful: a complete optimization over all legal backward parent edges, with a nontrivial exact/FPT/approximation guarantee beyond current `BvCompZ`/Zuckerli, could support a focused `TIER_B_Q2_VIABLE` paper. Tier A would additionally require a strong theoretical result and robust full-cost wins across diverse natural graph strata.
- Current evidence-acquisition readiness/risk: public CPU-only implementations, formats and corpora provide a finite route, but the Discovery mechanism and witness are not yet valid against current upstream. Readiness is `FINITE_ATOMIC_MECHANISM_REFREEZE_REQUIRED`.
- Why missing implementation/results/proof/hardware is or is not structurally fatal: none is required at Stage 0. The revision is required because current official source contradicts the claimed native action gap and the supplied three-list witness is not an action-divergence witness—not because positive results are missing.

## Discovery provenance

- Opportunity origins: `O3 / NATURAL_STRUCTURE`
- Domain tags: graph compression, compressed data structures, algorithms, systems
- Paper genealogy: WebGraph 2004 → Zuckerli 2020 → Rust WebGraph and current `BvCompZ`; representation neighbors include Log(Graph) and Laconic.
- Discovery method revision: accepted `v2/v8.1 + v8.6 + v8.7`
- Backtest reference and status: production-calibrated method; not reused as candidate evidence.
- Reminder: method backtest is calibration, not candidate evidence.

## Frozen object and claim

The exact object is one fixed naturally ordered directed graph `G=(V,E)`, represented by exact sorted successor lists. Vertex order, edges and list semantics cannot change. The output is one self-contained native-compatible BVGraph graph stream plus offsets/directory, supporting exact sequential decoding and the fixed list-random-access contract. A legal reference points only to a preceding list within a fixed window; reference-chain depth is bounded. Root/reference choice, native copy blocks, intervals, residuals and codes are charged together.

The input information is only `G`, the fixed legal code catalog, fixed window/depth/access contract and the declared additive cost model. Measured decoder timing cannot be used as an oracle during construction unless every comparator receives the same frozen training information.

The claim requiring revision is narrower than Discovery's wording: construct a forest over the **complete legal parent-edge DAG**, rather than first fixing each list's locally best parent, and provide an exact, parameterized or approximation property that current `BvCompZ` and Zuckerli do not provide.

## Positive opportunity map

- Natural workloads: immutable web/social/software-history graphs distributed through LAW/WebGraph and other public graph repositories, with preserved native order.
- Observed or expected cost/headroom: Zuckerli's published natural evaluation reports meaningful size reduction over Java WebGraph while retaining list access. This establishes that reference selection matters on natural graphs, but it is headroom already captured by the strongest current baseline and is **not candidate-specific evidence**.
- Mechanism-specific prediction: only graphs whose legal-edge DAG contains conflicting locally best chains plus valuable second-choice parent edges can separate a complete optimizer from `BvCompZ`. Low-similarity graphs, graphs whose best-edge forest already satisfies depth, and graphs dominated by root interval/gap coding are predeclared no-gain strata.

## Named baselines and fairness contract

1. Java WebGraph `BVGraph 3.6.12`: all legal `windowSize`, `maxRefCount`, `minIntervalLength`, code flags, offsets/load/no-reference alternatives; source path `src/it/unimi/dsi/webgraph/BVGraph.java`.
2. Rust `webgraph 0.6.2` standard `BvComp`: all legal compression window, depth, interval and instantaneous-code settings.
3. Rust `webgraph 0.6.2` `BvCompZ` through `webgraph-cli 0.4.2 --bvgraphz`: same settings plus `chunk_size`; this is the decisive current strong baseline.
4. An exhaustive complete-parent-edge oracle only on small instances: ceiling and correctness oracle, not a deployable baseline.

All deployed baselines receive the same graph order, successor lists, window/depth and code catalog. They must emit the same BVGraph semantics and offsets and be charged for scanning, candidate-edge costing, forest construction, memory/RSS, encoding, bitstream plus offsets/properties, sequential decode, random list access and fallback. The comparator union is finite and runnable; no vertex reorder, alternate graph representation or unlimited offline optimum is treated as an equal deployment baseline.

## Collision analysis

### Current-source decisive finding

Discovery inspected the Java compressor, whose loop tests every preceding list and greedily commits the smallest immediate compressed bit count. That observation was correct but incomplete. The official `vigna/webgraph-rs` implementation is a current first-party WebGraph implementation, not an adjacent third-party tool. Its released `webgraph 0.6.2` exports `BvCompZ`.

`BvCompZ` explicitly:

1. evaluates root and all legal window references with the native list compressor;
2. constructs a maximum-weight directed reference forest over a chunk;
3. uses dynamic programming to select a maximum-weight subforest of that chosen forest under `max_ref_count`;
4. greedily adds further legal references;
5. writes the native BVGraph stream and offsets.

The current CLI exposes `--bvgraphz`, `--chunk-size`, compression window, max reference count, interval length and outdegree/reference/block/residual code choices. Thus “current WebGraph has no global bounded reference-forest constructor” is contradicted. Zuckerli 2020 also describes the same reference-chain problem and direct-list-access evaluation.

This is a `DIRECT_FATAL` collision for the **generic Discovery mechanism**. It is a `DIRECT_SUBTRACT`, rather than final topic death, only for the narrower complete-edge-DAG algorithmic residual: `BvCompZ` first retains one locally best parent per node, optimizes a bounded-depth subforest of that forest, then uses a greedy repair. The source does not establish an optimum or approximation guarantee over every alternative legal parent edge.

### Nearest-prior facet matrix

| Facet | Candidate after correction | Java BVGraph 3.6.12 | Rust BvCompZ 0.6.2 | Zuckerli 2020 | Laconic / Log(Graph) |
|---|---|---|---|---|---|
| Object | fixed ordered exact successor lists, native BVGraph | same | same | same graph/list-access family | different representation/processing emphasis |
| Decision | all legal root/parent edges plus native list coding | local best parent | maximum-best-edge forest, depth DP, greedy refill | same reference-chain heuristic genealogy | rule/log representation actions |
| Constraint | window and bounded chain/list access | yes | yes | yes | not the same contract |
| Output | native stream + offsets | yes | yes | list-access compressed graph | different format/path |
| Objective | full native bits plus predeclared access/full-cost ledger | immediate encoded bits | saved encoded bits; depth hard constraint | compression plus decompression evaluation | representation/processing trade-off |
| Formal residual | complete-edge exact/FPT/approx property | no | not shown | heuristic | no same-object result |
| Collision | deployment baseline | direct subtract | decisive direct subtract | decisive paper subtract | methodological adjacent |

### Seed-distance and method-name deletion test

Deleting the title “reference forest” reveals that the original candidate says: buffer neighboring adjacency lists, score possible references with the native encoder, select high-saving parents under a chain-depth constraint, and write native offsets. That is extensionally the documented `BvCompZ`/Zuckerli construction. The residual survives method-name deletion only if it instead says: optimize over alternative parent edges discarded by the maximum-best-edge forest and provide a nontrivial guarantee or bounded-complexity algorithm.

### Three-list witness audit

The Discovery witness lists only `1→0` and `2→0`. With arrows denoting child/reference target, these are siblings; selecting `1→0` does not consume the depth budget of `2→0`. It therefore cannot distinguish local and global selection.

A useful **abstract** counterexample shape would require at least the competing edge `2→1`. For depth one, let saved-bit weights be `w(1→0)=6`, `w(2→1)=10`, `w(2→0)=9`. A best-edge forest chooses the chain `1→0, 2→1`; pruning can retain only weight 10, while the legal complete-edge solution `1→0, 2→0` has weight 15. This table is not yet evidence: revision must realize it with actual ordered successor lists and the pinned native encoder/codes/offsets, without author-injected edge costs.

## Competing mechanism decision

- Selected mechanism: complete-parent-edge bounded-depth forest optimization with an exact/FPT/approximation property and native realizable divergence from `BvCompZ`.
- Registered backup: none. Access-aware reference admission may be an ablation or objective component, but substituting an access weight into the native topology is not an independent paper mechanism.
- Pivot boundary: the revision may narrow the algorithm inside the same fixed graph/BVGraph contract. Reordering vertices, changing the reader/format/query, using a learned timing oracle, or becoming a generic configuration controller is a new object and requires a new ID.

## Residual paper kernel

The only potentially publishable N2 is: for the ordered legal-parent DAG induced by a real BVGraph encoder, solve or approximate maximum full-cost saving under window and path-depth bounds **without discarding second-choice parent edges first**. A viable paper must state a real algorithmic property—for example, exactness/FPT in bounded window/depth, a proved approximation under declared nonnegative additive costs, or a rigorously characterized tractable subclass—and show a native realizable case where the action differs from `BvCompZ`.

Changing edge weights, tuning `chunk_size/window/depth/codes`, extending the parameter grid, or wrapping `BvCompZ` with a selector remains below the paper threshold.

## Evidence route

- `PARETO_APPROXIMATION` plus `COMPLEXITY_THEORY`, followed by full-cost `PERFORMANCE` evidence.

## Performance-optimization admissibility, if applicable

- Same-function contract: exact successor-list equality, fixed order, native BVGraph random list access and identical window/depth contract.
- Algorithmic delta: complete-edge-DAG construction and nontrivial guarantee beyond maximum-best-edge subforest plus greedy refill.
- Full-cost ledger: source scan, all native trial encodings, optimization time/RSS, graph/offset/property bytes, encode time, sequential decode, random-list access, repeated workload if declared, and fallback.
- Strong-implementation fairness: Java `BVGraph`, Rust `BvComp` and `BvCompZ` receive identical graph, code and contract settings; exhaustive search is only a small-instance oracle.
- Generality and failure boundary: gains require competing best chains and valuable alternative parents; no benefit is expected when best-edge forest is feasible or alternative edges have negligible saving.
- Why not routine tuning: only a complete-edge action divergence plus algorithmic guarantee qualifies. Weight/flag/threshold changes do not.

## Q1/Q2 paper shape

- Problem: current native global reference selection may discard alternative parents before enforcing access depth, leaving avoidable compression/access cost.
- Contribution: a complete-edge bounded-depth optimizer/approximation with a precise guarantee and native-compatible construction.
- Evidence plan: realizable minimal counterexample, exhaustive small-graph oracle, current native comparators, 20–50 frozen natural graphs and a complete construction/read ledger.
- Expected paper narrative: current source establishes a strong implemented heuristic; the paper isolates its structural blind spot, supplies an algorithm with a formal property, and characterizes when natural graphs expose or do not expose the gap.

## Q1/Q2 shape calibration

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Reference set: WebGraph (WWW 2004), Zuckerli (IEEE Access 2020), Laconic (PVLDB 2024)
- Status: `PARITY_CONDITIONAL`
- Contribution-shape gap: the current brief does not yet define a contribution beyond released `BvCompZ`.
- Evidence-shape gap: no native realizable divergence, small oracle or natural full-cost result yet; these are Stage A evidence tasks after the atomic Stage 0 revision.
- Stage A closure plan: allowed only after revision and independent confirmation; first close native contract fidelity, then the realizable witness/oracle before natural runs.

## Non-relaxable quality audit

- Same-object: PASS; the corrected residual remains fixed-order native BVGraph.
- Latest collision: FAIL FOR CURRENT BRIEF; current Rust `BvCompZ` and Zuckerli were missing decisive subtractors. Finite revision can close it.
- Strong fair baselines: REVISE; `BvCompZ --bvgraphz` and its entire legal flag grid must be promoted to the primary comparator.
- Natural input/evidence: ROUTE PASS / CURRENT EVIDENCE OPEN; public natural graph route is finite, but Zuckerli's gains cannot be relabeled as candidate headroom.
- Full-cost: PLAN PASS; ledger is finite and includes offsets/construction/access.
- Reproducibility: PLAN PASS; immutable crate releases and CPU-only corpus route exist.
- Evidence/claim honesty: PASS after this correction; no current positive claim is made.

## Evidence path and AI completion

- AI executability class: `AI_CORE_EXECUTABLE`
- Estimated ai_core_fraction: `0.78`
- 72-hour first evidence: pin `webgraph 0.6.2`/CLI `0.4.2`; enumerate all legal forests for 3–8-list native fixtures; search for the first actual list/coding instance where `BvCompZ` differs from the complete optimum; validate exact decode and offsets.
- Human-only items and why they are non-decisive: venue choice and final interpretation benefit from human review; the decisive algorithm, fixtures, oracle and ledger are CPU/open-source executable.

## Fidelity closure plan audit

- Discovery status: `FINITE_FIDELITY_GAP`
- Complete action and native semantics are finite and same-object: yes, after adding Rust `BvCompZ` and freezing the complete legal-parent DAG.
- Comparator, denominator, full-cost and small-witness plan: finite; detailed above.
- Why an unimplemented interface/format/checker is or is not structurally fatal: it is not fatal. The current failure is a collision/action-definition defect; revision needs a source-grounded algorithmic residual, not an implementation or positive result.
- Reminder: Stage 0 audits the plan; Stage A must actually close `PRE_CLAIM_CONTRACT_FIDELITY_GATE` before its first claim-bearing run.

## Independent current upstream reality check

- Frozen upstream release/source and check date: Java WebGraph `3.6.12`; Rust `webgraph 0.6.2` (released 2026-05-01); `webgraph-cli 0.4.2`; checked 2026-08-10. Mutable GitHub SHA remained unavailable through local Schannel, so immutable release sources were used instead of inventing a commit.
- Current official documentation checked: Javadoc latest version index; GitHub `vigna/webgraph` and `vigna/webgraph-rs`; docs.rs release source/API; official author/project publication pages.
- Actual source paths/symbols checked: Java `BVGraph.java` compression loop; Rust `graphs/bvgraph/comp/bvcompz.rs`, `BvCompZ`, `update_references_for_max_length`, `find_additional_references_greedily`, `OffsetsWriter`; CLI `CompressArgs`.
- Default/non-default flags, thresholds and configurations checked: Java window/depth/interval/ζ/codes/offset/load/no-reference; Rust compression window, max reference count, min interval length, instantaneous codes, `--bvgraphz`, `--chunk-size` and offsets.
- Discovery absence claim confirmed, narrowed or contradicted: contradicted. Current first-party Rust source has the claimed global forest constructor.
- If contradicted, current native mechanism and finite configuration-grid baseline: `BvCompZ` plus every legal `CompressArgs` setting under the fixed contract.
- Any non-tuning residual that remains: only complete-parent-edge optimization/approximation beyond the maximum-best-edge forest and greedy repair.

## Stage A highest-risk probe plan

- Risk-bearing premise: there exists a native-realizable successor-list instance where the complete legal-parent solution differs from and improves on current `BvCompZ`, and this residual supports a nontrivial algorithmic guarantee.
- Cheap discriminating probe or counterexample search: exhaustive enumerate small sorted successor lists and all legal parent forests under pinned codes, compare native `BvCompZ` with a complete-edge oracle, and require exact stream/offset decode equality.
- Negative result that kills the direction: no realizable divergence after a predeclared exhaustive bounded search; every divergence depends on author-injected weights; the proposed solver has no guarantee/complexity advantage over enumeration; or the only difference is an access-weight/flag/threshold change.
- Positive-result ceiling: preliminary support/non-falsification only; not main-claim proof.

## Atomic revision gate

`REALIZABLE_COMPLETE_EDGE_DIVERGENCE_BEYOND_CURRENT_BVCOMPZ_AND_ZUCKERLI`

This is one proposition, not several independent gates: under one pinned native BVGraph contract, exhibit a realizable legal action that current `BvCompZ` cannot select because of its best-edge-forest restriction, and bind that action to one nontrivial complete-edge algorithmic/formal property. The revision package must include the actual successor lists, native settings/costs, current-output versus legal-better-output forest, exact decode/offset preservation plan, and the finite Stage A killer. It need not include an implementation, natural gain or finished theorem.

If the revision offers only a corrected drawing, abstract edge weights, access-weight substitution, a wider flag grid, vertex order change, wrapper/controller, or brute-force oracle as the method, the terminal outcome is `BELOW_Q2_STOP__CURRENT_BVCOMPZ_ZUCKERLI_REFERENCE_FOREST_ABSORPTION`.

## Stop conditions

1. `BvCompZ` or direct literature already covers the refrozen complete-edge action/guarantee.
2. No native-realizable action divergence exists; only arbitrary cost tables differ.
3. Contribution reduces to codes/window/depth/chunk/access-weight tuning or wrapper selection.
4. Exact successor lists, order, random-access or offset semantics change.
5. Full-cost gains vanish because candidate-edge costing/optimization/memory/offsets/access are omitted.
6. Natural positive evidence ultimately requires synthetic-only structure.

## Dual-axis score

- Academic value: `43/70` (problem 12/15; N2 clarity 10/20; latest-work delta 5/15; baseline/venue 8/10; falsifiability 8/10)
- AI executability bonus: `25/30` (artifact/baselines 9/10; AI core 8/10; replayable risk probe 8/10)
- Total: `68/100`

The score supports one revision, not PASS: the current-source collision is a hard gate that numeric totals cannot override.

## Human research reserve, if applicable

Not applicable. The residual is CPU/open-source and AI-core executable if it survives revision.

## User-action blocker, if applicable

None. The local Schannel failure did not prevent authoritative release-source verification through official docs.rs/GitHub pages and does not support any scientific inference.

