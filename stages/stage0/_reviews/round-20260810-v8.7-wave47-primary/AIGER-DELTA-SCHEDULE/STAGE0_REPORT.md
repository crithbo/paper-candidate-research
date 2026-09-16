# AIGER-DELTA-SCHEDULE Stage 0 Report

- Lane id: `STAGE0-BATCH-GATE / PRIMARY`
- Assignment id: `STAGE0-P1-20260810-AIGER-DELTA-SCHEDULE-PRIMARY-V8.7`
- Input freeze SHA-256: brief `179A41BFF132986FC37FC6E4FB71764B9F39A36CE7ACB7A4032B7370D344EC2A`; handoff `50AB1097AC9F981C644D559BFD3765A1507F66796AC85C46B90F68D54158EEE1`; discovery manifest self `16EF94DC69CCB0F6A3C26DD2919C5CE27E9E00342B4A6966FFD26EA0D5147439`
- Cross-assignment contamination declaration: no prior candidate score, PASS, failure, or mechanism judgment was inherited. Only current control rules, the frozen Wave47 package, and independently checked primary/current sources were used.
- Decision: `PASS_RECOMMENDED`
- Confirmation status: `PENDING_CONFIRMATION`
- Quality tier: `TIER_B_Q2_VIABLE`
- Confidence: `0.78`
- Evidence ceiling: `STAGE0_CONDITIONAL_PAPER_POTENTIAL__STATIC_ACTION_DIVERGENCE_ONLY`
- Novelty route: `N2`
- Candidate Q1 venue family: logic synthesis / EDA / formal-methods venues; the current shape is credible Q2-equivalent, not yet Q1-parity.
- Stage semantics: conditional paper-potential screen; this report does not establish the main claim.

## Structural paper potential vs current readiness

- Structural paper potential if successful: **yes, Tier B**. The residual is a format-constrained algorithmic problem: choose a legal topological numbering of a fixed AIG to minimize the piecewise variable-length binary AIGER delta cost, with an exact bounded-frontier algorithm and a deterministic scalable method or guarantee. That is more than a writer flag, emitter patch, or parameter sweep.
- Current evidence-acquisition readiness/risk: **medium**. The standard contract and native writer action surface are auditable, a legal static action-divergence witness exists, and HWMCC supplies a finite natural corpus route. There is not yet a candidate implementation, a natural headroom measurement, or a proved complexity/approximation result.
- Why missing implementation/results/proof/hardware is not structurally fatal: all decisive work is CPU/software/formal and has a finite preclaim closure route. Stage 0 tests whether the hypothesis can yield a paper if successful; Stage A must test whether it actually does.

## Discovery provenance

- Opportunity origins: direct software/algorithm residual in a standardized binary circuit format.
- Domain tags: `LOGIC_SYNTHESIS`, `BINARY_FORMAT`, `GRAPH_ALGORITHMS`, `COMPRESSION`.
- Paper genealogy: AIGER binary delta encoding and reference writer; Yosys/ABC AIG writers; compression-friendly graph ordering; topological-order optimization; AIG rewriting as an object-changing negative boundary.
- Discovery method revision: none used as candidate evidence.
- Backtest reference and status: not applicable to this scientific judgment.
- Reminder: method backtest is calibration, not candidate evidence.

## Frozen object and claim

The object is one fixed, reachable AND-inverter graph with fixed PI/latch/output/bad/constraint/justice/fairness order, fixed inversion bits, and fixed Boolean functions. The output is one standard binary AIGER 1.9 artifact accepted by the reference reader. No AIG rewriting, vertex deletion, alternate codec, `aig2`, thin/external representation, or interface reorder is allowed.

For each AND with assigned even literal `lhs` and ordered fanins `rhs0 >= rhs1`, the primary optimization cost is

`C_delta = sum_g (bytes_uleb(lhs-rhs0) + bytes_uleb(rhs0-rhs1))`.

The schedule must be topological and consecutively label ANDs after the fixed input/latch range. The deployment claim must separately ledger **whole-file bytes**, because decimal root-reference lines can also change width. A result only on `C_delta` supports a delta-payload claim, not an unqualified total-artifact claim.

## Positive opportunity map

- Natural workloads: public HWMCC bit-level AIGER benchmark families, pinned by archive hash and normalized only through a semantics-preserving reader/writer path.
- Observed or expected cost/headroom: not yet measured. The static witness below proves legal action divergence, not natural benefit.
- Mechanism-specific prediction: graphs with multiple simultaneously ready sub-DAGs and fanin-label gaps near 7-bit continuation thresholds should expose byte-cost choices that native traversal/canonical orders do not optimize.

### Static same-object action-divergence witness

Use 63 fixed PIs and six reachable ANDs:

- `g1=p1&p2`, `g2=p60&p61`, `g3=p62&p63`, `g5=p58&p59`, `g4=g1&g2`, `g6=g4&g5`;
- fixed outputs are `[g6,g3]`.

Both schedules are legal for the same graph and fixed outputs:

| Schedule | AND order | Binary AND-delta payload |
|---|---|---:|
| S1 | `g1,g2,g4,g5,g6,g3` | 12 bytes |
| S2 | `g2,g5,g3,g1,g4,g6` | 13 bytes |

In S1, `g1` has literal 128 and `lhs-rhs0=124` (one byte); in S2 it has literal 134 and the same delta is 130 (two bytes). All other deltas remain below 128. The fixed output literals remain three decimal digits, so this particular witness also differs by one whole-file byte. This is a hand-checkable format witness, not a performance experiment.

## Named baselines and fairness contract

1. **Current native writer union:** reference AIGER re-encoding/root DFS; pinned Yosys `write_aiger` with every same-object legal setting (including the previously omitted `-no-sort`); pinned ABC standard `write_aiger` default and `-u` isomorphic canonicalization. Metadata settings are matched. Object-changing modes are excluded from the equal-guarantee comparison.
2. **Same-information scheduling union:** stable Kahn/DFS orders, a threshold-aware ready-set greedy, and a precedence-feasible recursive-bisection adaptation, all using only the fixed DAG and the same CPU/memory budget.
3. **Small-instance ceiling:** exhaustive search or ILP over all legal topological schedules. This is an oracle/ceiling, not a deployment baseline and cannot automatically absorb the contribution.

All methods receive the identical graph and interface order. Full cost includes graph construction, scheduling/optimization, serialization, whole-file bytes, peak RSS, reference parsing, graph/function equality checks, and failure fallback.

## Collision analysis

Stage-0 result: `SEARCH_BOUNDED_CLOSED_FOR_STAGE0__NO_DIRECT_FATAL_FOUND`. This is not a universal absence claim.

### Nearest-prior facet matrix

| Source/mechanism | Same fixed AIG | Same standard reader | Topological labels | Same byte objective | Algorithm/guarantee | Classification |
|---|---:|---:|---:|---:|---:|---|
| AIGER reference re-encoder | yes | yes | yes | no | traversal/canonicalization only | strongest native baseline |
| Yosys pinned `write_aiger` | yes under frozen flags | yes | construction order | no | no global planner | native baseline |
| ABC pinned `write_aiger`, including `-u` | yes if canonicalization preserves identity contract | yes | internal order | no | no byte planner | strong native baseline/boundary |
| Kabiljo et al., KDD 2016 | graph-ordering abstraction | no | unrestricted, not AIG precedence | compression-oriented | recursive bisection | methodological subtractor |
| Gagrani et al., NeurIPS 2022 | computation DAG | no | yes | peak memory, not AIGER bytes | learned topological order | adjacent objective |
| Mishchenko et al., DAC 2006 | AIG domain | not fixed object | may reorder after rewriting | area/depth | DAG-aware rewriting | object-changing negative boundary |

No checked current source or paper jointly covered the same fixed AIG, standard binary AIGER contract, whole-DAG legal topological numbering, variable-length delta objective, and a nontrivial algorithm/guarantee.

### Seed-distance and method-name deletion test

- Seed distance: the idea is not merely “compress AIGER better.” It requires modeling ULEB128 threshold crossings under precedence, fixed labels, roots, and fanin differences; current writers expose traversal/canonicalization but no such objective.
- Method-name deletion: without “DP,” “AIGER,” or “delta scheduling,” the residual still reads as a defined precedence-constrained labeling problem with a discontinuous edge-length cost and a standard-format equality contract. It remains a research problem rather than a named-tool wrapper.

## Competing mechanism decision

- Selected mechanism: exact bounded-frontier/width dynamic programming whose state retains scheduled frontier, assigned relative labels needed to evaluate completed fanin deltas, and the next label; pair it with a deterministic scalable relaxation or certified bound.
- Registered backup: precedence-feasible recursive bisection or ready-set threshold-aware scheduling, compared as an alternative mechanism rather than merged into a universal union.
- Pivot boundary: changing the AIG, output/property order, codec, or reader is a new object; reducing the work to native option selection, local ready-node scoring without a general property, or post-hoc byte rewriting is not the frozen N2.

## Residual paper kernel

The paper kernel is: (i) formalize topology-constrained AIGER delta-byte scheduling; (ii) characterize hardness or tractable bounded-width structure; (iii) provide an exact FPT/DP method plus a deterministic large-graph algorithm with an auditable bound or failure diagnostic; and (iv) establish full-cost Pareto behavior on frozen natural AIG families against current native and same-information algorithmic baselines.

## Evidence route

- `PARETO_APPROXIMATION`
- `COMPLEXITY_THEORY`
- `PERFORMANCE`

## Performance-optimization admissibility

- Same-function contract: reference parse plus exact graph/interface/inversion equality and independent Boolean/equivalence checking; no rewrite or format switch.
- Algorithmic delta: global precedence-constrained label assignment under variable-length byte thresholds.
- Full-cost ledger: delta payload, whole file, planner and writer CPU, reader CPU, peak RSS, verification, random/root access where relevant, and fallback.
- Strong-implementation fairness: pinned native writers, all legal same-object settings, same-information heuristics, and an explicitly separated small-instance oracle.
- Generality and failure boundary: benefit is expected only when ready subgraphs create threshold-sensitive choices; chain-like or threshold-inert AIGs should be reported as null cases.
- Why not routine tuning: labels are combinatorial actions, the cost is discontinuous, and a paper-worthy version requires a reusable algorithmic or formal result.

## Q1/Q2 paper shape

- Problem: standardized AIG serialization leaves a legal, graph-wide labeling choice that can change variable-length payload cost.
- Contribution: new problem definition, nontrivial exact/approximate scheduler or guarantee, and a format-faithful implementation route.
- Evidence plan: static certificates, small exact ceilings, and family-stratified HWMCC full-cost evaluation.
- Expected paper narrative: a narrow but clean systems/algorithm result at Q2-equivalent level; Q1 requires a stronger theorem/approximation story and broad, stable natural effects.

## Q1/Q2 shape calibration

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Reference set: Kabiljo et al. KDD 2016; Gagrani et al. NeurIPS 2022; Mishchenko et al. DAC 2006; AIGER technical report as format boundary.
- Status: `PARITY_CONDITIONAL`
- Contribution-shape gap: no hardness/FPT/approximation result is yet established.
- Evidence-shape gap: no natural corpus result or full-cost implementation exists yet.
- Stage A closure plan: close native fidelity first, then run exact small instances and a bounded HWMCC pilot before any broad claim.

## Non-relaxable quality audit

- Same-object: pass at design level; the contract excludes graph and codec changes.
- Latest collision: pass for Stage 0 with bounded search, current-source reality check, and no direct fatal found.
- Strong fair baselines: pass at design level after adding AIGER reference re-encoding, Yosys `-no-sort`, ABC `-u`, same-information schedulers, and a separate exact ceiling.
- Natural input/evidence: HWMCC provides a finite natural route; actual natural headroom is not yet evidence.
- Full-cost: specified; not yet measured.
- Reproducibility: pinned commits, archive hashes, emitted artifacts, commands, and per-instance ledgers are finite Stage A requirements.
- Evidence/claim honesty: static witness establishes only action divergence. It does not establish natural gain, scalability, or paper-level superiority.

## Evidence path and AI completion

- AI executability class: `AI_CORE_EXECUTABLE`
- Estimated ai_core_fraction: `0.85`
- 72-hour first evidence: implement a minimal reference parser/serializer fidelity harness, exhaust all legal schedules for small AIGs, reproduce the six-AND certificate, and compare the three native order families on a small pinned HWMCC slice. This is a plan, not a result.
- Human-only items and why they are non-decisive: venue positioning and final theorem review benefit from human judgment but do not block the core software/formal work.

## Fidelity closure plan audit

- Discovery status: `READY_TO_CLOSE_IN_STAGEA`
- Complete action and native semantics are finite and same-object: yes; legal topological AND schedules and the binary delta equations are explicit.
- Comparator, denominator, full-cost and small-witness plan: finite and specified above.
- Why an unimplemented interface/format/checker is not structurally fatal: reference implementations and public benchmarks exist, and the missing components are bounded software work without proprietary resources.
- Reminder: Stage 0 audits the plan; Stage A must actually close `PRE_CLAIM_CONTRACT_FIDELITY_GATE` before its first claim-bearing run.

## Independent current upstream reality check

- Frozen upstream commit/tag and check date: Yosys `0f2bcb94b7dc8310a52abf6eef3a7e1a9f09b552`; ABC `6c51a9238544bce6eb300b7b1c3e5bb4215bec84`; current AIGER source observed at `039ec1a2cc37d3093ac35c4b6df65336b346f409`; checked 2026-08-10.
- Current official documentation checked: AIGER format/reference utilities; Yosys command/source surface; ABC command/source surface; HWMCC public benchmark contract.
- Actual source paths/symbols checked: AIGER `aiger_reencode`/`aiger_write_binary` and `aigtoaig`; Yosys `backends/aiger/aiger.cc` (`mkgate`, `bit2aig`, writer options); ABC `src/base/io/io.c`, `src/base/io/ioWriteAiger.c`, and `src/aig/gia/giaAiger.c`.
- Default/non-default flags, thresholds and configurations checked: Yosys `-ascii`, `-zinit`, `-miter`, `-symbols`, `-no-sort`, mapping flags and interface filters; ABC `-s`, `-c`, `-u`, `-v`; AIGER converter modes.
- Discovery absence claim confirmed, narrowed or contradicted: narrowed. Discovery omitted Yosys `-no-sort` and ABC `-u`; both are now mandatory baseline actions. Neither implements the frozen global byte objective.
- If contradicted, current native mechanism and finite configuration-grid baseline: native traversal/re-encoding and canonicalization are explicitly included; object-changing `aig2`, rewriting, interface edits, and alternate compression are negative controls.
- Any non-tuning residual that remains: threshold-aware whole-DAG legal numbering with a formal algorithm/property remains.

## Stage A highest-risk probe plan

- Risk-bearing premise: natural fixed AIGs contain enough legal topological freedom near byte thresholds for a global method to beat the complete native/same-information finite union after full cost.
- Cheap discriminating probe or counterexample search: pin the reader/writers and a family-stratified HWMCC subset; enumerate small cases; compare native, stable, greedy, recursive-bisection, and candidate schedules with exact equality and whole-file accounting.
- Negative result that kills the direction: any equality/reader-contract failure; the complete native union expresses the proposed action; fewer than 10% of eligible natural instances have threshold-sensitive legal choices; or candidate points have no p50/p90 full-cost Pareto advantage and no independent complexity/approximation contribution.
- Positive-result ceiling: preliminary support/non-falsification only; not main-claim proof.

## Stop conditions

- A current same-object writer or paper is found to optimize the same legal schedule and objective with equal or stronger guarantee/cost.
- The claimed algorithm needs graph rewriting, altered interface order, an alternate codec, or information unavailable to fair baselines.
- The only residual is flag selection, local byte heuristics, or emitter engineering without a nontrivial algorithm/formal result.
- The finite Stage A probe triggers any negative condition above.

## Dual-axis score

- Academic value: `47/70`
- AI executability bonus: `27/30`
- Total: `74/100`

## Human research reserve

Not applicable. The core is executable with public CPU software and formal checks.

## User-action blocker

None at Stage 0. No resource failure was used as scientific evidence.
